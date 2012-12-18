package jetbrains.mps.ide.messages.navigation;

import com.intellij.openapi.project.Project;
import codeOrchestra.view.utils.NavigationUtils;
import jetbrains.mps.ide.messages.NavigationManager;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SNodePointer;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;

public class NodePointerNavigationHandler implements INavigationHandler<SNodePointer> {

  @CodeOrchestraPatch
  public void navigate(Project project, SNodePointer node, boolean focus, boolean select) {
    SNode realNode = NavigationUtils.getNodeToDisplay(node.getNode()); // RE-3419
    if (realNode == null) return;
    NavigationManager.getInstance().navigateTo(project, realNode, focus, select);
  }
}