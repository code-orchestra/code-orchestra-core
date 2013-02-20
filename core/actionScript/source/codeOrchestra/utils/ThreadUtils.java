package codeOrchestra.utils;

/**
 * @author Alexander Eliseyev
 */
public final class ThreadUtils {

  public static void sleep(long millis) {
    try { Thread.sleep(millis); } catch (InterruptedException e) {}
  }

}
