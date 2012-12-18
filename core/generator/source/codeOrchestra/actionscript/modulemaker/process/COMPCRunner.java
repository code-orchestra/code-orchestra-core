package codeOrchestra.actionscript.modulemaker.process;

import codeOrchestra.actionscript.make.ASModuleMakeType;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class COMPCRunner extends DirectFlexSDKRunner {

  public COMPCRunner(File configFile, CompilerSettings compilerSettings, ASModuleMakeType moduleMakeType) {
    super(configFile, compilerSettings, moduleMakeType);
  }

  protected String getCommandName() {
    return "compc";
  }

  protected String getCommandDescription() {
    return "AS component compiler";
  }
  
}
