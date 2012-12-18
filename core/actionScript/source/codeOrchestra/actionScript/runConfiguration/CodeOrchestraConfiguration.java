package codeOrchestra.actionScript.runConfiguration;


import com.intellij.execution.configurations.ConfigurationType;
import org.jetbrains.annotations.NotNull;

/**
 * @author Alexander Eliseyev
 */
public enum CodeOrchestraConfiguration {
  
  ACTION_SCRIPT("codeOrchestra.actionScript.run.plugin.ActionScript_Kind"),
  AIR("codeOrchestra.actionScript.air.plugin.AIR_Kind"),
  AIR_MOBILE("codeOrchestra.actionScript.airMobile.plugin.AIRMobile_Kind"),
  JAVA_SCRIPT("codeOrchestra.js.plugin.JavaScript_Kind"),
  LIVE_CODING("codeOrchestra.actionScript.liveCoding.plugin.LiveCoding_Kind"),
  IOS_LIVE_CODING("codeOrchestra.actionScript.iosLive.plugin.IOSLiveCoding_Kind");

  private CodeOrchestraConfiguration(String className) {
    this.configurationTypeClassName = className;
  }
  
  private String configurationTypeClassName;

  private String getConfigurationTypeClassName() {
    return configurationTypeClassName;
  }

  public static boolean isCodeOrchestraConfiguration(@NotNull ConfigurationType configurationType) {
    String typeClassName = configurationType.getClass().getName();
    for (CodeOrchestraConfiguration codeOrchestraConfiguration : values()) {
      if (typeClassName.equals(codeOrchestraConfiguration.getConfigurationTypeClassName())) {
        return true;
      }
    }

    return false;
  }
  
}
