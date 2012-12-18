package codeOrchestra.javaScript.debugger.vm;

import org.chromium.sdk.JavascriptVm;
import org.chromium.sdk.TabDebugEventListener;

/**
 * @author Alexander Eliseyev
 */
public interface TabConnector {

  JavascriptVm attach(TabDebugEventListener listener) throws VmAttachException;

  String getUrl();

  boolean isAlreadyAttached();

  BackendBehavior getBackendBehavior();

}
