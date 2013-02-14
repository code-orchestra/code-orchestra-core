package codeOrchestra.actionscript.util;

import java.io.*;
import java.net.URI;
import java.util.Deque;
import java.util.Enumeration;
import java.util.LinkedList;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipOutputStream;

/**
 * author: Daniil
 */
public class ZipUtilForModule {
  public static boolean isValidName(String name) {
    if (name.equals(".svn") || name.equals(".git") || name.equals("source_gen")
      || name.equals("source_gen.caches") || name.equals("classes_gen") || name.equals(".gitignore") || name.contains(".zip") || name.equals("output_swf")) {
      return false;
    } else {
      return true;
    }
  }

  public static void importModule(String path, String directory) throws IOException {
    ZipFile zip = new ZipFile(path);
    new File(directory).mkdir();
    Enumeration entries = zip.entries();
    LinkedList<ZipEntry> zfiles = new LinkedList<ZipEntry>();
    while (entries.hasMoreElements()) {
      ZipEntry entry = (ZipEntry) entries.nextElement();
      if (entry.isDirectory()) {
        new File(directory + File.separator + entry.getName()).mkdir();
      } else {
        zfiles.add(entry);
      }
    }
    for (ZipEntry entry : zfiles) {
      InputStream in = zip.getInputStream(entry);
      OutputStream out = new FileOutputStream(directory + File.separator + entry.getName());
      byte[] buffer = new byte[1024];
      int len;
      while ((len = in.read(buffer)) >= 0) {
        out.write(buffer, 0, len);
      }

      in.close();
      out.close();
    }
    zip.close();
  }

  public static void exportModule(String path, String to) throws IOException {
    File directory = new File(path);
    URI base = directory.toURI();
    Deque<File> queue = new LinkedList<File>();
    queue.push(directory);
    OutputStream out = new FileOutputStream(new File(to));
    Closeable res = out;

    try {
      ZipOutputStream zout = new ZipOutputStream(out);
      res = zout;
      while (!queue.isEmpty()) {
        directory = queue.pop();
        for (File child : directory.listFiles()) {
          String name = base.relativize(child.toURI()).getPath();
          if (child.isDirectory()) {
            if (isValidName(child.getName())) {
              queue.push(child);
              name = name.endsWith("/") ? name : name + File.separator;
              zout.putNextEntry(new ZipEntry(name));
            }
          } else {
            if (isValidName(child.getName())) {
              zout.putNextEntry(new ZipEntry(name));
              InputStream in = new FileInputStream(child);
              try {
                byte[] buffer = new byte[1024];
                while (true) {
                  int readCount = in.read(buffer);
                  if (readCount < 0) {
                    break;
                  }
                  zout.write(buffer, 0, readCount);
                }
              } finally {
                in.close();
              }
              zout.closeEntry();
            }
          }
        }
      }
    } finally {
      res.close();
    }
  }
}
