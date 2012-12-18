package codeOrchestra.actionscript.wizards.newproject.fromexternal;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.xml.sax.InputSource;

import javax.xml.parsers.DocumentBuilderFactory;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;

/**
 * @author Anton.I.Neverov
 */
public abstract class ASExternalRunConfiguration {

  protected String name;
  protected String mainClass;
  protected String moduleName;

  protected File configFile;

  public String getName() {
    return name;
  }

  public String getMainClass() {
    return mainClass;
  }

  public String getModuleName() {
    return moduleName;
  }

  protected Element getTopLevelElement() throws ASExternalImporterException {

    BufferedReader reader;
    try {
      reader = new BufferedReader(new FileReader(configFile));
    } catch (FileNotFoundException e) {
      throw new ASExternalImporterException("Cannot find run configuration file " + configFile.getPath());
    }

    DocumentBuilderFactory fact = DocumentBuilderFactory.newInstance();
    Document doc;
    try {
      doc = fact.newDocumentBuilder().parse(new InputSource(reader));
    } catch (Exception e) {
      throw new ASExternalImporterException("Corrupted run configuration file: " + configFile.getPath());
    }

    Element el = doc.getDocumentElement();
    if (el == null) {
      throw new ASExternalImporterException("Corrupted run configuration file: " + configFile.getPath());
    }

    return el;
  }

}
