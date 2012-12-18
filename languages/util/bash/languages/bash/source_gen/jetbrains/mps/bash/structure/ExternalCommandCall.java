package jetbrains.mps.bash.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class ExternalCommandCall extends AbstractCommand {
  public static final String concept = "jetbrains.mps.bash.structure.ExternalCommandCall";
  public static final String DECLARATION = "declaration";
  public static final String REF_TO_OPTIONS = "refToOptions";

  public ExternalCommandCall(SNode node) {
    super(node);
  }

  public ExternalCommandDeclaration getDeclaration() {
    return (ExternalCommandDeclaration) this.getReferent(ExternalCommandDeclaration.class, ExternalCommandCall.DECLARATION);
  }

  public void setDeclaration(ExternalCommandDeclaration node) {
    super.setReferent(ExternalCommandCall.DECLARATION, node);
  }

  public int getRefToOptionsesCount() {
    return this.getChildCount(ExternalCommandCall.REF_TO_OPTIONS);
  }

  public Iterator<ExternalOptionReference> refToOptionses() {
    return this.children(ExternalOptionReference.class, ExternalCommandCall.REF_TO_OPTIONS);
  }

  public List<ExternalOptionReference> getRefToOptionses() {
    return this.getChildren(ExternalOptionReference.class, ExternalCommandCall.REF_TO_OPTIONS);
  }

  public void addRefToOptions(ExternalOptionReference node) {
    this.addChild(ExternalCommandCall.REF_TO_OPTIONS, node);
  }

  public void insertRefToOptions(ExternalOptionReference prev, ExternalOptionReference node) {
    this.insertChild(prev, ExternalCommandCall.REF_TO_OPTIONS, node);
  }

  public static ExternalCommandCall newInstance(SModel sm, boolean init) {
    return (ExternalCommandCall) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.bash.structure.ExternalCommandCall", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static ExternalCommandCall newInstance(SModel sm) {
    return ExternalCommandCall.newInstance(sm, false);
  }
}
