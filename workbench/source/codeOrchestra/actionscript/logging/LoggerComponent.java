package codeOrchestra.actionscript.logging;

import codeOrchestra.actionscript.logging.transport.LoggerServerSocketThread;
import com.intellij.openapi.components.AbstractProjectComponent;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class LoggerComponent extends AbstractProjectComponent implements ProjectComponent {

  private LoggerServerSocketThread serverSocketThread;

  public LoggerComponent(Project project) {
    super(project);
    this.serverSocketThread = new LoggerServerSocketThread();
  }

  @NotNull
  public String getComponentName() {
    return "RemoteASLogger";
  }

  public void initComponent() {
    serverSocketThread.openSocket();
  }

  public void disposeComponent() {
    serverSocketThread.closeSocket();
  }
}
