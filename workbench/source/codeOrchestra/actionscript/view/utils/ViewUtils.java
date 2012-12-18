package codeOrchestra.actionscript.view.utils;

import com.intellij.ide.DataManager;
import com.intellij.ide.projectView.ProjectView;
import com.intellij.ide.projectView.impl.AbstractProjectViewPane;
import com.intellij.openapi.project.Project;
import codeOrchestra.actionscript.view.ActionScriptViewPane;
import jetbrains.mps.ide.projectPane.IProjectPane;
import jetbrains.mps.workbench.MPSDataKeys;

/**
 * @author Alexander Eliseyev
 */
public class ViewUtils {

  public static boolean isInActionScriptView(Project project) {
    IProjectPane iProjectPane = getCurrentPane(project);
    return iProjectPane != null && iProjectPane instanceof ActionScriptViewPane;
  }

  public static boolean isInActionScriptView() {
    Project project = MPSDataKeys.PROJECT.getData(DataManager.getInstance().getDataContext());
    return isInActionScriptView(project);
  }

  public static AbstractProjectViewPane getCurrentPaneEx(Project project) {
    AbstractProjectViewPane pane = null;
    try {
      pane = ProjectView.getInstance(project).getCurrentProjectViewPane();
    } catch (Throwable t) {
      return null;
    }
    return pane;
  }

  public static IProjectPane getCurrentPane(Project ideaProject) {
    AbstractProjectViewPane pane = null;
    try {
      pane = ProjectView.getInstance(ideaProject).getCurrentProjectViewPane();
    } catch (Throwable t) {
      return null;
    }
    if (pane instanceof IProjectPane) {
      return (IProjectPane) pane;
    }
    return null;
  }

}
