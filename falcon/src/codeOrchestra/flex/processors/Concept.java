package codeOrchestra.flex.processors;

import codeOrchestra.flex.processors.binary.*;
import codeOrchestra.flex.processors.classifier.*;
import codeOrchestra.flex.processors.conditionalNode.*;
import codeOrchestra.flex.processors.containerLiteral.*;
import codeOrchestra.flex.processors.excludedNode.*;
import codeOrchestra.flex.processors.forStatement.*;
import codeOrchestra.flex.processors.functionDeclaration.*;
import codeOrchestra.flex.processors.functionCall.*;
import codeOrchestra.flex.processors.identifier.*;
import codeOrchestra.flex.processors.iterationFlow.*;
import codeOrchestra.flex.processors.languageIdentifier.*;
import codeOrchestra.flex.processors.literal.*;
import codeOrchestra.flex.processors.misc.*;
import codeOrchestra.flex.processors.reference.*;
import codeOrchestra.flex.processors.terminalNode.*;
import codeOrchestra.flex.processors.transparent.*;
import codeOrchestra.flex.processors.unary.*;
import codeOrchestra.flex.processors.variableDeclaration.*;
import codeOrchestra.flex.processors.xml.*;
import jetbrains.mps.smodel.SNode;

import java.lang.reflect.InvocationTargetException;

/**
 * @author Anton.I.Neverov
 */
public enum Concept {

  // Binary expressions
  AccessExpression("AccessExpression", AccessExpressionProcessor.class), // Weird stuff
  AndAssignment("AndAssignment", AndAssignmentProcessor.class),
  AndExpression("AndExpression", AndExpressionProcessor.class),
  AsExpression("AsExpression", AsExpressionProcessor.class),
  AssignmentExpression("AssignmentExpression", AssignmentExpressionProcessor.class),
  BitwiseAndAssignment("BitwiseAndAssignment", BitwiseAndAssignmentProcessor.class),
  BitwiseAndExpression("BitwiseAndExpression", BitwiseAndExpressionProcessor.class),
  BitwiseLeftShiftAssignment("BitwiseLeftShiftAssignment", BitwiseLeftShiftAssignmentProcessor.class),
  BitwiseOrAssignment("BitwiseOrAssignment", BitwiseOrAssignmentProcessor.class),
  BitwiseOrExpression("BitwiseOrExpression", BitwiseOrExpressionProcessor.class),
  BitwiseRightShiftAssignment("BitwiseRightShiftAssignment", BitwiseRightShiftAssignmentProcessor.class),
  BitwiseUnsignedRightShiftAssignment("BitwiseUnsignedRightShiftAssignment", BitwiseUnsignedRightShiftAssignmentProcessor.class),
  BitwiseXorAssignment("BitwiseXorAssignment", BitwiseXorAssignmentProcessor.class),
  BitwiseXorExpression("BitwiseXorExpression", BitwiseXorExpressionProcessor.class),
  DivideAssignmentExpression("DivideAssignmentExpression", DivideAssignmentExpressionProcessor.class),
  DivideExpression("DivideExpression", DivideExpressionProcessor.class),
  DotExpression("DotExpression", DotExpressionProcessor.class), // Weird stuff
  E4XDescendantsExpression("E4XDescendantsExpression", E4XDescendantsExpressionProcessor.class),  // Same as DotExpression
  EqualsExpression("EqualsExpression", EqualsExpressionProcessor.class),
  GreaterThanExpression("GreaterThanExpression", GreaterThanExpressionProcessor.class),
  GreaterThanOrEqualsExpression("GreaterThanOrEqualsExpression", GreaterThanOrEqualsExpressionProcessor.class),
  InExpression("InExpression", InExpressionProcessor.class),
  InstanceOfExpression("InstanceOfExpression", InstanceOfExpressionProcessor.class),
  IsExpression("IsExpression", IsExpressionProcessor.class),
  LessThanExpression("LessThanExpression", LessThanExpressionProcessor.class),
  LessThanOrEqualsExpression("LessThanOrEqualsExpression", LessThanOrEqualsExpressionProcessor.class),
  MinusAssignmentExpression("MinusAssignmentExpression", MinusAssignmentExpressionProcessor.class),
  MinusExpression("MinusExpression", MinusExpressionProcessor.class),
  ModuloAssignmentExpression("ModuloAssignmentExpression", ModuloAssignmentExpressionProcessor.class),
  MultiplyAssignmentExpression("MultiplyAssignmentExpression", MultiplyAssignmentExpressionProcessor.class),
  MultiplyExpression("MultiplyExpression", MultiplyExpressionProcessor.class),
  NotEqualsExpression("NotEqualsExpression", NotEqualsExpressionProcessor.class),
  OrAssignment("OrAssignment", OrAssignmentProcessor.class),
  OrExpression("OrExpression", OrExpressionProcessor.class),
  PlusAssignmentExpression("PlusAssignmentExpression", PlusAssignmentExpressionProcessor.class),
  PlusExpression("PlusExpression", PlusExpressionProcessor.class),
  RemainderExpression("RemainderExpression", RemainderExpressionProcessor.class),
  ShiftLeftExpression("ShiftLeftExpression", ShiftLeftExpressionProcessor.class),
  ShiftRightExpresson("ShiftRightExpresson", ShiftRightExpressonProcessor.class),
  ShiftUnsignedRightExpresson("ShiftUnsignedRightExpresson", ShiftUnsignedRightExpressonProcessor.class),
  StrictEqualsExpression("StrictEqualsExpression", StrictEqualsExpressionProcessor.class),
  StrictNotEqualsExpression("StrictNotEqualsExpression", StrictNotEqualsExpressionProcessor.class),
  TernaryOperatorExpression("TernaryOperatorExpression", TernaryOperatorExpressionProcessor.class), // Weird stuff

