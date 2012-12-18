package jetbrains.mps.lang.typesystem.structure;

/*Generated by MPS */

import jetbrains.mps.lang.smodel.structure.SNodeOperation;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class Node_InferTypeOperation extends SNodeOperation {
  public static final String concept = "jetbrains.mps.lang.typesystem.structure.Node_InferTypeOperation";

  public Node_InferTypeOperation(SNode node) {
    super(node);
  }

  public static Node_InferTypeOperation newInstance(SModel sm, boolean init) {
    return (Node_InferTypeOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.typesystem.structure.Node_InferTypeOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static Node_InferTypeOperation newInstance(SModel sm) {
    return Node_InferTypeOperation.newInstance(sm, false);
  }
}
