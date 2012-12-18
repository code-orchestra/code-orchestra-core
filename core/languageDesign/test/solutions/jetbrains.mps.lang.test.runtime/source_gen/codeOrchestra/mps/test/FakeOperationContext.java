package codeOrchestra.mps.test;

import com.intellij.openapi.project.Project;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.IScope;
import jetbrains.mps.smodel.Language;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.jetbrains.annotations.NotNull;

import java.awt.Frame;
import java.util.List;

/**
 * Created by IntelliJ IDEA.
 * User: Ivan
 * Date: Sep 15, 2010
 * Time: 5:01:50 PM
 * To change this template use File | Settings | File Templates.
 */
@CodeOrchestraPatch
public class FakeOperationContext implements IOperationContext {

  private final Project _project;

  private final String _moduleNamespace;

  public FakeOperationContext(Project project, String moduleNamespace) {
    _project = project;
    _moduleNamespace = moduleNamespace;
  }

  @Override
  public Project getProject() {
    return _project;
  }

  @Override
  public IModule getModule() {
    final List<Language> languages = _project.getComponent(MPSProject.class).getProjectLanguages();
    if (languages != null && !languages.isEmpty()) {
      for (Language language : languages) {
        if (_moduleNamespace.equals(language.toString())) {
          return language;
        }
      }
    }
    return null;
  }

  @NotNull
  @Override
  public IScope getScope() {
    return GlobalScope.getInstance();
  }

  @Override
  public Frame getMainFrame() {
    return null;
  }

  @Override
  public boolean isValid() {
    return true;
  }

  @Override
  public boolean isTestMode() {
    return false;
  }

  @Override
  public <T> T getComponent(Class<T> clazz) {
    return null;
  }
}
