package codeOrchestra.flex.processors.classifier;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.FunctionNode;
import org.apache.flex.compiler.internal.tree.as.MemberedNode;
import org.apache.flex.compiler.internal.tree.as.ScopedBlockNode;
import org.apache.flex.compiler.internal.tree.as.metadata.MetaTagNode;
import org.apache.flex.compiler.internal.tree.as.metadata.MetaTagsNode;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.INamespaceDecorationNode;
import org.apache.flex.compiler.tree.metadata.IMetaTagsNode;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public abstract class ClassifierProcessor extends SNodeProcessor {

  protected String classifierName;
  protected INamespaceDecorationNode namespaceNode;
  protected String interfaceChildName;
  protected List<ExpressionNodeBase> interfaceNodes = new ArrayList<ExpressionNodeBase>();
  protected List<FunctionNode> methods = new ArrayList<FunctionNode>();
  protected List<MetaTagNode> annotations = new ArrayList<MetaTagNode>();

  public ClassifierProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("name")) {
      classifierName = value;
    } else if (name.equals("sourceModule")) {
      // Ignore
    } else {
      return false;
    }
    return true;
  }

  protected void check() throws SNodeProcessorException {
    if (classifierName == null || namespaceNode == null) {
      throw new SNodeProcessorException();
    }
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (interfaceChildName == null) {
      throw new RuntimeException();
    }
    String childRole = child.getRole_();
    if (childRole.equals("visibility")) {
      if (namespaceNode != null) {
        throw new SNodeProcessorException();
      }
      namespaceNode = createNamespaceNode(child);
    } else if (childRole.equals(interfaceChildName)) {
      interfaceNodes.add(processChild(child, ExpressionNodeBase.class));
    } else if (childRole.equals("method")) {
      methods.add(processChild(child, FunctionNode.class));
    } else if (childRole.equals("annotation")) {
      annotations.add(processChild(child, MetaTagNode.class));
    } else if (childRole.equals("outOfPackageNode") || childRole.equals("outOfPackageButton")) {
      // Out of package nodes are processed separately because they are not children of root in the Falcon tree
    } else if (childRole.equals("asDoc")) {
      // Ignore
    } else {
      return false;
    }
    return true;
  }

  protected abstract MemberedNode createMemberedNode() throws SNodeProcessorException;

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    MemberedNode memberedNode = createMemberedNode();

    ScopedBlockNode scopedNode = memberedNode.getScopedNode();

    for (FunctionNode functionNode : methods) {
      scopedNode.addItem(functionNode);
    }

    addAnnotations(memberedNode, annotations);

    return memberedNode;
  }

}
