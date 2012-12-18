package jetbrains.mps.lang.generator.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.structure.structure.AbstractConceptDeclaration;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class BaseMappingRule extends BaseConcept {
  public static final String concept = "jetbrains.mps.lang.generator.structure.BaseMappingRule";
  public static final String APPLY_TO_CONCEPT_INHERITORS = "applyToConceptInheritors";
  public static final String APPLICABLE_CONCEPT = "applicableConcept";
  public static final String LABEL_DECLARATION = "labelDeclaration";
  public static final String CONDITION_FUNCTION = "conditionFunction";

  public BaseMappingRule(SNode node) {
    super(node);
  }

  public boolean getApplyToConceptInheritors() {
    return this.getBooleanProperty(BaseMappingRule.APPLY_TO_CONCEPT_INHERITORS);
  }

  public void setApplyToConceptInheritors(boolean value) {
    this.setBooleanProperty(BaseMappingRule.APPLY_TO_CONCEPT_INHERITORS, value);
  }

  public AbstractConceptDeclaration getApplicableConcept() {
    return (AbstractConceptDeclaration) this.getReferent(AbstractConceptDeclaration.class, BaseMappingRule.APPLICABLE_CONCEPT);
  }

  public void setApplicableConcept(AbstractConceptDeclaration node) {
    super.setReferent(BaseMappingRule.APPLICABLE_CONCEPT, node);
  }

  public MappingLabelDeclaration getLabelDeclaration() {
    return (MappingLabelDeclaration) this.getReferent(MappingLabelDeclaration.class, BaseMappingRule.LABEL_DECLARATION);
  }

  public void setLabelDeclaration(MappingLabelDeclaration node) {
    super.setReferent(BaseMappingRule.LABEL_DECLARATION, node);
  }

  public BaseMappingRule_Condition getConditionFunction() {
    return (BaseMappingRule_Condition) this.getChild(BaseMappingRule_Condition.class, BaseMappingRule.CONDITION_FUNCTION);
  }

  public void setConditionFunction(BaseMappingRule_Condition node) {
    super.setChild(BaseMappingRule.CONDITION_FUNCTION, node);
  }

  public static BaseMappingRule newInstance(SModel sm, boolean init) {
    return (BaseMappingRule) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.generator.structure.BaseMappingRule", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static BaseMappingRule newInstance(SModel sm) {
    return BaseMappingRule.newInstance(sm, false);
  }
}
