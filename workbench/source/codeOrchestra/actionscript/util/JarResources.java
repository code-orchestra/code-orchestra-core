package codeOrchestra.actionscript.util;

import java.util.Map;
import jetbrains.mps.internal.collections.runtime.MapSequence;
import jetbrains.mps.logging.Logger;
import org.apache.commons.lang.StringUtils;

import java.util.HashMap;
import java.util.zip.ZipFile;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipInputStream;
import java.io.BufferedInputStream;
import java.io.FileInputStream;

public class JarResources {

  private Map<String, Long> sizesMap = MapSequence.fromMap(new HashMap<String, Long>());
  private Map<String, byte[]> jarContents = MapSequence.fromMap(new HashMap<String, byte[]>());
  private String jarFileName;
  private String namespacePrefix;

  public JarResources(String jarFileName) {
    this(jarFileName, null);
  }

  public JarResources(String jarFileName, String namespacePrefix) {
    this.jarFileName = jarFileName;
    this.namespacePrefix = namespacePrefix;
    init();
  }

  public byte[] getResource(String name) {
    return MapSequence.fromMap(jarContents).get(name);
  }

  public Map<String, byte[]> getJarContents() {
    return jarContents;
  }

  private void init() {
    try {
      // Extract the entries sizes 
      ZipFile zf = new ZipFile(jarFileName);
      Enumeration e = zf.entries();
      while (e.hasMoreElements()) {
        ZipEntry ze = ((ZipEntry) e.nextElement());
        MapSequence.fromMap(sizesMap).put(ze.getName(), ze.getSize());
      }
      zf.close();

      // Extract the resources 
      ZipInputStream zipInputStream = new ZipInputStream(new BufferedInputStream(new FileInputStream(jarFileName)));
      ZipEntry zipEnty = null;
      while ((zipEnty = zipInputStream.getNextEntry()) != null) {
        // Ignore directories 
        if (zipEnty.isDirectory()) {
          continue;
        }

        // Ignore by the prefix if any
        if (namespacePrefix != null) {
          String pathByNamespace = StringUtils.replaceChars(zipEnty.getName(), '/', '.');
          if (!pathByNamespace.startsWith(namespacePrefix)) {
            continue;
          }
        }

        // Size unknown, take it from the map 
        long entrySize = zipEnty.getSize();
        if (entrySize == -1) {
          entrySize = MapSequence.fromMap(sizesMap).get(zipEnty.getName());
        }

        // Read the entry to the array 
        byte[] byteArray = new byte[(int) entrySize];
        int rb = 0;
        int chunk = 0;
        while (entrySize - rb > 0) {
          chunk = zipInputStream.read(byteArray, rb, ((int) entrySize) - rb);
          if (chunk == -1) {
            break;
          }
          rb += chunk;
        }
        MapSequence.fromMap(jarContents).put(zipEnty.getName(), byteArray);
      }
    } catch (Throwable t) {
      throw new RuntimeException("Error while initializing JAR resources from " + jarFileName, t);
    }
  }
}
