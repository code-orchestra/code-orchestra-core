package jetbrains.mps.lang.smodel.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class OperationParm_ConceptList extends AbstractOperationParameter {
  public static final String concept = "jetbrains.mps.lang.smodel.structure.OperationParm_ConceptList";
  public static final String CONCEPT = "concept";

  public OperationParm_ConceptList(SNode node) {
    super(node);
  }

  public int getConceptsCount() {
    return this.getChildCount(OperationParm_ConceptList.CONCEPT);
  }

  public Iterator<ConceptReference> concepts() {
    return this.children(ConceptReference.class, OperationParm_ConceptList.CONCEPT);
  }

  public List<ConceptReference> getConcepts() {
    return this.getChildren(ConceptReference.class, OperationParm_ConceptList.CONCEPT);
  }

  public void addConcept(ConceptReference node) {
    this.addChild(OperationParm_ConceptList.CONCEPT, node);
  }

  public void insertConcept(ConceptReference prev, ConceptReference node) {
    this.insertChild(prev, OperationParm_ConceptList.CONCEPT, node);
  }

  public static OperationParm_ConceptList newInstance(SModel sm, boolean init) {
    return (OperationParm_ConceptList) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.smodel.structure.OperationParm_ConceptList", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static OperationParm_ConceptList newInstance(SModel sm) {
    return OperationParm_ConceptList.newInstance(sm, false);
  }
}
