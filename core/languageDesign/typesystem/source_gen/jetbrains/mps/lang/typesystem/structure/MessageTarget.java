package jetbrains.mps.lang.typesystem.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class MessageTarget extends BaseConcept {
  public static final String concept = "jetbrains.mps.lang.typesystem.structure.MessageTarget";

  public MessageTarget(SNode node) {
    super(node);
  }

  public static MessageTarget newInstance(SModel sm, boolean init) {
    return (MessageTarget) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.MessageTarget", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static MessageTarget newInstance(SModel sm) {
    return MessageTarget.newInstance(sm, false);
  }
}