  // Classifier
  ClassConcept("ClassConcept", ClassConceptProcessor.class),
  Interface("Interface", InterfaceProcessor.class),
  OutOfPackageClassConcept("OutOfPackageClassConcept", OutOfPackageClassConceptProcessor.class),
  OutOfPackageInterface("OutOfPackageInterface", OutOfPackageInterfaceProcessor.class),

  // Conditional nodes
  DoWhileStatement("DoWhileStatement", DoWhileStatementProcessor.class),
  ElsifClause("ElsifClause", ElsifClauseProcessor.class),
  SwitchCase("SwitchCase", SwitchCaseProcessor.class),
  SwitchStatement("SwitchStatement", SwitchStatementProcessor.class),
  WhileStatement("WhileStatement", WhileStatementProcessor.class),
  WithStatement("WithStatement", WithStatementProcessor.class),

  // Container Literals
  ArrayLiteral("ArrayLiteral", ArrayLiteralProcessor.class),
  ObjectLiteral("ObjectLiteral", ObjectLiteralProcessor.class),

  // Excluded Nodes
  ActualArgumentInfo("ActualArgumentInfo", ActualArgumentInfoProcessor.class),
  CommentedStatement("CommentedStatement", CommentedStatementProcessor.class),
  CommentedStatementsBlock("CommentedStatementsBlock", CommentedStatementsBlockProcessor.class),
  FieldEmptyLine("FieldEmptyLine", FieldEmptyLineProcessor.class),
  MethodEmptyLine("MethodEmptyLine", MethodEmptyLineProcessor.class),
  RemarkStatement("RemarkStatement", RemarkStatementProcessor.class),
  Statement("Statement", StatementProcessor.class),
  StaticFieldEmptyLine("StaticFieldEmptyLine", StaticFieldEmptyLineProcessor.class),
  StaticMethodEmptyLine("StaticMethodEmptyLine", StaticMethodEmptyLineProcessor.class),

  // For Statements
  ForStatement("ForStatement", ForStatementProcessor.class),
  ForeachStatement("ForeachStatement", ForeachStatementProcessor.class),
  ForInBinding_VariableDeclaration("ForInBinding_VariableDeclaration", ForInBinding_VariableDeclarationProcessor.class),
  ForInitialiser_Variable("ForInitialiser_Variable", ForInitialiser_VariableProcessor.class),
  ForInStatement("ForInStatement", ForInStatementProcessor.class),

  // Function calls
  CastExpression("CastExpression", CastExpressionProcessor.class),
  ClassCreator("ClassCreator", ClassCreatorProcessor.class),
  ClassFromExpressionCreator("ClassFromExpressionCreator", ClassFromExpressionCreatorProcessor.class),
  FunctionCall("FunctionCall", FunctionCallProcessor.class),
  GlobalFunctionCall("GlobalFunctionCall", GlobalFunctionCallProcessor.class),
  InstanceMethodCallOperation("InstanceMethodCallOperation", InstanceMethodCallOperationProcessor.class),
  LocalFunctionCall("LocalFunctionCall", LocalFunctionCallProcessor.class),
  StaticMethodCallOperation("StaticMethodCallOperation", StaticMethodCallOperationProcessor.class),
  SuperConstructorInvocation("SuperConstructorInvocation", SuperConstructorInvocationProcessor.class),
  VectorCreator("VectorCreator", VectorCreatorProcessor.class),

