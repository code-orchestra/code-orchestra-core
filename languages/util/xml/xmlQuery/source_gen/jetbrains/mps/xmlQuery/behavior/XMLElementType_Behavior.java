package jetbrains.mps.xmlQuery.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import org.apache.commons.lang.StringUtils;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.structure.BehaviorDescriptor;
import jetbrains.mps.smodel.structure.ConceptRegistry;
import jetbrains.mps.smodel.behaviour.BehaviorManager;

public class XMLElementType_Behavior {
  private static Class[] PARAMETERS_7129398160685021502 = {SNode.class};

  public static void init(SNode thisNode) {
  }

  public static String virtual_getPresentation_1213877396640(SNode thisNode) {
    if ((SLinkOperations.getTarget(thisNode, "schema", false) == null)) {
      return "xml< >";
    } else {
      String complexTypePresentation = "...";
      if ((SLinkOperations.getTarget(thisNode, "complexType", false) != null)) {
        complexTypePresentation = SPropertyOperations.getString(SLinkOperations.getTarget(thisNode, "complexType", false), "typeName");
        if (StringUtils.isEmpty(complexTypePresentation)) {
          complexTypePresentation = SPropertyOperations.getString(SNodeOperations.getAncestor(SLinkOperations.getTarget(thisNode, "complexType", false), "jetbrains.mps.xmlSchema.structure.ElementWithContent", false, false), "elementName");
        } else {
          complexTypePresentation = String.format("[%s]", complexTypePresentation);
        }
      }
      return String.format("xml<%s:%s>", SPropertyOperations.getString(SLinkOperations.getTarget(thisNode, "schema", false), "schemaName"), complexTypePresentation);
    }
  }

  public static String call_getPresentation_7129398160685021502(SNode thisNode) {
    BehaviorDescriptor descriptor = ConceptRegistry.getInstance().getBehaviorDescriptorForInstanceNode(thisNode);
    return (String) descriptor.invoke(Object.class, SNodeOperations.cast(thisNode, "jetbrains.mps.xmlQuery.structure.XMLElementType"), "virtual_getPresentation_1213877396640", PARAMETERS_7129398160685021502);
  }

  public static String callSuper_getPresentation_7129398160685021502(SNode thisNode, String callerConceptFqName) {
    return (String) BehaviorManager.getInstance().invokeSuper(Object.class, SNodeOperations.cast(thisNode, "jetbrains.mps.xmlQuery.structure.XMLElementType"), callerConceptFqName, "virtual_getPresentation_1213877396640", PARAMETERS_7129398160685021502);
  }
}
