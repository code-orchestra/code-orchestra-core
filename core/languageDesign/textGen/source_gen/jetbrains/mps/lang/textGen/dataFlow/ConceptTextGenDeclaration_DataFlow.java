package jetbrains.mps.lang.textGen.dataFlow;

/*Generated by MPS */

import jetbrains.mps.lang.dataFlow.DataFlowBuilder;
import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.lang.dataFlow.DataFlowBuilderContext;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.smodel.SNode;

public class ConceptTextGenDeclaration_DataFlow extends DataFlowBuilder {
  public ConceptTextGenDeclaration_DataFlow() {
  }

  public void build(final IOperationContext operationContext, final DataFlowBuilderContext _context) {
    _context.getBuilder().emitWrite(_context.getNode());
    _context.getBuilder().emitRead(SLinkOperations.getTarget(_context.getNode(), "conceptDeclaration", false));
    _context.getBuilder().build((SNode) SLinkOperations.getTarget(_context.getNode(), "textGenBlock", true));
  }
}
