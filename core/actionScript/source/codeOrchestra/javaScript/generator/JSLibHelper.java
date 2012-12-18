package codeOrchestra.javaScript.generator;

import com.intellij.openapi.util.io.FileUtil;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.smodel.Language;

import java.io.*;
import java.util.Enumeration;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;

/**
 * @author Alexander Eliseyev
 */
public class JSLibHelper {

  private static Logger LOG = Logger.getLogger(JSLibHelper.class);

  private static final String JS_LIB_DIR = "lib";
  private static final String JAVASCRIPT_LIB_DIR = "module/" + JS_LIB_DIR;

  public static void copyLanguageJSLib(Language language, String libFilename, String targetSourcePath) {
    copyLanguageJSLib(language.getBundleHome().getPath(), libFilename, targetSourcePath);
  }

  private static void copyLanguageJSLib(String languageBundleHome, String libFilename, String targetSourcePath) {
    File sourcesDir = new File(targetSourcePath);
    if (!sourcesDir.exists() || !sourcesDir.isDirectory()) {
      LOG.error("Invalid source gen dir: " + targetSourcePath);
      return;
    }

    if (languageBundleHome.toLowerCase().contains(".jar")) {
      copyLanguageJSLibFromZIP(languageBundleHome, libFilename, sourcesDir);
    } else {
      copyLanguageJSLibFromDir(languageBundleHome, libFilename, sourcesDir);
    }
  }

  private static void copyLanguageJSLibFromZIP(String languageZip, String libFilename, File targetSources) {
    ZipFile zipFile;
    try {
      zipFile = new ZipFile(languageZip);
    } catch (IOException e) {
      LOG.error("Can't access the language archive", e);
      return;
    }

    try {
      final Enumeration entries = zipFile.entries();
      while (entries.hasMoreElements()) {
        ZipEntry entry = (ZipEntry) entries.nextElement();
        if (entry.getName().startsWith(JAVASCRIPT_LIB_DIR) && entry.getName().endsWith(libFilename)) {
          extractEntry(entry, zipFile.getInputStream(entry), targetSources, true);
          return;
        }
      }
    } catch (Throwable e) {
      LOG.error("Can't extract from the language archive", e);
      return;
    }
  }

  private static void copyLanguageJSLibFromDir(String languageBundleHome, String libFilename, File targetSources) {
    File languageHome = new File(languageBundleHome);
    if (!languageHome.exists() || !languageHome.isDirectory()) {
      LOG.error("Illegal language dir: " + languageBundleHome);
      return;
    }
    
    File jsLibDir = new File(languageHome, JS_LIB_DIR);
    if (jsLibDir.exists() && jsLibDir.isDirectory()) {
      try {
        File jsLibSource = new File(jsLibDir, libFilename);
        File jsLibTarget = new File(targetSources, libFilename);
        FileUtil.copy(jsLibSource, jsLibTarget);
      } catch (IOException e) {
        LOG.error("Can't copy JS generated sources from " + jsLibDir + " to " + targetSources);
        return;
      }
    }
  }

  public static void extractEntry(ZipEntry entry, final InputStream inputStream, File outputDir, boolean overwrite) throws IOException {
    final boolean isDirectory = entry.isDirectory();

    String entryName = entry.getName();
    String relativeName = entryName.substring(JAVASCRIPT_LIB_DIR.length() + 1, entryName.length());

    final File file = new File(outputDir, relativeName);
    if (file.exists() && !overwrite) return;

    FileUtil.createParentDirs(file);
    if (isDirectory) {
      file.mkdir();
    }
    else {
      final BufferedInputStream is = new BufferedInputStream(inputStream);
      final BufferedOutputStream os = new BufferedOutputStream(new FileOutputStream(file));
      try {
        FileUtil.copy(is, os);
      }
      finally {
        os.close();
        is.close();
      }
    }
  }

}
