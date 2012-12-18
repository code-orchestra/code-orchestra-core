package codeOrchestra.actionscript.modulemaker.process;

import codeOrchestra.actionscript.make.ASModuleMakeType;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import java.io.File;

/**
 * @author Alexander Eliseyev
 */
public class MXMLRunner extends DirectFlexSDKRunner {

  public MXMLRunner(File configFile, CompilerSettings compilerSettings, ASModuleMakeType moduleMakeType) {
    super(configFile, compilerSettings, moduleMakeType);
  }

  protected String getCommandName() {
    return "mxmlc";
  }

  protected String getCommandDescription() {
    return "AS application compiler";
  }
  
}
