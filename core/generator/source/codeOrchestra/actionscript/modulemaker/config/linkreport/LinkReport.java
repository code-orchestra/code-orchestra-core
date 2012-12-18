package codeOrchestra.actionscript.modulemaker.config.linkreport;

import codeOrchestra.actionscript.util.XMLUtils;
import jetbrains.mps.logging.Logger;
import org.w3c.dom.Document;
import org.w3c.dom.Element;

import javax.xml.transform.TransformerException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class LinkReport {

  private static final Logger LOG = Logger.getLogger(LinkReport.class);

  private static final String REPORT_ELEMENT = "report";
  private static final String SCRIPTS_ELEMENT = "scripts";
  private static final String SCRIPT_ELEMENT = "script";
  private static final String NAME_ATTRIBUTE = "name";
  private static final String DEF_ELEMENT = "def";
  private static final String ID_ELEMENT = "id";

  private List<Script> scripts = new ArrayList<Script>();

  private String pathToSave;

  public LinkReport(String pathToSave) {
    this.pathToSave = pathToSave;
  }

  public void addScript(String definitionId) {
    scripts.add(new Script(definitionId));
  }

  // TODO: do we need this?
  public void addScript(String name, String definitionId) {
    scripts.add(new Script(name, definitionId));
  }

  public String save() {
    Document document = XMLUtils.createDocument();

    Element reportElement = document.createElement(REPORT_ELEMENT);
    document.appendChild(reportElement);

    Element scriptsElement = document.createElement(SCRIPTS_ELEMENT);
    reportElement.appendChild(scriptsElement);

    for (Script script : scripts) {
      Element scriptElement = document.createElement(SCRIPT_ELEMENT);
      if (script.getName() != null) {
        scriptElement.setAttribute(NAME_ATTRIBUTE, script.getName());
      }
      scriptsElement.appendChild(scriptElement);

      Element definitionElement = document.createElement(DEF_ELEMENT);
      scriptElement.appendChild(definitionElement);
      definitionElement.setAttribute(ID_ELEMENT, script.getDefinitionId());
    }

    try {
      XMLUtils.saveToFile(pathToSave, document);
    } catch (TransformerException e) {
      LOG.error("Can't write linking report file to " + pathToSave, e);
      return null;
    }
    return pathToSave;
  }

}
