package codeOrchestra.actionscript.wizards.newproject;

import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASProjectFromExternalSource;
import codeOrchestra.actionscript.wizards.newproject.fromscratch.ASProjectFromScratchSource;
import codeOrchestra.actionscript.wizards.newproject.fromsources.ASProjectFromSourcesSource;

import java.util.Collections;
import java.util.List;
import java.util.ArrayList;

/**
 * @author Alexander Eliseyev
 */
public final class ASProjectSourceProvider {

  private static final ASProjectSourceProvider INSTANCE = new ASProjectSourceProvider();

  private List<ASProjectSource> sources = new ArrayList<ASProjectSource>();

  private ASProjectSourceProvider() {
    sources.add(new ASProjectFromScratchSource());
    sources.add(new ASProjectFromSourcesSource());
    sources.add(new ASProjectFromExternalSource());
  }

  public List<ASProjectSource> getSources() {
    return Collections.unmodifiableList(sources);
  }

  public static ASProjectSourceProvider getInstance() {
    return INSTANCE;
  }

}
