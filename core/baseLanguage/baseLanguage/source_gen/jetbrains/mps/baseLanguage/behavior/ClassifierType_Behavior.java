package jetbrains.mps.baseLanguage.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import java.util.List;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.core.behavior.BaseConcept_Behavior;
import jetbrains.mps.lang.core.behavior.INamedConcept_Behavior;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;
import jetbrains.mps.lang.pattern.GeneratedMatchingPattern;
import jetbrains.mps.typesystem.inference.TypeChecker;
import java.util.Iterator;
import jetbrains.mps.lang.pattern.util.MatchingUtil;
import jetbrains.mps.smodel.structure.BehaviorDescriptor;
import jetbrains.mps.smodel.structure.ConceptRegistry;
import jetbrains.mps.smodel.behaviour.BehaviorManager;
import java.util.Set;
import java.util.HashSet;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;
import jetbrains.mps.lang.pattern.IMatchingPattern;
import jetbrains.mps.lang.pattern.runtime.PatternUtil;
import java.util.ArrayList;

public class ClassifierType_Behavior {
  private static Class[] PARAMETERS_9011026350741578236 = {SNode.class};
  private static SNodePointer SNODE_POINTER_hz3823_a0a0a0a0b0c0a0a0a0b0b0a0a0k = new SNodePointer("f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)", "~Object");

  public static void init(SNode thisNode) {
  }

  public static String virtual_getPresentation_1213877396640(SNode thisNode) {
    SNode classifier = SLinkOperations.getTarget(thisNode, "classifier", false);
    if (classifier == null) {
      return "?no classifier?";
    }
    return ClassifierType_Behavior.call_getPresentation_2354269628709783609(thisNode, SPropertyOperations.getString(classifier, "name"));
  }

  public static String call_getPresentation_2354269628709783609(SNode thisNode, String name) {
    String result = name;
    List<SNode> parms = SLinkOperations.getTargets(thisNode, "parameter", true);
    if (ListSequence.fromList(parms).isNotEmpty()) {
      String parmsText = "";
      for (SNode parm : ListSequence.fromList(parms)) {
        if (parmsText.length() > 0) {
          parmsText = parmsText + ",";
        }
        parmsText = parmsText + BaseConcept_Behavior.call_getPresentation_1213877396640(parm);
      }
      result = result + "<" + parmsText + ">";
    }
    return result;
  }

  public static String virtual_getDetailedPresentation_2354269628709769373(SNode thisNode) {
    SNode classifier = SLinkOperations.getTarget(thisNode, "classifier", false);
    if (classifier == null) {
      return "?no classifier?";
    }
    return ClassifierType_Behavior.call_getPresentation_2354269628709783609(thisNode, INamedConcept_Behavior.call_getFqName_1213877404258(classifier));
  }

  public static String virtual_getErasureSignature_1213877337313(SNode thisNode) {
    SNode classifier = SLinkOperations.getTarget(thisNode, "classifier", false);
    if (classifier == null) {
      return "?no classifier?";
    }
    return INamedConcept_Behavior.call_getFqName_1213877404258(classifier);
  }

  public static SNode virtual_getErasure_702942408396803226(SNode thisNode) {
    SNode classifierType = SNodeOperations.copyNode(thisNode);
    ListSequence.fromList(SLinkOperations.getTargets(classifierType, "parameter", true)).clear();
    return classifierType;
  }

  public static boolean call_isRawType_702942408396828337(SNode thisNode) {
    SNode classifier = SLinkOperations.getTarget(thisNode, "classifier", false);
    if ((classifier == null)) {
      return false;
    }
    if (ListSequence.fromList(SLinkOperations.getTargets(classifier, "typeVariableDeclaration", true)).isEmpty()) {
      return false;
    }
    if (ListSequence.fromList(SLinkOperations.getTargets(thisNode, "parameter", true)).isNotEmpty()) {
      return false;
    }
    return true;
  }

