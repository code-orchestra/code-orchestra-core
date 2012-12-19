package codeOrchestra.flex.processors.forStatement;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.BinaryOperatorInNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;

/**
 * @author Anton.I.Neverov
 */
public class ForInStatementProcessor extends AbstractForStatementProcessor {

  protected ExpressionNodeBase iterable;

  public ForInStatementProcessor(SNode node) {
    super(node);
    initializerExpectedClass = ExpressionNodeBase.class;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("iterable")) {
        if (iterable != null) {
          throw new SNodeProcessorException();
        }
        iterable = processChild(child, ExpressionNodeBase.class);
      } else {
        return false;
      }
    }
    return true;
  }

  @Override
  protected void check() throws SNodeProcessorException {
    super.check();
    if (initializer == null || iterable == null) {
      throw new SNodeProcessorException();
    }
    // We can safely cast because it was already checked in super.handleChild()
    BinaryOperatorInNode binaryOperatorInNode = new BinaryOperatorInNode(null, (ExpressionNodeBase) initializer, iterable);
    initializer.setParent(binaryOperatorInNode);
    iterable.setParent(binaryOperatorInNode);
    initializer = binaryOperatorInNode;
  }

}
