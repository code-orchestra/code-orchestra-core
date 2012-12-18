package jetbrains.mps.analyzers.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class RuleReference extends BaseConcept {
  public static final String concept = "jetbrains.mps.analyzers.structure.RuleReference";
  public static final String RULE = "rule";

  public RuleReference(SNode node) {
    super(node);
  }

  public Rule getRule() {
    return (Rule) this.getReferent(Rule.class, RuleReference.RULE);
  }

  public void setRule(Rule node) {
    super.setReferent(RuleReference.RULE, node);
  }

  public static RuleReference newInstance(SModel sm, boolean init) {
    return (RuleReference) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.analyzers.structure.RuleReference", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static RuleReference newInstance(SModel sm) {
    return RuleReference.newInstance(sm, false);
  }
}
