package codeOrchestra.rgs.client.appimpl;

import com.intellij.openapi.application.impl.LaterInvocator;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import com.intellij.openapi.startup.StartupManager;
import com.intellij.openapi.wm.IdeFrame;
import com.intellij.openapi.wm.WindowManager;
import com.intellij.openapi.wm.ex.StatusBarEx;
import codeOrchestra.actionscript.make.ASModuleMakeType;
import codeOrchestra.actionscript.run.compiler.properties.OutputType;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import codeOrchestra.generator.listener.BuildBroadcaster;
import codeOrchestra.generator.listener.BuildProvider;
import codeOrchestra.rgs.RGSException;
import codeOrchestra.rgs.client.AbstractRGSClient;
import codeOrchestra.rgs.client.facade.RemoteGenerateListener;
import codeOrchestra.rgs.client.settings.RGSClientSettings;
import codeOrchestra.rgs.client.settings.view.RGSServerStatePanel;
import codeOrchestra.rgs.client.settings.view.RGSStateViewRefreshThread;
import codeOrchestra.rgs.logging.Severity;
import codeOrchestra.rgs.server.RGSParametersCLI;
import codeOrchestra.rgs.state.model.GenerateInput;
import codeOrchestra.utils.NotificationUtils;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.project.structure.modules.ModuleReference;
import org.apache.commons.lang.exception.ExceptionUtils;
import org.jetbrains.annotations.NotNull;

import javax.swing.JOptionPane;
import javax.swing.JScrollPane;
import javax.swing.JTextArea;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ApplicationRGSClient extends AbstractRGSClient implements ProjectComponent {

  private static final Logger LOG = Logger.getLogger(ApplicationRGSClient.class);

  public static ApplicationRGSClient getInstance() {
    Project project = ProjectHolder.getProject();
    if (project == null) {
      return null;
    }
    return project.getComponent(ApplicationRGSClient.class);
  }

  private RemoteGenerateListener defaultListener = new RemoteGenerateListener() {
    @Override
    public void onSuccess(GenerateInput generateInput) {
      ModuleReference moduleRef = generateInput.getModuleReference();
      BuildBroadcaster.getInstance().fireBuildEvent(moduleRef, CodeOrchestraGenerateManager.getOwnOutputType(moduleRef), generateInput.getBuildProvider(), true);
    }

    @Override
    public void onFail(GenerateInput generateInput, final String message, final RGSException e) {
      ModuleReference moduleRef = generateInput.getModuleReference();
      BuildBroadcaster.getInstance().fireBuildEvent(moduleRef, moduleRef == null ? OutputType.UNKNOWN : CodeOrchestraGenerateManager.getOwnOutputType(moduleRef), generateInput.getBuildProvider(), false);
      if (generateInput.getBuildProvider() != BuildProvider.LIVE_CODING_INCREMENTAL) {
        reportRGSError(message, e, "RGS Generation Failed");
      }
    }
  };

  @Override
  public void reportRGSError(String message, final RGSException e, final String title) {
    Runnable showException = e != null ? new Runnable() {
      @Override
      public void run() {
        JTextArea exceptionTextArea = new JTextArea();
        exceptionTextArea.setText(ExceptionUtils.getStackTrace(e));
        JScrollPane scrollPane = new JScrollPane(exceptionTextArea);

        JOptionPane.showMessageDialog(WindowManager.getInstance().getFrame(ProjectHolder.getProject()), scrollPane, title, JOptionPane.ERROR_MESSAGE);
      }
    } : null;

    LOG.error(message, e);

    NotificationUtils.notifyWithABalloon(title, message, Severity.ERROR, showException);
  }

  private RGSStatusWidget statusWidget;
  private RGSServerStatePanel serverStatePanel;
  private RGSStateViewRefreshThread viewRefreshThread;

  private List<RemoteGenerateListener> generateListeners = new ArrayList<RemoteGenerateListener>();

  public ApplicationRGSClient(final Project project, final RGSClientSettings rgsClientSettings) {
    super(project, rgsClientSettings);

    // Skip for RGS server
    if (!RGSParametersCLI.isInServerMode()) {
      StartupManager.getInstance(project).runWhenProjectIsInitialized(new Runnable() {
        @Override
        public void run() {
          // Try init the connection to the server
          if (rgsClientSettings.isUseRemoteGeneration()) {
            try {
              init();
            } catch (RGSException e) {
              // If the local connection failed, try starting the server
              // Don't start the server locally in developer build
              if (mustStartLocalRGS()) {
                tryStartLocalRGS();
              }
            }
          }
        }
      });
    }
  }

  protected int getServerPort() {
    return RGSClientSettings.getInstance().getRGSPort();
  }

  protected String getServerHost() {
    return RGSClientSettings.getInstance().getHost();
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "RGS Client Component";
  }

  public synchronized void addRemoteGenerationListener(RemoteGenerateListener listener) {
    this.generateListeners.add(listener);
  }

  public synchronized void removeRemoteGenerationListener(RemoteGenerateListener listener) {
    this.generateListeners.remove(listener);
  }

  @Override
  public synchronized void reportGenerationError(GenerateInput generateInput, String message, RGSException e) {
    for (RemoteGenerateListener generateListener : generateListeners) {
      generateListener.onFail(generateInput, message, e);
    }
  }

  @Override
  public void reportGenerationSuccess(GenerateInput generateInput) {
    for (RemoteGenerateListener generateListener : generateListeners) {
      generateListener.onSuccess(generateInput);
    }
  }

  @Override
  public void initComponent() {
    // Skip for RGS server
    if (RGSParametersCLI.isInServerMode()) {
      return;
    }

    this.addRemoteGenerationListener(defaultListener);

    StartupManager.getInstance(project).runWhenProjectIsInitialized(new Runnable() {
      @Override
      public void run() {
        serverStatePanel = new RGSServerStatePanel();

        IdeFrame ideFrame = WindowManager.getInstance().getIdeFrame(ProjectHolder.getProject());
        StatusBarEx statusBar = (StatusBarEx) ideFrame.getStatusBar();
        statusWidget = new RGSStatusWidget(serverStatePanel);
        statusBar.removeWidget(RGSStatusWidget.ID);
        statusBar.addWidget(statusWidget);

        viewRefreshThread = new RGSStateViewRefreshThread(serverStatePanel, statusWidget);
        viewRefreshThread.start();
      }
    });
  }

  public RGSStatusWidget getStatusWidget() {
    return statusWidget;
  }

  @Override
  public void disposeComponent() {
    // Skip for RGS server
    if (RGSParametersCLI.isInServerMode()) {
      return;
    }

    generateListeners.clear();

    IdeFrame ideFrame = WindowManager.getInstance().getIdeFrame(ProjectHolder.getProject());
    StatusBarEx statusBar = (StatusBarEx) ideFrame.getStatusBar();
    statusBar.removeWidget(RGSStatusWidget.ID);

    dispose();

    viewRefreshThread.stopRightThere();
    viewRefreshThread = null;

    statusWidget.dispose();
    statusWidget = null;

    serverStatePanel.dispose();
    serverStatePanel = null;
  }

  @Override
  public void projectOpened() {
 }

  @Override
  public void projectClosed() {
  }

}
