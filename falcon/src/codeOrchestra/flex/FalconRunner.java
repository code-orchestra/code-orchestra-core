package codeOrchestra.flex;

import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.make.ASModuleMakeType;
import codeOrchestra.actionscript.modulemaker.CompilationResult;
import codeOrchestra.actionscript.modulemaker.MakeException;
import codeOrchestra.actionscript.modulemaker.messages.CompilerMessage;
import codeOrchestra.actionscript.modulemaker.messages.CompilerMessagesWrapper;
import codeOrchestra.actionscript.modulemaker.process.AbstractFlexSDKRunner;
import codeOrchestra.actionscript.run.compiler.properties.CompilerSettings;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import jetbrains.mps.ide.smodel.WorkbenchModelAccess;
import jetbrains.mps.project.IModule;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import org.jetbrains.annotations.NotNull;

import java.io.*;
import java.util.List;

/**
 * @author Anton.I.Neverov
 */
public class FalconRunner extends AbstractFlexSDKRunner {

  private static final String COMPILE_ERRORS_LOG_FILE_NAME = "compile_errors.log";

  private boolean compileAsSWC;

  public FalconRunner(@NotNull File configFile, @NotNull CompilerSettings compilerSettings, @NotNull ASModuleMakeType moduleMakeType, boolean compileAsSWC) {
    super(configFile, compilerSettings, moduleMakeType);
    this.compileAsSWC = compileAsSWC;
  }

  @Override
  public CompilationResult run() throws MakeException {
    FalconProjectBuilder falconProjectBuilder = FalconProjectBuilder.getInstance();
    try {
      String mainClassModelUID = compilerSettings.mainClassModelUID;
      String mainClassNodeId = compilerSettings.mainClassNodeId;

      if (!compileAsSWC && mainClassModelUID != null && mainClassNodeId != null) {
        final SNodePointer sNodePointer = new SNodePointer(mainClassModelUID, mainClassNodeId);
        SNode mainClassNode = WorkbenchModelAccess.instance().runReadAction(new Computable<SNode>() {
          @Override
          public SNode compute() {
            return sNodePointer.getNode();
          }
        });
        falconProjectBuilder.setMainClass(mainClassNode);
      }

      falconProjectBuilder.setCommandLineArguments(getCommandArguments());
      falconProjectBuilder.build(compileAsSWC);
      return new CompilationResult(0, 0, false);
    } catch (FalconProjectBuilderException e) {
      List<CompilerMessage> messages = e.getMessages();
      try {
        FileWriter fileWriter = new FileWriter(getErrorLogFilePath());
        for (CompilerMessage message : messages) {
          fileWriter.write(message.getType().getPresentation() + ": " + message.getContent() + "\n\n");
        }
        fileWriter.close();
      } catch (IOException e1) {
        e1.printStackTrace(); // TODO: report somehow?
      }
      return new CompilationResult(new CompilerMessagesWrapper(messages));
    } finally {
      falconProjectBuilder.finishBuildSession();
    }
  }

  @Override
  public String getErrorLogFilePath() {
    CodeOrchestraGenerationContext sharedContext = CodeOrchestraGenerateManager.getSharedContext();
    IModule rootModule = MPSModuleRepository.getInstance().getModule(sharedContext.getRootModule());

    String moduleDir = rootModule.getDescriptorFile().getParent().getPath();
    return moduleDir + File.separator + COMPILE_ERRORS_LOG_FILE_NAME;
  }

  @Override
  protected String getCommandName() {
    return null;
  }

}