  // Function declarations
  AnonymousFunction("AnonymousFunction", AnonymousFunctionProcessor.class),
  ConstructorDeclaration("ConstructorDeclaration", ConstructorDeclarationProcessor.class),
  GlobalFunction("GlobalFunction", GlobalFunctionProcessor.class),
  InstanceGetterDeclaration("InstanceGetterDeclaration", InstanceGetterDeclarationProcessor.class),
  InstanceMethodDeclaration("InstanceMethodDeclaration", InstanceMethodDeclarationProcessor.class),
  InstanceSetterDeclaration("InstanceSetterDeclaration", InstanceSetterDeclarationProcessor.class),
  LocalFunctionDeclaration("LocalFunctionDeclaration", LocalFunctionDeclarationProcessor.class),
  OutOfPackageFunction("OutOfPackageFunction", OutOfPackageFunctionProcessor.class),
  StaticGetterDeclaration("StaticGetterDeclaration", StaticGetterDeclarationProcessor.class),
  StaticMethodDeclaration("StaticMethodDeclaration", StaticMethodDeclarationProcessor.class),
  StaticSetterDeclaration("StaticSetterDeclaration", StaticSetterDeclarationProcessor.class),

  // Identifiers
  ArgumentsExpression("ArgumentsExpression", ArgumentsExpressionProcessor.class),
  DynamicAccessOperation("DynamicAccessOperation", DynamicAccessOperationProcessor.class),
  DynamicClassifierType("DynamicClassifierType", DynamicClassifierTypeProcessor.class),
  DynamicNamespaceReference("DynamicNamespaceReference", DynamicNamespaceReferenceProcessor.class),
  E4XAttributeName("E4XAttributeName", E4XAttributeNameProcessor.class),
  NanLiteral("NanLiteral", NanLiteralProcessor.class),
  NegativeInfinity("NegativeInfinity", NegativeInfinityProcessor.class),
  PositiveInfinity("PositiveInfinity", PositiveInfinityProcessor.class),
  PrototypeOperation("PrototypeOperation", PrototypeOperationProcessor.class),
  UndefinedLiteral("UndefinedLiteral", UndefinedLiteralProcessor.class),

  // Iteration flow statements
  ContinueStatement("ContinueStatement", ContinueStatementProcessor.class),
  BreakStatement("BreakStatement", BreakStatementProcessor.class),

  // Language identifiers
  E4XAttributeStarToken("E4XAttributeStarToken", E4XAttributeStarTokenProcessor.class),
  E4XStarTokenOperation("E4XStarTokenOperation", E4XStarTokenOperationProcessor.class),
  LowerBoundType("LowerBoundType", LowerBoundTypeProcessor.class),
  ThisExpression("ThisExpression", ThisExpressionProcessor.class),
  SuperExpression("SuperExpression", SuperExpressionProcessor.class),
  VoidType("VoidType", VoidTypeProcessor.class),
  UpperBoundType("UpperBoundType", UpperBoundTypeProcessor.class),
  WildCardType("WildCardType", WildCardTypeProcessor.class),

  // Literals
  BooleanConstant("BooleanConstant", BooleanConstantProcessor.class),
  NullLiteral("NullLiteral", NullLiteralProcessor.class),
  NumberConstant("NumberConstant", NumberConstantProcessor.class),
  RegexpLiteral("RegexpLiteral", RegexpLiteralProcessor.class),
  StringApostropheLiteral("StringApostropheLiteral", StringApostropheLiteralProcessor.class),
  StringLiteral("StringLiteral", StringLiteralProcessor.class),

  // Misc
  AnnotationInstance("AnnotationInstance", AnnotationInstanceProcessor.class),
  BlockStatement("BlockStatement", BlockStatementProcessor.class),
  CatchClause("CatchClause", CatchClauseProcessor.class),
  ClassExpressionInternal("ClassExpressionInternal", ClassExpressionInternalProcessor.class),
  ConfigStatement("ConfigStatement", ConfigStatementProcessor.class),
  ConfigVariableExpression("ConfigVariableExpression", ConfigVariableExpressionProcessor.class),
  ExpressionList("ExpressionList", ExpressionListProcessor.class),
  GenericNewExpression("GenericNewExpression", GenericNewExpressionProcessor.class),
  IfStatement("IfStatement", IfStatementProcessor.class),
  LocalVariableDeclarationStatement("LocalVariableDeclarationStatement", LocalVariableDeclarationStatementProcessor.class),
  ObjectLiteralParameter("ObjectLiteralParameter", ObjectLiteralParameterProcessor.class),
  OutOfPackageScript("OutOfPackageScript", OutOfPackageScriptProcessor.class),
  ReturnStatement("ReturnStatement", ReturnStatementProcessor.class),
  TryStatement("TryStatement", TryStatementProcessor.class),
  UseNamespaceStatement("UseNamespaceStatement", UseNamespaceStatementProcessor.class),

