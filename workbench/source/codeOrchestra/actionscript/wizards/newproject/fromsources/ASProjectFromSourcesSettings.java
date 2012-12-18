package codeOrchestra.actionscript.wizards.newproject.fromsources;

import codeOrchestra.actionscript.util.FileUtils;
import codeOrchestra.actionscript.wizards.newproject.ASNewProjectSettings;
import jetbrains.mps.util.misc.hash.HashSet;
import org.apache.commons.lang.ObjectUtils;

import java.io.File;
import java.io.FileFilter;
import java.util.List;
import java.util.ArrayList;
import java.util.Set;

/**
 * @author Alexander Eliseyev
 */
public class ASProjectFromSourcesSettings extends ASNewProjectSettings {

  private String sourcesPath;
  private String moduleName;
  private String modulePath;

  private List<String> swcPaths = new ArrayList<String>();

  public String getModulePath() {
    return modulePath;
  }

  public void setModulePath(String modulePath) {
    this.modulePath = modulePath;
  }

  public String getModuleName() {
    return moduleName;
  }

  public void setModuleName(String moduleName) {
    this.moduleName = moduleName;
  }

  public String getSourcesPath() {
    return sourcesPath;
  }

  public void setSourcesPath(String sourcesPath) {
    boolean pathChanged = !ObjectUtils.equals(sourcesPath, this.sourcesPath);
    this.sourcesPath = sourcesPath;

    if (pathChanged) {
      updateLibrariesList();
    }
  }

  private void updateLibrariesList() {
    this.swcPaths.clear();

    List<File> swcFiles = FileUtils.listFileRecursively(new File(sourcesPath), new FileFilter() {
      public boolean accept(File pathname) {
        return pathname.getName().toLowerCase().trim().endsWith(".swc");
      }
    });

    for (File swcFile : swcFiles) {
      swcPaths.add(swcFile.getPath());
    }
  }  

  public List<String> getSwcPaths() {
    return swcPaths;
  }

  public Set<String> getUniquePaths() {
    HashSet<String> paths = new HashSet<String>();
    paths.addAll(swcPaths);
    return paths;
  }


}
