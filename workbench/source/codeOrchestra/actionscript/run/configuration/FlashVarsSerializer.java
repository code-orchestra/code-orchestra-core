package codeOrchestra.actionscript.run.configuration;

import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class FlashVarsSerializer {

  private static final String KEY_VALUE_SEPARATOR = "*@*";
  private static final String VAR_SEPARATOR = "*|*";

  public static String serialize(List<FlashVar> vars) {
    if (vars == null || vars.isEmpty()) {
      return "";
    }

    StringBuilder sb = new StringBuilder();
    for (FlashVar var : vars) {
      sb.append(var.getKey()).append(KEY_VALUE_SEPARATOR).append(var.getValue()).append(VAR_SEPARATOR);
    }
    String varString = sb.toString();
    return varString.substring(0, varString.length() - VAR_SEPARATOR.length());
  }

  public static List<FlashVar> deserialize(String varsString) {
    List<FlashVar> vars = new ArrayList<FlashVar>();

    if (varsString == null) {
      return vars;
    }

    String[] varArray = StringUtils.splitByWholeSeparator(varsString, VAR_SEPARATOR);
    if (varArray != null && varArray.length > 0) {
      for (String varString : varArray) {
        String[] keyValueArray = StringUtils.splitByWholeSeparator(varString, KEY_VALUE_SEPARATOR);
        if (keyValueArray != null && keyValueArray.length == 2) {
          vars.add(new FlashVar(keyValueArray[0], keyValueArray[1]));
        }
      }
    }    

    return vars;
  }

}
