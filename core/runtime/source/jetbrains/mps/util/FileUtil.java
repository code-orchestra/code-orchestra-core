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
package jetbrains.mps.util;


import java.io.*;
import java.util.Iterator;
import java.util.List;
import java.util.jar.JarOutputStream;
import java.util.jar.Manifest;
import java.util.regex.Pattern;
import java.util.zip.ZipOutputStream;

/**
 * @author Kostik
 */
public class FileUtil {
  private static final String[] IGNORED_DIRS = new String[]{".svn", ".git", "_svn"};
  public static final String DEFAULT_CHARSET = "UTF-8";

  public static File createTmpDir() {
    File tmp = getTempDir();
    int i = 0;
    while (true) {

      if (!new File(tmp, "mpstemp" + i).exists()) {
        break;
      }
      i++;
    }

    File result = new File(tmp, "mpstemp" + i);
    result.mkdir();
    return result;
  }

  public static File createTmpFile() {
    File tmp = getTempDir();
    int i = 0;
    while (true) {

      if (!new File(tmp, "mpstemp" + i).exists()) {
        break;
      }
      i++;
    }

    File result = new File(tmp, "mpstemp" + i);
    try {
      result.createNewFile();
    } catch (IOException e) {
      e.printStackTrace();
    }
    return result;
  }

  public static File getTempDir() {
    return new File(System.getProperty("java.io.tmpdir"));
  }

  public static void jar(File dir, final Manifest mf, File to) {
    new Packer() {
      protected ZipOutputStream createDeflaterStream(FileOutputStream fos) throws Exception {
        return new JarOutputStream(fos, mf);
      }
    }.pack(dir, to);
  }

  @SuppressWarnings({"UnusedDeclaration"})
  public static void zip(File dir, File to) {
    new Packer() {
      protected ZipOutputStream createDeflaterStream(FileOutputStream fos) throws Exception {
        return new ZipOutputStream(fos);
      }
    }.pack(dir, to);
  }

  public static void copyDir(File what, File to) {
    copyDir(what, to, false);
  }

  public static void copyDir(File what, File to, boolean checkEquals) {
    assert what.isDirectory();
    if (!to.exists()) {
      to.mkdir();
    }

    for (File f : what.listFiles()) {
      if (f.isDirectory()) {

        if (isIgnoredDir(f.getName())) continue;

        File fCopy = new File(to, f.getName());
        if (!fCopy.exists()) {
          fCopy.mkdir();
        }
        copyDir(f, fCopy);
      }

      if (f.isFile()) {
        try {
          copyFileChecked(f, to, checkEquals);
        } catch (IOException e) {
          e.printStackTrace();
        }
      }
    }
  }

  public static void copyFile(File f, File to) {
    try {
      copyFileChecked(f, to);
    } catch (IOException e) {
      e.printStackTrace();
    }
  }

  public static void copyFileChecked(File f, File to, boolean checkEquals) throws IOException {
    File target;
    if (to.isDirectory()) {
      target = new File(to, f.getName());
    } else {
      target = to;
    }

    if (!to.getParentFile().exists()) {
      to.getParentFile().mkdirs();
    }

    if (checkEquals && target.exists()) {
      String existingContents = FileUtil.read(target);
      if (existingContents.equals(FileUtil.read(f))) {
        return;
      }
    }

    byte[] bytes = new byte[(int) f.length()];

    OutputStream os = new FileOutputStream(target);
    FileInputStream is = new FileInputStream(f);

    ReadUtil.read(bytes, is);
    os.write(bytes);

    is.close();
    os.close();
  }

  public static void copyFileChecked(File f, File to) throws IOException {
    copyFileChecked(f, to, false);
  }

  public static String getCanonicalPath(File file) {
    if (file == null) {
      return null;
    }
    try {
      return file.getCanonicalPath();
    } catch (IOException e) {
      return file.getAbsolutePath();
    }
  }

  public static String getCanonicalPath(String path) {
    if (path == null) return "";
    File file = new File(path);
    return getCanonicalPath(file);
  }

  public static boolean delete(File root) {
    boolean result = true;

    if (root.isDirectory()) {
      for (File child : root.listFiles()) {
        result = delete(child) && result;
      }
    }
    // !result means one of children was not deleted, hence you may not delete this directory
    return result && root.delete();
  }

  public static boolean clear(File dir) {
    File[] files = dir.listFiles();
    if (files == null) return true;

    boolean result = true;

    for (File f : files) {
      boolean r = delete(f);
      result = result && r;
    }

    return result;
  }

  public static long getNewestFileTime(File dir) {
    return getNewestFileTime(dir, true);
  }

  public static long getNewestFileTime(File dir, boolean recursive) {
    File[] files = dir.listFiles();
    if (files == null) {
      return dir.lastModified();
    }
    long result = dir.lastModified();
    for (File file : files) {
      if (isIgnoredDir(file.getName())) {
        continue;
      }

      if (recursive) {
        result = Math.max(result, getNewestFileTime(file));
      } else {
        result = Math.max(result, file.lastModified());
      }
    }
    return result;
  }

  public static void writeFile(final File file, final String content) throws IOException {
    if (!file.getParentFile().exists()) {
      file.getParentFile().mkdirs();
    }

    if (file.exists()) {
      try {
        String existingContents = FileUtil.read(file);
        if (existingContents != null && existingContents.equals(content)) {
          return;
        }
      } catch (RuntimeException ex) {
        /* ignore */
      }
      file.delete();
    }

    boolean fileCreated = false;
    IOException lastExc = null;
    for (int i = 1; i <= 20; i++) {
      try {
        file.createNewFile();
        fileCreated = true;
        break;
      } catch (IOException ex) {
        lastExc = ex;
        //sometimes:
        //java.io.IOException: Access is denied
        //at java.io.WinNTFileSystem.createFileExclusively(Native Method)
        //at java.io.File.createNewFile(File.java:850)
        // so we'll try 5(20) times
      }
      try {
        Thread.sleep(100);
      } catch (InterruptedException ie) {
        //ok
      }
    }

    if (fileCreated) {
      FileUtil.write(file, content);
    } else {
      throw lastExc == null ? new IOException("Can't create " + file.getPath()) : lastExc;
    }
  }

