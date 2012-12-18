package codeOrchestra.actionScript.debugger.session;

import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import flash.tools.debugger.SourceLocator;

import java.io.*;
import java.util.Collection;
import java.util.Iterator;
import java.util.LinkedList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASDebugSourceLocator implements SourceLocator {

  private int changesCounter;
  private List<String> sourceDirectories = new LinkedList<String>();

  public ASDebugSourceLocator() {
    initSourceDirectoriesList();
  }

  public void addSources(String srcPath) {
    sourceDirectories.add(srcPath);
    changesCounter++;
  }

  public void addSources(Collection<String> srcPaths) {
    for (String srcPath : srcPaths) {
      addSources(srcPath);
    }
  }

  private void initSourceDirectoriesList() {
    File flexHome = new File(FlexSDKSettings.getInstance().getFlexSDKPath());
    if (flexHome.exists()) {
      try {
        File projectsDir = new File(flexHome, "frameworks/projects");
        File[] files = projectsDir.listFiles();
        if (files != null) {
          for (int i = 0; i < files.length; ++i) {
            if (files[i].isDirectory()) {
              File srcDir = new File(files[i], "src");
              if (srcDir.isDirectory()) {
                sourceDirectories.add(srcDir.getCanonicalPath());
              }
            }
          }
        }
      } catch (IOException e) {
        // ignore
      }
    }
    changesCounter++;
  }

  @Override
  public InputStream locateSource(String path, String pkg, String name) {
    File f = null;
    boolean exists = false;
    String pkgPlusName;

    if ((pkg != null && pkg.length() > 0))
      pkgPlusName = pkg + File.separator + name;
    else
      pkgPlusName = null;

    Iterator<String> iter = sourceDirectories.iterator();
    while (iter.hasNext()) {
      String dir = iter.next();

      // new File("", filename) searches the root dir -- that's not what we want!
      if (dir.equals("")) //$NON-NLS-1$
        dir = "."; //$NON-NLS-1$

      // look for sourcedir\package\filename
      if (pkgPlusName != null) {
        f = new File(dir, pkgPlusName);
        exists = f.exists();
      }

      // look for sourcedir\filename
      if (!exists) {
        f = new File(dir, name);
        exists = f.exists();
      }

      if (exists) {
        try {
          return new FileInputStream(f);
        } catch (FileNotFoundException e) {
          e.printStackTrace(); // shouldn't happen
        }
      }
    }

    return null;
  }

  @Override
  public int getChangeCount() {
    return changesCounter;
  }
}
