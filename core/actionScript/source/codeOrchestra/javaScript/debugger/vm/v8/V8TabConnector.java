package codeOrchestra.javaScript.debugger.vm.v8;

import codeOrchestra.javaScript.debugger.vm.BackendBehavior;
import codeOrchestra.javaScript.debugger.vm.TabConnector;
import codeOrchestra.javaScript.debugger.vm.VmAttachException;
import org.chromium.sdk.Browser;
import org.chromium.sdk.JavascriptVm;
import org.chromium.sdk.TabDebugEventListener;

import java.io.IOException;

/**
 * @author Alexander Eliseyev
 */
public class V8TabConnector implements TabConnector {

  private Browser.TabConnector tabConnector;

  public V8TabConnector(Browser.TabConnector tabConnector) {
    this.tabConnector = tabConnector;
  }

  @Override
  public JavascriptVm attach(TabDebugEventListener listener) throws VmAttachException {
    try {
      return tabConnector.attach(listener);
    } catch (IOException e) {
      throw new VmAttachException("Can't attach to the tab", e);
    }
  }

  @Override
  public String getUrl() {
    return tabConnector.getUrl();
  }

  @Override
  public boolean isAlreadyAttached() {
    return tabConnector.isAlreadyAttached();
  }

  @Override
  public BackendBehavior getBackendBehavior() {
    return V8BackendBehavior.INSTANCE;
  }
}
