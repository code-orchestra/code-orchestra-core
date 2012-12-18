package jetbrains.mps.lang.generator.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.pattern.GeneratedMatchingPattern;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.pattern.IMatchingPattern;

public class LoopMacro_Behavior {
  public static void init(SNode thisNode) {
  }

  public static SNode virtual_getInputNodeTypeInsideOfMacro_1213877290799(SNode thisNode) {
    {
      GeneratedMatchingPattern pattern_cdqxf8_a0a = new LoopMacro_Behavior.Pattern_cdqxf8_a0a0a0a1();
      SNode coercedNode_cdqxf8_a0a = TypeChecker.getInstance().getRuntimeSupport().coerce_(TypeChecker.getInstance().getTypeOf(SLinkOperations.getTarget(thisNode, "sourceNodesQuery", true)), pattern_cdqxf8_a0a);
      if (coercedNode_cdqxf8_a0a != null) {
        return ((SNode) pattern_cdqxf8_a0a.getFieldValue("patternVar_concept"));
      } else {
      }
    }
    return null;
  }

  public static class Pattern_cdqxf8_a0a0a0a1 extends GeneratedMatchingPattern implements IMatchingPattern {
    /*package*/ SNode patternVar_concept;

    public Pattern_cdqxf8_a0a0a0a1() {
    }

    public boolean match(SNode nodeToMatch) {
      {
        SNode nodeToMatch_LoopMacro_Behavior_cdqxf8_a0a0a0;
        nodeToMatch_LoopMacro_Behavior_cdqxf8_a0a0a0 = nodeToMatch;
        if (!("jetbrains.mps.baseLanguage.collections.structure.ListType".equals(nodeToMatch_LoopMacro_Behavior_cdqxf8_a0a0a0.getConceptFqName()))) {
          return false;
        }
        {
          String childRole_LoopMacro_Behavior_cdqxf8_ = "elementType";
          if (nodeToMatch_LoopMacro_Behavior_cdqxf8_a0a0a0.getChildCount(childRole_LoopMacro_Behavior_cdqxf8_) != 1) {
            return false;
          }
          {
            SNode childVar_LoopMacro_Behavior_cdqxf8_a0a0a0a = nodeToMatch_LoopMacro_Behavior_cdqxf8_a0a0a0.getChildren(childRole_LoopMacro_Behavior_cdqxf8_).get(0);
            {
              SNode nodeToMatch_LoopMacro_Behavior_cdqxf8_a0a0a0a;
              nodeToMatch_LoopMacro_Behavior_cdqxf8_a0a0a0a = childVar_LoopMacro_Behavior_cdqxf8_a0a0a0a;
              if (!("jetbrains.mps.lang.smodel.structure.SNodeType".equals(nodeToMatch_LoopMacro_Behavior_cdqxf8_a0a0a0a.getConceptFqName()))) {
                return false;
              }
              patternVar_concept = nodeToMatch_LoopMacro_Behavior_cdqxf8_a0a0a0a.getReferent("concept");
            }
          }
        }
      }
      return true;
    }

    public boolean hasAntiquotations() {
      return false;
    }

    public void fillFieldValuesFrom(GeneratedMatchingPattern pattern) {
      if (pattern != null && pattern.getClass() == this.getClass()) {
        patternVar_concept = (SNode) pattern.getFieldValue("patternVar_concept");
      }
    }

    public Object getFieldValue(String fieldName) {
      if ("patternVar_concept".equals(fieldName)) {
        return patternVar_concept;
      }
      return null;
    }

    public void performActions(Object o) {
    }
  }
}
