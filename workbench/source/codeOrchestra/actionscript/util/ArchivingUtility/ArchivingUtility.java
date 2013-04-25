/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package codeOrchestra.actionscript.util.ArchivingUtility;

import codeOrchestra.actionscript.util.ArchivingUtility.SelectItemDialog.AUSelectItemDialog;
import codeOrchestra.actionscript.util.ScreenHelper;
import codeOrchestra.actionscript.view.utils.Languages;
import codeOrchestra.environment.EnvironmentLibrary;
import codeOrchestra.environment.view.EnvironmentLibraryManager;
import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.progress.ProgressIndicator;
import com.intellij.openapi.progress.Progressive;
import com.intellij.openapi.ui.Messages;
import jetbrains.mps.ide.properties.SolutionProperties;
import jetbrains.mps.ide.ui.filechoosers.treefilechooser.TreeFileChooser;
import jetbrains.mps.project.*;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.project.ProjectDescriptor;
import jetbrains.mps.smodel.*;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jetbrains.annotations.NotNull;

import java.awt.Frame;
import java.io.File;
import java.io.IOException;
import java.util.*;
import java.util.concurrent.atomic.AtomicReference;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author olegchir
 */
public class ArchivingUtility {

  public static final String MODULES_DIR_NAME = "modules";
  public static final String LANGS_DIR_NAME = "languages";
  public static final String TARGET_TYPE_USER_MODULE = "TARGET_TYPE_USER_MODULE";
  public static final String TARGET_TYPE_USER_LANG = "TARGET_TYPE_USER_LANG";
  public static final String MODULE_FILE_EXTENSION = ".msd";
  public static final String LANGUAGE_FILE_EXTENSION = ".mpl";

  public static final String[] RESERVED_LIBRARIES = {"flex_swc",
    "framework_swc",
    "playerglobal_swc",
    "rpc_swc",
    "utilities_swc",
    "spark_swc",
    "mx_swc",
    "osmf_swc"};

