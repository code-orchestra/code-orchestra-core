package codeOrchestra.actionScript.compiler.fcsh;

import com.intellij.openapi.util.SystemInfo;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.utils.process.JavaLauncher;

import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class FCSHLauncher extends JavaLauncher {

  public FCSHLauncher(boolean livecodingMode) {
    super(null);

    StringBuilder programParameters = new StringBuilder();
    String flexHome = FlexSDKSettings.getInstance().getFlexSDKPath();
    programParameters.append(protect("-Dapplication.home=" + flexHome));
    programParameters.append(" -Duser.language=en");
    programParameters.append(" -Duser.country=US");
    programParameters.append(" -Djava.awt.headless=true");
    programParameters.append(" -jar ");
    String fcshJarPath = null;
    if (livecodingMode) {
      fcshJarPath = protect(FlexSDKSettings.getInstance().getDefaultFlexSDKPath() + "/liblc/fcsh.jar");
    }
    if (fcshJarPath == null || !(new File(fcshJarPath).exists())) {
      fcshJarPath = protect(flexHome + "/lib/fcsh.jar");
    }
    programParameters.append(fcshJarPath);
    setProgramParameter(programParameters.toString());

    StringBuilder jvmParameters = new StringBuilder();
    jvmParameters.append("-Xmx384m -Dsun.io.useCanonCaches=false ");
    if (!SystemInfo.isWindows) {
      jvmParameters.append("-d32 ");
    }
    setVirtualMachineParameter(jvmParameters.toString());
  }

}
