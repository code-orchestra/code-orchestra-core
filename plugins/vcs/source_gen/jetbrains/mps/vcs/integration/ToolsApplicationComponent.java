package jetbrains.mps.vcs.integration;

/*Generated by MPS */

import com.intellij.openapi.components.ApplicationComponent;
import com.intellij.openapi.diff.DiffManager;
import org.jetbrains.annotations.NotNull;

public class ToolsApplicationComponent implements ApplicationComponent {
  private final ModelDiffTool myModelDiffTool = new ModelDiffTool();
  private final ModelMergeTool myModelMergeTool = new ModelMergeTool();
  private final DiffManager myDiffManager;

  public ToolsApplicationComponent(DiffManager diffManager) {
    myDiffManager = diffManager;
  }

  @NotNull
  public String getComponentName() {
    return ToolsApplicationComponent.class.getSimpleName();
  }

  public void initComponent() {
    myDiffManager.registerDiffTool(myModelDiffTool);
    myDiffManager.registerDiffTool(myModelMergeTool);
  }

  public void disposeComponent() {
    myDiffManager.unregisterDiffTool(myModelDiffTool);
    myDiffManager.unregisterDiffTool(myModelMergeTool);
  }
}
