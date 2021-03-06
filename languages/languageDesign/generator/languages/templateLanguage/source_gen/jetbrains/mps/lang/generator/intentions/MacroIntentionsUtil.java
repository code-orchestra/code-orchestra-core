package jetbrains.mps.lang.generator.intentions;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.generator.typesystem.QueriesUtil;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.typesystem.inference.TypeChecker;
import jetbrains.mps.lang.pattern.GeneratedMatchingPattern;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.AttributeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.IAttributeDescriptor;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;
import java.util.List;
import java.util.ArrayList;
import jetbrains.mps.lang.structure.behavior.AbstractConceptDeclaration_Behavior;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.lang.pattern.IMatchingPattern;

public class MacroIntentionsUtil {
  public MacroIntentionsUtil() {
  }

  public static SNode getContextNodeConcept(SNode contextNode) {
    SNode enclosingMacro = findOuterMacro(contextNode);
    if ((enclosingMacro == null)) {
      return QueriesUtil.getApplicableConcept_fromEnvironment(contextNode);
    }
    if (SNodeOperations.isInstanceOf(enclosingMacro, "jetbrains.mps.lang.generator.structure.SourceSubstituteMacro")) {
      return getConceptFrom(SNodeOperations.cast(enclosingMacro, "jetbrains.mps.lang.generator.structure.SourceSubstituteMacro"));
    }
    return null;
  }

  private static SNode getConceptFrom(SNode macro) {
    SNode query = QueriesUtil.getQueryFunction_fromSourceSubstituteMacro(macro);
    SNode returnType = TypeChecker.getInstance().getTypeOf(query);
    // ====== 
    if (SNodeOperations.isInstanceOf(query, "jetbrains.mps.lang.generator.structure.SourceSubstituteMacro_SourceNodeQuery")) {
      {
        GeneratedMatchingPattern pattern_iiuth6_a0d0b = new MacroIntentionsUtil.Pattern_iiuth6_a0a0a0a3a1();
        SNode coercedNode_iiuth6_a0d0b = TypeChecker.getInstance().getRuntimeSupport().coerce_(returnType, pattern_iiuth6_a0d0b);
        if (coercedNode_iiuth6_a0d0b != null) {
          return ((SNode) pattern_iiuth6_a0d0b.getFieldValue("patternVar_concept"));
        } else {
          return null;
        }
      }
    } else if (SNodeOperations.isInstanceOf(query, "jetbrains.mps.lang.generator.structure.SourceSubstituteMacro_SourceNodesQuery")) {
      {
        GeneratedMatchingPattern pattern_iiuth6_a0a3a1 = new MacroIntentionsUtil.Pattern_iiuth6_a0a0a0a0d0b();
        SNode coercedNode_iiuth6_a0a3a1 = TypeChecker.getInstance().getRuntimeSupport().coerce_(returnType, pattern_iiuth6_a0a3a1);
        if (coercedNode_iiuth6_a0a3a1 != null) {
          return ((SNode) pattern_iiuth6_a0a3a1.getFieldValue("patternVar_concept"));
        } else {
          return null;
        }
      }
    } else {
      SNode macroOuterNode = SNodeOperations.getParent(SNodeOperations.getParent(macro));
      return getContextNodeConcept(macroOuterNode);
    }
  }

  private static SNode findOuterMacro(SNode contextNode) {
    if (contextNode == null) {
      return null;
    }
    if (ListSequence.fromList(AttributeOperations.getAttributeList(contextNode, new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.NodeMacro")))).isNotEmpty()) {
      return ListSequence.fromList(AttributeOperations.getAttributeList(contextNode, new IAttributeDescriptor.NodeAttribute(SConceptOperations.findConceptDeclaration("jetbrains.mps.lang.generator.structure.NodeMacro")))).last();
    }
    return findOuterMacro(SNodeOperations.getParent(contextNode));
  }

  public static List<SNode> getLinks(SNode sourceNode, boolean inCollection) {
    if (sourceNode == null) {
      return null;
    }
    List<SNode> result = ListSequence.fromList(new ArrayList<SNode>());
    for (SNode child : AbstractConceptDeclaration_Behavior.call_getLinkDeclarations_1213877394480(sourceNode)) {
      if (inCollection) {
        if (SPropertyOperations.hasValue(child, "sourceCardinality", "0..n", "0..1") || SPropertyOperations.hasValue(child, "sourceCardinality", "1..n", "0..1")) {
          ListSequence.fromList(result).addElement(child);
        }
      } else {
        if (SPropertyOperations.hasValue(child, "sourceCardinality", "0..1", "0..1") || SPropertyOperations.hasValue(child, "sourceCardinality", "1", "0..1")) {
          ListSequence.fromList(result).addElement(child);
        }
      }
    }
    return result;
  }

  public static class Pattern_iiuth6_a0a0a0a3a1 extends GeneratedMatchingPattern implements IMatchingPattern {
    /*package*/ SNode patternVar_concept;

    public Pattern_iiuth6_a0a0a0a3a1() {
    }

    public boolean match(SNode nodeToMatch) {
      {
        SNode nodeToMatch_MacroIntentionsUtil_iiuth6_a0a0a3a1;
        nodeToMatch_MacroIntentionsUtil_iiuth6_a0a0a3a1 = nodeToMatch;
        if (!("jetbrains.mps.lang.smodel.structure.SNodeType".equals(nodeToMatch_MacroIntentionsUtil_iiuth6_a0a0a3a1.getConceptFqName()))) {
          return false;
        }
        patternVar_concept = nodeToMatch_MacroIntentionsUtil_iiuth6_a0a0a3a1.getReferent("concept");
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

  public static class Pattern_iiuth6_a0a0a0a0d0b extends GeneratedMatchingPattern implements IMatchingPattern {
    /*package*/ SNode patternVar_concept;

    public Pattern_iiuth6_a0a0a0a0d0b() {
    }

    public boolean match(SNode nodeToMatch) {
      {
        SNode nodeToMatch_MacroIntentionsUtil_iiuth6_a0a0a0d0b;
        nodeToMatch_MacroIntentionsUtil_iiuth6_a0a0a0d0b = nodeToMatch;
        if (!("jetbrains.mps.baseLanguage.collections.structure.SequenceType".equals(nodeToMatch_MacroIntentionsUtil_iiuth6_a0a0a0d0b.getConceptFqName()))) {
          return false;
        }
        {
          String childRole_MacroIntentionsUtil_iiuth6_ = "elementType";
          if (nodeToMatch_MacroIntentionsUtil_iiuth6_a0a0a0d0b.getChildCount(childRole_MacroIntentionsUtil_iiuth6_) != 1) {
            return false;
          }
          {
            SNode childVar_MacroIntentionsUtil_iiuth6_a0a0a0a3a1 = nodeToMatch_MacroIntentionsUtil_iiuth6_a0a0a0d0b.getChildren(childRole_MacroIntentionsUtil_iiuth6_).get(0);
            {
              SNode nodeToMatch_MacroIntentionsUtil_iiuth6_a0a0a0a3a1;
              nodeToMatch_MacroIntentionsUtil_iiuth6_a0a0a0a3a1 = childVar_MacroIntentionsUtil_iiuth6_a0a0a0a3a1;
              if (!("jetbrains.mps.lang.smodel.structure.SNodeType".equals(nodeToMatch_MacroIntentionsUtil_iiuth6_a0a0a0a3a1.getConceptFqName()))) {
                return false;
              }
              patternVar_concept = nodeToMatch_MacroIntentionsUtil_iiuth6_a0a0a0a3a1.getReferent("concept");
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
