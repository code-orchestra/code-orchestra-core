package codeOrchestra.actionscript.wizards.newproject.fromexternal;

import jetbrains.mps.util.misc.hash.HashMap;
import org.apache.commons.lang.StringUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Map;

/**
 * @author Anton.I.Neverov
 */
public abstract class ASExternalImporter {

  protected String projectPath;
  protected String projectName;
  protected List<ASExternalModule> modules = new ArrayList<ASExternalModule>();
  protected List<ASExternalRunConfiguration> runConfigurations = new ArrayList<ASExternalRunConfiguration>();
  protected boolean copyLibraries = false;
  protected boolean copyConfigFiles = false;

  protected abstract void determineProjectName() throws ASExternalImporterException;

  protected abstract void locateModules() throws ASExternalImporterException;

  protected abstract void addRunConfigurations() throws ASExternalImporterException;

  public boolean projectIsFound() {
    return projectPath != null;
  }

  public boolean modulesAreFound() {
    return modules.size() > 0;
  }

  protected abstract void innerSetProject(String path) throws ASExternalImporterException;

  public void setProject(String path) throws ASExternalImporterException {
    if (path == null || StringUtils.isEmpty(path)) {
      resetStateAndThrowException("Project path is empty");
    }
    projectPath = path;
    innerSetProject(path);
    determineProjectName();
    locateModules();
    addRunConfigurations();
  }

  public void setCopyLibraries(boolean b) {
    copyLibraries = b;
  }

  public void setCopyConfigFiles(boolean b) {
    copyConfigFiles = b;
  }

  protected abstract void resetSpecificFields();

  protected void resolveModuleDependencies() {
    Map<String, String> namePathMap = new HashMap<String, String>();
    // Resolve module dependencies
    for (ASExternalModule module : modules) {
      namePathMap.put(module.getModuleName(), module.getModulePath());
    }
    for (ASExternalModule module : modules) {
      module.resolveModuleDependencies(namePathMap);
    }
  }

  protected void resetStateAndThrowException(String message) throws ASExternalImporterException {
    projectPath = null;
    projectName = null;
    modules.clear();
    resetSpecificFields();
    throw new ASExternalImporterException(message);
  }

  public String getProjectName() {
    return projectName;
  }

  public List<ASExternalModule> getModules() {
    return Collections.unmodifiableList(modules);
  }

  public List<ASExternalRunConfiguration> getRunConfigurations() {
    return Collections.unmodifiableList(runConfigurations);
  }

  public boolean isCopyLibraries() {
    return copyLibraries;
  }

  public boolean isCopyConfigFiles() {
    return copyConfigFiles;
  }

}
