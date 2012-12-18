package jetbrains.mps.ide.messages.navigation;

import com.intellij.openapi.project.Project;
import codeOrchestra.view.utils.NavigationUtils;
import jetbrains.mps.messages.NodeWithContext;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.util.annotation.CodeOrchestraPatch;
import jetbrains.mps.workbench.editors.MPSEditorOpener;

public class NodeWithContextNavigationHandler implements INavigationHandler<NodeWithContext> {

  @CodeOrchestraPatch
  public void navigate(Project project, NodeWithContext object, boolean focus, boolean select) {
    SNode node = NavigationUtils.getNodeToDisplay(object.getNode()); // RE-3419
    if (node == null) return;
    IOperationContext context = object.getContext();
    if (context == null) return;
    context.getComponent(MPSEditorOpener.class).openNode(node, context, focus, select);
  }
}
