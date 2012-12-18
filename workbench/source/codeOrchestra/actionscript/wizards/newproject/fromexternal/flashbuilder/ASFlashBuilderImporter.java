package codeOrchestra.actionscript.wizards.newproject.fromexternal.flashbuilder;

import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalImporter;
import codeOrchestra.actionscript.wizards.newproject.fromexternal.ASExternalImporterException;

import java.io.File;
import java.io.FileFilter;
import java.io.FilenameFilter;

/**
 * @author Anton.I.Neverov
 */
public class ASFlashBuilderImporter extends ASExternalImporter {

  @Override
  protected void innerSetProject(String path) throws ASExternalImporterException {
    //To change body of implemented methods use File | Settings | File Templates.
  }

  @Override
  protected void determineProjectName() throws ASExternalImporterException {
    // There is no project in FlashBuilder, there is just a set of modules in a workspace
    projectName = null;
  }

  public boolean projectIsFound() {
    return super.projectIsFound() && modules.size() > 0;
  }

  @Override
  protected void locateModules() throws ASExternalImporterException {
    modules.clear();

    File dir = new File(projectPath);
    assert (dir.isDirectory());
    String[] modulePaths = dir.list();
    
    for (String module : modulePaths) {
      module = projectPath + "/" + module;
      if (!(new File(module).isDirectory())) {
        continue;
      }

      File projectFile = new File(module, ".project");
      File actionScriptPropertiesFile = new File(module, ".actionScriptProperties");

      if (!(projectFile.exists() && actionScriptPropertiesFile.exists())) {
        continue;
      }

      modules.add(new ASFlashBuilderModule(module));
    }

    resolveModuleDependencies();

  }

  @Override
  protected void addRunConfigurations() {
    runConfigurations.clear();

    File[] dirs = new File(projectPath).listFiles(new FileFilter() {
      @Override
      public boolean accept(File pathname) {
        return pathname.isDirectory();
      }
    });
    
    for (File dir : dirs) {
      String[] runConfigurationNames = dir.list(new FilenameFilter() {
        @Override
        public boolean accept(File dir, String name) {
          return name.endsWith(".launch");
        }
      });
      for (String s : runConfigurationNames) {
        try {
          runConfigurations.add(new ASFlashBuilderRunConfiguration(dir.getPath() + "/" + s, modules));
        } catch (ASExternalImporterException e) {
          // Ignore
        }
      }
    }

  }

  @Override
  protected void resetSpecificFields() {
    //To change body of implemented methods use File | Settings | File Templates.
  }
}
