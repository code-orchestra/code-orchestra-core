package codeOrchestra.actionscript.logging;

import codeOrchestra.actionscript.logging.transport.LoggerServerSocketThread;
import codeOrchestra.rgs.server.RGSParametersCLI;
import com.intellij.openapi.components.AbstractProjectComponent;
import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.components.ProjectComponent;
import com.intellij.openapi.project.Project;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public class LoggerComponent implements ApplicationComponent {

  private LoggerServerSocketThread serverSocketThread;

  public LoggerComponent() {
    this.serverSocketThread = new LoggerServerSocketThread();
  }

  @NotNull
  public String getComponentName() {
    return "RemoteASLogger";
  }

  public void initComponent() {
    if (!RGSParametersCLI.isInServerMode()) {
      serverSocketThread.openSocket();
    }
  }

  public void disposeComponent() {
    if (!RGSParametersCLI.isInServerMode()) {
      serverSocketThread.closeSocket();
    }
  }
}
