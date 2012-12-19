package codeOrchestra.flex.processors.terminalNode;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.parsing.as.ASToken;
import org.apache.flex.compiler.internal.parsing.as.ASTokenTypes;

/**
 * @author Anton.I.Neverov
 */
public class DefaultSwitchCaseProcessor extends TerminalNodeProcessor {

  public DefaultSwitchCaseProcessor(SNode node) {
    super(node);
    myToken = new ASToken(ASTokenTypes.TOKEN_KEYWORD_DEFAULT, -1, -1, -1, -1, "default");
    bodyName = "body";
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("expression")) {
        // Ignore ( DefaultSwitchCase is a child of SwitchCase and has empty expression )
      } else {
        return false;
      }
    }
    return true;
  }

}