  public static ArchivingUtilityExportContext exportModuleAction(AnActionEvent event, final IOperationContext operationContext, final IModule module, final MPSProject mpsProject, final Frame frame, final String targetType) {

    //Push all valuable data to global context
    final ArchivingUtilityExportContext auContext = new ArchivingUtilityExportContext();
    auContext.setEvent(event);
    auContext.setOperationContext(operationContext);
    auContext.setMpsProject(mpsProject);
    auContext.setFrame(frame);
    auContext.setTargetType(targetType);

    //Specifically for root module
    final AtomicReference<IModule> globalRootModule = new AtomicReference<IModule>(module);
    auContext.setModule(module);

    //Initialize thread-global lists
    final MPSModuleRepository mrepo = MPSModuleRepository.getInstance();
    final List<IModule> allModules = new ArrayList<IModule>();
    final List<IModule> blacklistModules = new ArrayList<IModule>();
    final ArrayList<IModule> whitelistModules = new ArrayList<IModule>();
    final ArrayList<IModule> depModules = new ArrayList<IModule>();
    final List<String> reservedNames = new ArrayList<String>();
    final List<IModule> userLanguages = new ArrayList<IModule>();

    //If required to import language, create a list of avaliable langs, that was created by user
    if (TARGET_TYPE_USER_LANG.equals(targetType) && null == module) {
      ModelAccess.instance().runWriteActionWithProgressSynchronously(new Progressive() {
        public void run(@NotNull() ProgressIndicator p0) {
          List<IModule> localAllModules = mpsProject.getModules();
          userLanguages.addAll(getUserLangs(mpsProject.getProjectLanguages()));
          if (userLanguages.size() < 1) {
            auContext.abort("No languages found", "Error", false);
            return;
          }
        }
      }, "Searching user languages", false, mpsProject.getProject());

      //If there's multiple user languages, display selection dialog
      if (userLanguages.size() > 1) {
        HashSet<String> selectedModuleIds = new HashSet<String>();
        AUSelectModuleDialog dialog = new AUSelectModuleDialog(frame, "Select Language", "Export checked", "Export selected", AUSelectItemDialog.SELECTION_TYPE_SINGLE_SELECTED, userLanguages, selectedModuleIds);
        dialog.checkAll();
        ScreenHelper.centerOnScreen(dialog, true);
        dialog.setVisible(true);

        if (dialog.isRunSelected()) {
          ArrayList<IModule> selectedLangModules = dialog.getSelectedItems();
          if (null != selectedLangModules && selectedLangModules.size() > 0) {
            auContext.setModule(selectedLangModules.get(0));
            globalRootModule.set(selectedLangModules.get(0));
          } else {
            auContext.abort("No languages selected", "Error", true);
            return auContext;
          }
        } else {
          auContext.abort("No languages selected", "Error", true);
          return auContext;
        }
      } else {
        //Else use first language in the list
        auContext.setModule(userLanguages.get(0));
        globalRootModule.set(userLanguages.get(0));
      }
    }

    //Try to fill depModules with all dependencies of a root module
    ModelAccess.instance().runWriteActionWithProgressSynchronously(new Progressive() {
      public void run(@NotNull() ProgressIndicator p0) {
        //Enumerate all modules
        List<IModule> localAllModules = mpsProject.getModules();
        allModules.addAll(localAllModules);

        //Create blacklist of reserved module names
        reservedNames.addAll(Arrays.asList("Project_assets"));
        reservedNames.addAll(Arrays.asList(RESERVED_LIBRARIES));

        //Create namespace: full whitelist and exceptions from it in blacklist
        searchModules(targetType, globalRootModule.get(), mpsProject, mrepo, allModules, blacklistModules, whitelistModules);
        //Create dependencies list (restricted by previously created namespace)
        processDeps(globalRootModule.get(), depModules, mrepo, mpsProject, blacklistModules, whitelistModules, reservedNames);
        //Remove duplicated items
        removeDuplicatesInPlace(depModules);
      }
    }, "Checking Modules", false, mpsProject.getProject());

    //Abort if there's any async abort requests
    if (auContext.displayAbortMessage()) {
      return auContext;
    }

    //If there's many dependencies show dialog to allow select it
    if (!depModules.contains(globalRootModule.get())) {
      depModules.add(globalRootModule.get());
    }
    final List<IModule> approvedDepModules = new ArrayList<IModule>();

    boolean shouldShowModuleSelectionDialog = depModules.size() > 1;

    if (shouldShowModuleSelectionDialog) {
      HashSet<String> selectedModuleIds = new HashSet<String>();
      AUSelectModuleDialog dialog = new AUSelectModuleDialog(frame, "Select Modules", "Export checked",  "Export selected", AUSelectItemDialog.SELECTION_TYPE_MULTIPLE_CHECKED,depModules, selectedModuleIds);
      dialog.checkAll();
      ScreenHelper.centerOnScreen(dialog, true);
      dialog.setVisible(true);
      if (dialog.isRunChecked()) {
        ArrayList<IModule> checkedModules = dialog.getCheckedItems();
        if (null != checkedModules) {
          approvedDepModules.addAll(checkedModules);
        }
      }
    } else {
      approvedDepModules.add(globalRootModule.get());
    }

    auContext.setModulesToExport(approvedDepModules);
    return auContext;
  }

  public static List<IModule> getUserLangs(List<Language> allModules) {
    List<String> listedStdLangs = Languages.getListedStandardLanguages();
    List<IModule> userLanguages = new ArrayList<IModule>();

    for (IModule currModule : allModules) {
      if (currModule instanceof Language) {
        if (!listedStdLangs.contains(currModule.getModuleFqName())) {
          userLanguages.add(currModule);
        }
      }
    }

    return userLanguages;
  }

  public static void processDeps(IModule localModule, List<IModule> fullList, MPSModuleRepository mrepo, MPSProject mpsProject, List<IModule> blacklistModules, List<IModule> whitelistModules, List<String> reservedNames) {
    if (fullList.contains(localModule)) {
      return;
    } else {
      fullList.add(localModule);
    }

    List<ModuleReference> allModelRefs = new ArrayList<ModuleReference>();
    List<IModule> partList = new ArrayList<IModule>();

    List<Dependency> dependencies = localModule.getDependencies();
    for (Dependency dep : dependencies) {
      allModelRefs.add(dep.getModuleRef());
    }
    allModelRefs.addAll(localModule.getUsedLanguagesReferences());

    for (ModuleReference moduleRef : allModelRefs) {
      if (null != moduleRef) {
        IModule currModule = mrepo.getModule(moduleRef);
        if (!fullList.contains(currModule)) {
          partList.add(currModule);
        }
      }
    }

    for (IModule currModule : partList) {
      if (currModule instanceof Solution) {
        if (Languages.isDefaultImportLanguage(currModule.getModuleReference(), (Solution) currModule)) {
          continue;
        }
      }
      if (null != currModule && !currModule.equals(localModule) &&
        !blacklistModules.contains(currModule) && whitelistModules.contains(currModule) &&
        !reservedNames.contains(currModule.getModuleFqName())
        ) {
        for (MPSModuleOwner owner : mrepo.getOwners(currModule)) {
          if (!currModule.isPackaged()) {
            if (owner.equals(mpsProject)) {
              processDeps(currModule, fullList, mrepo, mpsProject, blacklistModules, whitelistModules, reservedNames);
              break;
            }
          }
        }
      }
    }
  }

