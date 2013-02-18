package codeOrchestra.utils;

import java.io.IOException;

/**
 * @author Alexander Eliseyev
 */
public final class ExceptionUtils {

  public static boolean isBrokenPipe(IOException exception) {
    String message = exception.getMessage();
    if (message == null) {
      return false;
    }
    return message.contains("Broken pipe") || message.contains("Bad file descriptor");
  }

}
