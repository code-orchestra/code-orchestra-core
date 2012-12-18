package jetbrains.mps.internal.collections.runtime;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.closures.runtime.AdapterClass;
import jetbrains.mps.baseLanguage.closures.runtime._FunctionTypes;

public class CaseInsensitiveStringComparison {
  public CaseInsensitiveStringComparison() {
  }

  @SuppressWarnings(value = "unchecked")
  public static <T> int compare(T a, T b, @AdapterClass(value = "ISelector") _FunctionTypes._return_P1_E0<? extends Comparable<?>, ? super T> selector) {
    if (a == b) {
      return 0;
    }
    if (a == null || b == null) {
      return (a == null ?
        -1 :
        1
      );
    }
    Object selA = selector.invoke(a);
    Object selB = selector.invoke(b);
    if (selA == selB) {
      return 0;
    }
    if (selA == null || selB == null) {
      return (selA == null ?
        -1 :
        1
      );
    }
    if ((selA instanceof String) && (selB instanceof String)) {
      return String.CASE_INSENSITIVE_ORDER.compare((String) selA, (String) selB);
    }
    return ((Comparable<Object>) selA).compareTo((Comparable<Object>) selB);
  }
}
