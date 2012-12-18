/*
 * Copyright 2003-2011 JetBrains s.r.o.
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 * http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package jetbrains.mps.build;

import jetbrains.mps.util.FileUtil;

import java.io.BufferedWriter;
import java.io.File;
import java.io.FileWriter;
import java.io.IOException;
import java.util.*;

public class GenerateNSI {
  private final List<File> myBaseDirs = new ArrayList<File>();
  private final File myCurrentDir;
  private final String myInput;
  private final String myOutput;

  public static void main(String[] args) throws IOException {
    new GenerateNSI(args).generate();
  }

  public GenerateNSI(String[] args) {
    for (int i = 2; i < args.length; i++) {
      myBaseDirs.add(new File(args[i]));
    }
    myCurrentDir = new File("");
    myInput = args[0];
    myOutput = args[1];
  }

  public void generate() throws IOException {
    generateInstFile();
    generateUninstFile();
  }

  private static class FileComparator implements Comparator<File> {
    public int compare(File file1, File file2) {
      return file1.getAbsolutePath().compareTo(file2.getAbsolutePath());
    }
  }

  private String getRelativePath(String path, File basedir) {
    return getRelativePath(path, basedir.getAbsolutePath());
  }

  private String getRelativePath(String path, String basePath) {
    if (!path.startsWith(basePath)) {
      return path;
    }
    String rPath = path.substring(basePath.length(), path.length());
    if (rPath.startsWith(File.separator)) {
      rPath = rPath.substring(1, rPath.length());
    }
    return rPath;
  }

  private void generateUninstFile() throws IOException {
    BufferedWriter uninstWriter = new BufferedWriter(new FileWriter(myOutput));
    try {
      for (File basedir : myBaseDirs) {
        if (basedir.isDirectory()) {
          generateUninstFilePart(uninstWriter, basedir);
        } else {
          generateUninstFilePartForFile(uninstWriter, basedir);
        }
      }
      uninstWriter.newLine();
      uninstWriter.write("RmDir \"$INSTDIR\"");
    } finally {
      uninstWriter.close();
    }
  }

  private void generateUninstFilePartForFile(BufferedWriter uninstWriter, File file) throws IOException {
    uninstWriter.newLine();
    uninstWriter.write("Delete \"$INSTDIR\\" + file.getName() + "\"");
  }

  private void generateUninstFilePart(BufferedWriter uninstWriter, File basedir) throws IOException {
    List<File> allFiles = getAllFiles(basedir);

    Collections.sort(allFiles, new FileComparator());
    for (File file : allFiles) {
      uninstWriter.newLine();
      uninstWriter.write("Delete \"$INSTDIR\\" + getRelativePath(file.getAbsolutePath(), basedir) + "\"");
    }

    uninstWriter.newLine();
    List<File> dirs = getAllDirs(basedir);
    Collections.sort(dirs, new FileComparator());
    for (int i = dirs.size() - 1; i >= 0; i--) {
      final File dir = dirs.get(i);
      if (dir.getAbsolutePath().length() == 0) continue;
      uninstWriter.newLine();
      uninstWriter.write("RmDir \"$INSTDIR\\" + getRelativePath(dir.getAbsolutePath(), basedir) + "\"");
    }
  }

  private void generateInstFile() throws IOException {
    BufferedWriter instWriter = new BufferedWriter(new FileWriter(myInput));
    try {
      for (File basedir : myBaseDirs) {
        if (basedir.isDirectory()) {
          generateInstFilePart(instWriter, basedir);
        } else {
          generateInstFilePartForAFile(instWriter, basedir);
        }
      }
    }
    finally {
      instWriter.close();
    }
  }

  private void generateInstFilePartForAFile(BufferedWriter instWriter, File file) throws IOException {
    instWriter.newLine();
    instWriter.newLine();
    instWriter.write("SetOutPath $INSTDIR");
    instWriter.newLine();
    instWriter.write("File \"" + getRelativePath(file.getAbsolutePath(), myCurrentDir.getAbsolutePath()) + "\"");
  }

  private void generateInstFilePart(BufferedWriter instWriter, File basedir) throws IOException {
    Collection<File> dirs = getAllDirs(basedir);
    for (File dir : dirs) {
      final File[] files = dir.listFiles();
      if (files.length == 0) continue;
      instWriter.newLine();
      instWriter.newLine();
      if (dir.getAbsolutePath().length() > basedir.getAbsolutePath().length()) {
        instWriter.write("SetOutPath \"$INSTDIR\\" + getRelativePath(dir.getAbsolutePath(), basedir) + "\"");
      } else {
        instWriter.write("SetOutPath $INSTDIR");
      }

      for (File file : files) {
        if (!file.isDirectory()) {
          instWriter.newLine();
          instWriter.write("File \"" + getRelativePath(file.getAbsolutePath(), myCurrentDir.getAbsolutePath()) + "\"");
        }
      }
    }
  }

  private List<File> getAllFiles(File basedir) {
    return getAllFiles(basedir, new LinkedList<File>());
  }

  private List<File> getAllFiles(File dir, List<File> list) {
    File[] files = dir.listFiles();
    for (File f : files) {
      if (!f.isDirectory()) {
        list.add(f);
      } else if (!FileUtil.isIgnoredDir(f.getName())) {
        getAllFiles(f, list);
      }
    }

    return list;
  }

  private ArrayList<File> getAllDirs(File basedir) {
    return getAllDirs(basedir, new ArrayList<File>());
  }

  private ArrayList<File> getAllDirs(File dir, ArrayList<File> list) {
    if (FileUtil.isIgnoredDir(dir.getName())) return list;
    list.add(dir);
    File[] files = dir.listFiles();
    for (File f : files) {
      if (f.isDirectory()) {
        getAllDirs(f, list);
      }
    }

    return list;
  }
}
