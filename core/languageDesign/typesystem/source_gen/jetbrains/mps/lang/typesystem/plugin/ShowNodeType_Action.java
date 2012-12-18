package jetbrains.mps.lang.typesystem.plugin;

/*Generated by MPS */

import jetbrains.mps.plugins.pluginparts.actions.GeneratedAction;
import javax.swing.Icon;
import javax.swing.ImageIcon;
import jetbrains.mps.logging.Logger;
import org.jetbrains.annotations.NotNull;
import com.intellij.openapi.actionSystem.AnActionEvent;
import java.util.Map;
import jetbrains.mps.internal.collections.runtime.MapSequence;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.baseLanguage.closures.runtime.Wrappers;
import jetbrains.mps.typesystem.inference.TypeCheckingContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.nodeEditor.EditorComponent;
import javax.swing.JOptionPane;
import java.awt.Frame;
import jetbrains.mps.typesystem.uiActions.MyBaseNodeDialog;
import jetbrains.mps.errors.IErrorReporter;
import jetbrains.mps.smodel.IOperationContext;

public class ShowNodeType_Action extends GeneratedAction {
  private static final Icon ICON = new ImageIcon(ShowNodeType_Action.class.getResource("types.png"));
  private static Logger LOG = Logger.getLogger(ShowNodeType_Action.class);

  public ShowNodeType_Action() {
    super("Show Type", "Show node's HELGINS type", ICON);
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
      LOG.error("User's action doUpdate method failed. Action:" + "ShowNodeType", t);
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
    MapSequence.fromMap(_params).put("frame", event.getData(MPSDataKeys.FRAME));
    if (MapSequence.fromMap(_params).get("frame") == null) {
      return false;
    }
    MapSequence.fromMap(_params).put("node", event.getData(MPSDataKeys.NODE));
    if (MapSequence.fromMap(_params).get("node") == null) {
      return false;
    }
    MapSequence.fromMap(_params).put("editorComponent", event.getData(MPSDataKeys.EDITOR_COMPONENT));
    if (MapSequence.fromMap(_params).get("editorComponent") == null) {
      return false;
    }
    return true;
  }

  public void doExecute(@NotNull final AnActionEvent event, final Map<String, Object> _params) {
    try {
      final Wrappers._T<TypeCheckingContext> typeCheckingContext = new Wrappers._T<TypeCheckingContext>();
      final Wrappers._T<SNode> type = new Wrappers._T<SNode>();
      ModelAccess.instance().runReadAction(new Runnable() {
        public void run() {
          typeCheckingContext.value = ((EditorComponent) MapSequence.fromMap(_params).get("editorComponent")).getTypeCheckingContext();
          type.value = typeCheckingContext.value.getTypeDontCheck(((SNode) MapSequence.fromMap(_params).get("node")));
        }
      });
      if (type.value == null) {
        JOptionPane.showMessageDialog(((Frame) MapSequence.fromMap(_params).get("frame")), "no type");
        return;
      }
      MyBaseNodeDialog dialog;
      final Wrappers._T<IErrorReporter> reporter = new Wrappers._T<IErrorReporter>();
      ModelAccess.instance().runReadAction(new Runnable() {
        public void run() {
          reporter.value = typeCheckingContext.value.getTypeMessageDontCheck(((SNode) MapSequence.fromMap(_params).get("node")));
        }
      });
      dialog = new MyBaseNodeDialog(((IOperationContext) MapSequence.fromMap(_params).get("context")), ((SNode) MapSequence.fromMap(_params).get("node")), type.value, reporter.value);
      dialog.showDialog();
    } catch (Throwable t) {
      LOG.error("User's action execute method failed. Action:" + "ShowNodeType", t);
    }
  }
}
