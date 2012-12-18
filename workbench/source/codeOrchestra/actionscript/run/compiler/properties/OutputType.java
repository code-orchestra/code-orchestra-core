package codeOrchestra.actionscript.run.compiler.properties;

import codeOrchestra.actionscript.view.utils.Languages;

import java.util.Arrays;
import java.util.Collections;
import java.util.HashSet;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public enum OutputType {
  
  FLEX_APPLICATION(true),
  FLEX_LIBRARY(false),
  HTML5_APPLICATION(true, Languages.ACTION_SCRIPT_TO_JS),
  HTML5_LIBRARY(false, Languages.ACTION_SCRIPT_TO_JS),
  UNKNOWN(false);

  private Set<String> languagesNamespaces = new HashSet<String>();
  private boolean mustHaveMainClass;

  private OutputType(boolean mustHaveMainClass, String... namespaces) {
    this.languagesNamespaces.addAll(Arrays.asList(namespaces));
    this.mustHaveMainClass = mustHaveMainClass;
  }

  public boolean mustHaveMainClass() {
    return mustHaveMainClass;
  }

  public Set<String> getLanguagesNamespaces() {
    return Collections.unmodifiableSet(languagesNamespaces);
  }

  public int getIndex() {
    return ordinal();
  }

  public boolean isHTML5() {
    return this == HTML5_APPLICATION || this == HTML5_LIBRARY;
  }

  public static OutputType byIndex(int index) {
    for (OutputType outputType : values()) {
      if (index == outputType.getIndex()) {
        return outputType;
      }
    }
    throw new IllegalArgumentException("No output type for index " + index);
  }

}
