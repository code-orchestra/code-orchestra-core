package jetbrains.mps.reloading;

import jetbrains.mps.util.annotation.CodeOrchestraPatch;

/**
 * @author Alexander Eliseyev
 */
@CodeOrchestraPatch
public class RuntimeEnvironmentNotInitializedException extends Exception {

  public RuntimeEnvironmentNotInitializedException() {
  }

  public RuntimeEnvironmentNotInitializedException(String s) {
    super(s);
  }

  public RuntimeEnvironmentNotInitializedException(String s, Throwable throwable) {
    super(s, throwable);
  }

  public RuntimeEnvironmentNotInitializedException(Throwable throwable) {
    super(throwable);
  }
}
