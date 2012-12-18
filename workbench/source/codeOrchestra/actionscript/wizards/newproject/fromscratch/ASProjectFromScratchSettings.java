package codeOrchestra.actionscript.wizards.newproject.fromscratch;

import codeOrchestra.actionscript.wizards.newproject.ASNewProjectSettings;

/**
 * @author Alexander Eliseyev
 */
public class ASProjectFromScratchSettings extends ASNewProjectSettings {

  private boolean createModule;
  private String moduleName;
  private String modulePath;

  private boolean createMainClass;
  private String packageName;
  private String mainClassName;

  public boolean isCreateModule() {
    return createModule;
  }

  public void setCreateModule(boolean createModule) {
    this.createModule = createModule;
  }

  public String getModuleName() {
    return moduleName;
  }

  public void setModuleName(String moduleName) {
    this.moduleName = moduleName;
  }

  public String getModulePath() {
    return modulePath;
  }

  public void setModulePath(String modulePath) {
    this.modulePath = modulePath;
  }

  public boolean isCreateMainClass() {
    return createMainClass;
  }

  public void setCreateMainClass(boolean createMainClass) {
    this.createMainClass = createMainClass;
  }

  public String getMainClassName() {
    return mainClassName;
  }

  public void setMainClassName(String mainClassName) {
    this.mainClassName = mainClassName;
  }

  public String getPackageName() {
    return packageName;
  }

  public void setPackageName(String packageName) {
    this.packageName = packageName;
  }
}
