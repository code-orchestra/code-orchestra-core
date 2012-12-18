package codeOrchestra.actionscript.wizards.newproject.fromexternal.flashbuilder;

import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalPanel;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalType;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.idea.ASIdeaSettings;

/**
 * @author Anton.I.Neverov
 */
public class ASFlashBuilderType extends ASExternalType {

  public ASFlashBuilderType() {
    settings = new ASFlashBuilderSettings();
  }

  @Override
  public ASExternalPanel getConfigPanel() {
    if (configPanel == null) {
      configPanel = new ASFlashBuilderConfigPanel((ASFlashBuilderSettings) settings);
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
    return "Adobe Flash Builder";
  }

  @Override
  public boolean isEnabled() {
    return true;
  }

  @Override
  public boolean usesAdditionalStep() {
    return false;
  }
}
