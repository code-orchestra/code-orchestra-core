package codeOrchestra.actionscript.wizards.newproject.fromexternal;

import codeOrchestra.actionscript.wizards.newproject.fromexternal.fdt.ASFDTType;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.flashbuilder.ASFlashBuilderType;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.idea.ASIdeaType;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.maven.ASMavenType;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public final class ASExternalTypeProvider {

  private static final ASExternalTypeProvider INSTANCE = new ASExternalTypeProvider();

  private List<ASExternalType> sources = new ArrayList<ASExternalType>();

  private ASExternalTypeProvider() {
    sources.add(new ASIdeaType());
    sources.add(new ASFlashBuilderType());
    //sources.add(new ASFDTType());
    //sources.add(new ASMavenType());
  }

  public List<ASExternalType> getTypes() {
    return Collections.unmodifiableList(sources);
  }
  
  public int getTypesSize() {
    return sources.size();
  }

  public static ASExternalTypeProvider getInstance() {
    return INSTANCE;
  }

}
