package codeOrchestra.javaScript.debugger.vm.wip;

import codeOrchestra.javaScript.debugger.vm.BackendBehavior;
import codeOrchestra.javaScript.debugger.vm.TabConnector;
import codeOrchestra.javaScript.debugger.vm.VmAttachException;
import org.chromium.sdk.JavascriptVm;
import org.chromium.sdk.TabDebugEventListener;
import org.chromium.sdk.wip.WipBrowser.WipTabConnector;
import org.chromium.sdk.wip.WipBrowserTab;

import java.io.IOException;

/**
 * @author Alexander Eliseyev
 */
public class WIPTabConnector implements TabConnector {

  private WipTabConnector myWipTabConnector;

  public WIPTabConnector(WipTabConnector wipTabConnector) {
    myWipTabConnector = wipTabConnector;
  }

  @Override
  public JavascriptVm attach(TabDebugEventListener listener) throws VmAttachException {
    try {
      WipBrowserTab wipBrowserTab = myWipTabConnector.attach(listener);
      return wipBrowserTab.getJavascriptVm();
    } catch (IOException e) {
      throw new VmAttachException("Can't attach to the tab", e);
    }
  }

  @Override
  public String getUrl() {
    return myWipTabConnector.getUrl();
  }

  @Override
  public boolean isAlreadyAttached() {
    return myWipTabConnector.isAlreadyAttached();
  }

  @Override
  public BackendBehavior getBackendBehavior() {
    return WIPBackendBehavior.INSTANCE;
  }
}
