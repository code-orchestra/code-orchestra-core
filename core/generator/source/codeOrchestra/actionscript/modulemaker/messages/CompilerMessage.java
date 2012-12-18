package codeOrchestra.actionscript.modulemaker.messages;

import com.intellij.openapi.util.io.FileUtil;
import codeOrchestra.generator.CodeOrchestraGenerateManager;
import codeOrchestra.generator.CodeOrchestraGenerationContext;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.generator.traceInfo.TraceInfoCache;
import jetbrains.mps.ide.messages.FileWithLogicalPosition;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.smodel.SModelDescriptor;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.traceInfo.DebugInfo;
import jetbrains.mps.util.NameUtil;
import jetbrains.mps.vfs.FileSystem;
import org.jetbrains.annotations.Nullable;

import java.io.File;
import java.io.FilenameFilter;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

/**
 * @author Alexander Eliseyev
 */
public class CompilerMessage implements Serializable {

  private final static String MESSAGE_PATTERN = "^\\s*((?:\\w:)?[^:]+)\\((\\d+)\\):\\s+col:\\s+(\\d+):?\\s+(Error|Warning):\\s+(.+)\\s*$";

  public static final String TRACE_INFO = ".trace.info";

  // Match group numbers:

  // 1 - source path
  // 2 - line number
  // 3 - column number
  // 4 - message type
  // 5 - message contents

  private String sourcePath;
  private int lineNumber;
  private int columnNumber;
  private MessageType type;
  private String content;

  private transient Object hintObject;

  public CompilerMessage(MessageType type, String content) {
    this.type = type;
    this.content = content;
  }

  private CompilerMessage(Matcher messageMatcher) {
    String sourcePathRaw = messageMatcher.group(1);
    this.sourcePath = sourcePathRaw.contains("^") ? sourcePathRaw.substring(sourcePathRaw.indexOf("^") + 1, sourcePathRaw.length()).trim() : sourcePathRaw;

    this.lineNumber = Integer.parseInt(messageMatcher.group(2));
    this.columnNumber = Integer.parseInt(messageMatcher.group(3));
    this.type = MessageType.parse(messageMatcher.group(4));
    this.content = messageMatcher.group(5);
  }

  @Nullable
  public SNodePointer getNodePointer() {
    if (getHintObject() instanceof SNodePointer) {
      return (SNodePointer) getHintObject();
    }
    return null;
  }

  public synchronized Object getHintObject() {
    if (hintObject == null) {
      hintObject = getHintObjectInternal();
    }
    return hintObject;
  }

  private Object getHintObjectInternal() {
    if (sourcePath == null) {
      return null;
    }

    CodeOrchestraGenerateManager codeOrchestraGenerateManager = ProjectHolder.getProject().getComponent(CodeOrchestraGenerateManager.class);
    if (codeOrchestraGenerateManager != null) {
      CodeOrchestraGenerationContext currentContext = codeOrchestraGenerateManager.getCurrentContext();
      if (currentContext != null) {
        Solution rootSolution = MPSModuleRepository.getInstance().getSolution(currentContext.getRootModule());
        if (rootSolution != null) {
          // 1 - figure out the model name
          File moduleSourceGenDir = new File(rootSolution.getGeneratorOutputPath());
          File sourceFileDir = new File(new File(sourcePath).getParent());
          String modelName = NameUtil.namespaceFromPath(FileUtil.getRelativePath(moduleSourceGenDir, sourceFileDir));

          // 2 - figure out the exact model by the solution containing it
          SModelDescriptor modelDescriptor = null;
          File[] traceInfoFiles = sourceFileDir.listFiles(new FilenameFilter() {
            @Override
            public boolean accept(File dir, String filename) {
              return filename.endsWith(TRACE_INFO);
            }
          });
          if (traceInfoFiles != null) {
            for (File traceInfoFile : traceInfoFiles) {
              String traceFilename = traceInfoFile.getName();
              String moduleName = traceFilename.substring(0, traceFilename.indexOf(TRACE_INFO));

              IModule module = MPSModuleRepository.getInstance().getModule(moduleName);
              if (module != null) {
                for (SModelDescriptor moduleModelDescriptor : module.getOwnModelDescriptors()) {
                  if (moduleModelDescriptor.getLongName().equals(modelName)) {
                    modelDescriptor = moduleModelDescriptor;
                    break;
                  }
                }
              }
            }

            // 3 - figure out the node
            if (modelDescriptor != null) {
              DebugInfo debugInfo = TraceInfoCache.getInstance().get(modelDescriptor);
              if (debugInfo != null) {
                SNode nodeForLine = debugInfo.getNodeForLine(new File(sourcePath).getName(), lineNumber, modelDescriptor.getSModel());
                if (nodeForLine != null) {
                  return new SNodePointer(nodeForLine);
                }
              }
            }

          }
        }
      }
    }

    return new FileWithLogicalPosition(FileSystem.getInstance().getFileByPath(sourcePath), this.lineNumber - 1, this.columnNumber - 1);
  }

  public static CompilerMessagesWrapper extract(String compilerOutput) {
    List<CompilerMessage> compilerMessages = new ArrayList<CompilerMessage>();

    Pattern pattern = Pattern.compile(MESSAGE_PATTERN, Pattern.MULTILINE);
    Matcher matcher = pattern.matcher(compilerOutput);

    while (matcher.find()) {
      compilerMessages.add(new CompilerMessage(matcher));
    }

    return new CompilerMessagesWrapper(compilerMessages);
  }

  public String getSourcePath() {
    return sourcePath;
  }

  public int getLineNumber() {
    return lineNumber;
  }

  public int getColumnNumber() {
    return columnNumber;
  }

  public MessageType getType() {
    return type;
  }

  public String getContent() {
    return content;
  }

  @Override
  public boolean equals(Object o) {
    if (this == o) return true;
    if (o == null || getClass() != o.getClass()) return false;

    CompilerMessage that = (CompilerMessage) o;

    if (columnNumber != that.columnNumber) return false;
    if (lineNumber != that.lineNumber) return false;
    if (content != null ? !content.equals(that.content) : that.content != null) return false;
    if (sourcePath != null ? !sourcePath.equals(that.sourcePath) : that.sourcePath != null) return false;
    if (type != that.type) return false;

    return true;
  }

  @Override
  public int hashCode() {
    int result = sourcePath != null ? sourcePath.hashCode() : 0;
    result = 31 * result + lineNumber;
    result = 31 * result + columnNumber;
    result = 31 * result + (type != null ? type.hashCode() : 0);
    result = 31 * result + (content != null ? content.hashCode() : 0);
    return result;
  }

  @Override
  public String toString() {
    return "CompilerMessage{" +
      "sourcePath='" + sourcePath + '\'' +
      ", lineNumber=" + lineNumber +
      ", columnNumber=" + columnNumber +
      ", type=" + type +
      ", content='" + content + '\'' +
      '}';
  }

  public String getReportMessage() {
    return getContent() + " (line: " + lineNumber + ", source: " + sourcePath + ")";
  }
}
