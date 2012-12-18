package codeOrchestra.javaScript.debugger.scripts;

import jetbrains.mps.util.misc.hash.HashMap;
import org.chromium.sdk.Script;

import java.io.File;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class JSScriptsCache {

  private Map<Object, Script> scripts = new HashMap<Object, Script>();
  private Map<String, Script> scriptsByFilename = new HashMap<String, Script>();

  public synchronized void putScript(Script script) {
    scripts.put(script.getId(), script);

    String scriptFileName = getScriptFileName(script);
    if (scriptFileName != null) {
      scriptsByFilename.put(scriptFileName, script);
    }
  }

  public synchronized void removeScript(Script script) {
    scripts.remove(script.getId());

    String scriptFileName = getScriptFileName(script);
    if (scriptFileName != null) {
      scriptsByFilename.remove(scriptFileName);
    }
  }

  public synchronized Script getScriptByFileName(String scriptFileName) {
    for (Script script : scripts.values()) {
      if (scriptFileName.equals(getScriptFileName(script))) {
        return script;
      }
    }
    return null;
  }

  public synchronized Script getScriptById(Object id) {
    return scripts.get(id);
  }
  
  private static String getScriptFileName(Script script) {
    String scriptName = script.getName();
    if (scriptName == null) {
      return null;
    }
    return new File(scriptName).getName();
  }

}