  public static void searchModules(String targetType, IModule module, MPSProject mpsProject, MPSModuleRepository mrepo, List<IModule> allModules, List<IModule> blacklistModules, List<IModule> whitelistModules) {
    //Solution solution = MPSModuleRepository.getInstance().getSolution(module.getModuleDescriptor().getModuleReference());
    List<String> listedStdLangs = Languages.getListedStandardLanguages();

//    //Add all loaded libraries to the blacklist (VIEW PANE!)
//    ActionScriptViewPane ASViewPane = ActionScriptViewPane.getInstance(mpsProject.getProject());
//    SModelReference[] ASLbraryModelReferences = ASViewPane.getLibraryModelReferences();
//    for (SModelReference sRef : ASLbraryModelReferences) {
//      IModule sModule = SModelRepository.getInstance().getModelDescriptor(sRef).getModule();
//      blacklistModules.add(sModule);
//    }
//
//    //Add all project items to the whitelist (VIEW PANE!)
//    SModelReference[] ASProjectModelReferences = ASViewPane.getProjectModelReferences();
//    for (SModelReference sModelReference : ASProjectModelReferences) {
//      IModule sModule = SModelRepository.getInstance().getModelDescriptor(sModelReference).getModule();
//      if (null!=sModule && !listedStdLangs.contains(sModule.getModuleFqName())) {
//        whitelistModules.add(sModule);
//      }
//    }

    for (IModule currModule : allModules) {
      if (null != currModule && !listedStdLangs.contains(currModule.getModuleFqName())) {
        whitelistModules.add(currModule);
      }
    }

    //Add all environment libraries to blacklist
    EnvironmentLibraryManager envLibM = mpsProject.getProject().getComponent(EnvironmentLibraryManager.class);
    for (IModule currModule : allModules) {
      List<EnvironmentLibrary> allEnvLibs = envLibM.getAllEnvironmentsLibraries(currModule);
      for (EnvironmentLibrary currEnvLib : allEnvLibs) {
        ModuleReference libraryReference = currEnvLib.getLibraryReference();
        IModule libModule = mrepo.getModule(libraryReference);
        blacklistModules.add(libModule);
      }
    }
  }

  public static List removeDuplicates(List l) {
    Set s = new HashSet();
    s.addAll(l);
    ArrayList a = new ArrayList();
    a.addAll(s);
    return a;
  }

  public static void removeDuplicatesInPlace(List l) {
    Set s = new HashSet();
    s.addAll(l);
    l.clear();
    l.addAll(s);
  }

  public static IFile showSelectDestinationUI(MPSProject mpsProject) {
    String projectDirPath = mpsProject.getProjectFile().getParent();
    File initialFile = null;

    File modulesDir = new File(projectDirPath, MODULES_DIR_NAME);
    if (modulesDir.exists()) {
      initialFile = modulesDir;
    } else {
      initialFile = new File(projectDirPath);
    }

    TreeFileChooser chooser = new TreeFileChooser();
    chooser.setMode(TreeFileChooser.MODE_DIRECTORIES);
    chooser.setInitialFile(FileSystem.getInstance().getFileByPath(initialFile.getPath()));
    chooser.setTitle("Select Output Folder");
    IFile result = chooser.showDialog();

    return result;
  }

  public static String getDestinationFilePath(IFile destinationDirectory, IModule module) {
    return destinationDirectory.getPath() + File.separator + module.getModuleFqName() + ".zip";
  }

  public static File getDestinationFile(String destinationFilePath) {
    return new File(destinationFilePath);
  }

  public static String assetsModuleToPath(IModule assetsModule) {
    String baseAssetsModulePath = null;
    SolutionProperties pro = new SolutionProperties();
    pro.loadFrom(assetsModule.getModuleDescriptor());
    List<ModelRoot> stubModels = pro.getStubModels();
    if (stubModels.size() > 0) {
      ModelRoot defaultRoot = stubModels.get(0);
      baseAssetsModulePath = defaultRoot.getPath();
    }
    return baseAssetsModulePath;
  }

