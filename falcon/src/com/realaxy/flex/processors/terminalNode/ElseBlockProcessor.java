package codeOrchestra.flex.processors.terminalNode;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.parsing.as.ASToken;
import org.apache.flex.compiler.internal.parsing.as.ASTokenTypes;

/**
 * @author Anton.I.Neverov
 */
public class ElseBlockProcessor extends TerminalNodeProcessor {

  public ElseBlockProcessor(SNode node) {
    super(node);
    myToken = new ASToken(ASTokenTypes.TOKEN_KEYWORD_ELSE, -1, -1, -1, -1, "else");
    bodyName = "statementBody";
  }

}
