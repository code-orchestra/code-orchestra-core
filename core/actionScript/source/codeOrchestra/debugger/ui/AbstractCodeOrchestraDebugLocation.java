package codeOrchestra.debugger.ui;

import com.intellij.openapi.util.Computable;
import codeOrchestra.actionScript.Concepts;
import codeOrchestra.debugger.breakpoint.ICodeOrchestraDebugLocation;
import jetbrains.mps.generator.traceInfo.TraceInfoUtil;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.smodel.SNode;

import java.util.List;

/**
 * @author Alexander Eliseyev
 */
public abstract class AbstractCodeOrchestraDebugLocation implements ICodeOrchestraDebugLocation {

  public final SNode getNode() {
    return ModelAccess.instance().runReadAction(new Computable<SNode>() {
      @Override
      public SNode compute() {
        SNode node = TraceInfoUtil.getNode(getUnitName(), getFileName(), getLineNumber());
        if (node == null) {
          return null;
        }

        if (node.isInstanceOfConcept(Concepts.STATEMENT)) {
          return node;
        }

        if (node.isInstanceOfConcept(Concepts.STATEMENTS_LIST)) {
          List<SNode> statements = node.getChildren("statement");
          if (!statements.isEmpty()) {
            return statements.get(0);
          }
        }

        SNode ancestorStatement = SNodeOperations.getAncestor(node, Concepts.STATEMENT, false, false);
        if (ancestorStatement != null) {
          return ancestorStatement;
        }

        return node;
      }
    });
  }

}
