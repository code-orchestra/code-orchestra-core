package codeOrchestra.utils;

import jetbrains.mps.util.PathManager;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class BuildUtil {

  public static boolean isDeveloperBuild() {
    return !new File(PathManager.getHomePath(), "ActionScript").exists();
  }

}
