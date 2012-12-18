package jetbrains.mps.lang.actions.structure;

/*Generated by MPS */

import jetbrains.mps.lang.smodel.structure.LinkList_AddNewChildOperation;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class NF_LinkList_AddNewChildOperation extends LinkList_AddNewChildOperation {
  public static final String concept = "jetbrains.mps.lang.actions.structure.NF_LinkList_AddNewChildOperation";

  public NF_LinkList_AddNewChildOperation(SNode node) {
    super(node);
  }

  public static NF_LinkList_AddNewChildOperation newInstance(SModel sm, boolean init) {
    return (NF_LinkList_AddNewChildOperation) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.actions.structure.NF_LinkList_AddNewChildOperation", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static NF_LinkList_AddNewChildOperation newInstance(SModel sm) {
    return NF_LinkList_AddNewChildOperation.newInstance(sm, false);
  }
}
