package jetbrains.mps.samples.matrixLanguage.runtime;

/*Generated by MPS */


public class DoubleFieldOperations implements FieldOperations<Double> {
  public DoubleFieldOperations() {
  }

  public Double add(Double a, Double b) {
    return a + b;
  }

  public Double mult(Double a, Double b) {
    return a * b;
  }

  public Double addittiveInverse(Double a) {
    return 0 - a;
  }

  public Double multiplicativeInverse(Double a) {
    return 1 / a;
  }
}
