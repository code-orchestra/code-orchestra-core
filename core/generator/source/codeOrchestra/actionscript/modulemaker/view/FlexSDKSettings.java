package codeOrchestra.actionscript.modulemaker.view;

import codeOrchestra.rgs.server.RGSParametersCLI;
import codeOrchestra.utils.ProjectHolder;
import com.intellij.openapi.components.*;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.project.ProjectManager;
import codeOrchestra.actionScript.compiler.fcsh.FCSHManager;
import codeOrchestra.actionScript.flexsdk.FlexSDKLibsManager;
import codeOrchestra.actionscript.modulemaker.CompilerKind;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings.FlexSDKSettingsState;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.options.ConfigurationException;
import com.intellij.openapi.options.SearchableConfigurable;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.PathManager;
import org.apache.commons.lang.StringUtils;
import org.jetbrains.annotations.Nls;
import org.jetbrains.annotations.NotNull;

import javax.swing.Icon;
import javax.swing.JComponent;
import javax.swing.JOptionPane;
import java.io.File;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
@State(
  name = "FlexSDKSettings",
  storages = {
    @Storage(
      id = "other",
      file = "$WORKSPACE_FILE$"
    )
  }
)
public class FlexSDKSettings implements PersistentStateComponent<FlexSDKSettingsState>, ProjectComponent, SearchableConfigurable {

  private static final Logger LOG = Logger.getLogger(FlexSDKSettings.class);

  public static final String DEFAULT_AIR_DESCRIPTOR_VERSION = "3.3";

  private static final String DEFAULT_FLEX_SDK_DIR = "flex_sdk";

  public static FlexSDKSettings getInstance() {
    Project project = ProjectHolder.getProject();

    if (project != null) {
      FlexSDKSettings flexSDKSettings = project.getComponent(FlexSDKSettings.class);
      if (flexSDKSettings != null) {
        return flexSDKSettings;
      }
    }

    return new FlexSDKSettings();
  }

  private FlexSDKSettingsState state = new FlexSDKSettingsState();
  private FlexSDKConfigurationPage myFlexSDKConfigurationPage;
  private Integer majorVersion;

  public int getFlexSDKMajorVersion() {
    if (majorVersion == null) {
      majorVersion = FlexSDKVersionAnalyzer.getFlexSDKMajorVersion(getFlexSDKPath());
    }
    return majorVersion;
  }

  @NotNull
  public String getComponentName() {
    return "Flex SDK";
  }

  public String getId() {
    return "flex.sdk.settings";
  }

  public void initComponent() {

  }

  private FlexSDKConfigurationPage getConfigurationPage() {
    if (myFlexSDKConfigurationPage == null) {
      myFlexSDKConfigurationPage = new FlexSDKConfigurationPage(this);
    }
    return myFlexSDKConfigurationPage;
  }

  public Runnable enableSearch(String s) {
    return null;
  }

  @Nls
  public String getDisplayName() {
    return "Flex SDK";
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
    return myFlexSDKConfigurationPage.isModified();
  }

  public boolean isFlexSDKPathChanged() {
    return myFlexSDKConfigurationPage.isFlexSDKPathChanged();
  }

  public boolean isAirPresent() {
    return new File(getAirDebugLauncherPath()).exists();
  }

  public String getAirDebugLauncherPath() {
    String result = new File(getFlexSDKPath(), "bin" + File.separator + "adl").getPath();

    String osName = System.getProperty("os.name");
    if (osName.startsWith("Mac OS")) {
      return result;
    } else if (osName.startsWith("Windows")) {
      return result + ".exe";
    }

    return result;
  }

  public String getFlexCompilerShellPath() {
    String result = new File(getFlexSDKPath(), "bin" + File.separator + "fcsh").getPath();

    String osName = System.getProperty("os.name");
    if (osName.startsWith("Mac OS")) {
      return result;
    } else if (osName.startsWith("Windows")) {
      return result + ".exe";
    }

    return result;
  }

