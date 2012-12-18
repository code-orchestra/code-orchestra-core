package codeOrchestra.actionScript.update;

import java.io.BufferedInputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.util.zip.Adler32;
import java.util.zip.CRC32;

/**
 * @author Alexander Eliseyev
 */
public class Checksum {

  public static final long INVALID_CHECKSUM = -1;

  public static long getChecksum(File file) {
    // TODO: this is a freaking disgrace
    return file.length();
    //return getChecksumValue(new Adler32(), file);
  }

  public static long getChecksumValue(java.util.zip.Checksum checksum, File file) {
    try {
      BufferedInputStream is = new BufferedInputStream(new FileInputStream(file));
      byte[] bytes = new byte[1024];
      int len;

      while ((len = is.read(bytes)) >= 0) {
        checksum.update(bytes, 0, len);
      }
      is.close();
    }
    catch (IOException e) {
      return INVALID_CHECKSUM;
    }
    return checksum.getValue();
  }

}
