package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.parsing.as.ASToken;
import org.apache.flex.compiler.internal.parsing.as.ASTokenTypes;
import org.apache.flex.compiler.internal.tree.as.*;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class GenericNewExpressionProcessor extends SNodeProcessor {

  FunctionCallNode creator;

  public GenericNewExpressionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    String childRole = child.getRole_();
    if (childRole.equals("creator")) {
      if (creator != null) {
        throw new SNodeProcessorException();
      }
      creator = processChild(child, FunctionCallNode.class);
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (creator == null) {
      throw new SNodeProcessorException();
    }

    creator.setNewKeywordNode(new ASToken(ASTokenTypes.TOKEN_KEYWORD_NEW, -1, -1, -1, -1, "new"));

    return creator;
  }

}
