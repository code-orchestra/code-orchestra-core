package codeOrchestra.actionScript.scope;

import com.intellij.openapi.project.Project;
import codeOrchestra.environment.view.EnvironmentLibraryManager;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.ide.smodel.CurrentProjectAccessUtil;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public final class ActionScriptScopes {

  private ActionScriptScopes() {
  }

  public static IScope getActionScriptLanguageScope(final IScope wrappedScope) {
    return new ActionScriptLanguageScope() {
      protected IScope getDelegatedScope() {
        return wrappedScope;
      }
    };
  }

  @Deprecated
  public static IScope getActionScriptSolutionScope(final IScope wrappedScope, boolean includeStubs) {
    return new ActionScriptSolutionScope(includeStubs, ProjectHolder.getProject(), false) {
      @Override
      protected IScope getDelegatedScope() {
        return wrappedScope;
      }
    };
  }

  public static IScope getActionScriptSolutionScope(final IScope wrappedScope, boolean includeStubs, @NotNull SNode context) {
    Project project = ProjectHolder.getProject();
    boolean filterOutEnvironmentLibs = false;

    IModule sourceModule = context.getSourceModule();
    if (project != null && sourceModule != null) {
      filterOutEnvironmentLibs = !project.getComponent(EnvironmentLibraryManager.class).isLibraryImplementation(sourceModule);
    }

    return new ActionScriptSolutionScope(includeStubs, project, filterOutEnvironmentLibs) {
      @Override
      protected IScope getDelegatedScope() {
        return wrappedScope;
      }
    };
  }

}
