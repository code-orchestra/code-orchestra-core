package codeOrchestra.http;

import codeOrchestra.rgs.server.RGSParametersCLI;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.components.ApplicationComponent;
import jetbrains.mps.util.PathManager;
import org.jetbrains.annotations.NotNull;
import org.mortbay.jetty.Handler;
import org.mortbay.jetty.Server;
import org.mortbay.jetty.handler.ContextHandler;
import org.mortbay.jetty.handler.HandlerList;
import org.mortbay.jetty.handler.ResourceHandler;

import java.io.File;
import java.util.HashMap;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class CodeOrchestraHttpServer implements ApplicationComponent {

  public static CodeOrchestraHttpServer getInstance() {
    return ApplicationManager.getApplication().getComponent(CodeOrchestraHttpServer.class);
  }

  private Server server;
  private HandlerList activeHandlers;

  private Map<String, Handler> handlersMap = new HashMap<String, Handler>();

  private boolean mustReload;
  private long lastReloadRequest;
  private Object reloadMonitor = new Object();

  @Override
  public void initComponent() {
    if (RGSParametersCLI.isInServerMode()) {
      return;
    }

    server = new Server(8090); // TODO: make configurable

    activeHandlers = new HandlerList();
    server.setHandler(activeHandlers);

    addAlias(new File(PathManager.getHomePath()), "/");

    try {
      server.start();
    } catch (Exception e) {
      throw new RuntimeException("Can't start jetty server", e);
    }

    new ServerReloadThread().start();
  }

  public void addModuleAlias(String moduleName, File baseDir) {
    addAlias(new File(baseDir, "output_swf"), "/modules_output/" + moduleName);
  }

  public void addAlias(File baseDir, String alias) {
    Handler handler = getContextHandler(alias, getResourceHandler(baseDir.getPath() + "/"));
    addHandler(handler, alias);
  }

  private void addHandler(Handler handler, String alias) {
    if (RGSParametersCLI.isInServerMode()) {
      return;
    }

    Handler existingHandler = handlersMap.get(alias);
    if (existingHandler != null) {
      activeHandlers.removeHandler(existingHandler);
    }

    activeHandlers.addHandler(handler);
    handlersMap.put(alias, handler);

    reloadServer();
  }

  private void reloadServer() {
    synchronized (reloadMonitor) {
      mustReload = true;
      lastReloadRequest = System.currentTimeMillis();
    }
  }

  @Override
  public void disposeComponent() {
    if (RGSParametersCLI.isInServerMode()) {
      return;
    }

    try {
      server.stop();
    } catch (Exception e) {
      throw new RuntimeException("Can't stop HTTP server", e);
    }
  }

  @NotNull
  @Override
  public String getComponentName() {
    return "Code Orchestra HTTP Server";
  }

  private static ContextHandler getContextHandler(String contextPath, Handler handler) {
    ContextHandler contextHandler = new ContextHandler();
    contextHandler.setContextPath(contextPath);
    contextHandler.addHandler(handler);
    return contextHandler;
  }

  private static ResourceHandler getResourceHandler(String resourceBase) {
    ResourceHandler resourceHandler = new ResourceHandler();
    resourceHandler.setResourceBase(resourceBase);
    return resourceHandler;
  }

  private class ServerReloadThread extends Thread {
    private ServerReloadThread() {
      super("HTTP Server Reload Thread");
    }

    private void doReload() {
      try {
        server.stop();
        server.start();
      } catch (Exception e) {
        throw new RuntimeException("Can't reload jetty server", e);
      } finally {
        mustReload = false;
      }
    }

    @Override
    public void run() {
      while (true) {
        synchronized (reloadMonitor) {
          if (mustReload && (System.currentTimeMillis() - lastReloadRequest) > 1500) {
            doReload();
          }
        }

        try {
          Thread.sleep(500);
        } catch (InterruptedException e) {
          // ignore
        }
      }
    }
  }

}
