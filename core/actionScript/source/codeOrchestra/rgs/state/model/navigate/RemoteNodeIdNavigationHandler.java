package codeOrchestra.rgs.state.model.navigate;

import com.intellij.openapi.project.Project;
import codeOrchestra.rgs.state.model.RemoteNodeId;
import codeOrchestra.view.utils.NavigationUtils;
import jetbrains.mps.ide.messages.NavigationManager;
import jetbrains.mps.ide.messages.navigation.INavigationHandler;
import jetbrains.mps.smodel.SNode;

/**
 * @author: Alexander Eliseyev
 */
public class RemoteNodeIdNavigationHandler implements INavigationHandler<RemoteNodeId> {

  @Override
  public void navigate(Project project, RemoteNodeId remoteNodeId, boolean focus, boolean select) {
    SNode node = remoteNodeId.getNode();
    if (node == null) {
      return;
    }

    SNode realNode = NavigationUtils.getNodeToDisplay(node); // RE-3419
    if (realNode == null) return;
    NavigationManager.getInstance().navigateTo(project, realNode, focus, select);
  }
}
