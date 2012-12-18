package codeOrchestra.actionscript.socket.command.impl;

import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.logging.model.LoggerMessage;
import codeOrchestra.actionscript.socket.ClientSocketHandler;
import codeOrchestra.actionscript.socket.command.TraceCommand;
import codeOrchestra.utils.ProjectHolder;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.workbench.editors.MPSEditorOpener;

import javax.swing.SwingUtilities;

/**
 * @author Alexander Eliseyev
 */
public class NavigateTraceCommand implements TraceCommand {

  private static final String NAVIGATE_COMMAND = "select-node";

  @Override
  public boolean isApplicable(LoggerMessage message) {
    return NAVIGATE_COMMAND.equals(message.getCommand());
  }

  @Override
  public void execute(final LoggerMessage loggerMessage, ClientSocketHandler clientSocketHandler) {
    // Hint object (SNode pointer)
    final SNode sNode = ModelAccess.instance().runReadAction(new Computable<SNode>() {
      public SNode compute() {
        return loggerMessage.getNodePointer().getNode();
      }
    });

    if (sNode == null) {
      return;
    }

    // RE-3351 - Immediate node navigation message
    SwingUtilities.invokeLater(new Runnable() {
      public void run() {
        ModuleContext context = ModuleContext.create(sNode, ProjectHolder.getProject());
        if (context == null) return;

        if (sNode.isRegistered()) {
          context.getComponent(MPSEditorOpener.class).openNode(sNode, context, true, true);
        }
      }
    });
  }

}
