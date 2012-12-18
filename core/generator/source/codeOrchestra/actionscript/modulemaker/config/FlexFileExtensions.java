package codeOrchestra.actionscript.modulemaker.config;

import java.util.HashMap;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public final class FlexFileExtensions {

  private static final String CLASS_CONCEPT = "codeOrchestra.actionScript.structure.ClassConcept";
  private static final String MXML_COMPONENT = "codeOrchestra.mxml.structure.MxmlComponentDeclaration";

  public static final String DOT_AS = ".as";
  public static final String DOT_MXML = ".mxml";

  private static Map<String, String> conceptToExtension = new HashMap<String, String>();

  static {
    conceptToExtension.put(CLASS_CONCEPT, DOT_AS);
    conceptToExtension.put(MXML_COMPONENT, DOT_MXML);
  }

  public static String get(String conceptFQName) {
    return conceptToExtension.get(conceptFQName);
  }

  private FlexFileExtensions() {
  }

}
