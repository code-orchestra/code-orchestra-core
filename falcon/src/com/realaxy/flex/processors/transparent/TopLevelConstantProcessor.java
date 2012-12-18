package codeOrchestra.flex.processors.transparent;

import codeOrchestra.flex.processors.SNodeProcessorException;
import jetbrains.mps.smodel.SNode;

/**
 * @author Anton.I.Neverov
 */
public class TopLevelConstantProcessor extends TransparentNodeProcessor {

  public TopLevelConstantProcessor(SNode node) {
    super(node);
    childName = "constant";
  }

  @Override
  protected boolean handleProperty(String name, String value) throws SNodeProcessorException {
    if (name.equals("name")) {
      // Ignore
    } else if (name.equals("sourceModule")) {
      // Ignore
    } else {
      return false;
    }
    return true;
  }

  @Override
  protected boolean handleChild(SNode child) throws SNodeProcessorException {
    if (!super.handleChild(child)) {
      String childRole = child.getRole_();
      if (childRole.equals("outOfPackageNode") || childRole.equals("outOfPackageButton")) {
        // Out of package nodes are processed separately because they are not children of root in the Falcon tree
      } else {
        return false;
      }
    }
    return true;
  }

}
