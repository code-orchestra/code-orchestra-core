package codeOrchestra.actionScript.assets;

import codeOrchestra.actionScript.assets.util.AssetEventType;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import codeOrchestra.utils.ProjectHolder;
import com.intellij.openapi.components.AbstractProjectComponent;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.util.Computable;
import com.intellij.openapi.vfs.VirtualFile;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.ModuleId;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.smodel.*;
import jetbrains.mps.stubs.BaseStubModelDescriptor;
import jetbrains.mps.stubs.StubReloadManager;
import jetbrains.mps.util.FileUtil;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.util.*;

/**
 * Project assets manager.
 *
 * @author Alexander Eliseyev
 */
public final class AssetsManager extends AbstractProjectComponent implements ProjectComponent {

  public static AssetsManager getInstance() {
    return ProjectHolder.getProject().getComponent(AssetsManager.class);
  }

  private static final String FILE_ASSET_CONCEPT = "codeOrchestra.projectAssets.structure.FileAsset";
  private static final String PATH_PROPERTY_NAME = "path";

  public final static String DEFAULT_ASSETS_DIR = "assets";

  public final static ModuleReference ASSETS_LANG_REFEFERNCE = ModuleReference.fromString("codeOrchestra.projectAssets");

  private AssetsSolution assetsSolution;

  private List<AssetFileListener> fileListeners = new ArrayList<AssetFileListener>();

  public AssetsManager(Project project) {
    super(project);
  }

  public boolean areModuleAssetsEnabled() {
    // The module assets are currently disabled
    return false;
  }

  @Override
  public void disposeComponent() {
    this.assetsSolution = null;
  }

  public void addAssetFileListener(AssetFileListener listener) {
    fileListeners.add(listener);
  }

  public void removeAssetFileListener(AssetFileListener listener) {
    fileListeners.remove(listener);
  }

  public void fireAssetFileEvent(AssetEventType eventType, String assetFilePath) {
    String relativePath = FileUtil.getRelativePath(assetFilePath, createOrGetProjectAssetsDir().getPath(), File.separator);
    AssetFileEvent assetFileEvent = new AssetFileEvent(assetFilePath, relativePath, eventType);

    for (AssetFileListener assetFileListener : fileListeners) {
      assetFileListener.onAssetFileEvent(assetFileEvent);
    }
  }

  public void reloadProjectAssetsStubs() {
    // 1 - Mark the asset model as requiring a reload
    SModelReference sModelReference = createProjectAssetModelReference(myProject);
    if (sModelReference != null) {
      SModelDescriptor descriptor = SModelRepository.getInstance().getModelDescriptor(sModelReference);
      if (descriptor != null && descriptor instanceof BaseStubModelDescriptor) {
        ((BaseStubModelDescriptor) descriptor).markReload();
      }
    }

    // 2 - Reload the stubs
    StubReloadManager.getInstance().reload();

    // 3 - Refresh the view
    IProjectPane currentPane = ViewUtils.getCurrentPane(myProject);
    if (currentPane != null) {
      currentPane.rebuild();
    }
  }

  private SolutionDescriptor createProjectAssetsSD() {
    SolutionDescriptor descriptor = new SolutionDescriptor();

    // Name, UUID & stuff

    descriptor.setUUID(getProjectAssetsUUID().toString());
    descriptor.setNamespace(getProjectAssetSolutionNamespace(myProject.getName()));
    descriptor.setCompileInMPS(false);
    descriptor.setDontLoadClasses(true);
    descriptor.getUsedLanguages().add(ASSETS_LANG_REFEFERNCE);
    descriptor.setAssetsDirName(DEFAULT_ASSETS_DIR, null);

    // Assets stubs model root

    ModelRoot assetModelRoot = new ModelRoot();
    assetModelRoot.setPath(createOrGetProjectAssetsDir().getPath());
    assetModelRoot.setManager(LanguageID.ASSETS_MANAGER);
    descriptor.getStubModelEntries().add(assetModelRoot);

    return descriptor;
  }