  // References
  CatchClauseVariableReference("CatchClauseVariableReference", CatchClauseVariableReferenceProcessor.class),
  ClassExpression("ClassExpression", ClassExpressionProcessor.class),
  ClassifierType("ClassifierType", ClassifierTypeProcessor.class),
  FieldReferenceOperation("FieldReferenceOperation", FieldReferenceOperationProcessor.class),
  GlobalFunctionReference("GlobalFunctionReference", GlobalFunctionReferenceProcessor.class),
  InstanceGetterReference("InstanceGetterReference", InstanceGetterReferenceProcessor.class),
  InstanceMethodReference("InstanceMethodReference", InstanceMethodReferenceProcessor.class),
  InstanceSetterReference("InstanceSetterReference", InstanceSetterReferenceProcessor.class),
  LocalFunctionReference("LocalFunctionReference", LocalFunctionReferenceProcessor.class),
  LocalVariableReference("LocalVariableReference", LocalVariableReferenceProcessor.class),
  LoopLabelReference("LoopLabelReference", LoopLabelReferenceProcessor.class),
  NamespaceDeclarationReference("NamespaceDeclarationReference", NamespaceDeclarationReferenceProcessor.class),
  ParameterReference("ParameterReference", ParameterReferenceProcessor.class),
  StaticFieldReferenceOperation("StaticFieldReferenceOperation", StaticFieldReferenceOperationProcessor.class),
  StaticGetterReference("StaticGetterReference", StaticGetterReferenceProcessor.class),
  StaticMethodReferenceOperation("StaticMethodReferenceOperation", StaticMethodReferenceOperationProcessor.class),
  StaticSetterReference("StaticSetterReference", StaticSetterReferenceProcessor.class),

  // Terminal nodes
  // ElseBlock - there is no such concept, it is actually BlockStatement and it's processor is directly called by IfStatementProcessor
  FinallyBlock("FinallyBlock", FinallyBlockProcessor.class),
  DefaultSwitchCase("DefaultSwitchCase", DefaultSwitchCaseProcessor.class),

  // Transparent nodes
  Condition("Condition", ConditionProcessor.class),
  E4XAttributeAccess("E4XAttributeAccess", E4XAttributeAccessProcessor.class),
  E4XCondition("E4XCondition", E4XConditionProcessor.class),
  ExpressionStatement("ExpressionStatement", ExpressionStatementProcessor.class),
  ForInBinding_VariableReference("ForInBinding_VariableReference", ForInBinding_VariableReferenceProcessor.class),
  ForInitialiser_Expression("ForInitialiser_Expression", ForInitialiser_ExpressionProcessor.class),
  OperationExpression("OperationExpression", OperationExpressionProcessor.class),
  ParenthesizedExpression("ParenthesizedExpression", ParenthesizedExpressionProcessor.class),
  TopLevelConstant("TopLevelConstant", TopLevelConstantProcessor.class),
  TopLevelNamespace("TopLevelNamespace", TopLevelNamespaceProcessor.class),
  WithAccessOperationExpression("WithAccessOperationExpression", WithAccessOperationExpressionProcessor.class),
  XmlTemplate("XmlTemplate", XmlTemplateProcessor.class),

  // Unary expressions
  BitwiseNotExpression("BitwiseNotExpression", BitwiseNotExpressionProcessor.class),
  DefaultXmlNamespaceStatement("DefaultXmlNamespaceStatement", DefaultXmlNamespaceStatementProcessor.class),
  DeleteExpression("DeleteExpression", DeleteExpressionProcessor.class),
  E4XAttributeList("E4XAttributeList", E4XAttributeListProcessor.class),
  E4XAttributeExpression("E4XAttributeExpression", E4XAttributeExpressionProcessor.class),
  NotExpression("NotExpression", NotExpressionProcessor.class),
  PostfixDecrementExpression("PostfixDecrementExpression", PostfixDecrementExpressionProcessor.class),
  PostfixIncrementExpression("PostfixIncrementExpression", PostfixIncrementExpressionProcessor.class),
  PrefixDecrementExpression("PrefixDecrementExpression", PrefixDecrementExpressionProcessor.class),
  PrefixIncrementExpression("PrefixIncrementExpression", PrefixIncrementExpressionProcessor.class),
  ThrowStatement("ThrowStatement", ThrowStatementProcessor.class),
  TypeOfExpression("TypeOfExpression", TypeOfExpressionProcessor.class),
  UnaryMinus("UnaryMinus", UnaryMinusProcessor.class),
  UnaryPlus("UnaryPlus", UnaryPlusProcessor.class),

