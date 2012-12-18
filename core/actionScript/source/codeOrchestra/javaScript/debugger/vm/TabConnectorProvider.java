package codeOrchestra.javaScript.debugger.vm;

import codeOrchestra.javaScript.debugger.configuration.JSDebuggerSettings;

/**
 * @author Alexander Eliseyev
 */
public interface TabConnectorProvider {

  TabConnector get(JSDebuggerSettings debuggerSettings) throws VmConnectException;
  BackendBehavior getBackendBehavior();
  String getCommandLineArgumentName();

}
