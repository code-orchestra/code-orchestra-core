package codeOrchestra.air.descriptor.codecs;

import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.actionscript.util.XMLUtils;
import codeOrchestra.air.descriptor.AirApplicationDescriptor;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 * @author Alexander Eliseyev
 */
public final class AirApplicationDescriptorCodec {

  private static final String APPLICATION_NS_TEMPLATE = "http://ns.adobe.com/air/application/";

  private static final String APPLICATION_ELEMENT = "application";
  private static final String ID_ELEMENT = "id";
  private static final String FILENAME_ELEMENT = "filename";
  private static final String NAME_ELEMENT = "name";
  private static final String VERSION_NUMBER_ELEMENT = "versionNumber";

  private static String getApplicationNamespace() {
    return APPLICATION_NS_TEMPLATE + FlexSDKSettings.getInstance().getAIRDescriptorVersion();
  }

  public static Document toXML(AirApplicationDescriptor descriptor) {
    Document document = XMLUtils.createDocument();

    // Root
    Element rootElement = document.createElementNS(getApplicationNamespace(), APPLICATION_ELEMENT);
    document.appendChild(rootElement);

    // Id
    Element idElement = document.createElement(ID_ELEMENT);
    idElement.setTextContent(descriptor.getId());
    rootElement.appendChild(idElement);

    // Filename
    Element filenameElement = document.createElement(FILENAME_ELEMENT);
    filenameElement.setTextContent(descriptor.getFilename());
    rootElement.appendChild(filenameElement);

    // Name
    Element nameElement = document.createElement(NAME_ELEMENT);
    nameElement.setTextContent(descriptor.getName());
    rootElement.appendChild(nameElement);

    // Version number
    Element versionElement = document.createElement(VERSION_NUMBER_ELEMENT);
    versionElement.setTextContent(descriptor.getVersionNumber());
    rootElement.appendChild(versionElement);

    // Initial window subtree
    Element initialWindowElement = AirInitialWindowSettingsCodec.toXML(descriptor.getInitialWindow(), document);
    rootElement.appendChild(initialWindowElement);

    return document;
  }

}
