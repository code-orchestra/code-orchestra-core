package codeOrchestra.flex.processors.iterationFlow;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.parsing.as.ASToken;
import org.apache.flex.compiler.internal.parsing.as.ASTokenTypes;

/**
 * @author Anton.I.Neverov
 */
public class BreakStatementProcessor extends IterationFlowStatementProcessor {

  public BreakStatementProcessor(SNode node) {
    super(node);
    myToken = new ASToken(ASTokenTypes.TOKEN_KEYWORD_BREAK, -1, -1, -1, -1, "break");
  }

}
