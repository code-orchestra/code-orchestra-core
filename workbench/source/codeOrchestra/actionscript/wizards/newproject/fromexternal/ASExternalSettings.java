package codeOrchestra.actionscript.wizards.newproject.fromexternal;

import codeOrchestra.actionscript.wizards.newproject.ASNewProjectSettings;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.idea.ASIdeaImporter;

/**
 * @author Anton.I.Neverov
 */
public abstract class ASExternalSettings extends ASNewProjectSettings {
  
  protected ASExternalImporter importer;
  
  public ASExternalImporter getImporter() {
    return importer;
  }

  public void setImporter(ASExternalImporter importer) {
    this.importer = importer;
  }
  
}
