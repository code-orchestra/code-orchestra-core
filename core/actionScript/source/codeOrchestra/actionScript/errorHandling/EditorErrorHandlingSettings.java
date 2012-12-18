package codeOrchestra.actionScript.errorHandling;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.openapi.options.SearchableConfigurable;
import codeOrchestra.actionScript.errorHandling.EditorErrorHandlingSettings.EditorErrorHandlingSettingsState;
import codeOrchestra.actionScript.license.VersionHelper;
import org.jetbrains.annotations.Nls;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.JComponent;

/**
 * @author Alexander Eliseyev
 */
@State(
  name = "EditorErrorHandlingSettings",
  storages = {
    @Storage(
      id ="other",
      file = "$APP_CONFIG$/editorErrorHandlingSettings.xml"
    )
  }
)
public class EditorErrorHandlingSettings implements PersistentStateComponent<EditorErrorHandlingSettingsState>, ApplicationComponent, SearchableConfigurable {

  public static EditorErrorHandlingSettings getInstance() {
    return ApplicationManager.getApplication().getComponent(EditorErrorHandlingSettings.class);
  }

  private EditorErrorHandlingSettingsState state = new EditorErrorHandlingSettingsState();
  private EditorErrorHandlingConfigurationPage configurationPage;

  @NotNull
  public String getComponentName() {
    return "IDE Debugging";
  }

  public String getId() {
    return "codeOrchestra.error.handling";
  }

  public void initComponent() {

  }

  private EditorErrorHandlingConfigurationPage getConfigurationPage() {
    if (configurationPage == null) {
      configurationPage = new EditorErrorHandlingConfigurationPage(this);
    }
    return configurationPage;
  }

  public Runnable enableSearch(String s) {
    return null;
  }

  @Nls
  public String getDisplayName() {
    return "IDE Debugging";
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
    return configurationPage.isModified();
  }

  public boolean reportFatalErrors() {
    return state.isReportFatalErrors();
  }

  public void setReportFatalErrors(boolean reportFatalErrors) {
    this.state.setReportFatalErrors(reportFatalErrors);
  }

  public boolean useCPUTracing() {
    return state.isUseCPUTracing();
  }

  public void setUseCPUTracing(boolean useCPUTracing) {
    this.state.setUseCPUTracing(useCPUTracing);
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

  public EditorErrorHandlingSettingsState getState() {
    return state;
  }

  public void loadState(EditorErrorHandlingSettingsState state) {
    this.state = state;
  }

  public static class EditorErrorHandlingSettingsState {
    private boolean reportFatalErrors = !VersionHelper.IS_RELEASE_VERSION;
    private boolean useCPUTracing = false;

    public boolean isReportFatalErrors() {
      return reportFatalErrors;
    }

    public void setReportFatalErrors(boolean reportFatalErrors) {
      this.reportFatalErrors = reportFatalErrors;
    }

    public boolean isUseCPUTracing() {
      return useCPUTracing;
    }

    public void setUseCPUTracing(boolean useCPUTracing) {
      this.useCPUTracing = useCPUTracing;
    }
  }

}
