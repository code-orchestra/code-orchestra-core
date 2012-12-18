package codeOrchestra.air;

import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import codeOrchestra.air.descriptor.AirApplicationDescriptor;
import codeOrchestra.air.descriptor.AirApplicationDescriptorBuilder;
import codeOrchestra.air.descriptor.AirInitialWindowSettings;
import codeOrchestra.air.descriptor.AirInitialWindowSettingsBuilder;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class DefaultModuleAirDescriptorGenerator {

  private Solution module;
  private Project project;

  public DefaultModuleAirDescriptorGenerator(Solution module, Project project) {
    this.module = module;
    this.project = project;
  }

  public File generate() throws AirRunException {
    String swfOutputPath = SolutionUtils.getSWFOutputPath(module);
    if (swfOutputPath == null) {
      throw new AirRunException("Can't figure out the " + module + " module output path");
    }

    File swfOuputFile = new File(swfOutputPath);

    String moduleName = getModuleName();

    AirInitialWindowSettingsBuilder initialWindowSettingsBuilder = new AirInitialWindowSettingsBuilder();
    initialWindowSettingsBuilder.setContent(swfOuputFile.getName());

    initialWindowSettingsBuilder.setTitle(moduleName);
    initialWindowSettingsBuilder.setVisible(true);
    initialWindowSettingsBuilder.setWidth(400);
    initialWindowSettingsBuilder.setHeight(300);

    AirInitialWindowSettings airInitialWindowSettings = initialWindowSettingsBuilder.createAirInitialWindowSettings();

    AirApplicationDescriptorBuilder descriptorBuilder = new AirApplicationDescriptorBuilder();
    descriptorBuilder.setId(moduleName);
    descriptorBuilder.setName(moduleName);
    descriptorBuilder.setFilename(moduleName);
    descriptorBuilder.setVersionNumber("0.0");
    descriptorBuilder.setInitialWindow(airInitialWindowSettings);
    AirApplicationDescriptor airApplicationDescriptor = descriptorBuilder.createAirApplicationDescriptor();

    return airApplicationDescriptor.saveToFile(getDescriptorOutputPath(swfOuputFile));
  }

  private String getDescriptorOutputPath(File swfOuputFile) {
    return new File(swfOuputFile.getParent(), getModuleName() + "-air-app.xml").toString();
  }

  private String getModuleName() {
    return module.toString();
  }

}
