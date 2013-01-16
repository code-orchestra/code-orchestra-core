package codeOrchestra.actionScript.scope;

import com.intellij.openapi.project.Project;
import codeOrchestra.environment.view.EnvironmentLibraryManager;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.ide.smodel.CurrentProjectAccessUtil;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.SNode;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

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
    return getActionScriptSolutionScope(wrappedScope, includeStubs, context, null);
  }

  public static IScope getActionScriptSolutionScope(final IScope wrappedScope, boolean includeStubs, @NotNull IModule sourceModule) {
    return getActionScriptSolutionScope(wrappedScope, includeStubs, null, sourceModule);
  }

  private static IScope getActionScriptSolutionScope(final IScope wrappedScope, boolean includeStubs, @Nullable SNode context, @Nullable IModule sourceModule) {
    Project project = ProjectHolder.getProject();
    boolean filterOutEnvironmentLibs = false;

    if (context == null && sourceModule == null) {
      throw new RuntimeException("context and sourceModule cannot be both null");
    }
    if (sourceModule == null) {
      sourceModule = context.getSourceModule();
    }
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
