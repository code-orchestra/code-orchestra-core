package jetbrains.mps.ypath.structure;

/*Generated by MPS */

import jetbrains.mps.lang.core.structure.BaseConcept;
import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class VisitParameterDeclarationList extends BaseConcept {
  public static final String concept = "jetbrains.mps.ypath.structure.VisitParameterDeclarationList";
  public static final String VISIT_PARAMETER_DECLARATION = "visitParameterDeclaration";

  public VisitParameterDeclarationList(SNode node) {
    super(node);
  }

  public int getVisitParameterDeclarationsCount() {
    return this.getChildCount(VisitParameterDeclarationList.VISIT_PARAMETER_DECLARATION);
  }

  public Iterator<VisitParameterDeclaration> visitParameterDeclarations() {
    return this.children(VisitParameterDeclaration.class, VisitParameterDeclarationList.VISIT_PARAMETER_DECLARATION);
  }

  public List<VisitParameterDeclaration> getVisitParameterDeclarations() {
    return this.getChildren(VisitParameterDeclaration.class, VisitParameterDeclarationList.VISIT_PARAMETER_DECLARATION);
  }

  public void addVisitParameterDeclaration(VisitParameterDeclaration node) {
    this.addChild(VisitParameterDeclarationList.VISIT_PARAMETER_DECLARATION, node);
  }

  public void insertVisitParameterDeclaration(VisitParameterDeclaration prev, VisitParameterDeclaration node) {
    this.insertChild(prev, VisitParameterDeclarationList.VISIT_PARAMETER_DECLARATION, node);
  }

  public static VisitParameterDeclarationList newInstance(SModel sm, boolean init) {
    return (VisitParameterDeclarationList) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.ypath.structure.VisitParameterDeclarationList", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static VisitParameterDeclarationList newInstance(SModel sm) {
    return VisitParameterDeclarationList.newInstance(sm, false);
  }
}
