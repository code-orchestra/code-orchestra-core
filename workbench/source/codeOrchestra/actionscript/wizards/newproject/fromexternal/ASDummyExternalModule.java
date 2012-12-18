package codeOrchestra.actionscript.wizards.newproject.fromexternal;

import java.util.Map;

/**
 * Used to describe a module that was not imported by "New project from external source" action
 *
 * @author Anton.I.Neverov
 */
public class ASDummyExternalModule extends ASExternalModule {

  public void setSourcesPath(String path) {
    sourcesPath = path;
  }

  @Override
  public void resolveModuleDependencies(Map<String, String> namePathMap) {
    // Does nothing
  }
}
