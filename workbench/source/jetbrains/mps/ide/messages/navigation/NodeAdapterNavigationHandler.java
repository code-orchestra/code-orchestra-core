package jetbrains.mps.ide.messages.navigation;

import com.intellij.openapi.project.Project;
import jetbrains.mps.ide.messages.NavigationManager;
import jetbrains.mps.smodel.BaseAdapter;
import jetbrains.mps.smodel.INodeAdapter;

public class NodeAdapterNavigationHandler implements INavigationHandler<INodeAdapter> {
  public void navigate(Project project, INodeAdapter node, boolean focus, boolean select) {
    NavigationManager.getInstance().navigateTo(project, BaseAdapter.fromAdapter(node), focus, select);
  }
}
