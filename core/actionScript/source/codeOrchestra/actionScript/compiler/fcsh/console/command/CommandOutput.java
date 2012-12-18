package codeOrchestra.actionScript.compiler.fcsh.console.command;

import com.intellij.execution.process.ProcessOutputTypes;
import com.intellij.openapi.util.Key;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class CommandOutput {

  private Map<Key, StringBuilder> outputMap = new HashMap<Key, StringBuilder>();

  public void addOutput(Key key, String text) {
    StringBuilder stringBuilder = outputMap.get(key);
    if (stringBuilder == null) {
      stringBuilder = new StringBuilder();
      outputMap.put(key, stringBuilder);
    }

    stringBuilder.append(text);
  }

  public String getNormalOutput() {
    StringBuilder stringBuilder = outputMap.get(ProcessOutputTypes.STDOUT);
    if (stringBuilder == null) {
      return null;
    }

    return stringBuilder.toString();
  }

  public String getErrorOutput() {
    StringBuilder stringBuilder = outputMap.get(ProcessOutputTypes.STDERR);
    if (stringBuilder == null) {
      return null;
    }

    return stringBuilder.toString();
  }

}
