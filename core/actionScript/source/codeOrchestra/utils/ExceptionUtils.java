package codeOrchestra.utils;

import java.io.IOException;
import java.net.SocketException;

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

  public static boolean isSocketClosed(SocketException e) {
    return e.getMessage().equals("Socket closed");
  }

}
