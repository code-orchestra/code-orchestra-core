package jetbrains.mps.baseLanguage.regexp.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.PropertySupport;

public class _StringRegexp_PropertySupport extends PropertySupport {
  public boolean canSetValue(String value) {
    String testValue = null;
    if (value == null) {
      testValue = "";
    } else {
      testValue = value;
    }
    return testValue.matches("[^\\+?.\\[\\]]+");
  }
}
