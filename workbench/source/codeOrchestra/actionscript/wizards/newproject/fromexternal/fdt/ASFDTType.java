package codeOrchestra.actionscript.wizards.newproject.fromexternal.fdt;

import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalPanel;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalType;

/**
 * @author Anton.I.Neverov
 */
public class ASFDTType extends ASExternalType {

  private ASFDTSettings settings = new ASFDTSettings();
  private ASExternalPanel configPanel;
  private ASExternalPanel additionalPanel;

  @Override
  public ASExternalPanel getConfigPanel() {
    if (configPanel == null) {
      configPanel = new ASFDTConfigPanel(settings);
    }
    return configPanel;
  }

  @Override
  public ASExternalPanel getAdditionalPanel() {
    // It is ok to return null while usesAdditionalStep() returns false
    return additionalPanel;
  }

  @Override
  public String getName() {
    return "FDT";
  }

  @Override
  public boolean isEnabled() {
    return false;
  }

  @Override
  public void prepareCreatedProject(Project createdProject) {
    // TODO: implement
    System.out.println("Prepared FDT");
  }

  @Override
  public String createDirs() {
    // TODO: implement
    System.out.println("Created FDT dirs");
    return null;
  }

  @Override
  public boolean usesAdditionalStep() {
    return false;
  }

  @Override
  public String getProjectName() {
    return settings.getProjectName();
  }

  @Override
  public String getProjectPath() {
    return settings.getProjectPath();
  }

}
