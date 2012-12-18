package codeOrchestra.actionscript.view;

import com.intellij.openapi.actionSystem.ActionGroup;
import codeOrchestra.actionscript.view.utils.SolutionUtils;
import jetbrains.mps.ide.projectPane.Icons;
import jetbrains.mps.ide.ui.MPSTreeNode;
import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;
import jetbrains.mps.smodel.MPSModuleRepository;
import jetbrains.mps.workbench.action.ActionUtils;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Comparator;
import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public class ASLibrariesTreeNode extends MPSTreeNode {

  public static final String ACTIONS_ID = "codeOrchestra.actionScript.core.plugin.ASLibrariesActions_ActionGroup";

  private MPSProject mpsProject;
  private boolean myInitialized;

  public ASLibrariesTreeNode(MPSProject mpsProject) {
    super(null);
    this.mpsProject = mpsProject;

    setIcon(Icons.LIB_ICON);
    setNodeIdentifier("Libraries");
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
    return ActionUtils.getGroup(ACTIONS_ID);
  }

  private void populate() {
    List<Solution> solutions = MPSModuleRepository.getInstance().getAllSolutions();

    // Mine nodes
    List<ASLibraryTreeNode> libraryNodes = new ArrayList<ASLibraryTreeNode>();    
    for (Solution solution : solutions) {
      if (solution.isPackaged()) { 
        if (!SolutionUtils.isBuiltinLibrary(solution)) {
          continue;
        }
      }

      boolean isOutLib = true;
      if (solution.isPackaged() && SolutionUtils.isBuiltinLibrary(solution)) {
        isOutLib = true;
      } else if (!SolutionUtils.isActionScriptDependent(solution) || !SolutionUtils.isStubSolution(solution)) {
        isOutLib = false;
      }

      if (!isOutLib) {
        continue;
      }

      ASLibraryTreeNode moduleTreeNode = new ASLibraryTreeNode(solution, mpsProject);
      libraryNodes.add(moduleTreeNode);
    }
    
    // Sort by name
    Collections.sort(libraryNodes, new Comparator<ASLibraryTreeNode>() {
      public int compare(ASLibraryTreeNode mpsTreeNodes, ASLibraryTreeNode mpsTreeNodes1) {
        return mpsTreeNodes.getText().compareTo(mpsTreeNodes1.getText());
      }
    });

    // Sort by type
    Collections.sort(libraryNodes, new Comparator<ASLibraryTreeNode>() {
      public int compare(ASLibraryTreeNode mpsTreeNodes, ASLibraryTreeNode mpsTreeNodes1) {
        if (mpsTreeNodes.getText().contains(".swc")) {
          return -1;
        }
        if (mpsTreeNodes1.getText().contains(".swc")) {
          return 1;
        }
        return 0;
      }
    });

    // Add nodes
    for (ASLibraryTreeNode libraryTreeNode : libraryNodes) {
      add(libraryTreeNode);
    }
  }

}
