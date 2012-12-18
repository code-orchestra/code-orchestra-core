package jetbrains.mps.baseLanguage.plugin;

/*Generated by MPS */

import jetbrains.mps.plugins.pluginparts.actions.GeneratedAction;
import javax.swing.Icon;
import jetbrains.mps.logging.Logger;
import com.intellij.openapi.actionSystem.AnActionEvent;
import java.util.Map;
import jetbrains.mps.baseLanguage.util.plugin.refactorings.ExtractMethodFactory;
import java.util.List;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.internal.collections.runtime.MapSequence;
import jetbrains.mps.nodeEditor.EditorComponent;
import org.jetbrains.annotations.NotNull;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;
import jetbrains.mps.baseLanguage.closures.runtime.Wrappers;
import jetbrains.mps.baseLanguage.util.plugin.refactorings.ExtractMethodRefactoringParameters;
import jetbrains.mps.baseLanguage.util.plugin.refactorings.ExtractMethodRefactoring;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.baseLanguage.util.plugin.refactorings.ExtractMethodDialog;
import java.awt.Frame;
import jetbrains.mps.nodeEditor.EditorContext;

public class ExtractMethod_Action extends GeneratedAction {
  private static final Icon ICON = null;
  private static Logger LOG = Logger.getLogger(ExtractMethod_Action.class);

  public ExtractMethod_Action() {
    super("Extract Method", "", ICON);
    this.setIsAlwaysVisible(false);
    this.setExecuteOutsideCommand(true);
  }

  public boolean isApplicable(AnActionEvent event, final Map<String, Object> _params) {
    return ExtractMethodFactory.isRefactoringAvailable(((List<SNode>) MapSequence.fromMap(_params).get("nodes"))) && !(((EditorComponent) MapSequence.fromMap(_params).get("editorComponent")).isReadOnly());
  }

  public void doUpdate(@NotNull AnActionEvent event, final Map<String, Object> _params) {
    try {
      {
        boolean enabled = this.isApplicable(event, _params);
        this.setEnabledState(event.getPresentation(), enabled);
      }
    } catch (Throwable t) {
      LOG.error("User's action doUpdate method failed. Action:" + "ExtractMethod", t);
      this.disable(event.getPresentation());
    }
  }

  protected boolean collectActionData(AnActionEvent event, final Map<String, Object> _params) {
    if (!(super.collectActionData(event, _params))) {
      return false;
    }
    {
      List<SNode> nodes = event.getData(MPSDataKeys.NODES);
      boolean error = false;
      if (nodes != null) {
      }
      if (error || nodes == null) {
        MapSequence.fromMap(_params).put("nodes", null);
      } else {
        MapSequence.fromMap(_params).put("nodes", ListSequence.fromListWithValues(new ArrayList<SNode>(), nodes));
      }
    }
    if (MapSequence.fromMap(_params).get("nodes") == null) {
      return false;
    }
    MapSequence.fromMap(_params).put("frame", event.getData(MPSDataKeys.FRAME));
    if (MapSequence.fromMap(_params).get("frame") == null) {
      return false;
    }
    MapSequence.fromMap(_params).put("context", event.getData(MPSDataKeys.EDITOR_CONTEXT));
    if (MapSequence.fromMap(_params).get("context") == null) {
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
      final Wrappers._T<ExtractMethodRefactoringParameters> params = new Wrappers._T<ExtractMethodRefactoringParameters>();
      final Wrappers._T<ExtractMethodRefactoring> refactoring = new Wrappers._T<ExtractMethodRefactoring>();
      ModelAccess.instance().runWriteAction(new Runnable() {
        public void run() {
          params.value = ExtractMethodFactory.createParameters(((List<SNode>) MapSequence.fromMap(_params).get("nodes")));
          refactoring.value = ExtractMethodFactory.createRefactoring(params.value);
          params.value.setReturnType(refactoring.value.getMethodType());
        }
      });
      ExtractMethodDialog dialog = new ExtractMethodDialog(((Frame) MapSequence.fromMap(_params).get("frame")), ((EditorContext) MapSequence.fromMap(_params).get("context")), params.value, refactoring.value);
      dialog.pack();
      dialog.showDialog();
    } catch (Throwable t) {
      LOG.error("User's action execute method failed. Action:" + "ExtractMethod", t);
    }
  }
}
