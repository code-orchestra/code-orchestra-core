package codeOrchestra.air.descriptor.codecs;

import codeOrchestra.air.descriptor.AirInitialWindowSettings;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

/**
 * @author Alexander Eliseyev
 */
public final class AirInitialWindowSettingsCodec {

  private static final String INITIAL_WINDOW_ELEMENT = "initialWindow";
  private static final String CONTENT_ELEMENT = "content";
  private static final String TITLE_ELEMENT = "title";
  private static final String VISIBLE_ELEMENT = "visible";
  private static final String WIDTH_ELEMENT = "width";
  private static final String HEIGHT_ELEMENT = "height";

  public static Element toXML(AirInitialWindowSettings initialWindowSettings, Document applicationDocument) {
    Element initialWindowElement = applicationDocument.createElement(INITIAL_WINDOW_ELEMENT);

    // Content
    Element contentElement = applicationDocument.createElement(CONTENT_ELEMENT);
    contentElement.setTextContent(initialWindowSettings.getContent());
    initialWindowElement.appendChild(contentElement);

    // Title
    Element titleElement = applicationDocument.createElement(TITLE_ELEMENT);
    titleElement.setTextContent(initialWindowSettings.getTitle());
    initialWindowElement.appendChild(titleElement);

    // Visible
    Element visibleElement = applicationDocument.createElement(VISIBLE_ELEMENT);
    visibleElement.setTextContent(Boolean.valueOf(initialWindowSettings.isVisible()).toString());
    initialWindowElement.appendChild(visibleElement);

    // Width
    Element widthElement = applicationDocument.createElement(WIDTH_ELEMENT);
    widthElement.setTextContent(Integer.valueOf(initialWindowSettings.getWidth()).toString());
    initialWindowElement.appendChild(widthElement);

    // Height
    Element heightElement = applicationDocument.createElement(HEIGHT_ELEMENT);
    heightElement.setTextContent(Integer.valueOf(initialWindowSettings.getHeight()).toString());
    initialWindowElement.appendChild(heightElement);

    return initialWindowElement;
  }

}
