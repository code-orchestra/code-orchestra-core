package codeOrchestra.flex;

import org.apache.flex.compiler.internal.as.codegen.LexicalScope;
import org.apache.flex.compiler.internal.semantics.MethodBodySemanticChecker;

/**
 * @author Anton.I.Neverov
 */
public class MethodBodySemanticCheckerFactory {
  public static MethodBodySemanticChecker getChecker(LexicalScope currentScope) {
    if (FalconProjectBuilder.getInstance().skipSemanticCheck()) {
      return new FakeMethodBodySemanticChecker(currentScope);
    }
    return new MethodBodySemanticChecker(currentScope);
  }
}
