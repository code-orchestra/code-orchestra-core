package com.intellij.idea;

/**
 * @author Alexander Eliseyev
 */
public abstract class StartupAction {

  public abstract void cancel();
  public abstract void proceed();

}
