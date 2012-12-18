package codeOrchestra.rgs.state;

/**
 * @author Alexander Eliseyev
 */
public class RGSNotConnectedState implements RGSState {

  @Override
  public String getPresentation() {
    return "Not connected";
  }
}
