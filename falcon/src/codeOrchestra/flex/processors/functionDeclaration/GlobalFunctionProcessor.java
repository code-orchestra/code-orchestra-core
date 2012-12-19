package codeOrchestra.flex.processors.functionDeclaration;

import codeOrchestra.flex.processors.Concept;
import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;
import org.apache.flex.compiler.internal.tree.as.FunctionNode;
import org.apache.flex.compiler.internal.tree.as.GetterNode;
import org.apache.flex.compiler.internal.tree.as.IdentifierNode;
import org.apache.flex.compiler.internal.tree.as.SetterNode;

/**
 * @author Anton.I.Neverov
 */
public class GlobalFunctionProcessor extends FunctionDeclarationProcessor {

  private AccessorModifier accessorModifier = AccessorModifier.NORMAL;

  public GlobalFunctionProcessor(SNode node) {
    super(node);
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (!super.handleProperty(name, value)) {
      if (name.equals("sourceModule")) {
        // Ignore
      } else {
        return false;
      }
    }

    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("outOfPackageNode") || childRole.equals("outOfPackageButton")) {
        // Out of package nodes are processed separately because they are not children of root in the Falcon tree
      } else if (childRole.equals("accessorModifier")) {
        if (accessorModifier != AccessorModifier.NORMAL) {
          throw new SNodeProcessorException();
        }
        if (nodeIsInstanceOfConcept(child, Concept.GlobalFunctionGetModifier)) {
          accessorModifier = AccessorModifier.GET;
        } else if (nodeIsInstanceOfConcept(child, Concept.GlobalFunctionSetModifier)) {
          accessorModifier = AccessorModifier.SET;
        } else {
          throw new SNodeProcessorException();
        }
      } else {
        return false;
      }
    }
    return true;
  }

  @Override
  protected FunctionNode createFunctionNode(IdentifierNode nameNode) {
    switch (accessorModifier) {
      case GET:
        return new GetterNode(null, null, nameNode);
      case SET:
        return new SetterNode(null, null, nameNode);
      default:
        return new FunctionNode(null, nameNode);
    }
  }

  private enum AccessorModifier {
    GET,
    SET,
    NORMAL
  }

}

