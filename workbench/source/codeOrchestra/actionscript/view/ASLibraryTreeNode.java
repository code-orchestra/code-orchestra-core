package codeOrchestra.actionscript.view;

import com.intellij.openapi.actionSystem.ActionGroup;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.model.ModelRoot;
import jetbrains.mps.project.structure.modules.ModuleDescriptor;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.action.ActionUtils;

import javax.swing.Icon;
import javax.swing.ImageIcon;
import java.io.File;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASLibraryTreeNode extends ASProjectModuleTreeNode {

  public static final String ACTIONS_ID = "codeOrchestra.actionScript.core.plugin.ASLibraryActions_ActionGroup";

  public static final Icon SWC_ICON = new ImageIcon(ASProjectModuleTreeNode.class.getResource("nodes/module_green.png"));

  public ASLibraryTreeNode(Solution solution, MPSProject project) {
    super(solution, project);
  }

  @Override
  public boolean isLibrary() {
    return true;
  }

  @Override
  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(ACTIONS_ID);
  }

  @Override
  public ActionGroup getQuickCreateGroup(boolean plain) {
    return null;
  }

  public void updatePresentation() {
    super.updatePresentation();

    if (getText().endsWith(".swc)") || getText().endsWith(".ane)")) {
      setIcon(SWC_ICON);
    }
  }

  protected String getModulePresentation() {
    if (SolutionUtils.isSWCSolution((Solution) getModule())) {
      ModuleDescriptor moduleDescriptor = getModule().getModuleDescriptor();
      if (moduleDescriptor != null) {
        List<ModelRoot> stubModelEntries = moduleDescriptor.getStubModelEntries();
        if (stubModelEntries != null && !stubModelEntries.isEmpty()) {
          ModelRoot modelRoot = stubModelEntries.get(0);
          String libPath = modelRoot.getPath();

          if (libPath != null) {
            return super.getModulePresentation() + " (" + new File(libPath).getName() + ")";
          }
        }
      }
    }

    return super.getModulePresentation();
  }
  
}
