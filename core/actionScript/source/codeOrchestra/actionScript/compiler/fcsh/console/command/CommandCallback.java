package codeOrchestra.actionScript.compiler.fcsh.console.command;

import com.intellij.openapi.util.Key;

/**
 * @author Alexander Eliseyev
 */
public interface CommandCallback {

  String getCommand();

  void textAvailable(String text, Key k);

  boolean isDone();

  void done(CommandOutput response);

  boolean isSynchronous();

  void failed(Throwable t);

}