package codeOrchestra.flex;

import org.apache.flex.abc.instructionlist.InstructionList;
import org.apache.flex.abc.semantics.MethodBodyInfo;
import org.apache.flex.abc.semantics.MethodInfo;
import org.apache.flex.abc.semantics.PooledValue;
import org.apache.flex.compiler.definitions.IDefinition;
import org.apache.flex.compiler.internal.as.codegen.Binding;
import org.apache.flex.compiler.internal.as.codegen.LexicalScope;
import org.apache.flex.compiler.internal.definitions.AccessorDefinition;
import org.apache.flex.compiler.internal.definitions.FunctionDefinition;
import org.apache.flex.compiler.internal.definitions.VariableDefinition;
import org.apache.flex.compiler.internal.semantics.MethodBodySemanticChecker;
import org.apache.flex.compiler.internal.tree.as.BaseDefinitionNode;
import org.apache.flex.compiler.internal.tree.as.VariableNode;
import org.apache.flex.compiler.projects.ICompilerProject;
import org.apache.flex.compiler.tree.as.IASNode;
import org.apache.flex.compiler.tree.as.IFunctionNode;
import org.apache.flex.compiler.tree.as.IImportNode;
import org.apache.flex.compiler.tree.as.IVariableNode;

import java.util.Vector;
import java.util.concurrent.atomic.AtomicInteger;

/**
 * @author Anton.I.Neverov
 */
public class FakeMethodBodySemanticChecker extends MethodBodySemanticChecker {

  /**
   * Construct a new MethodBodySemanticChecker from the current lexical scope.
   */
  public FakeMethodBodySemanticChecker(LexicalScope current_scope) {
    super(current_scope);
  }

//  @Override
//  public boolean functionBodyHasNonInlineableInstructions(InstructionList insns, boolean reportInlineProblems, String functionName) {
//    return super.functionBodyHasNonInlineableInstructions(insns, reportInlineProblems, functionName);    //To change body of overridden methods use File | Settings | File Templates.
//  }
//
//  @Override
//  public boolean functionBodyHasNonInlineableNodes(IASNode n, boolean reportInlineProblems, String functionName, AtomicInteger exprCount) {
//    return super.functionBodyHasNonInlineableNodes(n, reportInlineProblems, functionName, exprCount);    //To change body of overridden methods use File | Settings | File Templates.
//  }
//
//  @Override
//  public boolean canFunctionBeInlined(FunctionDefinition function) {
//    return super.canFunctionBeInlined(function);    //To change body of overridden methods use File | Settings | File Templates.
//  }
//
//  @Override
//  public boolean canSetterBeInlined(AccessorDefinition accessor) {
//    return super.canSetterBeInlined(accessor);    //To change body of overridden methods use File | Settings | File Templates.
//  }
//
//  @Override
//  public boolean canGetterBeInlined(AccessorDefinition accessor) {
//    return super.canGetterBeInlined(accessor);    //To change body of overridden methods use File | Settings | File Templates.
//  }
//
//  @Override
//  public void leaveConstructor() {
//    super.leaveConstructor();    //To change body of overridden methods use File | Settings | File Templates.
//  }
//
//  @Override
//  public void enterConstructor() {
//    super.enterConstructor();    //To change body of overridden methods use File | Settings | File Templates.
//  }

  @Override
  public void checkVariableForConflictingDefinitions(IASNode iNode, VariableDefinition varDef) {

  }

  @Override
  public void checkInterfaceFunctionForConflictingDefinitions(IASNode iNode, FunctionDefinition funcDef) {

  }

  @Override
  public boolean checkFunctionForConflictingDefinitions(IASNode iNode, FunctionDefinition funcDef) {
    return false;
  }

  @Override
  public void checkRestParameter(IASNode iNode, Binding param_type) {

  }

  @Override
  public void checkVectorLiteral(IASNode iNode, Binding type_param) {

  }

  @Override
  public void checkNamespaceOfDefinition(IASNode iNode, IDefinition def, ICompilerProject project) {

  }

  @Override
  public void checkNamespaceDeclaration(IASNode iNode, Binding ns_name) {

  }

