package jetbrains.mps.bootstrap.helgins.sandbox.sb1;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.pattern.GeneratedMatchingPattern;
import java.util.Set;
import java.util.HashSet;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.smodel.SReference;
import jetbrains.mps.smodel.SModelReference;
import jetbrains.mps.smodel.SNodeId;
import jetbrains.mps.lang.pattern.IMatchingPattern;

public class AClssssssssssssssssass {
  public static void fossso() {
    new AClssssssssssssssssass.QuotationClass_axt657_a0a0a().createNode("ererer" + 4);
    {
      SNode matchedNode_axt657_b0a = new AClssssssssssssssssass.QuotationClass_axt657_a0a0a1a0().createNode();
      {
        boolean matches_axt657_a1a0 = false;
        GeneratedMatchingPattern matchingPattern = new AClssssssssssssssssass.Pattern_axt657_a0a1a1a1a0();
        matches_axt657_a1a0 = matchingPattern.match(matchedNode_axt657_b0a);
        if (matches_axt657_a1a0) {
          {
            SNode d = ((SNode) matchingPattern.getFieldValue("patternVar_class"));
          }
        }
      }
    }
  }

  public static void bar() {
  }

  public static class QuotationClass_axt657_a0a0a {
    public QuotationClass_axt657_a0a0a() {
    }

    public SNode createNode(Object parameter_5) {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      SNode quotedNode_2 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.LocalVariableDeclaration", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_3 = quotedNode_1;
        quotedNode1_3.setProperty("name", (String) parameter_5);
        {
          quotedNode_2 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.IntegerType", null, GlobalScope.getInstance(), false);
          SNode quotedNode1_4 = quotedNode_2;
          quotedNode_1.addChild("type", quotedNode1_4);
        }
        result = quotedNode1_3;
      }
      return result;
    }
  }

  public static class QuotationClass_axt657_a0a0a1a0 {
    public QuotationClass_axt657_a0a0a1a0() {
    }

    public SNode createNode() {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.ClassifierType", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_2 = quotedNode_1;
        quotedNode1_2.addReference(SReference.create("classifier", quotedNode1_2, SModelReference.fromString("f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)"), SNodeId.fromString("~Object")));
        result = quotedNode1_2;
      }
      return result;
    }
  }

  public static class Pattern_axt657_a0a1a1a1a0 extends GeneratedMatchingPattern implements IMatchingPattern {
    /*package*/ SNode patternVar_class;

    public Pattern_axt657_a0a1a1a1a0() {
    }

    public boolean match(SNode nodeToMatch) {
      {
        SNode nodeToMatch_AClssssssssssssssssass_axt657_a0a0b0a;
        nodeToMatch_AClssssssssssssssssass_axt657_a0a0b0a = nodeToMatch;
        if (!("jetbrains.mps.baseLanguage.structure.ClassifierType".equals(nodeToMatch_AClssssssssssssssssass_axt657_a0a0b0a.getConceptFqName()))) {
          return false;
        }
        patternVar_class = nodeToMatch_AClssssssssssssssssass_axt657_a0a0b0a.getReferent("classifier");
      }
      return true;
    }

    public boolean hasAntiquotations() {
      return false;
    }

    public void fillFieldValuesFrom(GeneratedMatchingPattern pattern) {
      if (pattern != null && pattern.getClass() == this.getClass()) {
        patternVar_class = (SNode) pattern.getFieldValue("patternVar_class");
      }
    }

    public Object getFieldValue(String fieldName) {
      if ("patternVar_class".equals(fieldName)) {
        return patternVar_class;
      }
      return null;
    }

    public void performActions(Object o) {
    }
  }
}
