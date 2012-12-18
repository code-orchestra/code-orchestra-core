package jetbrains.mps.ide.actions;

/*Generated by MPS */

import com.intellij.openapi.progress.Task;

import java.util.Iterator;
import java.util.Set;

import codeOrchestra.actionscript.modulemaker.ASModuleMaker;
import codeOrchestra.actionscript.modulemaker.MakeException;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import jetbrains.mps.project.IModule;
import jetbrains.mps.internal.collections.runtime.SetSequence;
import java.util.LinkedHashSet;
import com.intellij.openapi.project.Project;
import jetbrains.mps.project.Solution;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;
import com.intellij.openapi.progress.ProgressIndicator;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.make.ModuleMaker;
import jetbrains.mps.make.MPSCompilationResult;
import jetbrains.mps.reloading.ClassLoaderManager;

public class DefaultMakeTask extends Task.Modal {
  private boolean needClean;
  private Set<IModule> modules = SetSequence.fromSet(new LinkedHashSet<IModule>());
  private Set<Solution> asModules = new LinkedHashSet<Solution>();

  public DefaultMakeTask(Project project, String title, Set<IModule> modules, boolean needClean) {
    super(project, title, true);
    this.needClean = needClean;
    SetSequence.fromSet(this.modules).addSequence(SetSequence.fromSet(modules));

    // Add dependencies
    if (this.modules != null) {
      Iterator<IModule> moduleIterator = modules.iterator();
      while (moduleIterator.hasNext()) {
        IModule module = moduleIterator.next();
        if (module instanceof Solution && SolutionUtils.isActionScriptDependent((Solution) module)) {
          moduleIterator.remove();
          asModules.add((Solution) module);
        }
      }
    }
  }

  @CodeOrchestraPatch
  private boolean canBeMade(Solution solution) {
    return !solution.isPackaged() && !SolutionUtils.isStubSolution(solution);
  }

  @CodeOrchestraPatch
  public void run(@NotNull final ProgressIndicator indicator) {
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        ASModuleMaker asModuleMaker = new ASModuleMaker(getProject());

        // RE-1356
        // AS Solutions
        for (Solution solution : asModules) {
          try {
            // RF-730
            if (canBeMade(solution)) {
              asModuleMaker.make(solution, indicator, myProject);
            }
          } catch (MakeException e) {
            // ignore
          }
        }
        if (ViewUtils.isInActionScriptView()) {
          return;
        }

        // Other solutions
        if (!modules.isEmpty()) {
          ModuleMaker maker = new ModuleMaker();
          if (needClean) {
            maker.clean(modules, indicator);
          }

          MPSCompilationResult compilationResult = maker.make(modules, indicator);
          if (compilationResult.isReloadingNeeded()) {
            ClassLoaderManager.getInstance().reloadAll(indicator);
          }
        }
      }
    });
  }
}