  @Override
  public void checkQualifier(IASNode iNode) {

  }

//  @Override
//  public void addTypeProblem(IASNode typeNode, IDefinition typeDef, String typeDesc, boolean reportAmbiguousReference) {
//    super.addTypeProblem(typeNode, typeDef, typeDesc, reportAmbiguousReference);    //To change body of overridden methods use File | Settings | File Templates.
//  }

  @Override
  public void checkClassField(VariableNode var, boolean is_const) {

  }

  @Override
  public void checkTypeName(Binding typename) {

  }

  @Override
  public void checkVariableDeclaration(IASNode iNode) {

  }

  @Override
  public void checkForDuplicateModifiers(BaseDefinitionNode bdn) {

  }

  @Override
  public void checkUnaryOperator(IASNode iNode, int opcode) {

  }

  @Override
  public void checkUseNamespaceDirective(IASNode iNode, Binding ns_name) {

  }

  @Override
  public void checkImportDirective(IImportNode importNode) {

  }

  @Override
  public void checkThrow(IASNode iNode) {

  }

  @Override
  public void checkControlFlow(IASNode iNode, MethodInfo mi, MethodBodyInfo mbi) {

  }

  @Override
  public void checkReturnVoid(IASNode iNode) {

  }

  @Override
  public void checkReturnValue(IASNode iNode) {

  }

  @Override
  public void checkNewExpr(IASNode iNode, Binding class_binding, Vector<? extends Object> args) {

  }

  @Override
  public void checkNewExpr(IASNode call_node) {

  }

  @Override
  public void checkMemberAccess(IASNode iNode, Binding member, int opcode) {

  }

  @Override
  public void checkLValue(IASNode iNode, Binding binding) {

  }

  @Override
  public void checkIncDec(IASNode iNode, boolean is_incr, Binding binding) {

  }

  @Override
  public void checkIncDec(IASNode iNode, boolean is_incr) {

  }

  @Override
  public void checkSuperAccess(IASNode iNode) {

  }

//  @Override
//  public PooledValue checkInitialValue(IVariableNode iNode, Binding type, PooledValue initial_value) {
//    return super.checkInitialValue(iNode, type, initial_value);    //To change body of overridden methods use File | Settings | File Templates.
//  }

  @Override
  public void checkReference(Binding b, boolean forLValue) {

  }

  @Override
  public void checkReference(Binding b) {

  }

  @Override
  public void checkGetProperty(Binding binding) {

  }

  @Override
  public void checkSimpleName(IASNode iNode, Binding binding) {

  }

  @Override
  public void checkFunctionDefinition(IFunctionNode iNode, FunctionDefinition def) {

  }

  @Override
  public void checkFunctionCall(IASNode iNode, Binding method_binding, Vector<? extends Object> actuals) {

  }

  @Override
  public void checkNativeMethod(IASNode iNode) {

  }

  @Override
  public void checkFunctionBody(IASNode iNode) {

  }

  @Override
  public void checkExplicitSuperCall(IASNode iNode, Vector<? extends Object> args) {

  }

  @Override
  public void checkDeleteExpr(IASNode iNode, Binding binding) {

  }

  @Override
  public void checkDefaultSuperCall(IASNode iNode) {

  }

  @Override
  public void checkConstantValue(IASNode iNode) {

  }

  @Override
  public void checkBindableVariableDeclaration(IASNode iNode, IDefinition d) {

  }

  @Override
  public void checkCompoundAssignment(IASNode iNode, Binding lvalue, int opcode) {

  }

  @Override
  public void checkTypeCheckImplicitConversion(IASNode iNode) {

  }

  @Override
  public void checkImplicitConversion(IASNode iNode, IDefinition expected_type) {

  }

  @Override
  public void checkBinaryOperator(IASNode root, IASNode left, IASNode right, int opcode) {

  }

  @Override
  public void checkBinaryOperator(IASNode iNode, int opcode) {

  }

  @Override
  public void checkAssignToBracketExpr(IASNode iNode) {

  }

  @Override
  public void checkInitialization(IASNode iNode, Binding binding) {

  }

  @Override
  public void checkAssignmentValue(IDefinition leftDefinition, IASNode rightNode) {

  }

  @Override
  public void checkAssignment(IASNode iNode, Binding binding) {

  }

  @Override
  public void checkNestedFunctionDecl(IFunctionNode funcNode) {

  }

  @Override
  public void checkFunctionDecl(IFunctionNode funcNode) {

  }
}
