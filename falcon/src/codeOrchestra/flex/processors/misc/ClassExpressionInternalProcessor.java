package codeOrchestra.flex.processors.misc;

import codeOrchestra.flex.processors.SNodeProcessor;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.ExpressionNodeBase;
import org.apache.flex.compiler.internal.tree.as.FullNameNode;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.tree.as.IASNode;

/**
 * @author Anton.I.Neverov
 */
public class ClassExpressionInternalProcessor extends SNodeProcessor {

  private String packageName;
  private String className;

  public ClassExpressionInternalProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("package")) {
      packageName = value;
    } else if (name.equals("className")) {
      className = value;
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    return false;
  }

  @Override
  protected IASNode createNode() throws SNodeProcessorException {
    if (className == null) {
      throw new SNodeProcessorException();
    }

    IdentifierNode classIdentifierNode = new IdentifierNode(className);
    if (packageName == null || packageName.isEmpty()) {
      return classIdentifierNode;
    }

    String[] nameParts = packageName.split("\\.");

    ExpressionNodeBase fqName = null;
    for (String namePart : nameParts) {
      IdentifierNode identifierNode = new IdentifierNode(namePart);
      if (fqName == null) {
        fqName = identifierNode;
      } else {
        fqName = new FullNameNode(fqName, null, identifierNode);
      }
    }

    return new FullNameNode(fqName, null, classIdentifierNode);
  }

}
