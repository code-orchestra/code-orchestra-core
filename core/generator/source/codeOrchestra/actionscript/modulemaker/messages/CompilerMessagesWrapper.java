package codeOrchestra.actionscript.modulemaker.messages;

import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class CompilerMessagesWrapper {

  private List<CompilerMessage> messages;
  private int errorCount;
  private int warningsCount;

  public CompilerMessagesWrapper(List<CompilerMessage> messages) {
    this.messages = messages;
    for (CompilerMessage compilerMessage : messages) {
      switch (compilerMessage.getType()) {
        case ERROR: errorCount++; break;
        case WARNING: warningsCount++; break;
      }
    }
  }

  public List<CompilerMessage> getMessages() {
    return messages;
  }

  public int getErrorCount() {
    return errorCount;
  }

  public int getWarningsCount() {
    return warningsCount;
  }

  public boolean isEmpty() {
    return getErrorCount() == 0 && getWarningsCount() == 0;
  }
}
