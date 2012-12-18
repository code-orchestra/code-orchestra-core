package codeOrchestra.actionScript.css;

import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class Parser extends org.apache.batik.css.parser.Parser {

  public Map<String, String> getNamespaces() {
    return namespaces;
  }

}
