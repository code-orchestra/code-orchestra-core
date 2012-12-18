package codeOrchestra.ios.wrapper;

import com.sun.jna.ptr.LongByReference;

/**
 * @author: Alexander Eliseyev
 */
public class FileWrapper {

  private LongByReference fileReference;
  private String path;

  public FileWrapper(LongByReference fileReference, String path) {
    this.fileReference = fileReference;
    this.path = path;
  }

  public LongByReference getFileReference() {
    return fileReference;
  }

  public String getPath() {
    return path;
  }
}
