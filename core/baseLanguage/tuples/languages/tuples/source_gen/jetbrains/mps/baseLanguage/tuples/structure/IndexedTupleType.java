package jetbrains.mps.baseLanguage.tuples.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Type;
import jetbrains.mps.smodel.SNode;
import java.util.Iterator;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class IndexedTupleType extends Type {
  public static final String concept = "jetbrains.mps.baseLanguage.tuples.structure.IndexedTupleType";
  public static final String CPR_LeftBracket = "leftBracket";
  public static final String CPR_RightBracket = "rightBracket";
  public static final String COMPONENT_TYPE = "componentType";

  public IndexedTupleType(SNode node) {
    super(node);
  }

  public int getComponentTypesCount() {
    return this.getChildCount(IndexedTupleType.COMPONENT_TYPE);
  }

  public Iterator<Type> componentTypes() {
    return this.children(Type.class, IndexedTupleType.COMPONENT_TYPE);
  }

  public List<Type> getComponentTypes() {
    return this.getChildren(Type.class, IndexedTupleType.COMPONENT_TYPE);
  }

  public void addComponentType(Type node) {
    this.addChild(IndexedTupleType.COMPONENT_TYPE, node);
  }

  public void insertComponentType(Type prev, Type node) {
    this.insertChild(prev, IndexedTupleType.COMPONENT_TYPE, node);
  }

  public static IndexedTupleType newInstance(SModel sm, boolean init) {
    return (IndexedTupleType) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.baseLanguage.tuples.structure.IndexedTupleType", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static IndexedTupleType newInstance(SModel sm) {
    return IndexedTupleType.newInstance(sm, false);
  }
}
