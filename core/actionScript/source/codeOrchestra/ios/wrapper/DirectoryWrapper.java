package codeOrchestra.ios.wrapper;

import codeOrchestra.ios.jna.mobileDevice.afc_directory;
import codeOrchestra.ios.jna.mobileDevice.afc_directory.ByReference;

/**
 * @author: Alexander Eliseyev
 */
public class DirectoryWrapper {

  private afc_directory.ByReference dir;
  private String path;

  public DirectoryWrapper(ByReference dir, String path) {
    this.dir = dir;
    this.path = path;
  }

  public ByReference getDir() {
    return dir;
  }

  public String getPath() {
    return path;
  }
}