  // Variable declarations
  CatchClauseVariableDeclaration("CatchClauseVariableDeclaration", CatchClauseVariableDeclarationProcessor.class),
  FieldDeclaration("FieldDeclaration", FieldDeclarationProcessor.class),
  LocalVariableDeclaration("LocalVariableDeclaration", LocalVariableDeclarationProcessor.class),
  NamespaceDeclaration("NamespaceDeclaration", NamespaceDeclarationProcessor.class),
  OutOfPackageConstant("OutOfPackageConstant", OutOfPackageConstantProcessor.class),
  OutOfPackageNamespaceDeclaration("OutOfPackageNamespaceDeclaration", OutOfPackageNamespaceDeclarationProcessor.class),
  ParameterDeclaration("ParameterDeclaration", ParameterDeclarationProcessor.class),
  StaticFieldDeclaration("StaticFieldDeclaration", StaticFieldDeclarationProcessor.class),
  TopLevelConstantDeclaration("TopLevelConstantDeclaration", TopLevelConstantDeclarationProcessor.class),
  VarargsParameter("VarargsParameter", VarargsParameterProcessor.class),

  // XML
  XmlAttribute("XmlAttribute", XmlAttributeProcessor.class),
  XmlAttributeName("XmlAttributeName", XmlAttributeNameProcessor.class),
  XmlAttributeValue("XmlAttributeValue", XmlAttributeValueProcessor.class),
  XmlCDATANode("XmlCDATANode", XmlCDATANodeProcessor.class),
  XmlCommentNode("XmlCommentNode", XmlCommentNodeProcessor.class),
  XmlExpression("XmlExpression", XmlExpressionProcessor.class),
  XmlElementNode("XmlElementNode", XmlElementNodeProcessor.class),
  XmlElementNodeName("XmlElementNodeName", XmlElementNodeNameProcessor.class),
  XmlElementNodeName_last("XmlElementNodeName_last", XmlElementNodeName_lastProcessor.class),
  XmlNodeList("XmlNodeList", XmlNodeListProcessor.class),
  XmlProcessingInstructionNode("XmlProcessingInstructionNode", XmlProcessingInstructionNodeProcessor.class),
  XmlTextNode("XmlTextNode", XmlTextNodeProcessor.class),

  // Concepts without processor
  AnnotationDeclaration("AnnotationDeclaration", null),
  AnnotationPropertyValue("AnnotationPropertyValue", null),
  ClassStaticInitializer("ClassStaticInitializer", null),
  ConfigVisibility("ConfigVisibility", null),
  DynamicNamespaceVisibility("DynamicNamespaceVisibility", null),
  GlobalFunctionGetModifier("GlobalFunctionGetModifier", null),
  GlobalFunctionSetModifier("GlobalFunctionSetModifier", null),
  InternalVisibility("InternalVisibility", null),
  NamespaceVisibility("NamespaceVisibility", null),
  PrivateVisibility("PrivateVisibility", null),
  ProtectedVisibility("ProtectedVisibility", null),
  PublicVisibility("PublicVisibility", null),
  StatementLabel("StatementLabel", null),
  StatementList("StatementList", null),
  XmlNamespace("XmlNamespace", null);

  Concept(String name, Class<? extends SNodeProcessor> clazz) {
    // we are working only with codeOrchestra.actionScript language
    conceptFQName = "codeOrchestra.actionScript.structure." + name;
    // clazz can be null - not all concepts need processors
    processorClass = clazz;
  }

  private String conceptFQName;
  private Class<? extends SNodeProcessor> processorClass;

  public String getName() {
    return conceptFQName;
  }

  public SNodeProcessor createProcessor(SNode node) throws SNodeProcessorException {
    if (processorClass == null) {
      throw new SNodeProcessorException();
    }
    try {
      return processorClass.getDeclaredConstructor(SNode.class).newInstance(node);
    } catch (InstantiationException e) {
      throw new SNodeProcessorException(e);
    } catch (IllegalAccessException e) {
      throw new SNodeProcessorException(e);
    } catch (InvocationTargetException e) {
      throw new SNodeProcessorException(e);
    } catch (NoSuchMethodException e) {
      throw new SNodeProcessorException(e);
    }
  }
}
