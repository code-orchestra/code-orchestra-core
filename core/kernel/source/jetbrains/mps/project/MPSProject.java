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
package jetbrains.mps.project;

import codeOrchestra.utils.ProjectHolder;
import com.intellij.ide.impl.ProjectUtil;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.progress.EmptyProgressIndicator;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.vfs.*;
import codeOrchestra.actionScript.assets.AssetsManager;
import codeOrchestra.actionScript.assets.AssetsSolution;
import codeOrchestra.actionScript.assets.util.AssetsReloadFileListener;
import codeOrchestra.actionScript.stubs.ASStubsReloadFileListener;
import codeOrchestra.rgs.server.RGSParametersCLI;
import jetbrains.mps.MPSCore;
import jetbrains.mps.cleanup.CleanupManager;
import jetbrains.mps.library.ModulesMiner;
import jetbrains.mps.library.ModulesMiner.ModuleHandle;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.persistence.ProjectDescriptorPersistence;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.project.Path;
import jetbrains.mps.project.structure.project.ProjectDescriptor;
import jetbrains.mps.reloading.ClassLoaderManager;
import jetbrains.mps.smodel.*;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;
import org.jdom.Element;
import org.jetbrains.annotations.NonNls;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@State(
  name = "MPSProject",
  storages = {
    @Storage(
      id = "other",
      file = "$PROJECT_FILE$"
    )
  }
)
public class MPSProject implements MPSModuleOwner, ProjectComponent, PersistentStateComponent<Element> {

  private Project myProject;
  private Element myProjectElement;
  private List<Object> myProjectDevKits;

  @CodeOrchestraPatch
  private boolean hasToBeSaved;

  @CodeOrchestraPatch
  private AssetsReloadFileListener assetsReloadFileListener;

  @CodeOrchestraPatch
  private ASStubsReloadFileListener asStubsReloadFileListener;

  @CodeOrchestraPatch
  private ModuleReference assetsSolutionReference;

  public MPSProject(Project project) {
    myProject = project;
  }

  public Element getState() {
    if (myProject.getPresentableUrl() == null) {
      return new Element("state");
    }

    return ModelAccess.instance().runReadAction(new Computable<Element>() {
      public Element compute() {
        ProjectDescriptor descriptor = getProjectDescriptor();
        File file = new File(myProject.getPresentableUrl());
        return ProjectDescriptorPersistence.saveProjectDescriptorToElement(descriptor, file);
      }
    });
  }

  @CodeOrchestraPatch
  public void forceSave() {
    if (!hasToBeSaved) {
      return;
    }

    ModelAccess.instance().runReadAction(new Computable<Element>() {
      public Element compute() {
        ProjectDescriptor descriptor = getProjectDescriptor();
        File file = new File(myProject.getPresentableUrl());
        Element element = ProjectDescriptorPersistence.saveProjectDescriptorToElement(descriptor, file);

        hasToBeSaved = false;

        return element;
      }
    });
  }

  public void loadState(Element state) {
    myProjectElement = state;
  }

  public void projectOpened() {

  }

  public void projectClosed() {

  }

  @NonNls
  @NotNull
  public String getComponentName() {
    return "MPS Project Holder";
  }

  public void initComponent() {
    String url = myProject.getPresentableUrl();
    if (url != null) {
      final File projectFile = new File(url);
      ProjectDescriptor descriptor = new ProjectDescriptor();
      ProjectDescriptorPersistence.loadProjectDescriptorFromElement(descriptor, projectFile, myProjectElement);
      init(projectFile, descriptor);
    } else {
      ProjectDescriptor descriptor = new ProjectDescriptor();
      init(null, descriptor);
    }
  }

  public void disposeComponent() {
    dispose(false);
  }

  //-----------project holder end

  public static final String COMPONENT = "component";
  public static final String CLASS = "class";

  private static final Logger LOG = Logger.getLogger(MPSProject.class);

  private File myProjectFile;
  private ProjectDescriptor myProjectDescriptor;

  private List<ModuleReference> myModules = new ArrayList<ModuleReference>();

  private String myErrors = null;

