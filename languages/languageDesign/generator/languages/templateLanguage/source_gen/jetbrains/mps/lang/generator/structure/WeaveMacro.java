package jetbrains.mps.lang.generator.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class WeaveMacro extends NodeMacro {
  public static final String concept = "jetbrains.mps.lang.generator.structure.WeaveMacro";
  public static final String RULE_CONSEQUENCE = "ruleConsequence";
  public static final String NODES_TO_WEAVE_QUERY = "nodesToWeaveQuery";

  public WeaveMacro(SNode node) {
    super(node);
  }

  public TemplateDeclarationReference getRuleConsequence() {
    return (TemplateDeclarationReference) this.getChild(TemplateDeclarationReference.class, WeaveMacro.RULE_CONSEQUENCE);
  }

  public void setRuleConsequence(TemplateDeclarationReference node) {
    super.setChild(WeaveMacro.RULE_CONSEQUENCE, node);
  }

  public SourceSubstituteMacro_SourceNodesQuery getNodesToWeaveQuery() {
    return (SourceSubstituteMacro_SourceNodesQuery) this.getChild(SourceSubstituteMacro_SourceNodesQuery.class, WeaveMacro.NODES_TO_WEAVE_QUERY);
  }

  public void setNodesToWeaveQuery(SourceSubstituteMacro_SourceNodesQuery node) {
    super.setChild(WeaveMacro.NODES_TO_WEAVE_QUERY, node);
  }

  public static WeaveMacro newInstance(SModel sm, boolean init) {
    return (WeaveMacro) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.generator.structure.WeaveMacro", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static WeaveMacro newInstance(SModel sm) {
    return WeaveMacro.newInstance(sm, false);
  }
}
