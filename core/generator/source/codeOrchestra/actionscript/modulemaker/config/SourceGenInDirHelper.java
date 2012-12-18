package codeOrchestra.actionscript.modulemaker.config;

import jetbrains.mps.util.FileUtil;
import org.apache.commons.lang.StringUtils;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class SourceGenInDirHelper {

  public static void main(String[] arg) {
    String modelSourcesPath = "/Users/eliseev/Projects/CodeOrchestra/languages/overloadedOperators/source_gen/com/codeOrchestra/actionScript/overloadedOperators/operators";
    String modelLongName = "codeOrchestra.actionScript.overloadedOperators.operators";

    System.out.println("DEST : " + copyGeneratedSourcesToTempDir(modelSourcesPath, modelLongName));
  }

  public static String copyGeneratedSourcesToTempDir(String modelSourcesPath, String modelLongName) {
    String tempDirName = "source_" + modelLongName;
    File destinationPath = getTempSourcesDir(tempDirName);

    File packagePath = new File(destinationPath, StringUtils.replace(modelLongName, ".", File.separator));
    packagePath.mkdirs();

    FileUtil.copyDir(new File(modelSourcesPath), packagePath, true);

    return destinationPath.getPath();
  }

  private static File getTempSourcesDir(String tempDirName) {
    File tmp = FileUtil.getTempDir();
    File result = new File(tmp, tempDirName);

    result.mkdir();
    return result;
  }

}
