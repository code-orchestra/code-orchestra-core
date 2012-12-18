package codeOrchestra.flex.processors.iterationFlow;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.parsing.as.ASToken;
import org.apache.flex.compiler.internal.parsing.as.ASTokenTypes;

/**
 * @author Anton.I.Neverov
 */
public class ContinueStatementProcessor extends IterationFlowStatementProcessor {

  public ContinueStatementProcessor(SNode node) {
    super(node);
    myToken = new ASToken(ASTokenTypes.TOKEN_KEYWORD_CONTINUE, -1, -1, -1, -1, "continue");
  }

}
