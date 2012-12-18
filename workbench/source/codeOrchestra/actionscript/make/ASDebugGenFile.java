package codeOrchestra.actionscript.make;

import codeOrchestra.actionscript.util.XMLUtils;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;
import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.NodeList;

import javax.xml.transform.TransformerException;
import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public final class ASDebugGenFile {

  public static final String FILE_NAME = "codeOrchestra.debug";

  private static final String CODE_ORCHESTRA_GEN_DEBUG_ELEMENT = "codeOrchestraGenDebug";
  private static final String MAKE_TYPE_ELEMENT = "makeType";
  private static final String RUN_CONFIGURATION_ELEMENT = "runConfiguration";

  private String sourcePath;
  private ASModuleMakeType moduleMakeType;
  private String runConfigurationClass;

  private ASDebugGenFile(String sourcePath) {
    this.sourcePath = sourcePath;
  }

  private ASDebugGenFile(String sourcePath, @NotNull ASModuleMakeType moduleMakeType, String runConfigurationClass) {
    this.sourcePath = sourcePath;
    this.moduleMakeType = moduleMakeType;
    this.runConfigurationClass = runConfigurationClass;
  }

  public static @NotNull ASDebugGenFile fromFile(String path) {
    File theFile = new File(path);
    if (!theFile.exists()) {
      return new ASDebugGenFile(path);
    }

    return fromXML(XMLUtils.fileToDOM(theFile), path);
  }

  public @Nullable String getRunConfigurationClass() {
    return runConfigurationClass;
  }

  public @Nullable ASModuleMakeType getModuleMakeType() {
    return moduleMakeType;
  }

  public void setModuleMakeType(ASModuleMakeType moduleMakeType) {
    this.moduleMakeType = moduleMakeType;
  }

  public void setRunConfigurationClass(String runConfigurationClass) {
    this.runConfigurationClass = runConfigurationClass;
  }

  public Document toXML() {
    Document document = XMLUtils.createDocument();

    // Root
    Element rootElement = document.createElement(CODE_ORCHESTRA_GEN_DEBUG_ELEMENT);
    document.appendChild(rootElement);

    // Make type
    Element makeTypeElement = (Element) rootElement.appendChild(document.createElement(MAKE_TYPE_ELEMENT));
    makeTypeElement.setTextContent(moduleMakeType.name());

    // Run configuration class name
    if (runConfigurationClass != null) {
      Element runConfigurationElement = (Element) rootElement.appendChild(document.createElement(RUN_CONFIGURATION_ELEMENT));
      runConfigurationElement.setTextContent(runConfigurationClass);
    }

    return document;
  }

  public static @NotNull ASDebugGenFile fromXML(Document document, String sourcePath) {
    Element rootElement = document.getDocumentElement();

    Element makeTypeElement = (Element) rootElement.getElementsByTagName(MAKE_TYPE_ELEMENT).item(0);
    ASModuleMakeType makeType = ASModuleMakeType.valueOf(makeTypeElement.getTextContent());

    String runConfigurationClassName = null;
    NodeList elementsByTagName = rootElement.getElementsByTagName(RUN_CONFIGURATION_ELEMENT);
    if (elementsByTagName != null && elementsByTagName.getLength() > 0) {
      Element runConfigurationElement = (Element) rootElement.getElementsByTagName(RUN_CONFIGURATION_ELEMENT).item(0);
      runConfigurationClassName = runConfigurationElement.getTextContent();
    }

    return new ASDebugGenFile(sourcePath, makeType, runConfigurationClassName);
  }

  public void save() {
    Document xml = toXML();

    try {
      XMLUtils.saveToFile(sourcePath, xml);
    } catch (TransformerException e) {
      throw new RuntimeException("Can't transform codeOrchestra generation debug document", e);
    }
  }

}
