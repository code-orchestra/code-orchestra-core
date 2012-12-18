package codeOrchestra.actionscript.wizards.newproject.fromexternal;

/**
 * @author Anton.I.Neverov
 */
public class ASProjectFromExternalConfigStep extends ASProjectFromExternalNextStep {

  public ASProjectFromExternalConfigStep(ASProjectFromExternalSettings settings) {
    super(settings);
  }

  public void refreshControlComponent() {
    if (settings != null && settings.getType() != null) {
      myPanel.remove(0);
      myInnerPanel = settings.getType().getConfigPanel();
      myPanel.add(myInnerPanel);
    }
  }

  @Override
  public boolean finishable() {
    if (settings != null && settings.getType() != null && !settings.getType().usesAdditionalStep()) {
      return true;
    }
    return false;
  }

  public boolean continuable() {
    if (settings != null && settings.getType() != null && settings.getType().usesAdditionalStep()) {
      return true;
    }
    return false;
  }

}
