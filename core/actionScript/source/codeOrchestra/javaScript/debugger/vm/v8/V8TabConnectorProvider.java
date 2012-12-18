package codeOrchestra.javaScript.debugger.vm.v8;

import codeOrchestra.javaScript.debugger.configuration.JSDebuggerSettings;
import codeOrchestra.javaScript.debugger.vm.BackendBehavior;
import codeOrchestra.javaScript.debugger.vm.TabConnector;
import codeOrchestra.javaScript.debugger.vm.TabConnectorProvider;
import codeOrchestra.javaScript.debugger.vm.VmConnectException;
import jetbrains.mps.logging.Logger;
import org.chromium.sdk.Browser;
import org.chromium.sdk.BrowserFactory;
import org.chromium.sdk.UnsupportedVersionException;

import java.io.IOException;
import java.net.InetSocketAddress;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class V8TabConnectorProvider implements TabConnectorProvider {

  private static Logger LOG = Logger.getLogger(V8TabConnectorProvider.class);

  public static final V8TabConnectorProvider INSTANCE = new V8TabConnectorProvider();

  private V8TabConnectorProvider() {
  }

  private boolean isDebugEnabled() {
    return false;
  }

  @Override
  public TabConnector get(JSDebuggerSettings debuggerSettings) throws VmConnectException {
    InetSocketAddress socketAddress = new InetSocketAddress(debuggerSettings.getHost(), debuggerSettings.getPort());

    if (isDebugEnabled()) {
      LOG.info("Trying to get browser");
    }
    Browser browser = BrowserFactory.getInstance().create(socketAddress, null);

    Browser.TabFetcher tabFetcher;
    try {
      if (isDebugEnabled()) {
        LOG.info("Trying to get tab fetcher");
      }
      tabFetcher = browser.createTabFetcher();
    } catch (IOException e) {
      throw new VmConnectException("Unable to connect to browser", true);
    } catch (UnsupportedVersionException e) {
      throw new VmConnectException("Wrong Chrome/Debugger version " + e.getMessage());
    }

    try {
      List<? extends Browser.TabConnector> tabList;

      if (isDebugEnabled()) {
        LOG.info("Trying to get tabs");
      }
      try {
        tabList = tabFetcher.getTabs();
      } catch (IOException e) {
        throw new VmConnectException("Can't fetch the tabs", true);
      }

      if (tabList.isEmpty()) {
        throw new VmConnectException("No open tabs present in Chrome", true);
      }

      if (isDebugEnabled()) {
        LOG.info("Returning V8TabConnector");
      }

      // Return the last tab. Not sure if this is right
      return new V8TabConnector(tabList.get(tabList.size() - 1));
    } finally {
      tabFetcher.dismiss();
    }
  }

  @Override
  public BackendBehavior getBackendBehavior() {
    return V8BackendBehavior.INSTANCE;
  }

  @Override
  public String getCommandLineArgumentName() {
    return "remote-shell-port";
  }
}
