package codeOrchestra.utils;

import com.intellij.openapi.util.io.FileUtil;
import jetbrains.mps.util.UnzipUtil;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.zip.Deflater;
import java.util.zip.ZipEntry;
import java.util.zip.ZipOutputStream;

/**
 * @author Alexander Eliseyev
 */
public final class CompressUtils {

  private CompressUtils() {
  }

  public static void unzip(File zipFile, File baseDir) throws IOException {
    UnzipUtil.unzip(zipFile, baseDir);
  }

  public static void zip(List<File> filesToCompress, File baseDir, String outputPath) throws IOException {
    zip(filesToCompress, baseDir, outputPath, -1);
  }

  /**
   * All the files in <code>filesToCompress</code> must be contained within the <code>baseDir</code>.
   */
  public static void zip(List<File> filesToCompress, File baseDir, String outputPath, int level) throws IOException {
    byte[] buffer = new byte[1024];

    FileOutputStream fos = new FileOutputStream(outputPath);
    ZipOutputStream zos = new ZipOutputStream(fos);

    if (level != -1) {
      zos.setLevel(level);
    }

    for (File file : filesToCompress) {
      if (!file.exists()) {
        continue;
      }

      List<File> filesToCompressCurrentIteration;
      if (file.isDirectory()) {
        filesToCompressCurrentIteration = new ArrayList<File>();
        listFilesRecursively(file, filesToCompressCurrentIteration);
      } else {
        filesToCompressCurrentIteration = Collections.singletonList(file);
      }

      for (File fileToCompressCurrentIteration : filesToCompressCurrentIteration) {
        ZipEntry ze = new ZipEntry(FileUtil.getRelativePath(baseDir, fileToCompressCurrentIteration));
        zos.putNextEntry(ze);

        FileInputStream in = new FileInputStream(fileToCompressCurrentIteration);

        int len;
        while ((len = in.read(buffer)) > 0) {
          zos.write(buffer, 0, len);
        }

        in.close();
      }
    }

    zos.closeEntry();
    zos.close();
  }

  private static void listFilesRecursively(File dir, List<File> files) {
    assert dir.isDirectory();

    for (File childFile : dir.listFiles()) {
      if (childFile.isDirectory()) {
        listFilesRecursively(childFile, files);
      } else {
        files.add(childFile);
      }
    }
  }

}
