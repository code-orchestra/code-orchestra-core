package jetbrains.mps.analyzers.structure;

/*Generated by MPS */

import jetbrains.mps.lang.pattern.structure.ActionStatement;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.baseLanguage.structure.Expression;
import jetbrains.mps.lang.pattern.structure.InsertPosition;
import jetbrains.mps.smodel.SModel;
import jetbrains.mps.smodel.SModelUtil_new;
import jetbrains.mps.project.GlobalScope;

public class EmitInstruction extends ActionStatement {
  public static final String concept = "jetbrains.mps.analyzers.structure.EmitInstruction";
  public static final String INSTRUCTION_REF = "instructionRef";
  public static final String TARGET = "target";
  public static final String POSITION = "position";

  public EmitInstruction(SNode node) {
    super(node);
  }

  public InstructionReference getInstructionRef() {
    return (InstructionReference) this.getChild(InstructionReference.class, EmitInstruction.INSTRUCTION_REF);
  }

  public void setInstructionRef(InstructionReference node) {
    super.setChild(EmitInstruction.INSTRUCTION_REF, node);
  }

  public Expression getTarget() {
    return (Expression) this.getChild(Expression.class, EmitInstruction.TARGET);
  }

  public void setTarget(Expression node) {
    super.setChild(EmitInstruction.TARGET, node);
  }

  public InsertPosition getPosition() {
    return (InsertPosition) this.getChild(InsertPosition.class, EmitInstruction.POSITION);
  }

  public void setPosition(InsertPosition node) {
    super.setChild(EmitInstruction.POSITION, node);
  }

  public static EmitInstruction newInstance(SModel sm, boolean init) {
    return (EmitInstruction) SModelUtil_new.instantiateConceptDeclaration("jetbrains.mps.analyzers.structure.EmitInstruction", sm, GlobalScope.getInstance(), init).getAdapter();
  }

  public static EmitInstruction newInstance(SModel sm) {
    return EmitInstruction.newInstance(sm, false);
  }
}
