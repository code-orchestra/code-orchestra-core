package codeOrchestra.actionScript.flexsdk;

import java.io.*;
import java.util.Properties;

/**
 * @author Alexander Eliseyev
 */
public class MMConfig {

  private static final String MM_CFG_FILENAME = "mm.cfg";
  private static final String PRELOAD_SWF_PROPERTY = "PreloadSWF";

  private Properties properties;

  public MMConfig(Properties properties) {
    this.properties = properties;
  }

  public void setPreloadSWF(String swfPath) {
    properties.put(PRELOAD_SWF_PROPERTY, swfPath);
  }

  public void removePreloadSWF() {
    properties.remove(PRELOAD_SWF_PROPERTY);
  }

  public void save() {
    try {
      FileOutputStream out = new FileOutputStream(getMMConfigFile());

      // Hack to remove the comment lines
      ByteArrayOutputStream arrayOut = new ByteArrayOutputStream();
      properties.store(arrayOut, null);
      String string = new String(arrayOut.toByteArray(), "8859_1");
      String sep = System.getProperty("line.separator");
      String content = string.substring(string.indexOf(sep) + sep.length());
      out.write(content.getBytes("8859_1"));
    } catch (IOException e) {
      throw new RuntimeException("Can't save mm.cfg", e);
    }
  }

  public static MMConfig load() {
    Properties properties = new Properties();

    File mmConfigFile = getMMConfigFile();
    if (mmConfigFile.exists()) {
      try {
        properties.load(new FileInputStream(mmConfigFile));
      } catch (IOException e) {
        throw new RuntimeException("Can't load mm.cfg", e);
      }
    }

    return new MMConfig(properties);
  }

  private static File getMMConfigFile() {
    return new File(System.getProperty("user.home"), MM_CFG_FILENAME);
  }

}
