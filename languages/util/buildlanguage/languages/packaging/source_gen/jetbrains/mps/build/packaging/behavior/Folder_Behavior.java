package jetbrains.mps.build.packaging.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;

public class Folder_Behavior {
  public static void init(SNode thisNode) {
    SLinkOperations.setTarget(thisNode, "sourcePath", SConceptOperations.createNewNode("jetbrains.mps.build.packaging.structure.Path", null), true);
  }

  public static String virtual_getChildrenTargetDir_1237389224202(SNode thisNode) {
    return AbstractProjectComponent_Behavior.call_getPath_1213877333777(thisNode).getPath();
  }
}
