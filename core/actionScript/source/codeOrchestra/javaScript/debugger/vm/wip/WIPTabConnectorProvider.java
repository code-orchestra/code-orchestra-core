package codeOrchestra.javaScript.debugger.vm.wip;

import codeOrchestra.javaScript.debugger.configuration.JSDebuggerSettings;
import codeOrchestra.javaScript.debugger.vm.BackendBehavior;
import codeOrchestra.javaScript.debugger.vm.TabConnector;
import codeOrchestra.javaScript.debugger.vm.TabConnectorProvider;
import codeOrchestra.javaScript.debugger.vm.VmConnectException;
import jetbrains.mps.logging.Logger;
import org.chromium.sdk.wip.WipBackend;
import org.chromium.sdk.wip.WipBackendFactory;
import org.chromium.sdk.wip.WipBrowser;
import org.chromium.sdk.wip.WipBrowser.WipTabConnector;
import org.chromium.sdk.wip.WipBrowserFactory;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class WIPTabConnectorProvider implements TabConnectorProvider {

  private static Logger LOG = Logger.getLogger(WIPTabConnectorProvider.class);

  public static final WIPTabConnectorProvider INSTANCE = new WIPTabConnectorProvider();

  private final WipBackendFactory myBackendFactory;

  private WIPTabConnectorProvider() {
    myBackendFactory = new WipBackendFactory();
  }

  private boolean isDebugEnabled() {
    return true;
  }

  @Override
  public TabConnector get(JSDebuggerSettings debuggerSettings) throws VmConnectException {
    InetSocketAddress socketAddress = new InetSocketAddress(debuggerSettings.getHost(), debuggerSettings.getPort());

    if (isDebugEnabled()) {
      LOG.info("Trying to get browser");
    }
    WipBrowser browser = WipBrowserFactory.INSTANCE.createBrowser(socketAddress, null);

    if (isDebugEnabled()) {
      LOG.info("Trying to get backend");
    }
    WipBackend backend = myBackendFactory.create();

    if (isDebugEnabled()) {
      LOG.info("Trying to get tabs");
    }
    List<? extends WipTabConnector> tabs = null;
    try {
      tabs = browser.getTabs(backend);
    } catch (IOException e) {
      throw new VmConnectException("Can't get tabs using WIP: " + e.getMessage(), true);
    }

    if (tabs.isEmpty()) {
      throw new VmConnectException("No open tabs present in Chrome", true);
    }

    if (isDebugEnabled()) {
      LOG.info("Returning WIPTabConnector");
    }
    return new WIPTabConnector(tabs.get(tabs.size() - 1));
  }

  @Override
  public BackendBehavior getBackendBehavior() {
    return WIPBackendBehavior.INSTANCE;
  }

  @Override
  public String getCommandLineArgumentName() {
    return "remote-debugging-port";
  }
}
