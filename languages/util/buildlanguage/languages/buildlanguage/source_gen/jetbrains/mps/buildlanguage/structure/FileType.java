package jetbrains.mps.buildlanguage.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class FileType extends PropertyType {
  public static final String concept = "jetbrains.mps.buildlanguage.structure.FileType";

  public FileType(SNode node) {
    super(node);
  }

  public static FileType newInstance(SModel sm, boolean init) {
    return (FileType) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.buildlanguage.structure.FileType", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static FileType newInstance(SModel sm) {
    return FileType.newInstance(sm, false);
  }
}
