package jetbrains.mps.regex.samples;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.regexp.runtime.Replacer;
import java.util.regex.Matcher;

public class _Replacer_x5qji9_a0a0b0b implements Replacer {
  /*package*/ SimpleReplace _enclosingClass;
  /*package*/ Object _closureContext;

  public _Replacer_x5qji9_a0a0b0b(SimpleReplace enclosingClass, Object closureContext) {
    this._enclosingClass = enclosingClass;
    this._closureContext = (Object) closureContext;
  }

  public String replace(Matcher matcher) {
    return "<" + matcher.group(1) + ">";
  }
}
