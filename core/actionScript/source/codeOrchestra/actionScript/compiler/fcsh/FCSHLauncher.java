package codeOrchestra.actionScript.compiler.fcsh;

import com.intellij.openapi.util.SystemInfo;
import codeOrchestra.actionscript.modulemaker.view.FlexSDKSettings;
import codeOrchestra.utils.process.JavaLauncher;

/**
 * @author Alexander Eliseyev
 */
public class FCSHLauncher extends JavaLauncher {

  public FCSHLauncher() {
    super(null);

    StringBuilder programParameters = new StringBuilder();
    String flexHome = FlexSDKSettings.getInstance().getFlexSDKPath();
    programParameters.append(protect("-Dapplication.home=" + flexHome));
    programParameters.append(" -Duser.language=en");
    programParameters.append(" -Duser.country=US");
    programParameters.append(" -jar ");
    programParameters.append(protect(flexHome + "/lib/fcsh.jar"));
    setProgramParameter(programParameters.toString());

    StringBuilder jvmParameters = new StringBuilder();
    jvmParameters.append("-Xmx384m -Dsun.io.useCanonCaches=false ");
    if (!SystemInfo.isWindows) {
      jvmParameters.append("-d32 ");
    }
    setVirtualMachineParameter(jvmParameters.toString());
  }

}
