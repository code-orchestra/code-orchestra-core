package flash.css;

import jetbrains.mps.project.Solution;
import org.w3c.css.sac.*;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Map.Entry;

/**
 * @author Alexander Eliseyev
 */
public class ParseTest {

  private static final String SOURCE_DOT = "source.";
  private static final String SRC_DOT = "src.";

  public static void main1(String[] args) {
    File file = new File("/Users/eliseev/TMP/myCss.css");
    File dir = new File("/Users/eliseev/TMP/");

    System.out.println("[" + calculatePackage(dir, file) + "]");
  }

  /**
   * Module-aware.
   * @return
   */
  public static String calculatePackage(File sourcesDir, File file) {
    String relativePath = file.getParent().replace(sourcesDir.getPath(), "");

    if (relativePath.equals(file.getPath())) {
      return "";
    }

    if (relativePath.startsWith(File.separator)) {
      relativePath = relativePath.substring(1);
    }

    String possiblePackage = relativePath.replace(File.separator, ".");

    if (possiblePackage.contains(SRC_DOT)) {
      possiblePackage = possiblePackage.substring(possiblePackage.indexOf(SRC_DOT) + SRC_DOT.length());
    }
    if (possiblePackage.contains(SOURCE_DOT)) {
      possiblePackage = possiblePackage.substring(possiblePackage.indexOf(SOURCE_DOT) + SOURCE_DOT.length());
    }

    return possiblePackage;
  }

  public static void main(String[] args) throws Throwable {
    String path = "/Users/eliseev/TMP/myCss.css";
    FileInputStream fileInputStream = new FileInputStream(path);

    StyleParser styleParser = new StyleParser(path, fileInputStream, new LoggerDumbImpl(), false);

    for (NamespaceDeclaration namespaceDeclaration : styleParser.getNamespaces()) {
      System.out.println(namespaceDeclaration);
    }

    for (Rule rule : styleParser.getRules()) {
      if (rule instanceof StyleRule) {
        StyleRule styleRule = (StyleRule) rule;
        SelectorList selectorList = styleRule.getSelectorList();

        System.out.println("List: ");

        if (selectorList.getLength() < 1) {
          continue;
        }

        for (int i = 0; i < selectorList.getLength(); i++) {
          Selector selector = selectorList.item(i);


          if (selector instanceof ConditionalSelector) {
            ConditionalSelector conditionalSelector = (ConditionalSelector) selector;

            // Condition
            Condition condition = conditionalSelector.getCondition();
            if (condition.getConditionType() == Condition.SAC_CLASS_CONDITION) {
              AttributeCondition attributeCondition = (AttributeCondition) condition;
              System.out.println("@@@@@@@ " + attributeCondition.getValue());
            } else {
              System.out.println(condition.getConditionType());
            }

            // Simple selector
            SimpleSelector simpleSelector = conditionalSelector.getSimpleSelector();
            // TODO: implement
          }
        }

        StyleDeclaration styleDeclaration = styleRule.getStyleDeclaration();
        for (Entry<String, StyleProperty> o : styleDeclaration.getProperties().entrySet()) {

        }

      } else if (rule instanceof FontFaceRule) {
        FontFaceRule fontFaceRule = (FontFaceRule) rule;
      }
    }

  }

}