  public static List<String> virtual_getVariableSuffixes_1213877337304(SNode thisNode) {
    String classifierName = SPropertyOperations.getString(SLinkOperations.getTarget(thisNode, "classifier", false), "name");
    String shortName = NameUtil.shortNameFromLongName(classifierName);
    return ((List<String>) NameUtil.splitByCamels(NameUtil.decapitalize(shortName)));
  }

  public static SNode virtual_getClassExpression_1213877337357(SNode thisNode) {
    return new ClassifierType_Behavior.QuotationClass_hz3823_a0a0i().createNode(SLinkOperations.getTarget(thisNode, "classifier", false));
  }

  public static SNode virtual_getAbstractCreator_1213877337340(SNode thisNode) {
    SNode classifier = SLinkOperations.getTarget(thisNode, "classifier", false);
    if (SNodeOperations.isInstanceOf(classifier, "jetbrains.mps.baseLanguage.structure.ClassConcept")) {
      if (!(SPropertyOperations.getBoolean(SNodeOperations.cast(classifier, "jetbrains.mps.baseLanguage.structure.ClassConcept"), "abstractClass")) && ListSequence.fromList(SLinkOperations.getTargets(SNodeOperations.cast(classifier, "jetbrains.mps.baseLanguage.structure.ClassConcept"), "constructor", true)).isNotEmpty()) {
        SNode creator = SConceptOperations.createNewNode("jetbrains.mps.baseLanguage.structure.ClassCreator", null);
        SLinkOperations.setTarget(creator, "baseMethodDeclaration", ListSequence.fromList(SLinkOperations.getTargets(SNodeOperations.cast(classifier, "jetbrains.mps.baseLanguage.structure.ClassConcept"), "constructor", true)).first(), false);
        for (SNode typeParm : ListSequence.fromList(SLinkOperations.getTargets(thisNode, "parameter", true))) {
          ListSequence.fromList(SLinkOperations.getTargets(creator, "typeParameter", true)).addElement(SNodeOperations.copyNode(typeParm));
        }
        return creator;
      }
    }
    return null;
  }

  public static boolean virtual_isSupersetOf_1220438914705(SNode thisNode, SNode t) {
    if (SNodeOperations.isInstanceOf(t, "jetbrains.mps.baseLanguage.structure.WildCardType")) {
      {
        SNode matchedNode_hz3823_a0a0j = thisNode;
        {
          boolean matches_hz3823_a0a0a9 = false;
          GeneratedMatchingPattern matchingPattern = new ClassifierType_Behavior.Pattern_hz3823_a0a1a1a0a0a01();
          matches_hz3823_a0a0a9 = matchingPattern.match(matchedNode_hz3823_a0a0j);
          if (matches_hz3823_a0a0a9) {
            return true;
          } else
          return false;
        }
      }
    }
    {
      GeneratedMatchingPattern pattern_hz3823_b0j = new ClassifierType_Behavior.Pattern_hz3823_a0a0a1a01(SLinkOperations.getTarget(thisNode, "classifier", false));
      SNode coercedNode_hz3823_b0j = TypeChecker.getInstance().getRuntimeSupport().coerce_(t, pattern_hz3823_b0j);
      if (coercedNode_hz3823_b0j != null) {
        {
          SNode typeParam;
          SNode myParam;
          Iterator<SNode> typeParam_iterator = ListSequence.fromList(((List<SNode>) pattern_hz3823_b0j.getFieldValue("patternVar_l"))).iterator();
          Iterator<SNode> myParam_iterator = ListSequence.fromList(SLinkOperations.getTargets(thisNode, "parameter", true)).iterator();
          while (true) {
            if (!(typeParam_iterator.hasNext())) {
              break;
            }
            if (!(myParam_iterator.hasNext())) {
              break;
            }
            typeParam = typeParam_iterator.next();
            myParam = myParam_iterator.next();
            if (SNodeOperations.isInstanceOf(myParam, "jetbrains.mps.baseLanguage.structure.WildCardType") || SNodeOperations.isInstanceOf(myParam, "jetbrains.mps.baseLanguage.structure.UpperBoundType")) {
              if (!(Type_Behavior.call_isSupersetOf_1220438914705(myParam, typeParam))) {
                return false;
              }
            } else {
              if (!(MatchingUtil.matchNodes(myParam, typeParam))) {
                return false;
              }
            }
          }
        }
        return true;
      } else {
      }
    }
    return Type_Behavior.callSuper_isSupersetOf_1220438914705(thisNode, "jetbrains.mps.baseLanguage.structure.ClassifierType", t);
  }