  public CompilerKind getCompilerKind() {
    return state.getCompilerKind();
  }

  public void setCompilerKind(CompilerKind compilerKind) {
    this.state.setCompilerKind(compilerKind);
  }

  public String getFlexSDKPath() {
    String flexSDKPath = getState().getFlexSDKPath();

    if (RGSParametersCLI.isInServerMode()) {
      String overridingFlexSDKPath = RGSParametersCLI.getOverridingFlexSDKPath();
      if (!StringUtils.isEmpty(overridingFlexSDKPath)) {
        flexSDKPath = overridingFlexSDKPath;
      }
    }

    if (StringUtils.isEmpty(flexSDKPath)) {
      return PathManager.getHomePath() + File.separator + DEFAULT_FLEX_SDK_DIR;
    }
    return flexSDKPath;
  }

  public String getDefaultFlexSDKPath() {
    return PathManager.getHomePath() + File.separator + DEFAULT_FLEX_SDK_DIR;
  }

  public void setFlexSDKPath(String path) {
    getState().setFlexSDKPath(path);
    majorVersion = null;
  }

  public void apply() throws ConfigurationException {
    boolean isFlexPathChanged = isFlexSDKPathChanged();

    myFlexSDKConfigurationPage.apply();

    if (isFlexPathChanged) {
      onFlexPathChange();
    }
  }

  private void onFlexPathChange() {
    String flexSDKVersion = FlexSDKVersionAnalyzer.getFlexSDKVersion(getFlexSDKPath());
    if (flexSDKVersion != null) {
      JOptionPane.showMessageDialog(
        myFlexSDKConfigurationPage.getContentPanel(),
        "Flex SDK " + flexSDKVersion + " path is successfully set",
        "Flex SDK",
        JOptionPane.INFORMATION_MESSAGE);
    }

    // RE-3417 - Destroy the fcsh processes
    Project[] openProjects = ProjectManager.getInstance().getOpenProjects();
    if (openProjects != null) {
      for (Project openProject : openProjects) {
        FCSHManager fcshManager = openProject.getComponent(FCSHManager.class);
        if (fcshManager != null) {
          fcshManager.destroyProcess();
        }
      }
    }

    // Reload the stubs
    FlexSDKLibsManager.getInstance().reloadFlexSDKSolutions();
  }

  public void disposeComponent() {

  }

  public void reset() {
    myFlexSDKConfigurationPage.reset();
  }

  public void disposeUIResources() {

  }

  public FlexSDKSettingsState getState() {
    return state;
  }

  @Override
  public void projectOpened() {
  }

  @Override
  public void projectClosed() {
  }

  public void loadState(FlexSDKSettingsState flexSDKSettingsState) {
    this.state = flexSDKSettingsState;
  }

  public String getAIRDescriptorVersion() {
    List<String> availableAIRDescriptorVersions = AirDescriptorVersionAnalyzer.getAvailableAIRDescriptorVersions(getFlexSDKPath());
    if (availableAIRDescriptorVersions.isEmpty()) {
      LOG.warning("Can't retrieve the AIR descriptor version from Flex SDK, using a default one: " + DEFAULT_AIR_DESCRIPTOR_VERSION);
      return DEFAULT_AIR_DESCRIPTOR_VERSION;
    }
    return availableAIRDescriptorVersions.get(0);
  }

  public static class FlexSDKSettingsState {
    private String flexSDKPath;
    private int compilerKind = CompilerKind.FCSH.ordinal();

    public String getFlexSDKPath() {
      return flexSDKPath;
    }

    public CompilerKind getCompilerKind() {
      return CompilerKind.byOrdinal(compilerKind);
    }

    public void setCompilerKind(CompilerKind compilerKind) {
      this.compilerKind = compilerKind.ordinal();
    }

    public void setFlexSDKPath(String flexSDKPath) {
      this.flexSDKPath = flexSDKPath;
    }
  }

}
