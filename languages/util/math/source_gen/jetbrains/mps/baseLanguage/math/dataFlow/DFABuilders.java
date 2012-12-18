package jetbrains.mps.baseLanguage.math.dataFlow;

/*Generated by MPS */

import jetbrains.mps.lang.dataFlow.DataFlowBuilders;
import jetbrains.mps.lang.dataFlow.DataFlowManager;

public class DFABuilders extends DataFlowBuilders {
  public void install(DataFlowManager manager) {
    manager.register("jetbrains.mps.baseLanguage.math.structure.Determinant", new Determinant_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.DivExpressionFraction", new DivExpressionFraction_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.ExponentialOperation", new ExponentialOperation_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.LinearSolveOperation", new LinearSolveOperation_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.MathFuncExpression", new MathFuncExpression_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.MathSymbol", new MathSymbol_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.MathSymbolFromToIndex", new MathSymbolFromToIndex_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.MathSymbolIndex", new MathSymbolIndex_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.MathSymbolIndexReference", new MathSymbolIndexReference_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.MatrixConstructor", new MatrixConstructor_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.MatrixElementAccessExpression", new MatrixElementAccessExpression_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.MatrixInitializer", new MatrixInitializer_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.MatrixInitializerIndexReference", new MatrixInitializerIndexReference_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.MatrixNorm", new MatrixNorm_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.MatrixZero", new MatrixZero_DataFlow());
    manager.register("jetbrains.mps.baseLanguage.math.structure.VectorInitializer", new VectorInitializer_DataFlow());
  }
}
