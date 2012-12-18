package jetbrains.mps.lang.generator.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.sharedConcepts.structure.Options_DefaultTrue;
import jetbrains.mps.lang.core.structure.INamedConcept;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class Root_MappingRule extends BaseMappingRule {
  public static final String concept = "jetbrains.mps.lang.generator.structure.Root_MappingRule";
  public static final String KEEP_SOURCE_ROOT = "keepSourceRoot";
  public static final String TEMPLATE = "template";

  public Root_MappingRule(SNode node) {
    super(node);
  }

  public Options_DefaultTrue getKeepSourceRoot() {
    String value = super.getProperty(Root_MappingRule.KEEP_SOURCE_ROOT);
    return Options_DefaultTrue.parseValue(value);
  }

  public void setKeepSourceRoot(Options_DefaultTrue value) {
    super.setProperty(Root_MappingRule.KEEP_SOURCE_ROOT, value.getValueAsString());
  }

  public INamedConcept getTemplate() {
    return (INamedConcept) this.getReferent(INamedConcept.class, Root_MappingRule.TEMPLATE);
  }

  public void setTemplate(INamedConcept node) {
    super.setReferent(Root_MappingRule.TEMPLATE, node);
  }

  public static Root_MappingRule newInstance(SModel sm, boolean init) {
    return (Root_MappingRule) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.generator.structure.Root_MappingRule", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static Root_MappingRule newInstance(SModel sm) {
    return Root_MappingRule.newInstance(sm, false);
  }
}
