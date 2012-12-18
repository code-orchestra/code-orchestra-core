package codeOrchestra.actionscript.modulemaker.config;

import com.intellij.cyclicDependencies.ShortestPathUtil;
import codeOrchestra.actionscript.util.JarResources;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.util.FileUtil;
import org.apache.commons.lang.StringUtils;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.Map.Entry;
import java.util.UUID;

/**
 * @author Alexander Eliseyev
 */
public class SourceGenInJarHelper {

  private static Logger LOG = Logger.getLogger(SourceGenInJarHelper.class.getSimpleName());

  public static String JAR_MARKER = ".jar!";

  private SourceGenInJarHelper() {
  }

  public static String extractGeneratedSourcesFromJar(String fullPathUnsafe, String modelLongName) {
    String fullPath = StringUtils.replaceChars(fullPathUnsafe, '\\', '/');

    if (isJarPath(fullPath)) {
      String tempDirName = "source_" + modelLongName;

      String jarFile = fullPath.substring(0, fullPath.indexOf(JAR_MARKER) + JAR_MARKER.length() - 1);
      String resourcePath = fullPath.substring(fullPath.indexOf(JAR_MARKER) + JAR_MARKER.length(), fullPath.length());

      if (resourcePath.startsWith("/")) {
        resourcePath = resourcePath.substring(1);
      }

      String resourcePathByDots = StringUtils.replaceChars(resourcePath, '/', '.');
      String namespacePrefix = resourcePathByDots + '.' + modelLongName;

      JarResources jarResources = new JarResources(jarFile, namespacePrefix);

      File destinationPath = getTempSourcesDir(tempDirName);

      for (Entry<String, byte[]> entry : jarResources.getJarContents().entrySet()){
        // e.g., module/source_gen/jetbrains/mps/ui/events/ClickEvent=[B@6d8dfef8
        try {
          extract(destinationPath, entry.getKey().replace(resourcePath, ""), entry.getValue());
        } catch (Throwable t) {
          LOG.warning("Error while extracting " + fullPath + " to a temporary dir", t);
        }
      }

      return destinationPath.getPath();
    }

    return null;
  }

  private static File getTempSourcesDir(String tempDirName) {
    // We don't want to overwrite the accessory libs, so we copy each build's accerrory models to a separate dir
    File tmp = new File(FileUtil.getTempDir(), "build" + System.getProperty("codeOrchestra.build.number"));
    if (!tmp.exists()) {
      tmp.mkdirs();
    }

    File result = new File(tmp, tempDirName);
    result.mkdir();

    return result;
  }

  private static void extract(File destinationPath, String entryPath, byte[] extractedBuffer) {
    if (extractedBuffer == null) {
      return;
    }

    String extractedFileName = destinationPath + entryPath;

    try {
      // Extract the jar resource to a temporary file
      File tempFile = new File(extractedFileName);
      if (tempFile.exists()) {
        return;
      }

      new File(tempFile.getParent()).mkdirs();

      FileOutputStream fileOutputStream = new FileOutputStream(tempFile);
      fileOutputStream.write(extractedBuffer);
      fileOutputStream.flush();
      fileOutputStream.close();
    } catch (IOException ioException) {
      throw new RuntimeException("Error while extracting " + entryPath + " to a temporary file", ioException);
    }

  }

  public static boolean isJarPath(String fullPath) {
    return fullPath.contains(JAR_MARKER) && !(fullPath.trim().endsWith(JAR_MARKER));
  }

}

