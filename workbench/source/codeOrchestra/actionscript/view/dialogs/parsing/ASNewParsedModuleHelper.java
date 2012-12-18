package codeOrchestra.actionscript.view.dialogs.parsing;

import codeOrchestra.actionscript.view.utils.Languages;
import jetbrains.mps.ide.vfs.IdeaFile;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.modules.Dependency;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.vfs.IFile;

import java.io.File;

/**
 * @author Anton.I.Neverov
 */
public class ASNewParsedModuleHelper {

  private ASNewParsedModuleHelper() {
  }

  public static Solution createNewSolution(final IFile solutionDescriptorFile, MPSProject myProject, boolean compileInMPS) {

    ModelAccess.instance().writeFilesInEDT(new Runnable() {
      @Override
      public void run() {
        ((IdeaFile) solutionDescriptorFile).refresh();
      }
    });

    // Create module dir
    File dir = new File(solutionDescriptorFile.getAbsolutePath()).getParentFile();
    if (!(dir.exists())) {
      dir.mkdirs();
    }
    // Create source dir
    File sourceDir = new File(dir.getPath() + File.separator + "source" + File.separator);
    if (!sourceDir.exists()) {
      sourceDir.mkdir();
    }
    String solutionFileName = solutionDescriptorFile.getName();
    String solutionName = solutionFileName.substring(0, solutionFileName.length() - 4);

    // Create solution
    // RE-2448
    ModelRoot modelRoot = new ModelRoot();
    modelRoot.setPrefix("");
    modelRoot.setPath(solutionDescriptorFile.getParent().getAbsolutePath());
    final Solution solution = Solution.createSolution(solutionName, solutionDescriptorFile, myProject, modelRoot);
    SolutionDescriptor solutionDescriptor = solution.getModuleDescriptor();

    solutionDescriptor.setCompileInMPS(compileInMPS);
    solutionDescriptor.getSourcePaths().add(sourceDir.getPath());

    // Add language imports
    solutionDescriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_INTERNAL));
    solutionDescriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_LOGGING));
    solutionDescriptor.getUsedLanguages().add(ModuleReference.fromString(Languages.ACTION_SCRIPT_ASSETS));

    // Add assets module dependency
    if (myProject.getAssetsSolutionReference() != null) {
      solutionDescriptor.getDependencies().add(new Dependency(myProject.getAssetsSolutionReference(), false));
    }

    // Save the solution descriptor
    ModelAccess.instance().writeFilesInEDT(new Runnable() {
      public void run() {
        solution.save();
      }
    });
    myProject.addProjectModule(solution);

    return solution;
  }

}
