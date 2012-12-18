package codeOrchestra.environment;

import codeOrchestra.actionscript.run.compiler.properties.OutputType;

import java.util.HashSet;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public enum Environment {

  ACTIONSCRIPT("ActionScript", OutputType.FLEX_APPLICATION, OutputType.FLEX_LIBRARY),
  HTML5("HTML5", OutputType.HTML5_APPLICATION, OutputType.HTML5_LIBRARY);

  private String displayName;
  private Set<OutputType> compatibleOutputTypes;

  private Environment(String displayName, final OutputType... outputTypes) {
    this.displayName = displayName;
    this.compatibleOutputTypes = new HashSet<OutputType>() {{
      for (OutputType outputType : outputTypes) {
        add(outputType);
      }
    }};
  }

  public String getDisplayName() {
    return displayName;
  }

  public boolean isCompatibleWith(OutputType outputType) {
    return compatibleOutputTypes.contains(outputType);
  }
  public static Environment byDisplayName(String displayName) {
    for (Environment environment : values()) {
      if (environment.getDisplayName().equals(displayName)) {
        return environment;
      }
    }
    return null;
  }

  public static Environment byOutputType(OutputType outputType) {
    for (Environment environment : values()) {
      if (environment.isCompatibleWith(outputType)) {
        return environment;
      }
    }
    return null;
  }
}
