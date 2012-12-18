package codeOrchestra.actionScript.compiler.fcsh;

import com.intellij.openapi.actionSystem.AnActionEvent;
import com.intellij.openapi.project.Project;
import jetbrains.mps.InternalFlag;
import jetbrains.mps.logging.Logger;
import jetbrains.mps.workbench.MPSDataKeys;
import jetbrains.mps.workbench.action.BaseAction;

import javax.swing.JOptionPane;
import java.util.Map;

public class TestFCSHAction extends BaseAction {

  private static final Logger LOG = Logger.getLogger(TestFCSHAction.class);

  protected TestFCSHAction() {
    super("FCSH Input");
    setIsAlwaysVisible(false);
  }

  @Override
  protected void doUpdate(AnActionEvent e, Map<String, Object> params) {
    super.doUpdate(e, params);
    if (!InternalFlag.isInternalMode()) {
      disable(e.getPresentation());
    }
  }

  @Override
  protected boolean isEnabledInASView() {
    return true;
  }

  protected void doExecute(AnActionEvent event, Map<String, Object> _params) {
    Project project = event.getData(MPSDataKeys.PROJECT);

    String input = JOptionPane.showInputDialog("Enter fcsh input");
    if (input == null) {
      return;
    }

    FCSHManager fcshManager = project.getComponent(FCSHManager.class);

    try {
      fcshManager.customInput(input);
    } catch (FCSHException e) {
      LOG.error("Error while try to send custom fcsh input: " + input, e);
    }
  }

}
