package codeOrchestra.air.descriptor;

import codeOrchestra.actionscript.util.XMLUtils;
import codeOrchestra.air.AirRunException;
import codeOrchestra.air.descriptor.codecs.AirApplicationDescriptorCodec;
import org.w3c.dom.Document;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class AirApplicationDescriptor {

  private String id;
  private String filename;
  private String name;
  private String versionNumber;

  private AirInitialWindowSettings initialWindow;

  AirApplicationDescriptor(String id, String filename, String name, String versionNumber, AirInitialWindowSettings initialWindow) {
    this.id = id;
    this.filename = filename;
    this.name = name;
    this.versionNumber = versionNumber;
    this.initialWindow = initialWindow;
  }

  public File saveToFile(String filePath) throws AirRunException {
    Document descriptorDocument = null;
    try {
      descriptorDocument = toXML();
    } catch (Throwable t) {
      throw new AirRunException("Error while encoding AIR descriptor", t);
    }

    try {
      return XMLUtils.saveToFile(filePath, descriptorDocument);
    } catch (Throwable t) {
      throw new AirRunException("Can't save the AIR descriptor under " + filePath, t);
    }
  }

  public String getId() {
    return id;
  }

  public String getFilename() {
    return filename;
  }

  public String getName() {
    return name;
  }

  public String getVersionNumber() {
    return versionNumber;
  }

  public AirInitialWindowSettings getInitialWindow() {
    return initialWindow;
  }

  public Document toXML() {
    return AirApplicationDescriptorCodec.toXML(this);
  }

}
