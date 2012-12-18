package codeOrchestra.actionscript.view.assets;

import jetbrains.mps.project.MPSProject;
import jetbrains.mps.smodel.MPSModuleRepository;

/**
 * @author Alexander Eliseyev
 */
public class ASProjectAssetsTreeNode extends ASAbstractAssetsTreeNode {

  public ASProjectAssetsTreeNode(MPSProject project) {
    super("Project Assets", project,
      MPSModuleRepository.getInstance().getSolution(project.getAssetsSolutionReference()));
  }

}