  public static SNode virtual_createDefaultTypeExpression_3359611512358152580(SNode thisNode) {
    return new ClassifierType_Behavior.QuotationClass_hz3823_a0a0l().createNode();
  }

  public static boolean virtual_hasMissingParameters_3508583411997314206(SNode thisNode) {
    return ListSequence.fromList(SLinkOperations.getTargets(SLinkOperations.getTarget(thisNode, "classifier", false), "typeVariableDeclaration", true)).count() != ListSequence.fromList(SLinkOperations.getTargets(thisNode, "parameter", true)).count();
  }

  public static SNode virtual_getLooseType_5744862332972792015(SNode thisNode) {
    SNode classifierType = SConceptOperations.createNewNode("jetbrains.mps.baseLanguage.structure.ClassifierType", null);
    SLinkOperations.setTarget(classifierType, "classifier", SLinkOperations.getTarget(thisNode, "classifier", false), false);
    for (SNode typeParam : SLinkOperations.getTargets(thisNode, "parameter", true)) {
      ListSequence.fromList(SLinkOperations.getTargets(classifierType, "parameter", true)).addElement(Type_Behavior.call_getLooseType_5744862332972792015(typeParam));
    }
    return classifierType;
  }

  public static String virtual_jniSignature_8847328628797633411(SNode thisNode) {
    SNode classifier = SLinkOperations.getTarget(thisNode, "classifier", false);
    String preparedFQName = INamedConcept_Behavior.call_getFqName_1213877404258(classifier).replace('.', '/');
    return "L" + preparedFQName + ";";
  }

  public static boolean virtual_isReifiable_2817265908000464118(SNode thisNode) {
    if (!(ListSequence.fromList(SLinkOperations.getTargets(thisNode, "parameter", true)).isEmpty())) {
      for (SNode parameter : SLinkOperations.getTargets(thisNode, "parameter", true)) {
        if (!(SNodeOperations.isInstanceOf(parameter, "jetbrains.mps.baseLanguage.structure.WildCardType"))) {
          return false;
        }
      }
    }
    return true;
  }

  public static SNode call_createDefaultTypeExpression_9011026350741578236(SNode thisNode) {
    BehaviorDescriptor descriptor = ConceptRegistry.getInstance().getBehaviorDescriptorForInstanceNode(thisNode);
    return (SNode) descriptor.invoke(Object.class, SNodeOperations.cast(thisNode, "jetbrains.mps.baseLanguage.structure.ClassifierType"), "virtual_createDefaultTypeExpression_3359611512358152580", PARAMETERS_9011026350741578236);
  }

  public static SNode callSuper_createDefaultTypeExpression_9011026350741578236(SNode thisNode, String callerConceptFqName) {
    return (SNode) BehaviorManager.getInstance().invokeSuper(Object.class, SNodeOperations.cast(thisNode, "jetbrains.mps.baseLanguage.structure.ClassifierType"), callerConceptFqName, "virtual_createDefaultTypeExpression_3359611512358152580", PARAMETERS_9011026350741578236);
  }

  public static class QuotationClass_hz3823_a0a0i {
    public QuotationClass_hz3823_a0a0i() {
    }

