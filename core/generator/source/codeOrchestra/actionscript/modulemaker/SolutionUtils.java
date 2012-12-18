package codeOrchestra.actionscript.modulemaker;

import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.modules.ModuleReference;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.smodel.LanguageID;

import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public final class SolutionUtils {

  public static void fetchDependencies(Solution solution, Set<Solution> dependencies) {
    for(IModule dependencyModule : solution.getDependOnModules()) {
      if (dependencyModule instanceof Solution) {
        Solution dependencyCandidate = (Solution) dependencyModule;
        if (!dependencies.contains(dependencyCandidate)) {
          dependencies.add(dependencyCandidate);
          fetchDependencies(dependencyCandidate, dependencies);
        }
      }
    }
  }

  public static boolean isActionScriptDependent(Solution solution) {
    //TODO: Rewrite using language inheritance
    for (ModuleReference languageRef : solution.getUsedLanguagesReferences()) {
      if (languageRef.getModuleFqName().startsWith("codeOrchestra.actionScript")) {
        return true;
      }
    }
    return false;
  }

  public static boolean isActionScriptDependent(SolutionDescriptor solutionDescriptor) {
    //TODO: Rewrite using language inheritance
    for (ModuleReference languageRef : solutionDescriptor.getUsedLanguages()) {
      if (languageRef.getModuleFqName().startsWith("codeOrchestra.actionScript")) {
        return true;
      }
    }
    return false;
  }

  public static String getSWCClassPathItemPath(Solution solution) {
    for (ModelRoot stubModelsEntry : solution.getModuleDescriptor().getStubModelEntries()) {
      if (stubModelsEntry.getPath().toLowerCase().endsWith(".swc")) {
        return stubModelsEntry.getPath();
      }
    }
    return null;
  }

  public static boolean isSWCSolution(Solution solution) {
    for (ModelRoot stubModelsEntry : solution.getModuleDescriptor().getStubModelEntries()) {
      if (LanguageID.SWC_MANAGER.equals(stubModelsEntry.getManager())) {
        return true;
      }
    }
    return false;
  }

  public static boolean isSWCSolution(SolutionDescriptor solution) {
    for (ModelRoot stubModelsEntry : solution.getStubModelEntries()) {
      if (LanguageID.SWC_MANAGER.equals(stubModelsEntry.getManager())) {
        return true;
      }
    }
    return false;
  }


}
