package codeOrchestra.actionscript.logging.settings;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.openapi.options.SearchableConfigurable;
import codeOrchestra.actionscript.logging.settings.LoggingSettings.LoggingSettingsState;
import codeOrchestra.actionscript.logging.view.LoggingSettingsConfigurationPage;
import org.jetbrains.annotations.Nls;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.JComponent;

/**
 * @author Alexander Eliseyev
 */
@State(
  name = "ASLoggingSettings",
  storages = {
    @Storage(
      id ="other",
      file = "$APP_CONFIG$/ASLoggingSettings.xml"
    )
  }
)
public class LoggingSettings implements PersistentStateComponent<LoggingSettingsState>, ApplicationComponent, SearchableConfigurable {

  public static LoggingSettings getInstance() {
    return ApplicationManager.getApplication().getComponent(LoggingSettings.class);
  }

  private LoggingSettingsState state = new LoggingSettingsState();
  private LoggingSettingsConfigurationPage configurationPage;

  @NotNull
  public String getComponentName() {
    return "Logging";
  }

  public String getId() {
    return "as.logging.settings";
  }

  public void initComponent() {

  }

  private LoggingSettingsConfigurationPage getConfigurationPage() {
    if (configurationPage == null) {
      configurationPage = new LoggingSettingsConfigurationPage(this);
    }
    return configurationPage;
  }

  public Runnable enableSearch(String s) {
    return null;
  }

  @Nls
  public String getDisplayName() {
    return "Logging";
  }

  public Icon getIcon() {
    return null;
  }

  public String getHelpTopic() {
    return null;
  }

  public JComponent createComponent() {
    return getConfigurationPage().getContentPane();
  }

  public boolean isModified() {
    return true;
  }

  public boolean isAllowMultipleLoggers() {
    return getState().isAllowMultipleLoggers();
  }

  public void setAllowMultipleLoggers(boolean allowMultipleLoggers) {
    getState().setAllowMultipleLoggers(allowMultipleLoggers);
  }

  public void disposeComponent() {

  }

  public void disposeUIResources() {

  }

  public void apply() throws ConfigurationException {
    getConfigurationPage().apply();
  }

  public void reset() {
    getConfigurationPage().reset();
  }

  public LoggingSettingsState getState() {
    return state;
  }

  public void loadState(LoggingSettingsState state) {
    this.state = state;
  }

  public static class LoggingSettingsState {
    private boolean allowMultipleLoggers;

    public boolean isAllowMultipleLoggers() {
      return allowMultipleLoggers;
    }

    public void setAllowMultipleLoggers(boolean allowMultipleLoggers) {
      this.allowMultipleLoggers = allowMultipleLoggers;
    }
  }

}