    public SNode createNode(Object parameter_3) {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.ClassifierClassExpression", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_2 = quotedNode_1;
        quotedNode1_2.setReferent("classifier", (SNode) parameter_3);
        result = quotedNode1_2;
      }
      return result;
    }
  }

  public static class Pattern_hz3823_a0a1a1a0a0a01 extends GeneratedMatchingPattern implements IMatchingPattern {
    public Pattern_hz3823_a0a1a1a0a0a01() {
    }

    public boolean match(SNode nodeToMatch) {
      {
        SNode nodeToMatch_ClassifierType_Behavior_hz3823_a0a0a0a0j;
        nodeToMatch_ClassifierType_Behavior_hz3823_a0a0a0a0j = nodeToMatch;
        if (!("jetbrains.mps.baseLanguage.structure.ClassifierType".equals(nodeToMatch_ClassifierType_Behavior_hz3823_a0a0a0a0j.getConceptFqName()))) {
          return false;
        }
        {
          SNodePointer pointer = SNODE_POINTER_hz3823_a0a0a0a0b0c0a0a0a0b0b0a0a0k;
          if (!(PatternUtil.matchReferentWithNode(pointer, nodeToMatch_ClassifierType_Behavior_hz3823_a0a0a0a0j.getReferent("classifier")))) {
            return false;
          }
        }
      }
      return true;
    }

    public boolean hasAntiquotations() {
      return false;
    }

    public void fillFieldValuesFrom(GeneratedMatchingPattern pattern) {
    }

    public Object getFieldValue(String fieldName) {
      return null;
    }

    public void performActions(Object o) {
    }
  }

  public static class Pattern_hz3823_a0a0a1a01 extends GeneratedMatchingPattern implements IMatchingPattern {
    /*package*/ List<SNode> patternVar_l;
    /*package*/ SNode patternVar_ignored;
    /*package*/ Object AntiquotationField_hz3823_a0a0a1a9;

    public Pattern_hz3823_a0a0a1a01(Object parameter_hz3823_a0a0a1a9) {
      this.AntiquotationField_hz3823_a0a0a1a9 = parameter_hz3823_a0a0a1a9;
    }

    public boolean match(SNode nodeToMatch) {
      {
        SNode nodeToMatch_ClassifierType_Behavior_hz3823_a0a1a9;
        nodeToMatch_ClassifierType_Behavior_hz3823_a0a1a9 = nodeToMatch;
        if (!("jetbrains.mps.baseLanguage.structure.ClassifierType".equals(nodeToMatch_ClassifierType_Behavior_hz3823_a0a1a9.getConceptFqName()))) {
          return false;
        }
        {
          SNode referent;
          referent = (SNode) this.AntiquotationField_hz3823_a0a0a1a9;
          if (nodeToMatch_ClassifierType_Behavior_hz3823_a0a1a9.getReferent("classifier") != referent) {
            return false;
          }
        }
        {
          String childRole_ClassifierType_Behavior_hz3823_ = "parameter";
          this.patternVar_l = ListSequence.fromList(new ArrayList<SNode>());
          patternVar_ignored = null;
          for (SNode childVar : nodeToMatch_ClassifierType_Behavior_hz3823_a0a1a9.getChildren(childRole_ClassifierType_Behavior_hz3823_)) {
            patternVar_ignored = childVar;
            ListSequence.fromList(this.patternVar_l).addElement(childVar);
          }
        }
      }
      return true;
    }

    public boolean hasAntiquotations() {
      return true;
    }

    public void fillFieldValuesFrom(GeneratedMatchingPattern pattern) {
      if (pattern != null && pattern.getClass() == this.getClass()) {
        patternVar_l = (List<SNode>) pattern.getFieldValue("patternVar_l");
        patternVar_ignored = (SNode) pattern.getFieldValue("patternVar_ignored");
      }
    }

    public Object getFieldValue(String fieldName) {
      if ("patternVar_l".equals(fieldName)) {
        return patternVar_l;
      }
      if ("patternVar_ignored".equals(fieldName)) {
        return patternVar_ignored;
      }
      return null;
    }

    public void performActions(Object o) {
    }
  }

  public static class QuotationClass_hz3823_a0a0l {
    public QuotationClass_hz3823_a0a0l() {
    }

    public SNode createNode() {
      SNode result = null;
      Set<SNode> _parameterValues_129834374 = new HashSet<SNode>();
      SNode quotedNode_1 = null;
      {
        quotedNode_1 = SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.structure.NullLiteral", null, GlobalScope.getInstance(), false);
        SNode quotedNode1_2 = quotedNode_1;
        result = quotedNode1_2;
      }
      return result;
    }
  }
}
