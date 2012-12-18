package codeOrchestra.actionscript.jsRunConfiguration;

import codeOrchestra.run.CodeOrchestraRunConfiguration;
import jetbrains.mps.project.MPSProject;

/**
 * @author Anton.I.Neverov
 */
public class JSRunConfiguration implements CodeOrchestraRunConfiguration {

  public enum MyBrowser {
    DEFAULT,
    CHROME
  }

  private String moduleName;
  private MyBrowser myBrowser;
  private String chromePath;

  private transient MPSProject mpsProject;


  public JSRunConfiguration(String moduleName, MyBrowser myBrowser, String chromePath) {
    this.moduleName = moduleName;
    if (myBrowser == null) {
      this.myBrowser = MyBrowser.DEFAULT;
    } else {
      this.myBrowser = myBrowser;
    }
    this.chromePath = chromePath;
  }

  public String getModuleName() {
    return moduleName;
  }

  public void setModuleName(String moduleName) {
    this.moduleName = moduleName;
  }

  public MPSProject getMpsProject() {
    return mpsProject;
  }

  public void setMpsProject(MPSProject mpsProject) {
    this.mpsProject = mpsProject;
  }

  public MyBrowser getBrowser() {
    return myBrowser;
  }

  public void setBrowser(MyBrowser browser) {
    myBrowser = browser;
  }

  public String getChromePath() {
    return chromePath;
  }

  public void setChromePath(String customChromePath) {
    this.chromePath = customChromePath;
  }

}
