package codeOrchestra.utils;

/**
 * @author Alexander Eliseyev
 */
public class TextUtils {

  public static String trim(String str, int length) {
    if (length == -1) {
      return str;
    }

    if (str == null || str.length() < length) {
      return str;
    }

    return str.substring(0, length - 1) + "...";
  }

}
