package codeOrchestra.debugger.configuration;

import com.intellij.execution.ExecutionException;
import codeOrchestra.actionscript.modulemaker.SolutionUtils;
import jetbrains.mps.debug.api.IDebuggerSettings;
import jetbrains.mps.project.Solution;
import org.jetbrains.annotations.NotNull;

import java.io.File;
import java.util.*;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractDebuggerSettings implements IDebuggerSettings {

  public List<String> getSourcePaths() throws ExecutionException {
    Solution runModule = getSolution();

    // Self
    Set<String> sourcePaths = new LinkedHashSet<String>();
    sourcePaths.addAll(runModule.getSourcePaths());

    // Dependencies
    HashSet<Solution> dependencies = new HashSet<Solution>();
    SolutionUtils.fetchDependencies(runModule, dependencies);
    for (Solution dependencyModule : dependencies) {
      if (!SolutionUtils.isSWCSolution(dependencyModule)) {
        sourcePaths.addAll(dependencyModule.getSourcePaths());
      }
    }

    // Filter out non-existing ones
    Iterator<String> pathsIterator = sourcePaths.iterator();
    while (pathsIterator.hasNext()) {
      if (!new File(pathsIterator.next()).exists()) {
        pathsIterator.remove();
      }
    }

    return new ArrayList<String>(sourcePaths);
  }

  protected abstract Solution getSolution() throws ExecutionException;

  @NotNull
  @Override
  public String getCommandLine(boolean application) {
    return "";
  }

  @Override
  public boolean isEmpty() {
    return false;
  }

}
