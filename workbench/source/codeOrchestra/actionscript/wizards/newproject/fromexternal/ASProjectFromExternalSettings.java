package codeOrchestra.actionscript.wizards.newproject.fromexternal;

import codeOrchestra.actionscript.wizards.newproject.ASNewProjectSettings;

/**
 * @author Anton.I.Neverov
 */
public class ASProjectFromExternalSettings extends ASNewProjectSettings {

  private ASExternalType type;
  private ASProjectFromExternalConfigStep configStep;
  private ASProjectFromExternalAdditionalStep additionalStep;

  public ASExternalType getType() {
    return type;
  }

  public void setType(ASExternalType type) {
    this.type = type;
  }

  public ASProjectFromExternalConfigStep getConfigStep() {
    return configStep;
  }

  public void setConfigStep(ASProjectFromExternalConfigStep configStep) {
    this.configStep = configStep;
  }

  public ASProjectFromExternalAdditionalStep getAdditionalStep() {
    return additionalStep;
  }

  public void setAdditionalStep(ASProjectFromExternalAdditionalStep additionalStep) {
    this.additionalStep = additionalStep;
  }
}
