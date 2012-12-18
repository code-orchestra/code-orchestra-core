package codeOrchestra.logging;

import com.intellij.openapi.project.Project;
import codeOrchestra.view.utils.NavigationUtils;
import jetbrains.mps.ide.messages.NavigationManager;
import jetbrains.mps.ide.messages.navigation.INavigationHandler;
import jetbrains.mps.smodel.SNode;

/**
 * @author Alexander Eliseyev
 */
public class SNodeWithStackTraceNavigationHandler implements INavigationHandler<SNodeWithStackTrace> {

  @Override
  public void navigate(Project project, SNodeWithStackTrace object, boolean focus, boolean select) {
    SNode realNode = NavigationUtils.getNodeToDisplay(object.getNodePointer().getNode()); // RE-3419
    if (realNode == null) return;
    NavigationManager.getInstance().navigateTo(project, realNode, focus, select);
  }
}