  /*
   * use writeFile
   */
  public static void write(File file, String content) {
    try {
      Writer out = new BufferedWriter(new OutputStreamWriter(new FileOutputStream(file), "UTF-8"));
      out.write(content);
      out.flush();
      out.close();
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  public static void write(File file, byte[] content) {
    OutputStream writer = null;
    try {
      writer = new FileOutputStream(file);
      writer.write(content);
    } catch (IOException e) {
      throw new RuntimeException(e);
    } finally {
      if (writer != null) {
        try {
          writer.close();
        } catch (IOException e) {}
      }
    }
  }

  public static String read(File file) {
    try {
      return read(new FileReader(file));
    } catch (IOException e) {
      throw new RuntimeException(e);
    }
  }

  public static String read(Reader reader) {
    BufferedReader r = null;
    try {
      r = new BufferedReader(reader);

      StringBuilder result = new StringBuilder();

      String line = null;
      while ((line = r.readLine()) != null) {
        result.append(line).append("\n");
      }

      return result.toString();
    } catch (IOException e) {
      throw new RuntimeException(e);
    } finally {
      try {
        if (r != null) {
          r.close();
        }
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }

  public static String readLine(Reader reader, int lineNo) {
    BufferedReader r = null;
    try {
      r = new BufferedReader(reader);

      String line = null;
      int currentLine = 0;
      while ((line = r.readLine()) != null) {
        if (currentLine == lineNo) {
          return line;
        }
        currentLine++;
      }

      return null;
    } catch (IOException e) {
      throw new RuntimeException(e);
    } finally {
      try {
        if (r != null) {
          r.close();
        }
      } catch (IOException e) {
        e.printStackTrace();
      }
    }
  }


  public static boolean isParent(File parent, File child) {
    if (!parent.isDirectory()) {
      return false;
    }

    if (parent.equals(child)) return true;

    for (File f : parent.listFiles()) {
      if (isParent(f, child)) return true;
    }

    return false;
  }

  public static File getMaxContainingFile(List<File> files) {
    if (files.size() == 0) return null;
    Iterator<File> fileIterator = files.iterator();
    File max = fileIterator.next();
    while (fileIterator.hasNext()) {
      if (max == null) return null;
      max = getMaxContainingFile(max, fileIterator.next());
    }

    return max;
  }

  public static File getMaxContainingFile(File file1, File file2) {
    if (isParentUp(file1, file2)) return file1;
    if (isParentUp(file2, file1)) return file2;

    File parent1 = file1.getParentFile();
    File parent2 = file2.getParentFile();

    if ((parent1 == null) && (parent2 == null)) {
      return null;
    } else if (parent1 == null) {
      return getMaxContainingFile(file1, parent2);
    } else if (parent2 == null) {
      return getMaxContainingFile(parent1, file2);
    }

    return getMaxContainingFile(parent1, parent2);
  }

  public static boolean isParentUp(File parent, File child) {
    if (!parent.isDirectory()) {
      return false;
    }

    if (parent.getPath().equals(child.getPath())) return true;

    File parentOfChild = child.getParentFile();
    if (parentOfChild == null) return false;
    return isParentUp(parent, parentOfChild);
  }

  public static boolean isIgnoredDir(String name) {
    for (String ignoredDir : IGNORED_DIRS) {
      if (ignoredDir.equals(name)) {
        return true;
      }
    }
    return false;
  }


  public static String getRelativePath(String targetPath, String basePath, String pathSeparator) {
    String[] base = basePath.split(Pattern.quote(pathSeparator));
    String[] target = targetPath.split(Pattern.quote(pathSeparator));

    StringBuffer common = new StringBuffer();

    int commonIndex = 0;
    while (commonIndex < target.length && commonIndex < base.length
      && target[commonIndex].equals(base[commonIndex])) {
      common.append(target[commonIndex]).append(pathSeparator);
      commonIndex++;
    }

    if (commonIndex == 0) {
      throw new PathResolutionException("No common path element found for '" + targetPath + "' and '" + basePath
        + "'");
    }

    if (target.length == commonIndex && base.length == target.length) {
      return "";
    }

    boolean baseIsFile = true;

    File baseResource = new File(basePath);

    if (baseResource.exists()) {
      baseIsFile = baseResource.isFile();

    } else if (basePath.endsWith(pathSeparator)) {
      baseIsFile = false;
    }

    StringBuffer relative = new StringBuffer();

    if (base.length != commonIndex) {
      int numDirsUp = baseIsFile ? base.length - commonIndex - 1 : base.length - commonIndex;

      for (int i = 0; i < numDirsUp; i++) {
        relative.append("..").append(pathSeparator);
      }
    }
    relative.append(targetPath.substring(common.length()));
    return relative.toString();
  }

  public static String getAbsolutePath(String path) {
    return new File(path).getAbsolutePath();
  }

  public static void closeFileSafe(Closeable c) {
    if (c != null) {
      try {
        c.close();
      } catch (IOException ignored) {
      }
    }
  }

  static class PathResolutionException extends RuntimeException {
    PathResolutionException(String msg) {
      super(msg);
    }
  }
}
