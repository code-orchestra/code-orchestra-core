package jetbrains.mps.lang.behavior.plugin;

/*Generated by MPS */

import jetbrains.mps.plugins.projectplugins.BaseProjectPlugin;
import java.util.List;
import jetbrains.mps.ide.editorTabs.EditorTabDescriptor;
import com.intellij.openapi.project.Project;
import java.util.ArrayList;

public class Behavior_ProjectPlugin extends BaseProjectPlugin {
  public Behavior_ProjectPlugin() {
  }

  public List<EditorTabDescriptor> initTabbedEditors(Project project) {
    List<EditorTabDescriptor> result = new ArrayList();
    result.add(new Behavior_TabDescriptor());
    return result;
  }
}
