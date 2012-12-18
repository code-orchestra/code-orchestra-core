package codeOrchestra.actionscript.wizards.newproject.fromexternal;

/**
 * @author Anton.I.Neverov
 */
public class ASProjectFromExternalAdditionalStep extends ASProjectFromExternalNextStep {

  public ASProjectFromExternalAdditionalStep(ASProjectFromExternalSettings settings) {
    super(settings);
  }

  public void refreshControlComponent() {
    if (settings != null && settings.getType() != null && settings.getType().usesAdditionalStep()) {
      myPanel.remove(0);
      myInnerPanel = settings.getType().getAdditionalPanel();
      myPanel.add(myInnerPanel);
    }
  }

  @Override
  public boolean finishable() {
    return true;
  }

}
