package jetbrains.mps.samples.matrixLanguage.structure;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.structure.Type;
import java.util.Iterator;
import java.util.List;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class MatrixLiteral extends Expression {
  public static final String concept = "jetbrains.mps.samples.matrixLanguage.structure.MatrixLiteral";
  public static final String SCALAR_TYPE = "scalarType";
  public static final String ROW = "row";

  public MatrixLiteral(SNode node) {
    super(node);
  }

  public Type getScalarType() {
    return (Type) this.getChild(Type.class, MatrixLiteral.SCALAR_TYPE);
  }

  public void setScalarType(Type node) {
    super.setChild(MatrixLiteral.SCALAR_TYPE, node);
  }

  public int getRowsCount() {
    return this.getChildCount(MatrixLiteral.ROW);
  }

  public Iterator<MatrixRow> rows() {
    return this.children(MatrixRow.class, MatrixLiteral.ROW);
  }

  public List<MatrixRow> getRows() {
    return this.getChildren(MatrixRow.class, MatrixLiteral.ROW);
  }

  public void addRow(MatrixRow node) {
    this.addChild(MatrixLiteral.ROW, node);
  }

  public void insertRow(MatrixRow prev, MatrixRow node) {
    this.insertChild(prev, MatrixLiteral.ROW, node);
  }

  public static MatrixLiteral newInstance(SModel sm, boolean init) {
    return (MatrixLiteral) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.samples.matrixLanguage.structure.MatrixLiteral", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static MatrixLiteral newInstance(SModel sm) {
    return MatrixLiteral.newInstance(sm, false);
  }
}
