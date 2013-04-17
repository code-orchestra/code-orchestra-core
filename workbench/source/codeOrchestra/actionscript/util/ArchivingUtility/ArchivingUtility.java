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

import codeOrchestra.actionscript.util.ScreenHelper;
import codeOrchestra.actionscript.view.ActionScriptViewPane;
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
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author olegchir
 */
public class ArchivingUtility {

  public static final String MODULES_DIR_NAME = "modules";

  public static ArchivingUtilityExportContext exportModuleAction(AnActionEvent event, final IOperationContext operationContext, final IModule module, final MPSProject mpsProject, final Frame frame) {
    final ArchivingUtilityExportContext auContext = new ArchivingUtilityExportContext();
    auContext.setEvent(event);
    auContext.setOperationContext(operationContext);
    auContext.setModule(module);
    auContext.setMpsProject(mpsProject);
    auContext.setFrame(frame);

    final MPSModuleRepository mrepo = MPSModuleRepository.getInstance();
    final List<IModule> allModules = new ArrayList<IModule>();
    final List<IModule> blacklistModules = new ArrayList<IModule>();
    final ArrayList<IModule> depModules = new ArrayList<IModule>();

    IFile destinationVirtualDirectory = showSelectDestinationUI(mpsProject);
    auContext.setDestinationVirtualDirectory(destinationVirtualDirectory);
    auContext.setDestinationFile(getDestinationFile(getDestinationFilePath(destinationVirtualDirectory, module)));

    ModelAccess.instance().runWriteActionWithProgressSynchronously(new Progressive() {
      public void run(@NotNull() ProgressIndicator p0) {
        Solution solution = MPSModuleRepository.getInstance().getSolution(module.getModuleDescriptor().getModuleReference());

        allModules.addAll(mrepo.getAllModules());

        //Add all loaded libraries to the blacklist (VIEW PANE!)
        ActionScriptViewPane viewPane = ActionScriptViewPane.getInstance(mpsProject.getProject());
        SModelReference[] libraryModelReferences = viewPane.getLibraryModelReferences();
        for (SModelReference sRef : libraryModelReferences) {
          IModule sModule = SModelRepository.getInstance().getModelDescriptor(sRef).getModule();
          blacklistModules.add(sModule);
        }

        //Add all project items to the whitelist (VIEW PANE!)
        SModelReference[] projectModelReferences = viewPane.getProjectModelReferences();
        ArrayList<IModule> whitelistModules = new ArrayList<IModule>();
        for (SModelReference sModelReference : projectModelReferences) {
          IModule sModule = SModelRepository.getInstance().getModelDescriptor(sModelReference).getModule();
          whitelistModules.add(sModule);
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

        //Create blacklist of reserved module names
        List<String> reservedNames = Arrays.asList("playerglobal_swc", "Project_assets");

        //Filter lib by blacklist and whitelist, reserved names list,
        //and then if it belongs to current project and not packaged -
        // add it to the list of modules that can be exported
        List<Dependency> dependencies = module.getDependencies();
        for (Dependency dep : dependencies) {
          ModuleReference moduleRef = dep.getModuleRef();
          if (null != moduleRef) {
            IModule currModule = mrepo.getModule(moduleRef);
            if (null!=currModule && !currModule.equals(module) &&
              !blacklistModules.contains(currModule) && whitelistModules.contains(currModule) &&
              !reservedNames.contains(currModule.getModuleFqName()) &&
              !Languages.isDefaultImportLanguage(moduleRef, solution)
              ) {
              for (MPSModuleOwner owner : mrepo.getOwners(currModule)) {
                if (!currModule.isPackaged()) {
                  if (owner.equals(mpsProject)) {
                    depModules.add(currModule);
                    break;
                  }
                }
              }
            }
          }
        }
      }
    }, "Checking Modules", false, mpsProject.getProject());

    boolean shouldShowModuleSelectionDialog = depModules.size() > 0;
    depModules.add(module);
    final ArrayList<IModule> approvedDepModules = new ArrayList<IModule>();

    if (shouldShowModuleSelectionDialog) {
      HashSet<String> selectedModuleIds = new HashSet<String>();
      AUSelectModuleDialog dialog = new AUSelectModuleDialog(frame, "Select Modules", "Export checked", depModules, selectedModuleIds);
      dialog.selectAll();
      ScreenHelper.centerOnScreen(dialog, true);
      dialog.setVisible(true);

      if (dialog.isRunChecked()) {
        ArrayList<IModule> checkedModules = dialog.getCheckedItems();
        if (null != checkedModules) {
          approvedDepModules.addAll(checkedModules);
        }
      }
    } else {
      approvedDepModules.add(module);
    }

    auContext.setModulesToExport(approvedDepModules);
    return auContext;
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
    String projectDirPath = auContext.getMpsProject().getProjectFile().getParent();
    final IFile destinationFile = auContext.getDestinationVirtualDirectory();

    List<String> assetsToExport = auContext.getAssetsToExport();

    if (assetsToExport.size() > 0) {
      HashSet<String> selectedModuleIds = new HashSet<String>();
      AUSelectAssetDialog dialog = new AUSelectAssetDialog(auContext.getFrame(), "Select Assets", "Export checked", assetsToExport, selectedModuleIds);
      dialog.selectAll();
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

  public static void importModuleAction(AnActionEvent event, IOperationContext operationContext, final MPSProject mpsProject, final Frame frame, final IModule assetsModule, final String[] existingAssets) {
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
    }

    Boolean moduleExist = false;
    for (IModule module : mpsProject.getModules()) {
      if (modulesInZIP.contains(module.getModuleFqName())) {
        moduleExist = true;
        Messages.showErrorDialog("Module with that name \"" + module.getModuleFqName() + "\" is already exist", "Error");
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
      AUSelectAssetDialog dialog = new AUSelectAssetDialog(frame, "Replace Existing Assets", "Replace checked", problemAssets, selectedAssetIds);
      dialog.selectAll();
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
          ZipUtilForModule.importModule(sourceZIPVirtualFile.getPath(), projectRootPath + File.separator + MODULES_DIR_NAME, assetsModulePath, blacklistedAssets);
        } catch (IOException e) {
          throw new RuntimeException();
        }
        IFile moduleDescriptor = FileSystem.getInstance().getFileByPath(projectRootPath + File.separator + MODULES_DIR_NAME + File.separator + sourceZIPFileName + File.separator + sourceZIPFileName + ".msd");
        FileSystem.getInstance().refresh(moduleDescriptor);
      }

    });


    ModelAccess.instance().runWriteActionWithProgressSynchronously(new Progressive() {
      public void run(@NotNull() ProgressIndicator p0) {
        final ProjectDescriptor projectDescriptor = mpsProject.getProjectDescriptor();
        mpsProject.getProject().getBaseDir().refresh(false,true);
        for (final String moduleNameInZIP : modulesInZIP) {
          IFile moduleDescriptor = FileSystem.getInstance().getFileByPath(projectRootPath + File.separator + MODULES_DIR_NAME + File.separator + moduleNameInZIP + File.separator + moduleNameInZIP + ".msd");

          if (null != moduleDescriptor && moduleDescriptor.exists()) {
            String modulePath = moduleDescriptor.getPath();
            if (null != projectDescriptor && null != modulePath) {
              modulePath = modulePath.replace("/",File.separator);
              projectDescriptor.addModule(modulePath);
            }
          }
        }
        mpsProject.setProjectDescriptor(projectDescriptor);
      }
    }, "Importing Module", false, mpsProject.getProject());

  }
}
