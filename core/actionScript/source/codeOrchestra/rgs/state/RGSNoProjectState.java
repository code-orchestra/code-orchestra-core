package codeOrchestra.rgs.state;

/**
 * @author Alexander Eliseyev
 */
public class RGSNoProjectState extends RGSConnectedState implements RGSState {

  private static RGSNoProjectState instance = new RGSNoProjectState();

  public static RGSNoProjectState instance() {
    return instance;
  }

  @Override
  public String toString() {
    return getClass().getSimpleName();
  }

  @Override
  public String getPresentation() {
    return "No project is loaded";
  }
}
