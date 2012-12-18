package codeOrchestra.rgs.client.settings;

import com.intellij.openapi.components.PersistentStateComponent;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.components.State;
import com.intellij.openapi.components.Storage;
import com.intellij.openapi.options.Configurable;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.util.SystemProperties;
import codeOrchestra.rgs.client.settings.RGSClientSettings.MyState;
import codeOrchestra.rgs.client.settings.view.RGSClientSettingsPreferences;
import codeOrchestra.rgs.server.RGSParametersCLI;
import codeOrchestra.utils.BuildUtil;
import codeOrchestra.utils.ProjectHolder;
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
  name = "RGSClientSettings",
  storages = {
    @Storage(
      id = "other",
      file = "$PROJECT_FILE$"
    )
  }
)
public class RGSClientSettings implements ProjectComponent, PersistentStateComponent<MyState>, Configurable {

  private MyState state = new MyState();

  private RGSClientSettingsPreferences settingsPanel;

  public static RGSClientSettings getInstance() {
    return ProjectHolder.getProject().getComponent(RGSClientSettings.class);
  }

  @Nls
  @Override
  public String getDisplayName() {
    return "Remote Generation";
  }

  @Override
  public Icon getIcon() {
    return null;
  }

  @Override
  public String getHelpTopic() {
    return null;
  }

  @Override
  public JComponent createComponent() {
    this.settingsPanel = new RGSClientSettingsPreferences(this);
    return this.settingsPanel.getComponent();
  }

  @Override
  public boolean isModified() {
    return settingsPanel.isModified();
  }

  @Override
  public void apply() throws ConfigurationException {
    settingsPanel.apply();
  }

  @Override
  public void reset() {
    settingsPanel.reset();
  }

  @Override
  public void disposeUIResources() {
  }

  @Override
  public MyState getState() {
    return this.state;
  }

  @Override
  public void loadState(MyState state) {
    this.state = state;
  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void projectClosed() {
  }

  @Override
  public void initComponent() {
  }

  @Override
  public void disposeComponent() {
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "RGS Client Settings Component";
  }

  public String getHost() {
    return state.getHost();
  }

  public void setHost(String host) {
    this.state.setHost(host);
  }

  public int getSSHDPort() {
    return state.getSshdPort();
  }

  public void setSSHDPort(int sshdPort) {
    this.state.setSshdPort(sshdPort);
  }

  public int getRGSPort() {
    return state.getRgsPort();
  }

  public void setRGSPort(int rgsPort) {
    this.state.setRgsPort(rgsPort);
  }

  public boolean isUseRemoteGenerationFromState() {
    return this.state.useRemoteGeneration;
  }

  public boolean isUseRemoteGeneration() {
    if (!isUseSeperateInstance()) {
      return false;
    }
    if (RGSParametersCLI.isInServerMode()) {
      return false;
    }
    if (BuildUtil.isDeveloperBuild()) {
      return isUseRemoteGenerationFromState();
    }
    return true;
  }

  public boolean isUseSeperateInstance() {
    return this.state.useSeperateInstance;
  }

  public void setUseSeparateInstance(boolean useSeperateInstance) {
    this.state.useSeperateInstance = useSeperateInstance;
  }

  public void setUseRemoteGeneration(boolean useRemoteGeneration) {
    this.state.setUseRemoteGeneration(useRemoteGeneration);
  }

  // Unconfigurable
  public String getUsername() {
    return RGSParametersCLI.DEFAULT_USERNAME;
  }

  // Unconfigurable
  public String getPassword() {
    return RGSParametersCLI.DEFAULT_PASSWORD;
  }

  public boolean isLocal() {
    return "localhost".equals(getHost()) || "127.0.0.1".equals(getHost()) || StringUtils.isEmpty(getHost());
  }

  public static class MyState {
    private static final String DEFAULT_WORKSPACE = SystemProperties.getUserHome() + File.separator + "rgs" + File.separator + "workspace";

    private String host = RGSParametersCLI.DEFAULT_HOST;
    private int sshdPort = RGSParametersCLI.DEFAULT_SSHD_PORT;
    private int rgsPort = RGSParametersCLI.DEFAULT_RGS_PORT;
    private String workspacePath = DEFAULT_WORKSPACE;
    private boolean useRemoteGeneration;

    private boolean useSeperateInstance = true;

    public boolean isUseSeperateInstance() {
      return useSeperateInstance;
    }

    public void setUseSeperateInstance(boolean useSeperateInstance) {
      this.useSeperateInstance = useSeperateInstance;
    }

    public String getWorkspacePath() {
      return workspacePath;
    }

    public void setWorkspacePath(String workspacePath) {
      this.workspacePath = workspacePath;
    }

    public String getHost() {
      return host;
    }

    public void setHost(String host) {
      this.host = host;
    }

    public int getSshdPort() {
      return sshdPort;
    }

    public void setSshdPort(int sshdPort) {
      this.sshdPort = sshdPort;
    }

    public int getRgsPort() {
      return rgsPort;
    }

    public void setRgsPort(int rgsPort) {
      this.rgsPort = rgsPort;
    }

    public boolean isUseRemoteGeneration() {
      return useRemoteGeneration;
    }

    public void setUseRemoteGeneration(boolean useRemoteGeneration) {
      this.useRemoteGeneration = useRemoteGeneration;
    }

    @Override
    public boolean equals(Object o) {
      if (this == o) return true;
      if (o == null || getClass() != o.getClass()) return false;

      MyState myState = (MyState) o;

      if (rgsPort != myState.rgsPort) return false;
      if (sshdPort != myState.sshdPort) return false;
      if (useRemoteGeneration != myState.useRemoteGeneration) return false;
      if (host != null ? !host.equals(myState.host) : myState.host != null) return false;

      return true;
    }

    @Override
    public int hashCode() {
      int result = host != null ? host.hashCode() : 0;
      result = 31 * result + sshdPort;
      result = 31 * result + rgsPort;
      result = 31 * result + (useRemoteGeneration ? 1 : 0);
      return result;
    }
  }

}
