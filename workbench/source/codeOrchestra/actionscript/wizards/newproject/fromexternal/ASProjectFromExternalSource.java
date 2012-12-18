package codeOrchestra.actionscript.wizards.newproject.fromexternal;

import codeOrchestra.actionscript.wizards.newproject.*;
import com.intellij.openapi.project.Project;
import jetbrains.mps.InternalFlag;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASProjectFromExternalSource extends ASAbstractProjectSource implements ASProjectSource {

  private ASProjectFromExternalSettings settings = new ASProjectFromExternalSettings();

  public ASProjectFromExternalSource() {
  }

  public String getID() {
    return "extModel";
  }

  public String getDescription() {
    return "Create Code Orchestra project structure over existing external model (IntelliJ IDEA, Adobe Flash Builder)";
  }

  public String getName() {
    return "Import project from external model";
  }

  public boolean isEnabled() {
    // TODO: Change to true after implementing
    //return InternalFlag.isInternalMode();
    return true;
  }

  public List<ASNewProjectStep> getSteps() {
    List<ASNewProjectStep> steps = new ArrayList<ASNewProjectStep>();

    steps.add(new ASProjectFromExternalTypeStep(settings));
    // We have to pass references to ConfigStep and AdditionalStep into TypeStep
    settings.setConfigStep(new ASProjectFromExternalConfigStep(settings));
    steps.add(settings.getConfigStep());
    settings.setAdditionalStep(new ASProjectFromExternalAdditionalStep(settings));
    steps.add(settings.getAdditionalStep());

    return steps;
  }

  @Override
  protected void prepareCreatedProject(Project createdProject) {
    // Prepare project in specific type, based on it's specific settings
    settings.getType().prepareCreatedProject(createdProject);
  }

  public String createDirs() {
    // Create project directory - same for all types
    File projectDirFile = new File(settings.getProjectPath());
    if (!(projectDirFile.exists())) {
      if (!projectDirFile.mkdirs()) return "Project directory creation failed";
    }

    // Create dirs in specific type, based on it's specific settings
    return settings.getType().createDirs();
  }

  public ASNewProjectSettings getSettings() {
    return settings;
  }

}
