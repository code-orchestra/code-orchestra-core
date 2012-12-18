package codeOrchestra.actionscript.view;

import com.intellij.openapi.actionSystem.ActionGroup;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.ui.ErrorState;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.ProjectOperationContext;
import jetbrains.mps.workbench.action.ActionUtils;

/**
 * @author Alexander Eliseyev
 */
public class ASProjectTreeNode extends MPSTreeNode {

  public static final String NEW_ACTIONS_ID = "codeOrchestra.actionScript.core.plugin.ASProjectNewActions_ActionGroup";
  public static final String ACTIONS_ID = "codeOrchestra.actionScript.core.plugin.ASProjectActions_ActionGroup";

  private MPSProject myProject;

  ASProjectTreeNode(MPSProject project) {
    super(ProjectOperationContext.get(project.getProject()));

    myProject = project;

    setIcon(Icons.PROJECT_ICON);
    setNodeIdentifier("Project");
    updatePresentation();
  }

  public void updatePresentation() {
    super.updatePresentation();
    setErrorState(myProject.getErrors() != null ? ErrorState.ERROR : ErrorState.NONE);
    setTooltipText(myProject.getErrors());
  }

  public ActionGroup getQuickCreateGroup(boolean plain) {
    return ActionUtils.getGroup(NEW_ACTIONS_ID);
  }

  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(ACTIONS_ID);
  }
    
  public int getToggleClickCount() {
    return -1;
  }
}