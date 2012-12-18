package codeOrchestra.actionScript;

import java.util.Arrays;
import java.util.HashSet;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public class Keywords {

  public static final Set<String> KEYWORDS = new HashSet<String>(Arrays.asList(
    new String[]
    {
    "true", "this", "null", "false", "use", "include", "import", "default",
    "var", "package", "namespace", "interface", "implements", "function",
    "extends", "const", "class", "static", "public", "protected", "private",
    "override", "native", "internal", "final", "dynamic", "with", "while",
    "finally", "catch", "try", "throw", "switch", "super", "return", "if",
    "for", "in", "else", "do", "continue", "case", "break", "as", "delete",
    "instanceof", "is", "new", "to", "typeof", "void" }
  ));

  public static boolean isKeyword(String word) {
    return KEYWORDS.contains(word);
  }


}
