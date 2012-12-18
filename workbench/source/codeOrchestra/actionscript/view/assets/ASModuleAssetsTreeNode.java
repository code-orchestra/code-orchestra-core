package codeOrchestra.actionscript.view.assets;

import jetbrains.mps.project.MPSProject;
import jetbrains.mps.project.Solution;

/**
 * @author Alexander Eliseyev
 */
public class ASModuleAssetsTreeNode extends ASAbstractAssetsTreeNode {

  public ASModuleAssetsTreeNode(MPSProject project, Solution solution) {
    super(solution.toString() + " Assets", project, solution);
  }

}
