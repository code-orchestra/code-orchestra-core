package jetbrains.mps.baseLanguage.dataFlow;

/*Generated by MPS */

import jetbrains.mps.lang.dataFlow.DataFlowBuilder;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.lang.dataFlow.DataFlowBuilderContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SPropertyOperations;

public class ForStatement_DataFlow extends DataFlowBuilder {
  public ForStatement_DataFlow() {
  }

  public void build(final IOperationContext operationContext, final DataFlowBuilderContext _context) {
    // todo hack 
    _context.getBuilder().build((SNode) SLinkOperations.getTarget(_context.getNode(), "variable", true));
    for (SNode additionalVar : SLinkOperations.getTargets(_context.getNode(), "additionalVar", true)) {
      _context.getBuilder().build((SNode) additionalVar);
    }
    _context.getBuilder().emitLabel("start");
    if (SNodeOperations.isInstanceOf(SLinkOperations.getTarget(_context.getNode(), "condition", true), "jetbrains.mps.baseLanguage.structure.BooleanConstant")) {
      SNode constant = SNodeOperations.cast(SLinkOperations.getTarget(_context.getNode(), "condition", true), "jetbrains.mps.baseLanguage.structure.BooleanConstant");
      if (!(SPropertyOperations.getBoolean(constant, "value"))) {
        _context.getBuilder().emitJump(_context.getBuilder().after(_context.getNode()));
      }
    } else if ((SLinkOperations.getTarget(_context.getNode(), "condition", true) != null)) {
      _context.getBuilder().build((SNode) SLinkOperations.getTarget(_context.getNode(), "condition", true));
      _context.getBuilder().emitIfJump(_context.getBuilder().after(_context.getNode()));
    }
    _context.getBuilder().build((SNode) SLinkOperations.getTarget(_context.getNode(), "body", true));
    for (final SNode iteration : SLinkOperations.getTargets(_context.getNode(), "iteration", true)) {
      _context.getBuilder().emitMayBeUnreachable(new Runnable() {
        public void run() {
          _context.getBuilder().build((SNode) iteration);
        }
      });
    }
    _context.getBuilder().emitMayBeUnreachable(new Runnable() {
      public void run() {
        _context.getBuilder().emitJump(_context.getBuilder().label(_context.getNode(), "start"));
      }
    });
  }
}
