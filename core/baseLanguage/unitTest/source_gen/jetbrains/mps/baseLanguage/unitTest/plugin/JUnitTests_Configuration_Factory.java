package jetbrains.mps.baseLanguage.unitTest.plugin;

/*Generated by MPS */

import com.intellij.execution.configurations.ConfigurationFactory;
import com.intellij.execution.configurations.RunConfiguration;
import com.intellij.openapi.project.Project;

public class JUnitTests_Configuration_Factory extends ConfigurationFactory {
  public JUnitTests_Configuration_Factory(JUnitTests_Kind type) {
    super(type);
  }

  public RunConfiguration createTemplateConfiguration(Project project) {
    return new JUnitTests_Configuration(project, this, "Template Configuration");
  }

  @Override
  public String getName() {
    return "JUnit Tests";
  }
}
