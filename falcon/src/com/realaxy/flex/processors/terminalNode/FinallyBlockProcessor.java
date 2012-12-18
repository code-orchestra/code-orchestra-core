package codeOrchestra.flex.processors.terminalNode;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.parsing.as.ASToken;
import org.apache.flex.compiler.internal.parsing.as.ASTokenTypes;

/**
 * @author Anton.I.Neverov
 */
public class FinallyBlockProcessor extends TerminalNodeProcessor {

  public FinallyBlockProcessor(SNode node) {
    super(node);
    myToken = new ASToken(ASTokenTypes.TOKEN_KEYWORD_FINALLY, -1, -1, -1, -1, "finally");
    bodyName = "body";
  }

}
