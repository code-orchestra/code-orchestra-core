package jetbrains.mps.execution.demo.plugin;

/*Generated by MPS */

import com.intellij.execution.configurations.ConfigurationFactory;
import com.intellij.execution.configurations.RunConfiguration;
import com.intellij.openapi.project.Project;

public class DemoApplication_Configuration_Factory extends ConfigurationFactory {
  public DemoApplication_Configuration_Factory(Demo_Kind type) {
    super(type);
  }

  public RunConfiguration createTemplateConfiguration(Project project) {
    return new DemoApplication_Configuration(project, this, "Template Configuration");
  }

  @Override
  public String getName() {
    return "Demo Application";
  }
}
