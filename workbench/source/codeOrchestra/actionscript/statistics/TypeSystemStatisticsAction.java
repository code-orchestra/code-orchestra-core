package codeOrchestra.actionscript.statistics;

import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.util.Computable;
import codeOrchestra.actionscript.view.utils.ViewUtils;
import jetbrains.mps.internal.collections.runtime.MapSequence;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.nodeEditor.EditorComponent;
import jetbrains.mps.plugins.pluginparts.actions.GeneratedAction;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.typesystem.inference.TypeContextManager;
import jetbrains.mps.workbench.MPSDataKeys;
import org.jetbrains.annotations.NotNull;

import java.awt.event.KeyEvent;
import java.util.Map;

/**
 * @author Alexander Eliseyev
 */
public class TypeSystemStatisticsAction extends GeneratedAction {

  private final Logger log = Logger.getLogger(getClass().getSimpleName());

  public TypeSystemStatisticsAction() {
    super("Run TS for Root and trace stats");
    this.setIsAlwaysVisible(false);
    this.setExecuteOutsideCommand(true);
  }

  @NotNull
  public String getKeyStroke() {
    return "";
  }

  public void doUpdate(@NotNull AnActionEvent event, Map<String, Object> params) {
    try {
      if (!ViewUtils.isInActionScriptView()) {
        this.enable(event.getPresentation());
      } else {
        this.disable(event.getPresentation());
      }
    } catch (Throwable t) {
      log.error("User's action doUpdate method failed. Action:" + "DataFlowStatisticsAction", t);
      this.disable(event.getPresentation());
    }
  }

  protected boolean collectActionData(AnActionEvent event, Map<String, Object> params) {
    if (!(super.collectActionData(event, params))) {
      return false;
    }

    MapSequence.fromMap(params).put("editorComponent", event.getData(MPSDataKeys.EDITOR_COMPONENT));
    if (MapSequence.fromMap(params).get("editorComponent") == null) {
      return false;
    }

    return true;
  }

  public void doExecute(@NotNull final AnActionEvent event, Map<String, Object> params) {
    try {
      EditorComponent editorComponent = (EditorComponent) MapSequence.fromMap(params).get("editorComponent");
      String rootName = null;

      // Clear cache
      final SNode editedNode = editorComponent.getEditedNode();
      if (editedNode != null && editedNode.isRoot()) {
        TypeContextManager.getInstance().removeContextForNode(editedNode);
        rootName = ModelAccess.instance().runReadAction(new Computable<String>() {
          public String compute() {
            return editedNode.getName();
          }
        });
      } else {
        log.warning("No root is being edited");
        return;
      }

      // Force checks run
      editorComponent.processKeyPressed(new KeyEvent(editorComponent.getExternalComponent(), KeyEvent.KEY_PRESSED, System.currentTimeMillis(), 0, KeyEvent.VK_F5, '5'));

      // Trace results
      log.info("TypeSystem statistics for the " + rootName);

      SubtypingRuleStatistics.instance().traceAverage();
      SubtypingRuleStatistics.instance().traceMaximum();

      InferenceRuleStatistics.instance().traceAverage();
      InferenceRuleStatistics.instance().traceMaximum();

      NonTypeSystemRuleStatistics.instance().traceAverage();
      NonTypeSystemRuleStatistics.instance().traceMaximum();
    } catch (Throwable t) {
      log.error("User's action execute method failed. Action:" + "ReloadAll", t);
    }
  }

}
