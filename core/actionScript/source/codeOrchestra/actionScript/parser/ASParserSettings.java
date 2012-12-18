package codeOrchestra.actionScript.parser;

import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.openapi.options.SearchableConfigurable;
import codeOrchestra.actionScript.parser.ASParserSettings.ASParserSettingsState;
import org.jetbrains.annotations.Nls;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.JComponent;

/**
 * @author Anton.I.Neverov
 */
@State(
  name = "ASParserSettings",
  storages = {
    @Storage(
      id ="other",
      file = "$APP_CONFIG$/asParserSettings.xml"
    )
  }
)
public class ASParserSettings implements PersistentStateComponent<ASParserSettingsState>, ApplicationComponent, SearchableConfigurable {

  public static ASParserSettings getInstance() {
    return ApplicationManager.getApplication().getComponent(ASParserSettings.class);
  }

  private ASParserSettingsState state = new ASParserSettingsState();
  private ASParserConfigurationPage configurationPage;

  @NotNull
  public String getComponentName() {
    return "Parser Settings";
  }

  @NotNull
  public String getId() {
    return "codeOrchestra.parser";
  }

  public void initComponent() {

  }

  private ASParserConfigurationPage getConfigurationPage() {
    if (configurationPage == null) {
      configurationPage = new ASParserConfigurationPage(this);
    }
    return configurationPage;
  }

  public Runnable enableSearch(String s) {
    return null;
  }

  @Nls
  public String getDisplayName() {
    return "Parser";
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

  public boolean isCopyEmbeddedFiles() {
    return state.isCopyEmbeddedFiles();
  }

  public void setCopyEmbeddedFiles(boolean useCPUTracing) {
    this.state.setCopyEmbeddedFiles(useCPUTracing);
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

  public ASParserSettingsState getState() {
    return state;
  }

  public void loadState(ASParserSettingsState state) {
    this.state = state;
  }

  public static class ASParserSettingsState {
    private boolean copyEmbeddedFiles = true;

    public boolean isCopyEmbeddedFiles() {
      return copyEmbeddedFiles;
    }

    public void setCopyEmbeddedFiles(boolean copyEmbeddedFiles) {
      this.copyEmbeddedFiles = copyEmbeddedFiles;
    }
  }
}
