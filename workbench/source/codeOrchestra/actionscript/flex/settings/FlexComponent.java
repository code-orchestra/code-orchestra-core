package codeOrchestra.actionscript.flex.settings;

/**
 * @author Alexander Eliseyev
 */
public class FlexComponent {

  private String componentId;
  private String componentClass;
  private boolean lookupOnly;

  public FlexComponent(String componentId, String componentClass, boolean lookupOnly) {
    this.componentId = componentId;
    this.componentClass = componentClass;
    this.lookupOnly = lookupOnly;
  }

  public String getComponentId() {
    return componentId;
  }

  public String getComponentClass() {
    return componentClass;
  }

  public boolean isLookupOnly() {
    return lookupOnly;
  }

  @Override
  public String toString() {
    return "FlexComponent{" +
      "componentId='" + componentId + '\'' +
      ", componentClass='" + componentClass + '\'' +
      ", lookupOnly=" + lookupOnly +
      '}';
  }
}