  public static void finishExportModuleAction(final ArchivingUtilityExportContext auContext) {
    List<String> assetsToExport = auContext.getAssetsToExport();

    if (assetsToExport.size() > 0) {
      HashSet<String> selectedModuleIds = new HashSet<String>();
      AUSelectAssetDialog dialog = new AUSelectAssetDialog(auContext.getFrame(), "Select Assets", "Export checked", "Export selected", AUSelectItemDialog.SELECTION_TYPE_MULTIPLE_CHECKED, assetsToExport, selectedModuleIds);
      dialog.checkAll();
      ScreenHelper.centerOnScreen(dialog, true);
      dialog.setVisible(true);
      assetsToExport.clear();
      if (dialog.isRunChecked()) {
        ArrayList<String> checkedAssets = dialog.getCheckedItems();
        if (null != checkedAssets) {
          assetsToExport.addAll(checkedAssets);
        }
      }
    }

    //Ask user to select destination ZIP file
    IFile destinationVirtualDirectory = showSelectDestinationUI(auContext.getMpsProject());
    if (null == destinationVirtualDirectory) {
      auContext.abort("Destination directory path was not selected", "Error", true);
      return;
    }
    //Create paths on a virtual filesystem
    auContext.setDestinationVirtualDirectory(destinationVirtualDirectory);
    auContext.setDestinationFile(getDestinationFile(getDestinationFilePath(destinationVirtualDirectory, auContext.getModule())));

    String projectDirPath = auContext.getMpsProject().getProjectFile().getParent();
    final IFile destinationFile = auContext.getDestinationVirtualDirectory();

    ModelAccess.instance().runWriteActionWithProgressSynchronously(new Progressive() {
      @Override
      public void run(@NotNull ProgressIndicator indicator) {
        if (destinationFile != null) {
          try {
            ZipUtilForModule.exportModule(auContext);
          } catch (IOException e) {
            e.printStackTrace();
          }
        }//To change body of implemented methods use File | Settings | File Templates.
      }
    }, "Exporting Modules", false, auContext.getMpsProject().getProject());
  }

  public static List<String> projectAssetNamesToZIPAssetNames(List<String> projectAssetNames) {
    List<String> zipAssetNames = new ArrayList<String>();
    for (String currAssetName : projectAssetNames) {
      String newAssetName = currAssetName;
      if (currAssetName.startsWith("/") || currAssetName.startsWith("\\")) {
        newAssetName = currAssetName.substring(1);
      }
      zipAssetNames.add(newAssetName);
    }
    return zipAssetNames;
  }

