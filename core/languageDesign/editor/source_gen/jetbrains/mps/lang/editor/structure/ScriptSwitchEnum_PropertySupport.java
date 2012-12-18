package jetbrains.mps.lang.editor.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.PropertySupport;
import java.util.Iterator;
import jetbrains.mps.internal.collections.runtime.ListSequence;

public class ScriptSwitchEnum_PropertySupport extends PropertySupport {
  public boolean canSetValue(String value) {
    if (value == null) {
      return true;
    }
    Iterator<ScriptSwitchEnum> constants = ListSequence.fromList(ScriptSwitchEnum.getConstants()).iterator();
    while (constants.hasNext()) {
      ScriptSwitchEnum constant = constants.next();
      if (value.equals(constant.getName())) {
        return true;
      }
    }
    return false;
  }

  public String toInternalValue(String value) {
    if (value == null) {
      return null;
    }
    Iterator<ScriptSwitchEnum> constants = ListSequence.fromList(ScriptSwitchEnum.getConstants()).iterator();
    while (constants.hasNext()) {
      ScriptSwitchEnum constant = constants.next();
      if (value.equals(constant.getName())) {
        return constant.getValueAsString();
      }
    }
    return null;
  }

  public String fromInternalValue(String value) {
    ScriptSwitchEnum constant = ScriptSwitchEnum.parseValue(value);
    if (constant != null) {
      return constant.getName();
    }
    return "";
  }
}
