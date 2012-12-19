package codeOrchestra.flex;

import codeOrchestra.actionscript.modulemaker.messages.CompilerMessage;
import codeOrchestra.actionscript.modulemaker.messages.MessageType;

import java.util.Collections;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class FalconProjectBuilderException extends Exception {

  private List<CompilerMessage> myMessages;

  public FalconProjectBuilderException(List<CompilerMessage> messages) {
    myMessages = messages;
  }

  public FalconProjectBuilderException(String message) {
    myMessages = Collections.singletonList(new CompilerMessage(MessageType.ERROR, message));
  }

  public List<CompilerMessage> getMessages() {
    return myMessages;
  }

}
