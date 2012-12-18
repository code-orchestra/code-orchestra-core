package jetbrains.mps.baseLanguage.behavior;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.project.IModule;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;
import jetbrains.mps.reloading.ReflectionUtil;
import jetbrains.mps.smodel.SModelStereotype;

public class LocalStaticFieldReference_Behavior {
  public static void init(SNode thisNode) {
  }

  public static Object virtual_eval_1213877519769(SNode thisNode, IModule module) {
    SNode classifier = SNodeOperations.as(SNodeOperations.getParent(SLinkOperations.getTarget(thisNode, "variableDeclaration", false)), "jetbrains.mps.baseLanguage.structure.Classifier");
    String name = SPropertyOperations.getString(SLinkOperations.getTarget(thisNode, "variableDeclaration", false), "name");
    return ReflectionUtil.getConstant(module, classifier, name);
  }

  public static boolean virtual_isCompileTimeConstant_1238860258777(SNode thisNode) {
    return SPropertyOperations.getBoolean(SLinkOperations.getTarget(thisNode, "variableDeclaration", false), "isFinal");
  }

  public static Object virtual_getCompileTimeConstantValue_1238860310638(SNode thisNode, IModule module) {
    SNode classifier = SNodeOperations.as(SNodeOperations.getParent(SLinkOperations.getTarget(thisNode, "variableDeclaration", false)), "jetbrains.mps.baseLanguage.structure.Classifier");
    if ((classifier != null) && SModelStereotype.isStubModelStereotype(SNodeOperations.getModel(classifier).getSModelReference().getStereotype())) {
      return Expression_Behavior.call_eval_1213877519769(thisNode, module);
    } else {
      return (Expression_Behavior.call_isCompileTimeConstant_1238860258777(SLinkOperations.getTarget(SLinkOperations.getTarget(thisNode, "variableDeclaration", false), "initializer", true)) ?
        Expression_Behavior.call_getCompileTimeConstantValue_1238860310638(SLinkOperations.getTarget(SLinkOperations.getTarget(thisNode, "variableDeclaration", false), "initializer", true), module) :
        null
      );
    }
  }
}