  public static void importModuleAction(AnActionEvent event, IOperationContext operationContext, final MPSProject mpsProject, final Frame frame, final IModule assetsModule, final String[] existingAssets, final String targetType) {
    List<String> allAssetsInProjectFormat = Arrays.asList(existingAssets);
    List<String> allAssets = projectAssetNamesToZIPAssetNames(allAssetsInProjectFormat);
    final String projectRootPath = mpsProject.getProjectFile().getParent();

    TreeFileChooser chooser = new TreeFileChooser();
    chooser.setMode(TreeFileChooser.MODE_FILES);
    chooser.setInitialFile(FileSystem.getInstance().getFileByPath(""));
    chooser.setTitle("Select ModuleName.zip File");
    chooser.setExtensionFileFilter(".zip");

    final IFile sourceZIPVirtualFile = chooser.showDialog();
    if (sourceZIPVirtualFile == null) {
      return;
    }
    final String sourceZIPFileName = sourceZIPVirtualFile.getName().split("\\.")[0];

    List<String> fileNames = ZipUtilForModule.extractFileNamesFromZIP(sourceZIPVirtualFile.getPath());
    final Set<String> modulesInZIP = new HashSet<String>();
    final Set<String> languagesInZIP = new HashSet<String>();
    final Set<String> assetsInZIP = new HashSet<String>();

    for (String fileName : fileNames) {
      Pattern assetsPattern = Pattern.compile("assets/(.+)");
      Matcher assetsMatcher = assetsPattern.matcher(fileName);
      if (assetsMatcher.matches()) {
        assetsInZIP.add(assetsMatcher.group(1));
      }

      //http://stackoverflow.com/questions/5205339/regular-expression-matching-fully-qualified-java-classes
      String unicodeFqClassPattern = "((([\\p{L}_\\p{Sc}][\\p{L}\\p{N}_\\p{Sc}]*\\.)*[\\p{L}_\\p{Sc}][\\p{L}\\p{N}_\\p{Sc}]*)+)";

      Pattern modulesPattern = Pattern.compile("modules/(" + unicodeFqClassPattern + ")/(.*)");
      Matcher modulesMatcher = modulesPattern.matcher(fileName);
      if (modulesMatcher.matches()) {
        modulesInZIP.add(modulesMatcher.group(1));
      }

      Pattern languagesPattern = Pattern.compile("languages/(" + unicodeFqClassPattern + ")/(.*)");
      Matcher languagesMatcher = languagesPattern.matcher(fileName);
      if (languagesMatcher.matches()) {
        languagesInZIP.add(languagesMatcher.group(1));
      }
    }

    Boolean moduleExist = false;
    for (IModule module : mpsProject.getModules()) {
      if (modulesInZIP.contains(module.getModuleFqName())) {
        moduleExist = true;
        Messages.showErrorDialog("Module \"" + module.getModuleFqName() + "\" already exist", "Error");
        return;
      }

      if (languagesInZIP.contains(module.getModuleFqName())) {
        moduleExist = true;
        Messages.showErrorDialog("Language \"" + module.getModuleFqName() + "\" already exist", "Error");
        return;
      }
    }

    List<String> problemAssets = new ArrayList<String>();
    for (String assetName : assetsInZIP) {
      if (allAssets.contains(assetName)) {
        problemAssets.add(assetName);
      }
    }

    final List<String> blacklistedAssets = new ArrayList<String>();
    if (problemAssets.size() > 0) {
      HashSet<String> selectedAssetIds = new HashSet<String>();
      AUSelectAssetDialog dialog = new AUSelectAssetDialog(frame, "Replace Existing Assets", "Replace checked", "Export selected", AUSelectItemDialog.SELECTION_TYPE_MULTIPLE_CHECKED, problemAssets, selectedAssetIds);
      dialog.checkAll();
      ScreenHelper.centerOnScreen(dialog, true);
      dialog.setVisible(true);
      if (dialog.isRunChecked()) {
        ArrayList<String> uncheckedAssets = dialog.getUncheckedItems();
        if (null != uncheckedAssets) {
          blacklistedAssets.addAll(uncheckedAssets);
        }
      }
    }

    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        try {
          String assetsModulePath = assetsModuleToPath(assetsModule);
          ZipUtilForModule.importModule(sourceZIPVirtualFile.getPath(), projectRootPath + File.separator + MODULES_DIR_NAME, projectRootPath + File.separator + LANGS_DIR_NAME, assetsModulePath, blacklistedAssets);
        } catch (IOException e) {
          throw new RuntimeException();
        }

        for (String currModule : modulesInZIP) {
          IFile moduleDescriptor = FileSystem.getInstance().getFileByPath(projectRootPath + File.separator + MODULES_DIR_NAME + File.separator + currModule + File.separator + currModule + MODULE_FILE_EXTENSION);
          FileSystem.getInstance().refresh(moduleDescriptor);
        }

        for (String currModule : languagesInZIP) {
          IFile moduleDescriptor = FileSystem.getInstance().getFileByPath(projectRootPath + File.separator + LANGS_DIR_NAME + File.separator + currModule + File.separator + currModule + LANGUAGE_FILE_EXTENSION);
          FileSystem.getInstance().refresh(moduleDescriptor);
        }
      }

    });


    ModelAccess.instance().runWriteActionWithProgressSynchronously(new Progressive() {
      public void run(@NotNull() ProgressIndicator p0) {
        final ProjectDescriptor projectDescriptor = mpsProject.getProjectDescriptor();
        mpsProject.getProject().getBaseDir().refresh(false, true);

        for (final String moduleNameInZIP : modulesInZIP) {
          IFile moduleDescriptor = FileSystem.getInstance().getFileByPath(projectRootPath + File.separator + MODULES_DIR_NAME + File.separator + moduleNameInZIP + File.separator + moduleNameInZIP + MODULE_FILE_EXTENSION);

          if (null != moduleDescriptor && moduleDescriptor.exists()) {
            String modulePath = moduleDescriptor.getPath();
            if (null != projectDescriptor && null != modulePath) {
              modulePath = modulePath.replace("/", File.separator);
              projectDescriptor.addModule(modulePath);
            }
          }
        }

        for (final String moduleNameInZIP : languagesInZIP) {
          IFile moduleDescriptor = FileSystem.getInstance().getFileByPath(projectRootPath + File.separator + LANGS_DIR_NAME + File.separator + moduleNameInZIP + File.separator + moduleNameInZIP + LANGUAGE_FILE_EXTENSION);

          if (null != moduleDescriptor && moduleDescriptor.exists()) {
            String modulePath = moduleDescriptor.getPath();
            if (null != projectDescriptor && null != modulePath) {
              modulePath = modulePath.replace("/", File.separator);
              projectDescriptor.addModule(modulePath);
            }
          }
        }

        mpsProject.setProjectDescriptor(projectDescriptor);
      }
    }, "Importing Module", false, mpsProject.getProject());
  }
}
