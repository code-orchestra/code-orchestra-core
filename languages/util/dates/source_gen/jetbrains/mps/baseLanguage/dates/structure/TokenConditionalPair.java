package jetbrains.mps.baseLanguage.dates.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.datesInternal.structure.IDateFormat;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class TokenConditionalPair extends BaseConcept {
  public static final String concept = "jetbrains.mps.baseLanguage.dates.structure.TokenConditionalPair";
  public static final String FORMAT = "format";
  public static final String CONDITION = "condition";

  public TokenConditionalPair(SNode node) {
    super(node);
  }

  public IDateFormat getFormat() {
    return (IDateFormat) this.getReferent(IDateFormat.class, TokenConditionalPair.FORMAT);
  }

  public void setFormat(IDateFormat node) {
    super.setReferent(TokenConditionalPair.FORMAT, node);
  }

  public TokenCondition getCondition() {
    return (TokenCondition) this.getChild(TokenCondition.class, TokenConditionalPair.CONDITION);
  }

  public void setCondition(TokenCondition node) {
    super.setChild(TokenConditionalPair.CONDITION, node);
  }

  public static TokenConditionalPair newInstance(SModel sm, boolean init) {
    return (TokenConditionalPair) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.dates.structure.TokenConditionalPair", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static TokenConditionalPair newInstance(SModel sm) {
    return TokenConditionalPair.newInstance(sm, false);
  }
}