  public Set<String> getProjectAssetsPaths() {
    MPSProject mpsProject = myProject.getComponent(MPSProject.class);
    ModuleReference assetsSolutionReference = mpsProject.getAssetsSolutionReference();

    if (assetsSolutionReference != null) {
      IModule module = MPSModuleRepository.getInstance().getModule(assetsSolutionReference);
      if (module != null) {
        return getAssetsPathsForSolution((Solution) module);
      }
    }

    return Collections.EMPTY_SET;
  }

  private Set<String> getAssetsPathsForSolution(final Solution solution) {
    if (solution.getModuleDescriptor().getAssetsDirName() == null) {
      return Collections.EMPTY_SET;
    }

    return ModelAccess.instance().runReadAction(new Computable<Set<String>>() {
      public Set<String> compute() {
        Set<String> paths = new HashSet<String>();

        SModelReference assetModelReference = AssetsManager.createAssetModelReference(solution.toString());
        SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(assetModelReference);
        if (modelDescriptor != null) {
          SModel sModel = modelDescriptor.getSModel();
          Iterator<SNode> assetsIterator = sModel.roots().iterator();

          while (assetsIterator.hasNext()) {
            SNode assetNode = assetsIterator.next();
            if (assetNode.isInstanceOfConcept(FILE_ASSET_CONCEPT)) {
              String path = assetNode.getProperty(PATH_PROPERTY_NAME);
              if (path != null) {
                paths.add(path);
              }
            }
          }
        }

        return paths;
      }
    });
  }

  public File createOrGetProjectAssetsDir() {
    VirtualFile projectBaseDir = myProject.getBaseDir();
    File assetsDir = new File(projectBaseDir.getPath(), DEFAULT_ASSETS_DIR);

    if (!assetsDir.exists()) {
      boolean dirCreated = assetsDir.mkdir();
      if (!dirCreated) {
        throw new RuntimeException("Can't create assets dir by the path: " + assetsDir.getPath());
      }
    }

    return assetsDir;
  }

  public Solution getOrCreateProjectAssetsSolution(MPSModuleOwner moduleOwner) {
    if (this.assetsSolution != null) {
      return this.assetsSolution;
    }

    this.assetsSolution = new AssetsSolution();

    MPSModuleRepository repository = MPSModuleRepository.getInstance();
    assetsSolution.setSolutionDescriptor(createProjectAssetsSD(), false);
    repository.addModule(assetsSolution, moduleOwner);

    return assetsSolution;
  }

  private UUID getProjectAssetsUUID() {
    String projectName = myProject.getName();
    return getProjectAssetsUUID(projectName);
  }

  // --- Static stuff (not requiring an open initialized project)

  public static SModelReference createProjectAssetModelReference(Project project) {
    return createAssetModelReference(getProjectAssetSolutionNamespace(project.getName()));
  }

  public static SModelReference createAssetModelReference(String moduleName) {
    String swcStubStereotype = SModelStereotype.getStubStereotypeForId("asset");
    String modelName = "#assets#-" + moduleName;

    SModelFqName fqName = new SModelFqName(modelName, swcStubStereotype);
    SModelId id = SModelId.foreign(swcStubStereotype, modelName);

    return new SModelReference(fqName, id);
  }

  public static SModel getProjectAssetsModel(@NotNull Project project) {
    SModelDescriptor modelDescriptor = SModelRepository.getInstance().getModelDescriptor(createAssetModelReference(getProjectAssetSolutionNamespace(project.getName())));
    if (modelDescriptor == null) {
      return null;
    }
    return modelDescriptor.getSModel();
  }

  public static ModuleReference createProjectAssetsModuleReference(String projectName) {
    ModuleId moduleId = ModuleId.fromString(getProjectAssetsUUID(projectName).toString());
    return new ModuleReference(projectName, moduleId);
  }

  public boolean isAssetsModule(Solution solution) {
    return solution.equals(assetsSolution);
  }

  // --- Internal static stuff

  private static String getProjectAssetSolutionNamespace(String projectName) {
    return "Project_assets";
  }

  private static UUID getProjectAssetsUUID(String projectName) {
    return new UUID(projectName.hashCode() * 17, projectName.hashCode() * 37);
  }

}
