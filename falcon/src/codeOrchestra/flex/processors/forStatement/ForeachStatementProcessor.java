package codeOrchestra.flex.processors.forStatement;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.parsing.as.ASToken;
import org.apache.flex.compiler.internal.parsing.as.ASTokenTypes;

/**
 * @author Anton.I.Neverov
 */
public class ForeachStatementProcessor extends ForInStatementProcessor {

  public ForeachStatementProcessor(SNode node) {
    super(node);
    myKeywordToken = new ASToken(ASTokenTypes.TOKEN_KEYWORD_FOR, -1, -1, -1, -1, "foreach"); // Actually any string with length != 3 =)
  }

}
