package codeOrchestra.ios.jna.util;

import java.lang.reflect.Field;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public final class FieldUtil {

  public static List getFieldsOrderForClass(Class clazz) {
    List<String> result = new ArrayList<String>();

    for (Field declaredField : clazz.getDeclaredFields()) {
      result.add(declaredField.getName());
    }

    return result;
  }

}
