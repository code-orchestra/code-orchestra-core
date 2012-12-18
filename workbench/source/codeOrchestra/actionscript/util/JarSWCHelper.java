package codeOrchestra.actionscript.util;

import java.io.File;
import java.util.UUID;
import java.io.FileOutputStream;
import java.io.IOException;

public final class JarSWCHelper {
  public static String JAR_MARKER = ".jar!";

  private JarSWCHelper() {
  }

  public static File extractJarSWCResource(String fullPath) {
    if (fullPath != null && fullPath.contains(JAR_MARKER) && !(fullPath.trim().endsWith(JAR_MARKER))) {
      String jarFile = fullPath.substring(0, fullPath.indexOf(JAR_MARKER) + JAR_MARKER.length() - 1);
      String resourcePath = fullPath.substring(fullPath.indexOf(JAR_MARKER) + JAR_MARKER.length(), fullPath.length());

      // RF-582
      if (resourcePath.startsWith("/")) {
        resourcePath = resourcePath.substring(1);
      }

      JarResources jarResources = new JarResources(jarFile);
      byte[] extractedBuffer = jarResources.getResource(resourcePath);

      if (extractedBuffer == null) {
        return null;
      }

      try {
        // Extract the jar resource to a temporary file 
        File tempFile = File.createTempFile(UUID.randomUUID().toString() + ".swc", null);

        FileOutputStream fileOutputStream = new FileOutputStream(tempFile);
        fileOutputStream.write(extractedBuffer);
        fileOutputStream.flush();
        fileOutputStream.close();

        return tempFile;
      } catch (IOException ioException) {
        throw new RuntimeException("Error while extracting " + fullPath + " to a temporary file");
      }
    }
    // Not a jar contained resource 
    return null;
  }
}
