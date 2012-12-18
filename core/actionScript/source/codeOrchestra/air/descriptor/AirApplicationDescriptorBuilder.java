package codeOrchestra.air.descriptor;

public class AirApplicationDescriptorBuilder {

  private String myId;
  private String myFilename;
  private String myName;
  private String myVersionNumber;
  private AirInitialWindowSettings myInitialWindow;

  public AirApplicationDescriptorBuilder setId(String id) {
    myId = id;
    return this;
  }

  public AirApplicationDescriptorBuilder setFilename(String filename) {
    myFilename = filename;
    return this;
  }

  public AirApplicationDescriptorBuilder setName(String name) {
    myName = name;
    return this;
  }

  public AirApplicationDescriptorBuilder setVersionNumber(String versionNumber) {
    myVersionNumber = versionNumber;
    return this;
  }

  public AirApplicationDescriptorBuilder setInitialWindow(AirInitialWindowSettings initialWindow) {
    myInitialWindow = initialWindow;
    return this;
  }

  public AirApplicationDescriptor createAirApplicationDescriptor() {
    return new AirApplicationDescriptor(myId, myFilename, myName, myVersionNumber, myInitialWindow);
  }
}