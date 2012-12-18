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
public class JSAccessorySourcesHelper {

  private static Logger LOG = Logger.getLogger(JSAccessorySourcesHelper.class);

  private static final String JS_GEN_DIR = "js_gen";
  private static final String JAVASCRIPT_GEN_DIR = "module/" + JS_GEN_DIR;

  public static void copyLanguageJSAccessories(Language language, String targetSourcePath) {
    copyLanguageJSAccessories(language.getBundleHome().getPath(), targetSourcePath);
  }

  private static void copyLanguageJSAccessories(String languageBundleHome, String targetSourcePath) {
    File sourcesDir = new File(targetSourcePath);
    if (!sourcesDir.exists() || !sourcesDir.isDirectory()) {
      LOG.error("Invalid source gen dir: " + targetSourcePath);
      return;
    }

    if (languageBundleHome.toLowerCase().contains(".jar")) {
      copyLanguageJSAccessoriesFromZIP(languageBundleHome, sourcesDir);
    } else {
      copyLanguageJSAccessoriesFromDir(languageBundleHome, sourcesDir);
    }
  }

  private static void copyLanguageJSAccessoriesFromZIP(String languageZip, File targetSources) {
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
        if (entry.getName().startsWith(JAVASCRIPT_GEN_DIR)) {
          extractEntry(entry, zipFile.getInputStream(entry), targetSources, true);
        }
      }
    } catch (Throwable e) {
      LOG.error("Can't extract from the language archive", e);
      return;
    }
  }

  private static void copyLanguageJSAccessoriesFromDir(String languageBundleHome, File targetSources) {
    File languageHome = new File(languageBundleHome);
    if (!languageHome.exists() || !languageHome.isDirectory()) {
      LOG.error("Illegal language dir: " + languageBundleHome);
      return;
    }
    
    File jsSourceDir = new File(languageHome, JS_GEN_DIR);
    if (jsSourceDir.exists() && jsSourceDir.isDirectory()) {
      try {
        FileUtil.copyDir(jsSourceDir, targetSources);
      } catch (IOException e) {
        LOG.error("Can't copy JS generated sources from " + jsSourceDir + " to " + targetSources);
        return;
      }
    }
  }

  public static void extractEntry(ZipEntry entry, final InputStream inputStream, File outputDir, boolean overwrite) throws IOException {
    final boolean isDirectory = entry.isDirectory();

    String entryName = entry.getName();
    String relativeName = entryName.substring(JAVASCRIPT_GEN_DIR.length() + 1, entryName.length());

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
