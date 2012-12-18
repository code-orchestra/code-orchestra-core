package codeOrchestra.actionscript.modulemaker.config;

import codeOrchestra.actionscript.modulemaker.config.FlexConfig.FileWrapper;

import java.io.File;
import java.io.FileFilter;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ResourceHelper {

  public static List<FileWrapper> getResources(String modulePath) {
    List<FileWrapper> result = new ArrayList<FileWrapper>();

    File moduleDir = new File(modulePath);
    File sourceDir = new File(moduleDir.getPath() + File.separator + "source");
    if (!sourceDir.exists()) {
      return result;
    }

    List<File> resourceFiles = listFileRecursively(sourceDir, new FileFilter() {
      public boolean accept(File file) {
        return !file.isDirectory() && !file.getName().toLowerCase().endsWith(".as");
      }
    });

    for (File resourceFile : resourceFiles) {
      result.add(new FileWrapper(resourceFile.getPath(), getRelativePath(resourceFile, sourceDir)));
    }

    return result;
  }

  public static String getRelativePath(File child, File parent) {
    return child.getPath().replace(parent.getPath(), "").substring(1);
  }

  public static List<File> listFileRecursively(File dir, FileFilter fileFilter) {
    assert dir.isDirectory();
    List<File> files = new ArrayList<File>();

    File[] subdirs = dir.listFiles(new FileFilter() {
      public boolean accept(File f) {
        return f.isDirectory() && !(".svn".equals(f.getName()));
      }
    });

    if (subdirs != null) {
      for (File subdir : subdirs) {
        files.addAll(listFileRecursively(subdir, fileFilter));
      }
      addArrayToList(files, dir.listFiles(fileFilter));
    }

    return files;
  }

  private static void addArrayToList(List<File> list, File[] array) {
    for (File file : array) {
      list.add(file);
    }
  }


}
