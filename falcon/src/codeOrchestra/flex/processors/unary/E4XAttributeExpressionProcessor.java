package codeOrchestra.flex.processors.unary;

import codeOrchestra.flex.processors.Concept;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.DynamicAccessNode;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;
import org.apache.flex.compiler.internal.tree.as.UnaryOperatorAtNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class E4XAttributeExpressionProcessor extends UnaryExpressionProcessor {

  protected boolean rebuildTree = false;

  public E4XAttributeExpressionProcessor(SNode node) {
    super(node);
    childName = "attributeName";
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (nodeIsInstanceOfConcept(child, Concept.E4XAttributeAccess)) {
      rebuildTree = true;
    }
    return super.handleChild(child);
  }

  @Override
  protected FixedChildrenNode createOperator() {
    return new UnaryOperatorAtNode(null, expression);
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    UnaryOperatorAtNode node = (UnaryOperatorAtNode) super.createNode();

    if (!rebuildTree) {
      return node;
    }

    /*
    our tree for @[expression] is
    @
      []
        expression

    falcon tree is
    []
      @ (with null operand)
      expression

    so we fix it here
    */
    node.setExpression(null);
    DynamicAccessNode dynamicAccessNode = new DynamicAccessNode(node);
    node.setParent(dynamicAccessNode);
    dynamicAccessNode.setRightOperandNode(expression);
    expression.setParent(dynamicAccessNode);
    return dynamicAccessNode;
  }

}
