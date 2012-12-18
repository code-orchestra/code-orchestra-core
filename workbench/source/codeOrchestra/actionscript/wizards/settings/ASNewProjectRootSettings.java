package codeOrchestra.actionscript.wizards.settings;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.openapi.options.SearchableConfigurable;
import codeOrchestra.actionscript.wizards.settings.ASNewProjectRootSettings.ASNewProjectSettingsState;
import jetbrains.mps.util.PathManager;
import jetbrains.mps.workbench.WorkbenchPathManager;
import org.apache.commons.lang.StringUtils;
import org.jetbrains.annotations.Nls;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.JComponent;
import java.io.File;

/**
 * @author Alexander Eliseyev
 */
@State(
  name = "ASNewProjectRootSettings",
  storages = {
    @Storage(
      id ="other",
      file = "$APP_CONFIG$/asNewProjectSettings.xml"
    )
  }
)
public class ASNewProjectRootSettings implements PersistentStateComponent<ASNewProjectSettingsState>, ApplicationComponent, SearchableConfigurable {

  public static ASNewProjectRootSettings getInstance() {
    return ApplicationManager.getApplication().getComponent(ASNewProjectRootSettings.class);
  }

  private ASNewProjectSettingsState state = new ASNewProjectSettingsState();
  private ASNewProjectRootConfigurationPage configurationPage;

  @NotNull
  public String getComponentName() {
    return "New Project Settings";
  }

  public String getId() {
    return "new.project.settings";
  }

  public void initComponent() {

  }

  private ASNewProjectRootConfigurationPage getConfigurationPage() {
    if (configurationPage == null) {
      configurationPage = new ASNewProjectRootConfigurationPage(this);
    }
    return configurationPage;
  }

  public Runnable enableSearch(String s) {
    return null;
  }

  @Nls
  public String getDisplayName() {
    return "New Project Settings";
  }

  public Icon getIcon() {
    return null;
  }

  public String getHelpTopic() {
    return null;
  }

  public JComponent createComponent() {
    return getConfigurationPage().getContentPanel();
  }

  public boolean isModified() {
    return true;
  }

  public String getProjectRoot() {
    String root = getState().getProjectsRoot();

    if (StringUtils.isEmpty(root)) {
      return WorkbenchPathManager.getUserHome() + File.separator + "CodeOrchestraProjects";
    }

    return root;
  }

  public void setProjectRoot(String path) {
    getState().setProjectsRoot(path);
  }

  public void apply() throws ConfigurationException {
    configurationPage.apply();
  }

  public void disposeComponent() {
    
  }

  public void reset() {
    configurationPage.reset();
  }

  public void disposeUIResources() {

  }

  public ASNewProjectSettingsState getState() {
    return state;
  }

  public void loadState(ASNewProjectSettingsState state) {
    this.state = state;
  }

  public static class ASNewProjectSettingsState {
    private String projectsRoot;

    public String getProjectsRoot() {
      return projectsRoot;
    }

    public void setProjectsRoot(String projectsRoot) {
      this.projectsRoot = projectsRoot;
    }
  }

}
