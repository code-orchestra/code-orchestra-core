package jetbrains.mps.baseLanguage.util.plugin.refactorings;

/*Generated by MPS */

import jetbrains.mps.smodel.IOperationContext;
import jetbrains.mps.smodel.SNode;
import jetbrains.mps.ide.findusages.model.SearchResults;
import java.util.List;
import jetbrains.mps.smodel.ModelAccess;
import jetbrains.mps.ide.findusages.model.SearchResult;
import jetbrains.mps.internal.collections.runtime.ListSequence;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SNodeOperations;
import jetbrains.mps.lang.smodel.generator.smodelAdapter.SLinkOperations;
import jetbrains.mps.lang.dataFlow.framework.Program;
import jetbrains.mps.lang.dataFlow.DataFlowManager;
import jetbrains.mps.lang.dataFlow.framework.instructions.Instruction;
import jetbrains.mps.lang.dataFlow.framework.instructions.RetInstruction;
import jetbrains.mps.lang.dataFlow.framework.instructions.NopInstruction;
import java.util.Set;
import jetbrains.mps.internal.collections.runtime.SetSequence;

public class InlineMethodRefactoringAnalyzer {
  private IOperationContext myOperationContext;
  private SNode myCall;
  private SNode myMethod;

  public InlineMethodRefactoringAnalyzer(IOperationContext operationContext, SNode call, SNode method) {
    this.myOperationContext = operationContext;
    this.myCall = call;
    this.myMethod = method;
  }

  public String findProblems(final boolean forAll, final SearchResults<SNode> ussages) {
    final List<SNode> myOverriding = MethodRefactoringUtils.findOverridingMethods(this.myMethod, this.myOperationContext);
    final StringBuffer errors = new StringBuffer();
    ModelAccess.instance().runReadAction(new Runnable() {
      public void run() {
        errors.append(InlineMethodRefactoringAnalyzer.this.getOverridingErrors(myOverriding));
        if (forAll) {
          for (SearchResult<SNode> res : ListSequence.fromList(ussages.getSearchResults())) {
            InlineMethodRefactoringAnalyzer.this.appendRefactoringProblems(res.getObject(), errors);
          }
        } else {
          InlineMethodRefactoringAnalyzer.this.appendRefactoringProblems(InlineMethodRefactoringAnalyzer.this.myCall, errors);
        }
      }
    });
    return errors.toString();
  }

  private String getOverridingErrors(List<SNode> overridingMethods) {
    StringBuffer errors = new StringBuffer();
    if (overridingMethods != null && ListSequence.fromList(overridingMethods).count() > 0) {
      errors.append("Inlined method overriden by this methods: ");
      for (SNode methodDeclaration : ListSequence.fromList(overridingMethods)) {
        errors.append(" ").append(SNodeOperations.getParent(methodDeclaration)).append(".").append(methodDeclaration);
      }
      errors.append(".\n");
    }
    return errors.toString();
  }

  private void appendRefactoringProblems(SNode node, StringBuffer errors) {
    InlineMethodRefactoring ref = new InlineMethodRefactoring(node);
    errors.append(ref.getProblems());
  }

  public static String getErrors(InlineMethodDialogModel methodModel) {
    if ((SLinkOperations.getTarget(methodModel.getMethodDeclaration(), "body", true) == null) || SNodeOperations.isInstanceOf(SLinkOperations.getTarget(methodModel.getMethodDeclaration(), "body", true), "jetbrains.mps.baseLanguage.structure.StubStatementList")) {
      return "No sources attached";
    }
    if (methodModel.getMethodCall() == null && isContainsSelfCalls(methodModel.getMethodDeclaration())) {
      return "Method is recursive";
    }
    if (isReturnBreaksExecitionFlow(SLinkOperations.getTarget(methodModel.getMethodDeclaration(), "body", true))) {
      return "Return breaks execution flow";
    }
    return null;
  }

  /*package*/ static boolean isContainsSelfCalls(SNode method) {
    for (SNode call : ListSequence.fromList(SNodeOperations.getDescendants(method, null, false, new String[]{}))) {
      if (MethodCallAdapter.isMethodCall(call)) {
        if (new MethodCallAdapter(call).getMethodDeclaration() == method) {
          return true;
        }
      }
    }
    return false;
  }

  /*package*/ static boolean isReturnBreaksExecitionFlow(SNode body) {
    Program program = DataFlowManager.getInstance().buildProgramFor(body);
    for (Instruction instruction : ListSequence.fromList(program.getInstructions())) {
      if (instruction instanceof RetInstruction) {
        Instruction next = program.get(instruction.getIndex() + 1);
        while (!(next.equals(program.getEnd()))) {
          if (next instanceof NopInstruction) {
            return true;
          }
          Set<Instruction> succ = next.succ();
          if (SetSequence.fromSet(succ).count() != 1) {
            return true;
          }
          next = SetSequence.fromSet(succ).first();
        }
      }
    }
    return false;
  }
}
