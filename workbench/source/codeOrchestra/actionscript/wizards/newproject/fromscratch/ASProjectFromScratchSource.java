package codeOrchestra.actionscript.wizards.newproject.fromscratch;

import com.intellij.openapi.project.Project;
import codeOrchestra.actionScript.assets.AssetsManager;
import codeOrchestra.actionScript.id.ASMNodeId;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import codeOrchestra.actionscript.view.utils.Languages;
import codeOrchestra.actionscript.view.utils.ModelUtils;
import codeOrchestra.actionscript.wizards.newproject.*;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.project.MPSExtentions;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.smodel.*;
import jetbrains.mps.smodel.descriptor.EditableSModelDescriptor;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.vfs.FileSystem;
import jetbrains.mps.vfs.IFile;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASProjectFromScratchSource extends ASAbstractProjectSource implements ASProjectSource {

  private ASProjectFromScratchSettings settings = new ASProjectFromScratchSettings();

  public String getID() {
    return "scratch";
  }

  public String getDescription() {
    return "Create new Code Orchestra project structure";
  }

  public String getName() {
    return "Create project from scratch";
  }

  protected void prepareCreatedProject(final Project createdProject) {
    final MPSProject mpsProject = createdProject.getComponent(MPSProject.class);

    ModelAccess.instance().runWriteActionInCommand(new Runnable() {
      public void run() {
        if (settings.isCreateModule()) {
          // Create a module (solution)
          Solution module = createNewModule(createdProject);

          if (!settings.isCreateMainClass()) {
            return;
          }

          // Create a model
          SModelDescriptor modelDescriptor = null;
          SModelFqName modelUID = new SModelFqName(settings.getPackageName(), "");
//          if (SModelRepository.getInstance().getModelDescriptor(modelUID) != null) {
//            modelDescriptor = SModelRepository.getInstance().getModelDescriptor(modelUID);
//            module.getOwnModelDescriptors().add(modelDescriptor);
//            module.save();
//          } else {
            modelDescriptor = module.createModel(modelUID, module.getSModelRoots().get(0));
          //}
          SModel sModel = modelDescriptor.getSModel();
          sModel.setLoading(true);

          // Add model imports
          ModelUtils.addDefaultModelImports(sModel, createdProject);

          // Add language imports
          sModel.addLanguage(Languages.getReference(Languages.ACTION_SCRIPT_INTERNAL));
          sModel.addLanguage(Languages.getReference(Languages.ACTION_SCRIPT_LOGGING));
          sModel.addLanguage(Languages.getReference(Languages.ACTION_SCRIPT_ASSETS));
          sModel.addEngagedOnGenerationLanguage(Languages.getReference(Languages.ACTION_SCRIPT_LOGGING));

          // Create a class
          SNode clazz = SConceptOperations.createNewNode("codeOrchestra.actionScript.structure.ClassConcept", null);
          SPropertyOperations.set(clazz, "name", settings.getMainClassName());
          sModel.addRoot(clazz);

          // Create a Sprite superclass reference
          SNode classifierType = SConceptOperations.createNewNode("codeOrchestra.actionScript.structure.ClassifierType", null);
          SNodeId spriteNodeId = ASMNodeId.createId(NameUtil.longNameFromNamespaceAndShortName("flash.display", "Sprite"));
          SReference spriteReference = SReference.create("reference", classifierType, getFlashDisplayPackageReference(), spriteNodeId);
          classifierType.addReference(spriteReference);
          SLinkOperations.setTarget(clazz, "superclass", classifierType, true);

          // Set a main class in module settings
          if (settings.isCreateMainClass()) {
            CompilerSettings compilerSettings = module.getModuleDescriptor().getCompilerSettings();
            compilerSettings.mainClassNodeId = clazz.getId();
            compilerSettings.mainClassModelUID = modelDescriptor.getSModelReference().toString();
          }

          module.save();

          // Save
          ((EditableSModelDescriptor) modelDescriptor).save();
          modelDescriptor.getSModel().setLoading(false);
        }
      }
    });
  }

  public static SModelReference getFlashDisplayPackageReference() {
    SModelFqName fqName = new SModelFqName("flash.display", "swc_stub");
    SModelId id = SModelId.foreign("swc_stub", "flash.display");
    return new SModelReference(fqName, id);
  }

  private Solution createNewModule(Project project) {
    MPSProject mpsProject = project.getComponent(MPSProject.class);

    // 1 - Create
    IFile solutionFile = FileSystem.getInstance().getFileByPath(getSolutionFileName());
    // RE-2448
    ModelRoot modelRoot = new ModelRoot();
    modelRoot.setPrefix("");
    modelRoot.setPath(solutionFile.getParent().getAbsolutePath());
    Solution solution = Solution.createSolution(settings.getModuleName(), solutionFile, mpsProject, modelRoot);

    // 2 - Adjust

    // Model root
    ModuleDescriptor descriptor = solution.getModuleDescriptor();

    // Source paths
    descriptor.getSourcePaths().add(solutionFile.getParent().getAbsolutePath() + File.separator + "source");

    // Add languages dependencies
    descriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_INTERNAL));
    descriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_LOGGING));
    descriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_ASSETS));

    // Add assets solution dependency
    descriptor.getDependencies().add(new Dependency(AssetsManager.createProjectAssetsModuleReference(project.getName()), false));

    // Add playerglobal dependency
    Dependency playerglobalDependency = new Dependency();
    playerglobalDependency.setModuleRef(ModuleReference.fromString("playerglobal_swc"));
    descriptor.getDependencies().add(playerglobalDependency);

    // Save and add to project
    solution.save();
    mpsProject.addProjectModule(solution, true);

    return solution;
  }

  public String createDirs() {
    File projectDirFile = new File(settings.getProjectPath());
    if (!(projectDirFile.exists())) {
      if (!projectDirFile.mkdirs()) return "Project directory creation failed";
    }

    File solutionDir = null;
    if (settings.isCreateModule()) {
      String path = getSolutionFileName();
      File solutionDescriptorFile = new File(path);
      solutionDir = solutionDescriptorFile.getParentFile();
      if (!(solutionDir.exists())) {
        if (!solutionDir.mkdirs()) return "Module directory creation failed";
      }

      // Create source dir
      File sourceDir = new File(solutionDir.getPath() + File.separator + "source");
      if (!sourceDir.exists()) {
        sourceDir.mkdir();
      }
    }

    return null;
  }

  public ASNewProjectSettings getSettings() {
    return settings;
  }

  public boolean isEnabled() {
    return true;
  }

  public List<ASNewProjectStep> getSteps() {
    List<ASNewProjectStep> steps = new ArrayList<ASNewProjectStep>();

    steps.add(new ASProjectFromScratchProjectStep(settings));
    steps.add(new ASProjectFromScratchClassStep(settings));

    return steps;
  }

  private String getSolutionFileName() {
    return NewProjectPathHelper.getSolutionFilePath(settings.getModulePath(), settings.getModuleName());
  }

}
