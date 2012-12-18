package jetbrains.mps.debugger.api.ui.actions;

/*Generated by MPS */

import jetbrains.mps.plugins.pluginparts.actions.GeneratedAction;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jetbrains.annotations.NotNull;
import com.intellij.openapi.actionSystem.AnActionEvent;
import java.util.Map;
import jetbrains.mps.internal.collections.runtime.MapSequence;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.debugger.api.ui.breakpoints.BreakpointsBrowserDialog;
import jetbrains.mps.smodel.IOperationContext;
import com.intellij.openapi.application.ApplicationManager;
import com.intellij.openapi.application.ModalityState;

public class ViewBreakpoints_Action extends GeneratedAction {
  private static final Icon ICON = new ImageIcon(ViewBreakpoints_Action.class.getResource("viewBreakpoints.png"));
  protected static Log log = LogFactory.getLog(ViewBreakpoints_Action.class);

  public ViewBreakpoints_Action() {
    super("View Breakpoints", "", ICON);
    this.setIsAlwaysVisible(false);
    this.setExecuteOutsideCommand(true);
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  public void doUpdate(@NotNull AnActionEvent event, final Map<String, Object> _params) {
    try {
      this.enable(event.getPresentation());
    } catch (Throwable t) {
      if (log.isErrorEnabled()) {
        log.error("User's action doUpdate method failed. Action:" + "ViewBreakpoints", t);
      }
      this.disable(event.getPresentation());
    }
  }

  protected boolean collectActionData(AnActionEvent event, final Map<String, Object> _params) {
    if (!(super.collectActionData(event, _params))) {
      return false;
    }
    MapSequence.fromMap(_params).put("context", event.getData(MPSDataKeys.OPERATION_CONTEXT));
    if (MapSequence.fromMap(_params).get("context") == null) {
      return false;
    }
    return true;
  }

  public void doExecute(@NotNull final AnActionEvent event, final Map<String, Object> _params) {
    try {
      final BreakpointsBrowserDialog dialog = new BreakpointsBrowserDialog(((IOperationContext) MapSequence.fromMap(_params).get("context")));
      ApplicationManager.getApplication().invokeLater(new Runnable() {
        public void run() {
          dialog.showDialog();
        }
      }, ModalityState.NON_MODAL);
    } catch (Throwable t) {
      if (log.isErrorEnabled()) {
        log.error("User's action execute method failed. Action:" + "ViewBreakpoints", t);
      }
    }
  }
}