  @CodeOrchestraPatch
  public void init(final File projectFile, final ProjectDescriptor projectDescriptor) {
    ProjectHolder.setBackupProject(myProject); // CO-4601

    if (myProject.isDefault()) return;

    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        myProjectFile = projectFile;
        myProjectDescriptor = projectDescriptor;

        readModules();

        for (IModule m : getModules()) {
          m.onModuleLoad();
        }
      }
    });
  }

  @Deprecated //now this is done in ProjectCloseClassReloader
  public void dispose(boolean reloadAll) {
    dispose();
  }

  @CodeOrchestraPatch
  public void dispose() {
    // RE-1756
    if (this.assetsReloadFileListener != null) {
      VirtualFileManager.getInstance().removeVirtualFileListener(this.assetsReloadFileListener);
      this.assetsReloadFileListener = null;
    }
    // RE-1419
    if (this.asStubsReloadFileListener != null) {
      VirtualFileManager.getInstance().removeVirtualFileListener(this.asStubsReloadFileListener);
      this.asStubsReloadFileListener = null;
    }

    ModelAccess.instance().runWriteAction(new Runnable() {
      public void run() {
        // RE-2613
        if (assetsSolutionReference != null) {
          IModule projectAssetsModule = MPSModuleRepository.getInstance().getModule(assetsSolutionReference);
          if (projectAssetsModule != null) {
            MPSModuleRepository.getInstance().removeModule(projectAssetsModule);
          }
          assetsSolutionReference = null;
        }

        ClassLoaderManager.getInstance().unloadAll(new EmptyProgressIndicator());

        MPSModuleRepository.getInstance().unRegisterModules(MPSProject.this);

        CleanupManager.getInstance().cleanup();

        if (ProjectManager.getInstance().getOpenProjects().length > 0) {
          ClassLoaderManager.getInstance().reloadAll(new EmptyProgressIndicator());
        }
        ClassLoaderManager.getInstance().updateClassPath();
      }
    });

    //todo hack
    if (myProject != null) {
      if (MPSCore.getInstance().isTestMode() && !(myProject.isDisposed())) {
        //second check if for MPS-12881, we invoked this method reqursively and tried to dispose a disposed project
        ProjectUtil.closeAndDispose(myProject);
      }
    }
  }

  //--modules

  @NotNull
  public List<IModule> getModules() {
    List<IModule> result = new ArrayList<IModule>();
    for (ModuleReference ref : myModules) {
      IModule module = MPSModuleRepository.getInstance().getModule(ref);
      if (module != null) {
        result.add(module);
      } else {
        error("Module was not found in MPSModuleRepository: " + ref.toString());
      }
    }
    return result;
  }

  public List<IModule> getModulesWithGenerators() {
    List<IModule> modules = getModules();
    List<IModule> generators = new ArrayList<IModule>();
    for (IModule m : modules) {
      if (m instanceof Language) {
        generators.addAll(((Language) m).getGenerators());
      }
    }
    modules.addAll(generators);
    return modules;
  }

  @NotNull
  public List<Path> getAllModulePaths() {
    return Collections.unmodifiableList(myProjectDescriptor.getModules());
  }

  public boolean isProjectModule(@NotNull IModule module) {
    return myModules.contains(module.getModuleReference());
  }

  @Nullable
  @CodeOrchestraPatch
  public String getFolderFor(IModule module) {
    // RE-1756
    if (module instanceof AssetsSolution) {
      return null;
    }

    IFile file = module.getDescriptorFile();
    assert file != null;
    Path path = new Path(file.getPath());
    for (Path sp : getAllModulePaths()) {
      if (sp.isSamePath(path)) {
        return sp.getMPSFolder();
      }
    }
    return null;
  }

  public void setFolderFor(IModule module, String newFolder) {
    IFile file = module.getDescriptorFile();
    assert file != null;
    Path path = new Path(file.getPath());
    for (Path sp : getAllModulePaths()) {
      if (sp.isSamePath(path)) {
        sp.setMPSFolder(newFolder);
        return;
      }
    }
  }

  //--descriptor

  public void update() {
    setProjectDescriptor(getProjectDescriptor());
  }

  @CodeOrchestraPatch
  public void setProjectDescriptor(final @NotNull ProjectDescriptor descriptor, boolean skipReload) {
    this.hasToBeSaved = true; // RE-4651

    MPSModuleRepository.getInstance().unRegisterModules(MPSProject.this);

    myProjectDescriptor = descriptor;

    readModules();

    if (!skipReload) {
      ClassLoaderManager.getInstance().reloadAll(new EmptyProgressIndicator());
    }
  }

  public void setProjectDescriptor(final @NotNull ProjectDescriptor descriptor) {
    setProjectDescriptor(descriptor, false);
  }

  @NotNull
  public ProjectDescriptor getProjectDescriptor() {
    return myProjectDescriptor;
  }

  //--languages

  @CodeOrchestraPatch
  public void addProjectModule(@NotNull IModule module, boolean skipReload) {
    ProjectDescriptor projectDescriptor = getProjectDescriptor();
    IFile descriptorFile = module.getDescriptorFile();
    assert descriptorFile != null;
    projectDescriptor.addModule(descriptorFile.getPath());
    setProjectDescriptor(projectDescriptor, skipReload);
  }

  public void addProjectModule(@NotNull IModule module) {
    addProjectModule(module, false);
  }

  @CodeOrchestraPatch
  public void removeProjectModule(@NotNull IModule module, boolean skipReload) {
    ProjectDescriptor projectDescriptor = getProjectDescriptor();
    IFile descriptorFile = module.getDescriptorFile();
    assert descriptorFile != null;
    projectDescriptor.removeModule(descriptorFile.getPath());
    setProjectDescriptor(projectDescriptor, skipReload);
  }

  public void removeProjectModule(@NotNull IModule module) {
    removeProjectModule(module, false);
  }

  @NotNull
  public <T extends IModule> List<T> getProjectModules(Class<T> moduleClass) {
    List<T> result = new ArrayList<T>();
    for (ModuleReference mr : myModules) {
      IModule module = MPSModuleRepository.getInstance().getModule(mr);
      if (module == null) continue;
      if (!moduleClass.isInstance(module)) continue;

      result.add((T) module);
    }
    return result;
  }

  //--ui

  @NotNull
  public String toString() {
    return "MPSProject file: " + (myProjectFile == null ? "<none>" : myProjectFile.toString());
  }

  public Project getProject() {
    return myProject;
  }

  private void error(String text) {
    if (myErrors == null) {
      myErrors = text;
    } else {
      myErrors += "\n" + text;
    }
    LOG.error(text);
  }

  public String getErrors() {
    return myErrors;
  }

  //--project stuff

  @NotNull
  public File getProjectFile() {
    return myProjectFile;
  }

  public List<SModelDescriptor> getProjectModels() {
    ArrayList<SModelDescriptor> result = new ArrayList<SModelDescriptor>();
    List<IModule> modules = getModules();
    for (IModule module : modules) {
      result.addAll(module.getOwnModelDescriptors());
    }
    return result;
  }

  @CodeOrchestraPatch
  private void readModules() {
    myErrors = null;

    // load solutions
    myModules = new ArrayList<ModuleReference>();
    for (Path modulePath : myProjectDescriptor.getModules()) {
      String path = modulePath.getPath();

      // RE-4382
      // Fix the paths for the out-of-project solutions in RGS
      if (RGSParametersCLI.isInServerMode() && path.endsWith(MPSExtentions.DOT_SOLUTION)) {
        String projectModulesPath = new File(getProject().getBaseDir().getPath(), "modules").getPath();
        File moduleFile = new File(path);
        if (!moduleFile.getPath().startsWith(projectModulesPath)) {
          String moduleFileName = moduleFile.getName();
          String moduleName = moduleFileName.substring(0, moduleFileName.lastIndexOf("."));

          path = new File(new File(projectModulesPath, moduleName), moduleFileName).getPath();
        }
      }

      IFile descriptorFile = FileSystem.getInstance().getFileByPath(path);
      if (descriptorFile.exists()) {
        ModuleDescriptor descriptor = ModulesMiner.getInstance().loadModuleDescriptor(descriptorFile);
        if (descriptor != null) {
          myModules.add(MPSModuleRepository.getInstance().registerModule(new ModuleHandle(descriptorFile, descriptor), this).getModuleReference());
        } else {
          error("Can't load module from " + descriptorFile.getPath() + " Unknown file type.");
        }
      } else {
        error("Can't load module from " + descriptorFile.getPath() + " File doesn't exist.");
      }
    }

    // RE-1756
    // Create a 'virtual' assets solution for the project
    AssetsManager assetsManager = myProject.getComponent(AssetsManager.class);
    this.assetsSolutionReference = assetsManager.getOrCreateProjectAssetsSolution(this).getModuleReference();
    if (this.assetsReloadFileListener == null) {
      this.assetsReloadFileListener = new AssetsReloadFileListener(myProject);
      VirtualFileManager.getInstance().addVirtualFileListener(this.assetsReloadFileListener);
    }

    // RE-1419
    if (this.asStubsReloadFileListener == null) {
      this.asStubsReloadFileListener = new ASStubsReloadFileListener(myProject);
      VirtualFileManager.getInstance().addVirtualFileListener(this.asStubsReloadFileListener);
    }
  }

  public ModuleReference getAssetsSolutionReference() {
    return assetsSolutionReference;
  }

  //-----------DEPRECATED

  @Deprecated
  // should be left for compatibility with generated plugins (editor openers)
  public <T> T getComponent(Class<T> clazz) {
    return getProject().getComponent(clazz);
  }

  public List<Solution> getProjectSolutions() {
    return getProjectModules(Solution.class);
  }

  public List<Language> getProjectLanguages() {
    return getProjectModules(Language.class);
  }

  public List<DevKit> getProjectDevKits() {
    return getProjectModules(DevKit.class);
  }
}
