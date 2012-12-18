package codeOrchestra.rgs.local;

import com.intellij.openapi.util.SystemInfo;
import codeOrchestra.utils.process.JavaLauncher;
import jetbrains.mps.util.PathManager;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author: Alexander Eliseyev
 */
public class RGSLocalLauncher extends JavaLauncher {

  private static final String CODEORCHESTRA_VMOPTIONS_FILE = "codeorchestra.vmoptions";
  private static final String MAIN_CLASS = "codeOrchestra.rgs.server.bootstrap.RGSBootstrap";

  public static void main(String[] args) throws IOException {
    ProcessBuilder processBuilder = new RGSLocalLauncher().createProcessBuilder();
    for (String s : processBuilder.command()) {
      System.out.print(s + " ");
    }

    processBuilder.start();
  }

  public RGSLocalLauncher() {
    super(getLocalRGSClassPath());

    setVirtualMachineParameter(getVMOptionsString());
    setProgramParameter(MAIN_CLASS);
  }

  private static List<String> getLocalRGSClassPath() {
    List<String> result = new ArrayList<String>();

    result.add(getAbsolutePathInHome("lib/mpsboot.jar"));
    result.add(getAbsolutePathInHome("lib/boot.jar"));
    result.add(getAbsolutePathInHome("lib/bootstrap.jar"));
    result.add(getAbsolutePathInHome("lib/util.jar"));
    result.add(getAbsolutePathInHome("lib/jdom.jar"));
    result.add(getAbsolutePathInHome("lib/log4j.jar"));
    result.add(getAbsolutePathInHome("lib/extensions.jar"));
    result.add(getAbsolutePathInHome("lib/trove4j.jar"));

    result.add(getAbsolutePathInHome("lib/actionScript.jar"));
    result.add(getAbsolutePathInHome("lib/mps.jar"));

    result.add(getAbsolutePathInHome("plugins/mpsmake.jar"));
    result.add(getAbsolutePathInHome("plugins/mpseditor.jar"));
    result.add(getAbsolutePathInHome("plugins/vcs.jar"));

    result.add(getAbsolutePathInHome("lib/ApacheSSHD/bcprov-jdk15-140.jar"));
    result.add(getAbsolutePathInHome("lib/ApacheSSHD/mina-core-2.0.2.jar"));
    result.add(getAbsolutePathInHome("lib/ApacheSSHD/slf4j-api-1.4.3.jar"));
    result.add(getAbsolutePathInHome("lib/ApacheSSHD/slf4j-simple-1.4.3.jar"));
    result.add(getAbsolutePathInHome("lib/ApacheSSHD/sshd-core-0.6.0.jar"));
    result.add(getAbsolutePathInHome("lib/ApacheSSHD/sshd-pam-0.6.0.jar"));
    result.add(getAbsolutePathInHome("lib/ApacheSSHD/tomcat-apr-5.5.23.jar"));

    result.add(getAbsolutePathInHome("lib/CommonsVFS/commons-vfs2-2.0.jar"));
    result.add(getAbsolutePathInHome("lib/CommonsVFS/jsch-0.1.48.jar"));

    result.add(getAbsolutePathInHome("ActionScript/baseLanguage.ext.movements.mpsarch.jar"));
    result.add(getAbsolutePathInHome("ActionScript/baseLanguage.ext.nullable.mpsarch.jar"));
    result.add(getAbsolutePathInHome("ActionScript/baseLanguage.ext.modelCache.mpsarch.jar"));
    result.add(getAbsolutePathInHome("ActionScript/codeOrchestra.actionScript.mpsarch.jar"));
    result.add(getAbsolutePathInHome("ActionScript/Scala.mpsarch.jar"));
    result.add(getAbsolutePathInHome("ActionScript/Metaas.mpsarch.jar"));
    result.add(getAbsolutePathInHome("ActionScript/Dump.mpsarch.jar"));
    result.add(getAbsolutePathInHome("ActionScript/playerglobal_swc.mpsarch.jar"));
    result.add(getAbsolutePathInHome("ActionScript/flex_swc.mpsarch.jar"));
    result.add(getAbsolutePathInHome("ActionScript/XStream.mpsarch.jar"));

    result.add(getAbsolutePathInHome("lib/commons-io-2.0.1.jar"));
    result.add(getAbsolutePathInHome("lib/commons-lang-2.4.jar"));

    return result;
  }

  private static String getVMOptionsString() {
    try {
      StringBuilder sb = new StringBuilder();
      for (String vmOption : getVMOptions()) {
        sb.append(vmOption).append(" ");
      }
      return sb.toString();
    } catch (IOException e) {
      System.err.println("Can't parse " + CODEORCHESTRA_VMOPTIONS_FILE);
      e.printStackTrace();
      return "";
    }
  }

  private static List<String> getVMOptions() throws IOException {
    List<String> vmOptionStrings = new ArrayList<String>();
    File vmOptionsFile = new File(new File(getHomePath(), "bin"), CODEORCHESTRA_VMOPTIONS_FILE);
    if (!vmOptionsFile.exists()) {
      return vmOptionStrings;
    }

    FileReader fr = new FileReader(vmOptionsFile);
    BufferedReader br = new BufferedReader(fr);
    String s;
    while((s = br.readLine()) != null) {
      vmOptionStrings.add(s);
    }

    if (!SystemInfo.isWindows) {
      vmOptionStrings.add("-d32");
    }

    if (System.getProperty("rgs.local.console") == null) {
      vmOptionStrings.add("-Drgs.headless=true");
      vmOptionStrings.add("-Djava.awt.headless=true");
    }

    if (System.getProperty("rgs.local.debug") != null) {
      vmOptionStrings.add("-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5006");
    }

    // RE-3949
    if (System.getProperty("dataIndexerMode") != null) {
      vmOptionStrings.add("-DdataIndexerMode=" + System.getProperty("dataIndexerMode"));
    }

    return vmOptionStrings;
  }

  private static String getAbsolutePathInHome(String relativePathInHome) {
    return new File(getHomePath(), relativePathInHome).getPath();
  }

  private static String getHomePath() {
    return PathManager.getHomePath();
  }

}
