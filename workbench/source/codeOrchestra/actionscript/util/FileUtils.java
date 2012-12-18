package codeOrchestra.actionscript.util;

import java.util.List;
import java.io.File;
import java.io.FileFilter;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.project.Solution;
import jetbrains.mps.vfs.impl.IoFileSystemProvider;

public final class FileUtils {

  public static final FileFilter DIRECTORY_FILTER = new FileFilter() {
    public boolean accept(File file) {
      return file.isDirectory();
    }
  };

  private FileUtils() {
  }

  public static boolean doesExist(String path) {
    return new File(path).exists();
  }

  public static List<File> listFileRecursively(File dir, FileFilter fileFilter) {
    assert dir.isDirectory();
    List<File> files = ListSequence.fromList(new ArrayList<File>());

    File[] subdirs = dir.listFiles(new FileFilter() {
      public boolean accept(File f) {
        return f.isDirectory() && !(".svn".equals(f.getName()));
      }
    });

    if (subdirs != null) {
      for (File subdir : subdirs) {
        ListSequence.fromList(files).addSequence(ListSequence.fromList(listFileRecursively(subdir, fileFilter)));
      }
      addArrayToList(files, dir.listFiles(fileFilter));
    }

    return files;
  }

  public static IFile getModelFile(Solution solution, String packageName) {
    String path = solution.getDescriptorFile().getParent() + File.separator + packageName.replace('.', File.separatorChar) + ".mps";

    IoFileSystemProvider provider = new IoFileSystemProvider();
    return provider.getFile(path);
  }

  private static void addArrayToList(List<File> list, File[] array) {
    for (File file : array) {
      ListSequence.fromList(list).addElement(file);
    }
  }
}
