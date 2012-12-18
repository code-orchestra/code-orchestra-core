package jetbrains.mps.ide.actions;

/*Generated by MPS */

import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.plugins.pluginparts.actions.GeneratedAction;
import javax.swing.Icon;
import javax.swing.ImageIcon;

import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import org.apache.commons.logging.Log;
import org.apache.commons.logging.LogFactory;
import org.jetbrains.annotations.NotNull;
import com.intellij.openapi.actionSystem.AnActionEvent;
import java.util.Map;
import jetbrains.mps.internal.collections.runtime.MapSequence;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.ide.projectPane.ProjectPane;
import com.intellij.openapi.project.Project;
import jetbrains.mps.smodel.SNode;

public class ShowInLogicalView_Action extends GeneratedAction {
  private static final Icon ICON = new ImageIcon(ShowInLogicalView_Action.class.getResource("logical_view.png"));
  protected static Log log = LogFactory.getLog(ShowInLogicalView_Action.class);

  @CodeOrchestraPatch
  public ShowInLogicalView_Action() {
    //super("Show Node in Project", "", ICON);
    super("Show Node in Project", "", null); // RE-2300
    this.setIsAlwaysVisible(true);
    this.setExecuteOutsideCommand(false);
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
        log.error("User's action doUpdate method failed. Action:" + "ShowInLogicalView", t);
      }
      this.disable(event.getPresentation());
    }
  }

  protected boolean collectActionData(AnActionEvent event, final Map<String, Object> _params) {
    if (!(super.collectActionData(event, _params))) {
      return false;
    }
    MapSequence.fromMap(_params).put("project", event.getData(MPSDataKeys.PROJECT));
    if (MapSequence.fromMap(_params).get("project") == null) {
      return false;
    }
    MapSequence.fromMap(_params).put("context", event.getData(MPSDataKeys.OPERATION_CONTEXT));
    if (MapSequence.fromMap(_params).get("context") == null) {
      return false;
    }
    MapSequence.fromMap(_params).put("node", event.getData(MPSDataKeys.NODE));
    if (MapSequence.fromMap(_params).get("node") == null) {
      return false;
    }
    return true;
  }

  public void doExecute(@NotNull final AnActionEvent event, final Map<String, Object> _params) {
    try {
      IProjectPane pane = ProjectPane.getInstance(((Project) MapSequence.fromMap(_params).get("project")));
      pane.selectNode(((SNode) MapSequence.fromMap(_params).get("node")), true);
    } catch (Throwable t) {
      if (log.isErrorEnabled()) {
        log.error("User's action execute method failed. Action:" + "ShowInLogicalView", t);
      }
    }
  }
}
