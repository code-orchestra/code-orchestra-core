package codeOrchestra.actionscript.flex.settings;

import jetbrains.mps.workbench.dialogs.project.components.parts.descriptors.BooleanDescriptor;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public final class FlexComponentDecoder {

  private static final String COMPONENT_PACKAGE_ELEMENT = "componentPackage";
  private static final String COMPONENT_ELEMENT = "component";

  private static final String ID_ATTR = "id";
  private static final String CLASS_ATTR = "class";
  private static final String LOOKUP_ONLY_ATTR = "lookupOnly";

  private FlexComponentDecoder() {
  }

  public static void decode(Document document, List<FlexComponent> components) {
    Element componentPackageElement = document.getDocumentElement();
    if (!COMPONENT_PACKAGE_ELEMENT.equals(componentPackageElement.getNodeName())) {
      throw new RuntimeException(COMPONENT_PACKAGE_ELEMENT + " root element expected");
    }

    NodeList componentNodeList = componentPackageElement.getElementsByTagName(COMPONENT_ELEMENT);
    for (int i = 0; i < componentNodeList.getLength(); i++) {
      Element componentElement = (Element) componentNodeList.item(i);

      String id = componentElement.getAttribute(ID_ATTR);
      String clazz = componentElement.getAttribute(CLASS_ATTR);
      String lookupOnlyStr = componentElement.getAttribute(LOOKUP_ONLY_ATTR);

      components.add(new FlexComponent(id, clazz, Boolean.parseBoolean(lookupOnlyStr)));
    }
  }

}
