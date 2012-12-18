package jetbrains.mpslite.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import java.util.Map;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.internal.collections.runtime.MapSequence;
import java.util.Set;
import java.util.HashSet;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.SReference;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNodeId;

public class ConcretePropertyPart_Behavior {
  public static void init(SNode thisNode) {
  }

  public static void virtual_fillConceptStructure_1238593834306(SNode thisNode, SNode concept, Map<SNode, SNode> conceptsToTargets, Map<SNode, SNode> partsToLinks) {
    SNode propertyDeclaration = SLinkOperations.addNewChild(concept, "propertyDeclaration", "jetbrains.mps.lang.structure.structure.PropertyDeclaration");
    SPropertyOperations.set(propertyDeclaration, "name", SPropertyOperations.getString(thisNode, "name"));
    if (SPropertyOperations.hasValue(thisNode, "propertyType", "numeric", "string")) {
      SLinkOperations.setTarget(propertyDeclaration, "dataType", SLinkOperations.getTarget(new ConcretePropertyPart_Behavior.QuotationClass_e1pb6q_a0c0a0c0b().createNode(), "dataType", false), false);
    } else if (SPropertyOperations.hasValue(thisNode, "propertyType", "string", "string")) {
      SLinkOperations.setTarget(propertyDeclaration, "dataType", SLinkOperations.getTarget(new ConcretePropertyPart_Behavior.QuotationClass_e1pb6q_a0c0a0a2a1().createNode(), "dataType", false), false);
    }
    MapSequence.fromMap(partsToLinks).put(thisNode, propertyDeclaration);
  }

  public static class QuotationClass_e1pb6q_a0c0a0c0b {
    public QuotationClass_e1pb6q_a0c0a0c0b() {
    }

    public SNode createNode() {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.structure.structure.PropertyDeclaration", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_2 = quotedNode_1;
        quotedNode1_2.setProperty("name", "_");
        quotedNode1_2.addReference(SReference.create("dataType", quotedNode1_2, SModelReference.fromString("r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)"), SNodeId.fromString("1082983657062")));
        result = quotedNode1_2;
      }
      return result;
    }
  }

  public static class QuotationClass_e1pb6q_a0c0a0a2a1 {
    public QuotationClass_e1pb6q_a0c0a0a2a1() {
    }

    public SNode createNode() {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.structure.structure.PropertyDeclaration", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_2 = quotedNode_1;
        quotedNode1_2.setProperty("name", "_");
        quotedNode1_2.addReference(SReference.create("dataType", quotedNode1_2, SModelReference.fromString("r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)"), SNodeId.fromString("1082983041843")));
        result = quotedNode1_2;
      }
      return result;
    }
  }
}
