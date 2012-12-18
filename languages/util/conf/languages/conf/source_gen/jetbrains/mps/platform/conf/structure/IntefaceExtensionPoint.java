package jetbrains.mps.platform.conf.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.structure.Classifier;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class IntefaceExtensionPoint extends ExtensionPoint {
  public static final String concept = "jetbrains.mps.platform.conf.structure.IntefaceExtensionPoint";
  public static final String IFACE = "iface";

  public IntefaceExtensionPoint(SNode node) {
    super(node);
  }

  public Classifier getIface() {
    return (Classifier) this.getReferent(Classifier.class, IntefaceExtensionPoint.IFACE);
  }

  public void setIface(Classifier node) {
    super.setReferent(IntefaceExtensionPoint.IFACE, node);
  }

  public static IntefaceExtensionPoint newInstance(SModel sm, boolean init) {
    return (IntefaceExtensionPoint) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.platform.conf.structure.IntefaceExtensionPoint", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static IntefaceExtensionPoint newInstance(SModel sm) {
    return IntefaceExtensionPoint.newInstance(sm, false);
  }
}
