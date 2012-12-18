package codeOrchestra.actionscript.view;

import com.intellij.openapi.actionSystem.ActionGroup;
import jetbrains.mps.ide.projectPane.logicalview.nodes.ProjectModuleTreeNode;
import jetbrains.mps.ide.ui.ErrorState;
import jetbrains.mps.project.IModule;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.ModuleContext;
import jetbrains.mps.project.Solution;
import jetbrains.mps.vfs.IFile;
import jetbrains.mps.workbench.action.ActionUtils;

import javax.swing.Icon;
import javax.swing.ImageIcon;

/**
 * @author Alexander Eliseyev
 */
public class ASProjectModuleTreeNode extends ProjectModuleTreeNode {

  public static final String NEW_ACTIONS_ID = "codeOrchestra.actionScript.core.plugin.ASModuleNewActions_ActionGroup";
  public static final String ACTIONS_ID = "codeOrchestra.actionScript.core.plugin.ASModuleActions_ActionGroup";

  public static final Icon MODULE_ICON = new ImageIcon(ASProjectModuleTreeNode.class.getResource("nodes/modul.png"));

  private Solution solution;
  private boolean myInitialized;
  private boolean showAdditionalText;

  public ASProjectModuleTreeNode(Solution solution, MPSProject project) {
    super(new ModuleContext(solution, project));
    this.solution = solution;
    updatePresentation();
  }

  public boolean isLibrary() {
    return false;
  }

  public void updatePresentation() {
    super.updatePresentation();
    setIcon(MODULE_ICON);

    IFile descriptorFile = solution.getDescriptorFile();
    assert descriptorFile != null;

    setNodeIdentifier(descriptorFile.getAbsolutePath());

    if (!showAdditionalText) {
      setAdditionalText(null);
    }
  }

  public ActionGroup getQuickCreateGroup(boolean plain) {
    return ActionUtils.getGroup(NEW_ACTIONS_ID);
  }

  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(ACTIONS_ID);
  }

  protected String getModulePresentation() {
    String name = solution.getModuleDescriptor().getNamespace();
    
    if (name != null) {
      return name;
    }
    return "module";
  }

  public IModule getModule() {
    return solution;
  }

  @Override
  public boolean isInitialized() {
    return myInitialized;
  }
  
  @Override
  public void init() {
    populate();
    myInitialized = true;
  }

  private void populate() {
    ASPackagesSubtree.create(this, getOperationContext());
  }

}
