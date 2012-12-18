package codeOrchestra.actionscript.view.assets;

import com.intellij.openapi.actionSystem.ActionGroup;
import codeOrchestra.actionScript.assets.AssetsManager;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.project.structure.modules.SolutionDescriptor;
import jetbrains.mps.workbench.action.ActionUtils;

import javax.swing.Icon;
import javax.swing.ImageIcon;

/**
 * @author Alexander Eliseyev
 */
public class ASRootAssetsTreeNode extends MPSTreeNode {

  public static final Icon ASSETS_ICON = new ImageIcon(ASRootAssetsTreeNode.class.getResource("assets.png"));

  private static final String ACTION_GROUP_ID = "codeOrchestra.projectAssets.plugin.ASRootAssetsActions_ActionGroup";

  private MPSProject mpsProject;
  private boolean myInitialized;

  public ASRootAssetsTreeNode(MPSProject mpsProject) {
    super(null);
    this.mpsProject = mpsProject;

    setIcon(ASSETS_ICON);
    setNodeIdentifier("Assets");
  }

  @Override
  public boolean isInitialized() {
    return myInitialized;
  }

  @Override
  public void init() {
    if (myInitialized) {
      return;
    }

    removeAllChildren();
    populate();
    myInitialized = true;
  }

  public ActionGroup getActionGroup() {
    return ActionUtils.getGroup(ACTION_GROUP_ID);
  }

  private void populate() {
    if (mpsProject.getAssetsSolutionReference() != null) {
      add(new ASProjectAssetsTreeNode(mpsProject));
    }

    // Module Assets are disabled for now
    if (mpsProject.getProject().getComponent(AssetsManager.class).areModuleAssetsEnabled()) {
      for (Solution solution : mpsProject.getProjectSolutions()) {
        SolutionDescriptor moduleDescriptor = solution.getModuleDescriptor();
        if (moduleDescriptor != null && moduleDescriptor.getAssetsDirName() != null) {
          add(new ASModuleAssetsTreeNode(mpsProject, solution));
        }
      }
    }
  }

}
