package jetbrains.mps.lang.dataFlow.structure;

/*Generated by MPS */

import jetbrains.mps.smodel.SNode;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class InstructionIsJump extends BooleanInstructionOperation {
  public static final String concept = "jetbrains.mps.lang.dataFlow.structure.InstructionIsJump";

  public InstructionIsJump(SNode node) {
    super(node);
  }

  public static InstructionIsJump newInstance(SModel sm, boolean init) {
    return (InstructionIsJump) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.lang.dataFlow.structure.InstructionIsJump", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static InstructionIsJump newInstance(SModel sm) {
    return InstructionIsJump.newInstance(sm, false);
  }
}
