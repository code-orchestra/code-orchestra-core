package jetbrains.mps.regexp.examples;

/*Generated by MPS */

import jetbrains.mps.baseLanguage.regexp.runtime.Replacer;
import java.util.regex.Matcher;

public class _Replacer_efh9at_a0a0a0d implements Replacer {
  /*package*/ BaseLanguageIntegration _enclosingClass;
  /*package*/ Object _closureContext;

  public _Replacer_efh9at_a0a0a0d(BaseLanguageIntegration enclosingClass, Object closureContext) {
    this._enclosingClass = enclosingClass;
    this._closureContext = (Object) closureContext;
  }

  public String replace(Matcher matcher) {
    return "<" + matcher.group(1) + ">";
  }
}
