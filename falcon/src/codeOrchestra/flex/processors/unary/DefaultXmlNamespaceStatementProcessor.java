package codeOrchestra.flex.processors.unary;

import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.DefaultXMLNamespaceNode;
import org.apache.flex.compiler.internal.tree.as.FixedChildrenNode;

/**
 * @author Anton.I.Neverov
 */
public class DefaultXmlNamespaceStatementProcessor extends UnaryExpressionProcessor {

  public DefaultXmlNamespaceStatementProcessor(SNode node) {
    super(node);
    childName = "expression";
  }

  @Override
  protected FixedChildrenNode createOperator() {
    DefaultXMLNamespaceNode defaultXMLNamespaceNode = new DefaultXMLNamespaceNode(null);
    defaultXMLNamespaceNode.setExpressionNode(expression);
    return defaultXMLNamespaceNode;
  }

}
