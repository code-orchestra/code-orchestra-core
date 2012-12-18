package jetbrains.mps.ide.devkit.actions;

/*Generated by MPS */

import jetbrains.mps.plugins.projectplugins.BaseProjectPlugin;
import java.util.List;
import jetbrains.mps.plugins.pluginparts.tool.BaseGeneratedTool;
import com.intellij.openapi.project.Project;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import java.util.ArrayList;

public class Mpsdevkit_ProjectPlugin extends BaseProjectPlugin {
  public Mpsdevkit_ProjectPlugin() {
  }

  public List<BaseGeneratedTool> initAllTools(Project project) {
    List<BaseGeneratedTool> tools = ListSequence.fromList(new ArrayList<BaseGeneratedTool>());
    ListSequence.fromList(tools).addElement(new ModelRepository_Tool(project));
    ListSequence.fromList(tools).addElement(new ModuleRepository_Tool(project));
    ListSequence.fromList(tools).addElement(new NodeExplorer_Tool(project));
    ListSequence.fromList(tools).addElement(new TraceTool_Tool(project));
    return tools;
  }
}
