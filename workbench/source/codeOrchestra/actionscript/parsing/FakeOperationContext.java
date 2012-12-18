package codeOrchestra.actionscript.parsing;

import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.project.IModule;
import com.intellij.openapi.project.Project;
import java.awt.Frame;
import org.jetbrains.annotations.NotNull;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.project.GlobalScope;

public class FakeOperationContext implements IOperationContext {
  private IModule module;
  private Project project;

  public FakeOperationContext(Project project, IModule module) {
    this.project = project;
    this.module = module;
  }

  public <T> T getComponent(Class<T> clazz) {
    return null;
  }

  public boolean isTestMode() {
    return false;
  }

  public boolean isValid() {
    return true;
  }

  public Frame getMainFrame() {
    return null;
  }

  @NotNull
  public IScope getScope() {
    return GlobalScope.getInstance();
  }

  public IModule getModule() {
    return module;
  }

  public Project getProject() {
    return project;
  }
}