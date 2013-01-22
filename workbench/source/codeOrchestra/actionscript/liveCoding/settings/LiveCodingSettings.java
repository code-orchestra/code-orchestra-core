package codeOrchestra.actionscript.liveCoding.settings;

import codeOrchestra.actionscript.liveCoding.settings.LiveCodingSettings.LiveCodingSettingsState;
import codeOrchestra.actionscript.modulemaker.CompilerKind;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.openapi.options.SearchableConfigurable;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.Nls;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.JComponent;

/**
 * @author Alexander Eliseyev
 */
@State(
  name = "LiveCodingSettings",
  storages = {
    @Storage(
      id ="other",
      file = "$APP_CONFIG$/liveCodingSettings.xml"
    )
  }
)
public class LiveCodingSettings implements PersistentStateComponent<LiveCodingSettingsState>, ApplicationComponent, SearchableConfigurable {

  private static final Logger LOG = Logger.getLogger(LiveCodingSettings.class);

  public static LiveCodingSettings getInstance() {
    return ApplicationManager.getApplication().getComponent(LiveCodingSettings.class);
  }

  private LiveCodingSettingsState state = new LiveCodingSettingsState();
  private LiveCodingConfigurationPane liveCodingConfigurationPane;

  public CompilerKind getCompilerKind() {
    return state.getCompilerKind();
  }

  public void setCompilerKind(CompilerKind compilerKind) {
    this.state.setCompilerKind(compilerKind);
  }

  @NotNull
  public String getComponentName() {
    return "Live Coding";
  }

  public String getId() {
    return "live.coding.settings";
  }

  public void initComponent() {
  }

  private LiveCodingConfigurationPane getConfigurationPage() {
    if (liveCodingConfigurationPane == null) {
      liveCodingConfigurationPane = new LiveCodingConfigurationPane(this);
    }
    return liveCodingConfigurationPane;
  }

  public Runnable enableSearch(String s) {
    return null;
  }

  @Nls
  public String getDisplayName() {
    return "Live Coding";
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
    return liveCodingConfigurationPane.isModified();
  }

  public void apply() throws ConfigurationException {
    liveCodingConfigurationPane.apply();
  }

  public void disposeComponent() {

  }

  public void reset() {
    liveCodingConfigurationPane.reset();
  }

  public void disposeUIResources() {

  }

  public LiveCodingSettingsState getState() {
    return state;
  }

  public void loadState(LiveCodingSettingsState state) {
    this.state = state;
  }

  public static class LiveCodingSettingsState {

    private int compilerKind = CompilerKind.FCSH.ordinal();

    public CompilerKind getCompilerKind() {
      return CompilerKind.byOrdinal(compilerKind);
    }

    public void setCompilerKind(CompilerKind compilerKind) {
      this.compilerKind = compilerKind.ordinal();
    }
  }

}
