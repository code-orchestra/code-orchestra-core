package jetbrains.mps.lang.plugin.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SConceptOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;

public class FileGeneratorDeclaration_Behavior {
  public static void init(SNode thisNode) {
  }

  public static SNode virtual_createType_1213877527970(SNode thisNode) {
    SNode type = SConceptOperations.createNewNode("jetbrains.mps.lang.plugin.structure.FileGeneratorType", null);
    SLinkOperations.setTarget(type, "generator", thisNode, false);
    return type;
  }

  public static String call_getGeneratedName_1218038748102(SNode thisNode) {
    return SPropertyOperations.getString(thisNode, "name") + "_FileGenerator";
  }

  public static String call_getGeneratedClassFQName_1218038748112(SNode thisNode) {
    return SNodeOperations.getModel(thisNode).getLongName() + "." + FileGeneratorDeclaration_Behavior.call_getGeneratedName_1218038748102(thisNode);
  }
}
