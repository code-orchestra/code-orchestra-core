<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:49b10014-fe6b-4682-a69d-1c3d6188eba3(jetbrains.mps.bash.structure)">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="3f4bc5f5-c6c1-4a28-8b10-c83066ffa4a1(jetbrains.mps.lang.constraints)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="u9e0" modelUID="r:49b10014-fe6b-4682-a69d-1c3d6188eba3(jetbrains.mps.bash.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3321051580269894529">
      <property name="name" nameId="tpck.1169194664001" value="CommandList" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8457058248751600625" resolveInfo="InputLine" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3321051580269917239">
      <property name="name" nameId="tpck.1169194664001" value="InputLines" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3321051580269925631">
      <property name="name" nameId="tpck.1169194664001" value="ShellScript" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3321051580270055527">
      <property name="name" nameId="tpck.1169194664001" value="SimpleCommand" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3321051580272063536">
      <property name="name" nameId="tpck.1169194664001" value="WordList" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3321051580273150841">
      <property name="name" nameId="tpck.1169194664001" value="AsyncOperator" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="commandlist" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8474643070102636489" resolveInfo="FollowingCommandList" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109503378338">
      <property name="name" nameId="tpck.1169194664001" value="CommandTerminator" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="terminator" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109503378340">
      <property name="name" nameId="tpck.1169194664001" value="SemicolonTerminator" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="terminator" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109503378338" resolveInfo="CommandTerminator" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109503906472">
      <property name="name" nameId="tpck.1169194664001" value="AsyncTerminator" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="terminator" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109503378338" resolveInfo="CommandTerminator" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109504426807">
      <property name="name" nameId="tpck.1169194664001" value="AbstractLoopCommand" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="loop" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109504426811">
      <property name="name" nameId="tpck.1169194664001" value="UntilLoopCommand" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="loop" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426807" resolveInfo="AbstractLoopCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109504426816">
      <property name="name" nameId="tpck.1169194664001" value="AbstractCommand" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3905757829901343108" resolveInfo="Command" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109504960433">
      <property name="name" nameId="tpck.1169194664001" value="WhileLoopCommand" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="loop" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426807" resolveInfo="AbstractLoopCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109506044887">
      <property name="name" nameId="tpck.1169194664001" value="ForeachCommand" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="loop" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426807" resolveInfo="AbstractLoopCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109506263695">
      <property name="name" nameId="tpck.1169194664001" value="VariableNameDeclaration" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902187955342" resolveInfo="LValue" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109507052112">
      <property name="name" nameId="tpck.1169194664001" value="ForCommand" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="loop" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426807" resolveInfo="AbstractLoopCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109507193260">
      <property name="name" nameId="tpck.1169194664001" value="ArithmeticExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109508737477">
      <property name="name" nameId="tpck.1169194664001" value="IfCommand" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="if" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109508737482">
      <property name="name" nameId="tpck.1169194664001" value="ElifCommand" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="if" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109510962907">
      <property name="name" nameId="tpck.1169194664001" value="CaseClause" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="case" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109511075340">
      <property name="name" nameId="tpck.1169194664001" value="CaseCommand" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="case" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109511424701">
      <property name="name" nameId="tpck.1169194664001" value="DoubleSemicolon" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="case" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109511764425" resolveInfo="CaseTerminator" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109511764425">
      <property name="name" nameId="tpck.1169194664001" value="CaseTerminator" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="case" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109512234531">
      <property name="name" nameId="tpck.1169194664001" value="SemicolonEt" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="case" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109511764425" resolveInfo="CaseTerminator" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109512234535">
      <property name="name" nameId="tpck.1169194664001" value="DoubleSemicolonEt" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="case" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109511764425" resolveInfo="CaseTerminator" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109512452300">
      <property name="name" nameId="tpck.1169194664001" value="SelectCommand" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109512908785">
      <property name="name" nameId="tpck.1169194664001" value="GroupingCommand" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="grouping" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109512908807">
      <property name="name" nameId="tpck.1169194664001" value="BraceGrouping" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="grouping" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109512908785" resolveInfo="GroupingCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7633559109513036752">
      <property name="name" nameId="tpck.1169194664001" value="BracketGrouping" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="grouping" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109512908785" resolveInfo="GroupingCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467437060443">
      <property name="name" nameId="tpck.1169194664001" value="BinaryArithmeticExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467437322736">
      <property name="name" nameId="tpck.1169194664001" value="MulExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467437426994">
      <property name="name" nameId="tpck.1169194664001" value="DivExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467437426998">
      <property name="name" nameId="tpck.1169194664001" value="ModExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467437531349">
      <property name="name" nameId="tpck.1169194664001" value="AddExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467437531353">
      <property name="name" nameId="tpck.1169194664001" value="SubExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467437635795">
      <property name="name" nameId="tpck.1169194664001" value="ArithmeticCommand" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438007066">
      <property name="name" nameId="tpck.1169194664001" value="UnaryArithmeticExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438007070">
      <property name="name" nameId="tpck.1169194664001" value="PostVariableExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3263637656462020094" resolveInfo="WordExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438007071">
      <property name="name" nameId="tpck.1169194664001" value="PreVariableExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3263637656462020094" resolveInfo="WordExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438131840">
      <property name="name" nameId="tpck.1169194664001" value="PostIncExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467438007070" resolveInfo="PostVariableExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438131844">
      <property name="name" nameId="tpck.1169194664001" value="PostDecExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467438007070" resolveInfo="PostVariableExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438131846">
      <property name="name" nameId="tpck.1169194664001" value="PreIncExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467438007071" resolveInfo="PreVariableExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438131848">
      <property name="name" nameId="tpck.1169194664001" value="PreDecExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467438007071" resolveInfo="PreVariableExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438341715">
      <property name="name" nameId="tpck.1169194664001" value="UnaryPlusExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467438007066" resolveInfo="UnaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438341718">
      <property name="name" nameId="tpck.1169194664001" value="UnaryMinusExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467438007066" resolveInfo="UnaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438551654">
      <property name="name" nameId="tpck.1169194664001" value="LogicalNegationExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467438007066" resolveInfo="UnaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438551656">
      <property name="name" nameId="tpck.1169194664001" value="BitwiseNegationExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467438007066" resolveInfo="UnaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438656709">
      <property name="name" nameId="tpck.1169194664001" value="ExpExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438761808">
      <property name="name" nameId="tpck.1169194664001" value="LeftBitwiseShiftExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438761812">
      <property name="name" nameId="tpck.1169194664001" value="RightBitwiseShiftExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438761816">
      <property name="name" nameId="tpck.1169194664001" value="EqualityExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438761818">
      <property name="name" nameId="tpck.1169194664001" value="InequalityExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438901253">
      <property name="name" nameId="tpck.1169194664001" value="BitwiseAndExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438901261">
      <property name="name" nameId="tpck.1169194664001" value="BitwiseOrExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438901265">
      <property name="name" nameId="tpck.1169194664001" value="BitwiseXorExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438901269">
      <property name="name" nameId="tpck.1169194664001" value="LogicalAndExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467438901274">
      <property name="name" nameId="tpck.1169194664001" value="LogicalOrExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467439118728">
      <property name="name" nameId="tpck.1169194664001" value="CommaExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467439274728">
      <property name="name" nameId="tpck.1169194664001" value="IntegerLiteral" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="number" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467439274730">
      <property name="name" nameId="tpck.1169194664001" value="DecimalConstant" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="number" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467439274728" resolveInfo="IntegerLiteral" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467439274735">
      <property name="name" nameId="tpck.1169194664001" value="HexIntegerLiteral" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="number" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467439274728" resolveInfo="IntegerLiteral" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467439473295">
      <property name="name" nameId="tpck.1169194664001" value="BasedIntegerLiteral" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="number" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467439274728" resolveInfo="IntegerLiteral" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467439714972">
      <property name="name" nameId="tpck.1169194664001" value="BracketExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467439962835">
      <property name="name" nameId="tpck.1169194664001" value="GreaterThanExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467439962839">
      <property name="name" nameId="tpck.1169194664001" value="LessThanExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467439962845">
      <property name="name" nameId="tpck.1169194664001" value="GreaterThanOrEqualExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440016189">
      <property name="name" nameId="tpck.1169194664001" value="LessThanOrEqualExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467437060443" resolveInfo="BinaryArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440108301">
      <property name="name" nameId="tpck.1169194664001" value="ConditionalOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440224562">
      <property name="name" nameId="tpck.1169194664001" value="BaseAssingmentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.assingments" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440353749">
      <property name="name" nameId="tpck.1169194664001" value="AssingmentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.assingments" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467440224562" resolveInfo="BaseAssingmentExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440353754">
      <property name="name" nameId="tpck.1169194664001" value="PlusAssingmentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.assingments" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467440224562" resolveInfo="BaseAssingmentExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440353758">
      <property name="name" nameId="tpck.1169194664001" value="MinusAssingmentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.assingments" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467440224562" resolveInfo="BaseAssingmentExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440353762">
      <property name="name" nameId="tpck.1169194664001" value="MusAssingmentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.assingments" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467440224562" resolveInfo="BaseAssingmentExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440353767">
      <property name="name" nameId="tpck.1169194664001" value="DivAssingmentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.assingments" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467440224562" resolveInfo="BaseAssingmentExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440460343">
      <property name="name" nameId="tpck.1169194664001" value="ModAssingmentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.assingments" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467440224562" resolveInfo="BaseAssingmentExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440460347">
      <property name="name" nameId="tpck.1169194664001" value="LeftShiftAssingmentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.assingments" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467440224562" resolveInfo="BaseAssingmentExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440460351">
      <property name="name" nameId="tpck.1169194664001" value="RightShiftAssingmentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.assingments" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467440224562" resolveInfo="BaseAssingmentExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440567065">
      <property name="name" nameId="tpck.1169194664001" value="AndAssingmentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.assingments" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467440224562" resolveInfo="BaseAssingmentExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440567069">
      <property name="name" nameId="tpck.1169194664001" value="OrAssingmentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.assingments" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467440224562" resolveInfo="BaseAssingmentExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467440697258">
      <property name="name" nameId="tpck.1169194664001" value="XorAssingmentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.assingments" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467440224562" resolveInfo="BaseAssingmentExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467441205664">
      <property name="name" nameId="tpck.1169194664001" value="BaseVariableAssingment" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467441325687">
      <property name="name" nameId="tpck.1169194664001" value="VariableAssingment" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467441205664" resolveInfo="BaseVariableAssingment" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467442053841">
      <property name="name" nameId="tpck.1169194664001" value="BasicParameterExpansion" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3999172467442724020">
      <property name="name" nameId="tpck.1169194664001" value="ArithmeticExpansion" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8353259571483751823">
      <property name="name" nameId="tpck.1169194664001" value="TildeExpansion" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8353259571483884165">
      <property name="name" nameId="tpck.1169194664001" value="GeneralizedWord" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="8353259571485353278">
      <property name="name" nameId="tpck.1169194664001" value="IGeneralizedWordUnit" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8353259571485353280">
      <property name="name" nameId="tpck.1169194664001" value="SimpleWord" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468235197585">
      <property name="name" nameId="tpck.1169194664001" value="BaseCommandSubstitution" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468235197608">
      <property name="name" nameId="tpck.1169194664001" value="QuotesCommandSubstitution" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468235197585" resolveInfo="BaseCommandSubstitution" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468235331236">
      <property name="name" nameId="tpck.1169194664001" value="BuckCommandSubstitution" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468235197585" resolveInfo="BaseCommandSubstitution" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468235439117">
      <property name="name" nameId="tpck.1169194664001" value="RedirectedCommand" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468235439120">
      <property name="name" nameId="tpck.1169194664001" value="Redirection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468235580318">
      <property name="name" nameId="tpck.1169194664001" value="InputRedirection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468235580340" resolveInfo="IORedirection" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468235580337">
      <property name="name" nameId="tpck.1169194664001" value="OutputRedirection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468235580340" resolveInfo="IORedirection" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468235580340">
      <property name="name" nameId="tpck.1169194664001" value="IORedirection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468235439120" resolveInfo="Redirection" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468235866604">
      <property name="name" nameId="tpck.1169194664001" value="AppendingOutputRedirection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468235580340" resolveInfo="IORedirection" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468236240462">
      <property name="name" nameId="tpck.1169194664001" value="OutputErrorRedirection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468235439120" resolveInfo="Redirection" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468236365434">
      <property name="name" nameId="tpck.1169194664001" value="AppendingOutputErrorRedirection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468235439120" resolveInfo="Redirection" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="4857814468237147395">
      <property name="name" nameId="tpck.1169194664001" value="IToWordRedirection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468237284479">
      <property name="name" nameId="tpck.1169194664001" value="HereDocumentRedirection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468235439120" resolveInfo="Redirection" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468237475269">
      <property name="name" nameId="tpck.1169194664001" value="HereStringRedirection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468235439120" resolveInfo="Redirection" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468237475279">
      <property name="name" nameId="tpck.1169194664001" value="DuplicateInputFileDiscriptor" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468235580340" resolveInfo="IORedirection" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468237475293">
      <property name="name" nameId="tpck.1169194664001" value="DuplicateOutputFileDiscriptor" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468235580340" resolveInfo="IORedirection" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468237475306">
      <property name="name" nameId="tpck.1169194664001" value="ReadingWritingRedirection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="redirections" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468235580340" resolveInfo="IORedirection" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468237520690">
      <property name="name" nameId="tpck.1169194664001" value="FunctionDeclaration" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="4857814468237560638">
      <property name="name" nameId="tpck.1169194664001" value="ICompoundCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468237744075">
      <property name="name" nameId="tpck.1169194664001" value="FunctionCallCommand" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468241254994">
      <property name="name" nameId="tpck.1169194664001" value="ExternalCommandDeclaration" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468241254997">
      <property name="name" nameId="tpck.1169194664001" value="ExternalCommandCall" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468241607048">
      <property name="name" nameId="tpck.1169194664001" value="ExternalOptionReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468242547367">
      <property name="name" nameId="tpck.1169194664001" value="OptionSet" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468241255113" resolveInfo="ExternalOptionDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468242547369">
      <property name="name" nameId="tpck.1169194664001" value="Option" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468243308834">
      <property name="name" nameId="tpck.1169194664001" value="OptionWithParam" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468241255113" resolveInfo="ExternalOptionDeclaration" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="4857814468243514690">
      <property name="name" nameId="tpck.1169194664001" value="ISymbolConcept" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="4857814468243514698">
      <property name="name" nameId="tpck.1169194664001" value="IDescribedConcept" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468241255113">
      <property name="name" nameId="tpck.1169194664001" value="ExternalOptionDeclaration" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7803330421057156061">
      <property name="name" nameId="tpck.1169194664001" value="OptionSetReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468241607048" resolveInfo="ExternalOptionReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7803330421057519636">
      <property name="name" nameId="tpck.1169194664001" value="OptionReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7803330421058939228">
      <property name="name" nameId="tpck.1169194664001" value="OptionWithParamReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468241607048" resolveInfo="ExternalOptionReference" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="7803330421059359220">
      <property name="name" nameId="tpck.1169194664001" value="ICommandParameter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7803330421058150857">
      <property name="name" nameId="tpck.1169194664001" value="ArgumentReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468241607048" resolveInfo="ExternalOptionReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4857814468243911286">
      <property name="name" nameId="tpck.1169194664001" value="Argument" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468241255113" resolveInfo="ExternalOptionDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3147078024743869739">
      <property name="name" nameId="tpck.1169194664001" value="ArgumentList" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468241255113" resolveInfo="ExternalOptionDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3147078024744633269">
      <property name="name" nameId="tpck.1169194664001" value="ArgumentListReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="external" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4857814468241607048" resolveInfo="ExternalOptionReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3147078024747082354">
      <property name="name" nameId="tpck.1169194664001" value="ConditionalCommand" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3147078024751877531">
      <property name="name" nameId="tpck.1169194664001" value="QuotedWord" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="3147078024759753552">
      <property name="name" nameId="tpck.1169194664001" value="IConcreteWordUnit" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3263637656455059140">
      <property name="name" nameId="tpck.1169194664001" value="SingleQuote" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3147078024751877531" resolveInfo="QuotedWord" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3263637656455059166">
      <property name="name" nameId="tpck.1169194664001" value="DoubleQuote" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3147078024751877531" resolveInfo="QuotedWord" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="3263637656461715717">
      <property name="name" nameId="tpck.1169194664001" value="IPriorityExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3263637656462020094">
      <property name="name" nameId="tpck.1169194664001" value="WordExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8457058248751600625">
      <property name="name" nameId="tpck.1169194664001" value="InputLine" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8457058248751696156">
      <property name="name" nameId="tpck.1169194664001" value="CommentedCommandList" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="comment" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8457058248751600625" resolveInfo="InputLine" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8474643070102636479">
      <property name="name" nameId="tpck.1169194664001" value="HeadCommandList" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="commandlist" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8474643070102636489">
      <property name="name" nameId="tpck.1169194664001" value="FollowingCommandList" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="commandlist" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8474643070110067629" resolveInfo="AbstractFollowingCommandList" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8474643070102636535">
      <property name="name" nameId="tpck.1169194664001" value="AndOperator" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="commandlist" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8474643070102636489" resolveInfo="FollowingCommandList" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8474643070102636539">
      <property name="name" nameId="tpck.1169194664001" value="OrOperator" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="commandlist" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8474643070102636489" resolveInfo="FollowingCommandList" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8474643070110067628">
      <property name="name" nameId="tpck.1169194664001" value="CommentedFollowingCommandList" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="comment" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8474643070110067629" resolveInfo="AbstractFollowingCommandList" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8474643070110067629">
      <property name="name" nameId="tpck.1169194664001" value="AbstractFollowingCommandList" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="commandlist" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8474643070110245381">
      <property name="name" nameId="tpck.1169194664001" value="HeadPipeline" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="pipeline" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8474643070111818349">
      <property name="name" nameId="tpck.1169194664001" value="FollowingPipeline" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="pipeline" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8474643070111988418">
      <property name="name" nameId="tpck.1169194664001" value="PipelineOperatorConnection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="pipeline" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8474643070111818349" resolveInfo="FollowingPipeline" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8474643070111988431">
      <property name="name" nameId="tpck.1169194664001" value="PipelineOperatorErrorConnection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="pipeline" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8474643070111818349" resolveInfo="FollowingPipeline" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8457058248751600624">
      <property name="name" nameId="tpck.1169194664001" value="CommentedText" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="comment" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3905757829901343108">
      <property name="name" nameId="tpck.1169194664001" value="Command" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="4515773109208483475">
      <property name="name" nameId="tpck.1169194664001" value="IComment" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="comment" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="4515773109209587383">
      <property name="name" nameId="tpck.1169194664001" value="IArithmeticHolder" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902187955342">
      <property name="name" nameId="tpck.1169194664001" value="LValue" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902187955344">
      <property name="name" nameId="tpck.1169194664001" value="VariableReference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902187955342" resolveInfo="LValue" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439561">
      <property name="name" nameId="tpck.1169194664001" value="ConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439562">
      <property name="name" nameId="tpck.1169194664001" value="UnaryConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439561" resolveInfo="ConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439577">
      <property name="name" nameId="tpck.1169194664001" value="ExistConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439584">
      <property name="name" nameId="tpck.1169194664001" value="BlockFileConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439590">
      <property name="name" nameId="tpck.1169194664001" value="CharFileConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439594">
      <property name="name" nameId="tpck.1169194664001" value="DirectoryConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439598">
      <property name="name" nameId="tpck.1169194664001" value="OtherExistConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439602">
      <property name="name" nameId="tpck.1169194664001" value="RegularFileConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439606">
      <property name="name" nameId="tpck.1169194664001" value="GroupIdConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439610">
      <property name="name" nameId="tpck.1169194664001" value="SymlinkConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439614">
      <property name="name" nameId="tpck.1169194664001" value="StickyBitConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439618">
      <property name="name" nameId="tpck.1169194664001" value="PipeConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439622">
      <property name="name" nameId="tpck.1169194664001" value="ReadTestConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439626">
      <property name="name" nameId="tpck.1169194664001" value="SizeConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191439630">
      <property name="name" nameId="tpck.1169194664001" value="TerminalConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191515046">
      <property name="name" nameId="tpck.1169194664001" value="UserIdConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191515051">
      <property name="name" nameId="tpck.1169194664001" value="WriteTestConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191515055">
      <property name="name" nameId="tpck.1169194664001" value="ExecTestConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191515059">
      <property name="name" nameId="tpck.1169194664001" value="EffectiveUserIdConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191515063">
      <property name="name" nameId="tpck.1169194664001" value="EffectiveGroupIdConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191515067">
      <property name="name" nameId="tpck.1169194664001" value="OtherSymlinkConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191515071">
      <property name="name" nameId="tpck.1169194664001" value="SocketConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191515075">
      <property name="name" nameId="tpck.1169194664001" value="LastReadConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191629585">
      <property name="name" nameId="tpck.1169194664001" value="OptnameStringConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191629589">
      <property name="name" nameId="tpck.1169194664001" value="ZeroStringConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191629593">
      <property name="name" nameId="tpck.1169194664001" value="NonZeroStringConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.unary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439562" resolveInfo="UnaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191629597">
      <property name="name" nameId="tpck.1169194664001" value="StringConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439561" resolveInfo="ConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191635402">
      <property name="name" nameId="tpck.1169194664001" value="BinaryConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439561" resolveInfo="ConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191635417">
      <property name="name" nameId="tpck.1169194664001" value="NewerThan" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191635424">
      <property name="name" nameId="tpck.1169194664001" value="OlderThan" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191635429">
      <property name="name" nameId="tpck.1169194664001" value="SameReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191635435">
      <property name="name" nameId="tpck.1169194664001" value="EqualityStrings" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191635439">
      <property name="name" nameId="tpck.1169194664001" value="InequalityStrings" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191635443">
      <property name="name" nameId="tpck.1169194664001" value="LessThanString" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902191635449">
      <property name="name" nameId="tpck.1169194664001" value="GreaterThanString" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="9034131902193581134">
      <property name="name" nameId="tpck.1169194664001" value="FreeCommand" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2362837471606677323">
      <property name="name" nameId="tpck.1169194664001" value="SemicolonOperator" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="commandlist" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8474643070102636489" resolveInfo="FollowingCommandList" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2362837471610329787">
      <property name="name" nameId="tpck.1169194664001" value="VariableAddAssingment" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3999172467441205664" resolveInfo="BaseVariableAssingment" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2362837471611764246">
      <property name="name" nameId="tpck.1169194664001" value="NotCommand" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2362837471611859389">
      <property name="name" nameId="tpck.1169194664001" value="InequalityNumber" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2362837471611859394">
      <property name="name" nameId="tpck.1169194664001" value="EqualityNumber" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2362837471611859396">
      <property name="name" nameId="tpck.1169194664001" value="LessThanNumber" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2362837471611859400">
      <property name="name" nameId="tpck.1169194664001" value="LessThanOrEqualNumber" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2362837471611859404">
      <property name="name" nameId="tpck.1169194664001" value="GreaterThanNumber" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2362837471611859408">
      <property name="name" nameId="tpck.1169194664001" value="GreaterThanOrEqual" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2362837471611859413">
      <property name="name" nameId="tpck.1169194664001" value="CombiningConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.combine" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439561" resolveInfo="ConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2362837471611859429">
      <property name="name" nameId="tpck.1169194664001" value="AndCombiningComditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.combine" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="2362837471611859413" resolveInfo="CombiningConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2362837471611859434">
      <property name="name" nameId="tpck.1169194664001" value="OrCombiningConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.combine" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="2362837471611859413" resolveInfo="CombiningConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2362837471611859440">
      <property name="name" nameId="tpck.1169194664001" value="BracketConditionalExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.combine" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191439561" resolveInfo="ConditionalExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="898011086340135411">
      <property name="name" nameId="tpck.1169194664001" value="EqualityStrings2" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="expressions.conditional.binary" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="9034131902191635402" resolveInfo="BinaryConditionalExpression" />
    </node>
  </roots>
  <root id="3321051580269894529">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3321051580273150845">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="head" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8474643070102636479" resolveInfo="HeadCommandList" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109503378344">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="terminator" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109503378338" resolveInfo="CommandTerminator" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2635812496400429929">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="comment" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8457058248751600624" resolveInfo="CommentedText" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3905757829894626361">
      <property name="value" nameId="tpce.1105725733873" value="command list" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3321051580269917239">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3321051580270635008">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="lines" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8457058248751600625" resolveInfo="InputLine" />
    </node>
  </root>
  <root id="3321051580269925631">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="9034131902190735828">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="usedVars" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109506263695" resolveInfo="VariableNameDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3321051580270016552">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="commands" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580269917239" resolveInfo="InputLines" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="6382090206696688456">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
  </root>
  <root id="3321051580270055527">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688201">
      <property name="value" nameId="tpce.1105725733873" value="some command" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3321051580270258991">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3321051580272063551">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="paramList" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580272063536" resolveInfo="WordList" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109510383038">
      <property name="value" nameId="tpce.1105725733873" value="command" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3321051580272063536">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3321051580272063542">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="words" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688724">
      <property name="value" nameId="tpce.1105725733873" value="list of words" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="3321051580273150841">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688731">
      <property name="value" nameId="tpce.1105725733873" value="&amp; operator" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8474643070109792261">
      <property name="value" nameId="tpce.1105725733873" value="&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3321051580273150842">
      <property name="value" nameId="tpce.1105725733873" value="&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="8474643070102636523" resolveInfo="operator" />
    </node>
  </root>
  <root id="7633559109503378338">
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="7633559109503378339">
      <property name="name" nameId="tpck.1169194664001" value="terminator" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="7633559109503378342">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="7633559109503378340">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109504015525">
      <property name="value" nameId="tpce.1105725733873" value=";" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109503378341">
      <property name="value" nameId="tpce.1105725733873" value=";" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="7633559109503378339" resolveInfo="terminator" />
    </node>
  </root>
  <root id="7633559109503906472">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563775005">
      <property name="value" nameId="tpce.1105725733873" value="async command execution" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109504015523">
      <property name="value" nameId="tpce.1105725733873" value="&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109503906473">
      <property name="value" nameId="tpce.1105725733873" value="&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="7633559109503378339" resolveInfo="terminator" />
    </node>
  </root>
  <root id="7633559109504426807">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109504426808">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="commands" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580269917239" resolveInfo="InputLines" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="7633559109509648827">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468237560639">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468237560638" resolveInfo="ICompoundCommand" />
    </node>
  </root>
  <root id="7633559109504426811">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688773">
      <property name="value" nameId="tpce.1105725733873" value="until test-command; do" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109504426812">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="testCommand" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109504858099">
      <property name="value" nameId="tpce.1105725733873" value="until" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7633559109504426816">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="2635812496400337918">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3905757829907119554">
      <property name="value" nameId="tpce.1105725733873" value="abstract command" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7633559109504960433">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688775">
      <property name="value" nameId="tpce.1105725733873" value="while test-command; do" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109505070366">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="testCommand" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109505403994">
      <property name="value" nameId="tpce.1105725733873" value="while" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7633559109506044887">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688771">
      <property name="value" nameId="tpce.1105725733873" value="for name [in words]" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109509545633">
      <property name="value" nameId="tpce.1105725733873" value="for" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109506274372">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="variable" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109506263695" resolveInfo="VariableNameDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109506274411">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="wordList" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580272063536" resolveInfo="WordList" />
    </node>
  </root>
  <root id="7633559109506263695">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="7633559109506263696">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611764225">
      <property name="value" nameId="tpce.1105725733873" value="variable name" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564604253">
      <property name="value" nameId="tpce.1105725733873" value="VAR" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7633559109507052112">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688769">
      <property name="value" nameId="tpce.1105725733873" value="for ((expr1; expr2; expr3))" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109507211188">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="accord" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109507211197">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="condition" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109507211198">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="iteration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109509539185">
      <property name="value" nameId="tpce.1105725733873" value="for" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7633559109507193260">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="7633559109507211187">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="7633559109508737477">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688766">
      <property name="value" nameId="tpce.1105725733873" value="if test-command; then" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109508737478">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="testCommand" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109508737479">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="ifTrue" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580269917239" resolveInfo="InputLines" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109508737480">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="ifFalse" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580269917239" resolveInfo="InputLines" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109508737481">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="elseIf" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109508737482" resolveInfo="ElifCommand" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109509539184">
      <property name="value" nameId="tpce.1105725733873" value="if" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468237560641">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468237560638" resolveInfo="ICompoundCommand" />
    </node>
  </root>
  <root id="7633559109508737482">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109508737485">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="testCommand" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109508737484">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="commands" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580269917239" resolveInfo="InputLines" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688767">
      <property name="value" nameId="tpce.1105725733873" value="elif test-command; then" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="7633559109510962907">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109510962908">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="patterns" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109510962909">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="command" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580269917239" resolveInfo="InputLines" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109510962918">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="terminator" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109511764425" resolveInfo="CaseTerminator" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688727">
      <property name="value" nameId="tpce.1105725733873" value="case clause" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="7633559109511075340">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688726">
      <property name="value" nameId="tpce.1105725733873" value="case command" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109511075341">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="word" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109511075342">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="clauses" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109510962907" resolveInfo="CaseClause" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109513380246">
      <property name="value" nameId="tpce.1105725733873" value="case" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468237560640">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468237560638" resolveInfo="ICompoundCommand" />
    </node>
  </root>
  <root id="7633559109511424701">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109511424703">
      <property name="value" nameId="tpce.1105725733873" value=";;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="7633559109511764428" resolveInfo="terminator" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109511424705">
      <property name="value" nameId="tpce.1105725733873" value=";;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7633559109511764425">
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="7633559109511764428">
      <property name="name" nameId="tpck.1169194664001" value="terminator" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="7633559109511764435">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="7633559109512234531">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109512234532">
      <property name="value" nameId="tpce.1105725733873" value=";&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="7633559109511764428" resolveInfo="terminator" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109512234534">
      <property name="value" nameId="tpce.1105725733873" value=";&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7633559109512234535">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109512234536">
      <property name="value" nameId="tpce.1105725733873" value=";;&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="7633559109511764428" resolveInfo="terminator" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109512234541">
      <property name="value" nameId="tpce.1105725733873" value=";;&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7633559109512452300">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688198">
      <property name="value" nameId="tpce.1105725733873" value="select command" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109512579105">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="variable" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109506263695" resolveInfo="VariableNameDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109512579106">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="words" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580272063536" resolveInfo="WordList" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109512579107">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="commands" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580269917239" resolveInfo="InputLines" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109514551363">
      <property name="value" nameId="tpce.1105725733873" value="select" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468237560642">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468237560638" resolveInfo="ICompoundCommand" />
    </node>
  </root>
  <root id="7633559109512908785">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688764">
      <property name="value" nameId="tpce.1105725733873" value="grouping command" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="7633559109512908787">
      <property name="name" nameId="tpck.1169194664001" value="leftBracket" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="7633559109512908789">
      <property name="name" nameId="tpck.1169194664001" value="rigthBracket" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7633559109512908790">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="commands" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580269917239" resolveInfo="InputLines" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="7633559109512908794">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468237560644">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468237560638" resolveInfo="ICompoundCommand" />
    </node>
  </root>
  <root id="7633559109512908807">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109512932619">
      <property name="value" nameId="tpce.1105725733873" value="{" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="7633559109512908787" resolveInfo="leftBracket" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109512932621">
      <property name="value" nameId="tpce.1105725733873" value="}" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="7633559109512908789" resolveInfo="rigthBracket" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109513036760">
      <property name="value" nameId="tpce.1105725733873" value="{ list }" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7633559109513036752">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902183882407">
      <property name="value" nameId="tpce.1105725733873" value="bracket grouping" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109513036753">
      <property name="value" nameId="tpce.1105725733873" value="(" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="7633559109512908787" resolveInfo="leftBracket" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109513036756">
      <property name="value" nameId="tpce.1105725733873" value=")" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="7633559109512908789" resolveInfo="rigthBracket" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7633559109513036758">
      <property name="value" nameId="tpce.1105725733873" value="(" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467437060443">
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="3999172467437184648">
      <property name="name" nameId="tpck.1169194664001" value="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3999172467437184655">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467437184656">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="leftExpression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467437184657">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="rightExpression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3263637656461715719">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3263637656461715717" resolveInfo="IPriorityExpression" />
    </node>
  </root>
  <root id="3999172467437322736">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851264">
      <property name="value" nameId="tpce.1105725733873" value="multiplication" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969638">
      <property name="value" nameId="tpce.1105725713309" value="9" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467437322737">
      <property name="value" nameId="tpce.1105725733873" value="*" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467437322739">
      <property name="value" nameId="tpce.1105725733873" value="*" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467437426994">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851243">
      <property name="value" nameId="tpce.1105725733873" value="division" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969636">
      <property name="value" nameId="tpce.1105725713309" value="9" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467437426995">
      <property name="value" nameId="tpce.1105725733873" value="/" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467437426997">
      <property name="value" nameId="tpce.1105725733873" value="/" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467437426998">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851262">
      <property name="value" nameId="tpce.1105725733873" value="mod operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969641">
      <property name="value" nameId="tpce.1105725713309" value="9" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467437426999">
      <property name="value" nameId="tpce.1105725733873" value="%" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467437427002">
      <property name="value" nameId="tpce.1105725733873" value="%" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467437531349">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851225">
      <property name="value" nameId="tpce.1105725733873" value="add operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969634">
      <property name="value" nameId="tpce.1105725713309" value="8" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467437531350">
      <property name="value" nameId="tpce.1105725733873" value="+" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467437531352">
      <property name="value" nameId="tpce.1105725733873" value="+" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467437531353">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563932407">
      <property name="value" nameId="tpce.1105725733873" value="substraction" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969632">
      <property name="value" nameId="tpce.1105725713309" value="8" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467437531354">
      <property name="value" nameId="tpce.1105725733873" value="-" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467437531356">
      <property name="value" nameId="tpce.1105725733873" value="-" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467437635795">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563387412">
      <property name="value" nameId="tpce.1105725733873" value="arithmetic command" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467437635796">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="expression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438867142">
      <property name="value" nameId="tpce.1105725733873" value="((" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468237560643">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468237560638" resolveInfo="ICompoundCommand" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4515773109209587387">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4515773109209587383" resolveInfo="IArithmeticHolder" />
    </node>
  </root>
  <root id="3999172467438007066">
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="3999172467438007072">
      <property name="name" nameId="tpck.1169194664001" value="sign" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467438007073">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="expression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3263637656462020083">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="3999172467438007070">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3999172467438131851">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="3999172467438007071">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3999172467438131850">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="3999172467438131840">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851268">
      <property name="value" nameId="tpce.1105725733873" value="increment operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564604344">
      <property name="value" nameId="tpce.1105725733873" value="++" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438131841">
      <property name="value" nameId="tpce.1105725733873" value="++" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467438007072" resolveInfo="sign" />
    </node>
  </root>
  <root id="3999172467438131844">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851266">
      <property name="value" nameId="tpce.1105725733873" value="decrement operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564604346">
      <property name="value" nameId="tpce.1105725733873" value="--" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438131845">
      <property name="value" nameId="tpce.1105725733873" value="--" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467438007072" resolveInfo="sign" />
    </node>
  </root>
  <root id="3999172467438131846">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851272">
      <property name="value" nameId="tpce.1105725733873" value="pre increment operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564604350">
      <property name="value" nameId="tpce.1105725733873" value="++" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438131847">
      <property name="value" nameId="tpce.1105725733873" value="++" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467438007072" resolveInfo="sign" />
    </node>
  </root>
  <root id="3999172467438131848">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851270">
      <property name="value" nameId="tpce.1105725733873" value="pre decrement operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564604348">
      <property name="value" nameId="tpce.1105725733873" value="--" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438131849">
      <property name="value" nameId="tpce.1105725733873" value="--" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467438007072" resolveInfo="sign" />
    </node>
  </root>
  <root id="3999172467438341715">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563932411">
      <property name="value" nameId="tpce.1105725733873" value="plus" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438341716">
      <property name="value" nameId="tpce.1105725733873" value="+" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467438007072" resolveInfo="sign" />
    </node>
  </root>
  <root id="3999172467438341718">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563932409">
      <property name="value" nameId="tpce.1105725733873" value="minus" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438341720">
      <property name="value" nameId="tpce.1105725733873" value="-" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467438007072" resolveInfo="sign" />
    </node>
  </root>
  <root id="3999172467438551654">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851258">
      <property name="value" nameId="tpce.1105725733873" value="logical negation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564783989">
      <property name="value" nameId="tpce.1105725733873" value="!" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438551655">
      <property name="value" nameId="tpce.1105725733873" value="!" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467438007072" resolveInfo="sign" />
    </node>
  </root>
  <root id="3999172467438551656">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851229">
      <property name="value" nameId="tpce.1105725733873" value="bitwise negation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564783982">
      <property name="value" nameId="tpce.1105725733873" value="~" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438551657">
      <property name="value" nameId="tpce.1105725733873" value="~" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467438007072" resolveInfo="sign" />
    </node>
  </root>
  <root id="3999172467438656709">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851247">
      <property name="value" nameId="tpce.1105725733873" value="exponent operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969643">
      <property name="value" nameId="tpce.1105725713309" value="10" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438656710">
      <property name="value" nameId="tpce.1105725733873" value="**" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656460969645">
      <property name="value" nameId="tpce.1105725733873" value="**" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467438761808">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851249">
      <property name="value" nameId="tpce.1105725733873" value="left bitwise shift operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969630">
      <property name="value" nameId="tpce.1105725713309" value="7" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438761809">
      <property name="value" nameId="tpce.1105725733873" value="&lt;&lt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438761811">
      <property name="value" nameId="tpce.1105725733873" value="&lt;&lt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467438761812">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851275">
      <property name="value" nameId="tpce.1105725733873" value="right bitwise shift operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969628">
      <property name="value" nameId="tpce.1105725713309" value="7" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438761813">
      <property name="value" nameId="tpce.1105725733873" value="&gt;&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438761815">
      <property name="value" nameId="tpce.1105725733873" value="&gt;&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467438761816">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851245">
      <property name="value" nameId="tpce.1105725733873" value="equals operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969611">
      <property name="value" nameId="tpce.1105725713309" value="5" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438761817">
      <property name="value" nameId="tpce.1105725733873" value="==" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656460969613">
      <property name="value" nameId="tpce.1105725733873" value="==" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467438761818">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851223">
      <property name="value" nameId="tpce.1105725733873" value="inequals operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969616">
      <property name="value" nameId="tpce.1105725713309" value="5" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656460969614">
      <property name="value" nameId="tpce.1105725733873" value="!=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656460969618">
      <property name="value" nameId="tpce.1105725733873" value="!=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467438901253">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851227">
      <property name="value" nameId="tpce.1105725733873" value="bitwise and operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969609">
      <property name="value" nameId="tpce.1105725713309" value="4" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438901258">
      <property name="value" nameId="tpce.1105725733873" value="&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438901260">
      <property name="value" nameId="tpce.1105725733873" value="&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467438901261">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851231">
      <property name="value" nameId="tpce.1105725733873" value="bitwise or operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969605">
      <property name="value" nameId="tpce.1105725713309" value="2" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438901262">
      <property name="value" nameId="tpce.1105725733873" value="|" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438901264">
      <property name="value" nameId="tpce.1105725733873" value="|" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467438901265">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851233">
      <property name="value" nameId="tpce.1105725733873" value="bitwise xor operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969607">
      <property name="value" nameId="tpce.1105725713309" value="3" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438901266">
      <property name="value" nameId="tpce.1105725733873" value="^" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438901268">
      <property name="value" nameId="tpce.1105725733873" value="^" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467438901269">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851256">
      <property name="value" nameId="tpce.1105725733873" value="logical and operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969602">
      <property name="value" nameId="tpce.1105725713309" value="1" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438901270">
      <property name="value" nameId="tpce.1105725733873" value="&amp;&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438901273">
      <property name="value" nameId="tpce.1105725733873" value="&amp;&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467438901274">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851260">
      <property name="value" nameId="tpce.1105725733873" value="logical or operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969600">
      <property name="value" nameId="tpce.1105725713309" value="0" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438901275">
      <property name="value" nameId="tpce.1105725733873" value="||" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467438901279">
      <property name="value" nameId="tpce.1105725733873" value="||" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467439118728">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851238">
      <property name="value" nameId="tpce.1105725733873" value="expr1, expt2" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467439118729">
      <property name="value" nameId="tpce.1105725733873" value="," />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467439118731">
      <property name="value" nameId="tpce.1105725733873" value="," />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467439274728">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3999172467439274729">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="3999172467439274730">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563480838">
      <property name="value" nameId="tpce.1105725733873" value="decimal integer literal" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="3999172467439274731">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657062" resolveInfo="integer" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656461102181">
      <property name="value" nameId="tpce.1105725733873" value="int" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467439274735">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563774981">
      <property name="value" nameId="tpce.1105725733873" value="hexademical integer literal" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="3999172467439346940">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656461108626">
      <property name="value" nameId="tpce.1105725733873" value="0x" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467439473295">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688778">
      <property name="value" nameId="tpce.1105725733873" value="integer in XX numeral system" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="3999172467439473296">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657062" resolveInfo="integer" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="3999172467439473297">
      <property name="name" nameId="tpck.1169194664001" value="base" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657062" resolveInfo="integer" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656461108625">
      <property name="value" nameId="tpce.1105725733873" value="basedint" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467439714972">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467439714973">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="expression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851234">
      <property name="value" nameId="tpce.1105725733873" value="( expression )" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851236">
      <property name="value" nameId="tpce.1105725733873" value="(" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467439962835">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851219">
      <property name="value" nameId="tpce.1105725733873" value="greater than operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969624">
      <property name="value" nameId="tpce.1105725713309" value="6" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467439962836">
      <property name="value" nameId="tpce.1105725733873" value="&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467439962838">
      <property name="value" nameId="tpce.1105725733873" value="&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467439962839">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851252">
      <property name="value" nameId="tpce.1105725733873" value="less than operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969620">
      <property name="value" nameId="tpce.1105725713309" value="6" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467439962840">
      <property name="value" nameId="tpce.1105725733873" value="&lt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467439962844">
      <property name="value" nameId="tpce.1105725733873" value="&lt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467439962845">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851221">
      <property name="value" nameId="tpce.1105725733873" value="greater than or equals operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969626">
      <property name="value" nameId="tpce.1105725713309" value="6" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440016186">
      <property name="value" nameId="tpce.1105725733873" value="&gt;=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440016188">
      <property name="value" nameId="tpce.1105725733873" value="&gt;=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467440016189">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851254">
      <property name="value" nameId="tpce.1105725733873" value="less than or equals operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="3263637656460969622">
      <property name="value" nameId="tpce.1105725713309" value="6" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656461715718" resolveInfo="priority" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440016190">
      <property name="value" nameId="tpce.1105725733873" value="&lt;=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467437184648" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440016192">
      <property name="value" nameId="tpce.1105725733873" value="&lt;=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467440108301">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467440108302">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="testExpression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467440108303">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="ifTrue" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467440108304">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="ifFalse" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851239">
      <property name="value" nameId="tpce.1105725733873" value="(cond)? expr1 : expr2" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563851241">
      <property name="value" nameId="tpce.1105725733873" value="?" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467440224562">
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="3999172467440224571">
      <property name="name" nameId="tpck.1169194664001" value="sign" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467440224563">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="lValue" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="9034131902187955342" resolveInfo="LValue" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467440224564">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="rValue" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3999172467440353766">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="3999172467440353749">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440353751">
      <property name="value" nameId="tpce.1105725733873" value="=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467440224571" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440353753">
      <property name="value" nameId="tpce.1105725733873" value="=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467440353754">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440353755">
      <property name="value" nameId="tpce.1105725733873" value="+=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467440224571" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440353757">
      <property name="value" nameId="tpce.1105725733873" value="+=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467440353758">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440353759">
      <property name="value" nameId="tpce.1105725733873" value="-=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467440224571" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440353761">
      <property name="value" nameId="tpce.1105725733873" value="-=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467440353762">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440353763">
      <property name="value" nameId="tpce.1105725733873" value="*=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467440224571" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440353765">
      <property name="value" nameId="tpce.1105725733873" value="*=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467440353767">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440353768">
      <property name="value" nameId="tpce.1105725733873" value="/=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467440224571" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440353770">
      <property name="value" nameId="tpce.1105725733873" value="/=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467440460343">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440460344">
      <property name="value" nameId="tpce.1105725733873" value="%=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467440224571" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440460346">
      <property name="value" nameId="tpce.1105725733873" value="%=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467440460347">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440460348">
      <property name="value" nameId="tpce.1105725733873" value="&lt;&lt;=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467440224571" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440460350">
      <property name="value" nameId="tpce.1105725733873" value="&lt;&lt;=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467440460351">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440460352">
      <property name="value" nameId="tpce.1105725733873" value="&gt;&gt;=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467440224571" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440460354">
      <property name="value" nameId="tpce.1105725733873" value="&gt;&gt;=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467440567065">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440567066">
      <property name="value" nameId="tpce.1105725733873" value="&amp;=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467440224571" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440567068">
      <property name="value" nameId="tpce.1105725733873" value="&amp;=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467440567069">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440567070">
      <property name="value" nameId="tpce.1105725733873" value="|=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467440224571" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440567072">
      <property name="value" nameId="tpce.1105725733873" value="|=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467440697258">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440697259">
      <property name="value" nameId="tpce.1105725733873" value="^=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467440224571" resolveInfo="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467440697261">
      <property name="value" nameId="tpce.1105725733873" value="^=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467441205664">
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="3999172467441293236">
      <property name="name" nameId="tpck.1169194664001" value="assingmentSign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3999172467441205665">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467441293220">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="lvalue" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="9034131902187955342" resolveInfo="LValue" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467441293221">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="value" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
  </root>
  <root id="3999172467441325687">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688209">
      <property name="value" nameId="tpce.1105725733873" value="assingment operator" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024747082337">
      <property name="value" nameId="tpce.1105725733873" value="def" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3999172467441457180">
      <property name="value" nameId="tpce.1105725733873" value="=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467441293236" resolveInfo="assingmentSign" />
    </node>
  </root>
  <root id="3999172467442053841">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467442053842">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="variable" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109506263695" resolveInfo="VariableNameDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="8353259571485385863">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="8353259571485353278" resolveInfo="IGeneralizedWordUnit" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3263637656454733083">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3147078024759753552" resolveInfo="IConcreteWordUnit" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656454733084">
      <property name="value" nameId="tpce.1105725733873" value="${" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3147078024759753553" resolveInfo="pattern" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="975347375211372222">
      <property name="value" nameId="tpce.1105725733873" value="${variable}" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3999172467442724020">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024759753557">
      <property name="value" nameId="tpce.1105725733873" value="$((" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3147078024759753553" resolveInfo="pattern" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="8353259571485353287">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="8353259571485353278" resolveInfo="IGeneralizedWordUnit" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3147078024759753555">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3147078024759753552" resolveInfo="IConcreteWordUnit" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4515773109209587385">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4515773109209587383" resolveInfo="IArithmeticHolder" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3999172467442724022">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="expression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109507193260" resolveInfo="ArithmeticExpression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024747378177">
      <property name="value" nameId="tpce.1105725733873" value="$((" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="8353259571483751823">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688205">
      <property name="value" nameId="tpce.1105725733873" value="tilde" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656455059131">
      <property name="value" nameId="tpce.1105725733873" value="~" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3147078024759753553" resolveInfo="pattern" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="8353259571485353289">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="8353259571485353278" resolveInfo="IGeneralizedWordUnit" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3263637656455059129">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3147078024759753552" resolveInfo="IConcreteWordUnit" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8353259571483751828">
      <property name="value" nameId="tpce.1105725733873" value="~" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="8353259571483884165">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8353259571485385865">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="units" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571485353278" resolveInfo="IGeneralizedWordUnit" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563480845">
      <property name="value" nameId="tpce.1105725733873" value="word" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="8353259571485353278" />
  <root id="8353259571485353280">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688203">
      <property name="value" nameId="tpce.1105725733873" value="string" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="8353259571485353281">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="8353259571485353278" resolveInfo="IGeneralizedWordUnit" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="8353259571485353282">
      <property name="name" nameId="tpck.1169194664001" value="word" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902186261706">
      <property name="value" nameId="tpce.1105725733873" value="text" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468235197585">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563387415">
      <property name="value" nameId="tpce.1105725733873" value="command substitution" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="4857814468235197588">
      <property name="name" nameId="tpck.1169194664001" value="left" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="4857814468235197590">
      <property name="name" nameId="tpck.1169194664001" value="right" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468235197586">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="8353259571485353278" resolveInfo="IGeneralizedWordUnit" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468235197593">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="command" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580269894529" resolveInfo="CommandList" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="4857814468235197607">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="4857814468235197608">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656455038995">
      <property name="value" nameId="tpce.1105725733873" value="`" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3147078024759753553" resolveInfo="pattern" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024752209258">
      <property name="value" nameId="tpce.1105725733873" value="`" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4857814468235331233">
      <property name="value" nameId="tpce.1105725733873" value="`" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="4857814468235197588" resolveInfo="left" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4857814468235331235">
      <property name="value" nameId="tpce.1105725733873" value="`" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="4857814468235197590" resolveInfo="right" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3263637656455038993">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3147078024759753552" resolveInfo="IConcreteWordUnit" />
    </node>
  </root>
  <root id="4857814468235331236">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4857814468235331237">
      <property name="value" nameId="tpce.1105725733873" value="$(" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="4857814468235197588" resolveInfo="left" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4857814468235331240">
      <property name="value" nameId="tpce.1105725733873" value=")" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="4857814468235197590" resolveInfo="right" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024747378176">
      <property name="value" nameId="tpce.1105725733873" value="$(" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468235439117">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688196">
      <property name="value" nameId="tpce.1105725733873" value="command with redirection" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468235439118">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="command" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468235439119">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="redirection" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4857814468235439120" resolveInfo="Redirection" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902186646658">
      <property name="value" nameId="tpce.1105725733873" value="redirect" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468235439120">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="4857814468235580317">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="4857814468235580318">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563774997">
      <property name="value" nameId="tpce.1105725733873" value="redirecting input" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024756657407">
      <property name="value" nameId="tpce.1105725733873" value="&lt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468235580337">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563775001">
      <property name="value" nameId="tpce.1105725733873" value="redirecting output" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4857814468235611029">
      <property name="name" nameId="tpck.1169194664001" value="noclobber" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024756657409">
      <property name="value" nameId="tpce.1105725733873" value="&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468235580340">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4857814468235580341">
      <property name="name" nameId="tpck.1169194664001" value="n" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657062" resolveInfo="integer" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468237147397">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468237147395" resolveInfo="IToWordRedirection" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="4857814468237512110">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="4857814468235866604">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563774986">
      <property name="value" nameId="tpce.1105725733873" value="appending redirected output" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024756565401">
      <property name="value" nameId="tpce.1105725733873" value="&gt;&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468236240462">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563774999">
      <property name="value" nameId="tpce.1105725733873" value="redirecting standard output and standard error" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468237147398">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468237147395" resolveInfo="IToWordRedirection" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024756657408">
      <property name="value" nameId="tpce.1105725733873" value="&amp;&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468236365434">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563774984">
      <property name="value" nameId="tpce.1105725733873" value="appending standard output and standard error" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468237147400">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468237147395" resolveInfo="IToWordRedirection" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024756565400">
      <property name="value" nameId="tpce.1105725733873" value="&amp;&gt;&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468237147395">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468237147396">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="word" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
  </root>
  <root id="4857814468237284479">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563774993">
      <property name="value" nameId="tpce.1105725733873" value="here documents" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468237284481">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="word" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571485353280" resolveInfo="SimpleWord" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468237284482">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="heredocument" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468237284483">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="delimiter" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571485353280" resolveInfo="SimpleWord" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4857814468237284484">
      <property name="name" nameId="tpck.1169194664001" value="striptabs" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024756657405">
      <property name="value" nameId="tpce.1105725733873" value="&lt;&lt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468237475269">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563774995">
      <property name="value" nameId="tpce.1105725733873" value="here strings" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468237475270">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468237147395" resolveInfo="IToWordRedirection" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024756657406">
      <property name="value" nameId="tpce.1105725733873" value="&lt;&lt;&lt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468237475279">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563774989">
      <property name="value" nameId="tpce.1105725733873" value="duplicating input file descriptors" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024756565402">
      <property name="value" nameId="tpce.1105725733873" value="&lt;&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468237475293">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563774991">
      <property name="value" nameId="tpce.1105725733873" value="duplicating output file descriptors" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024756565403">
      <property name="value" nameId="tpce.1105725733873" value="&gt;&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468237475306">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563775003">
      <property name="value" nameId="tpce.1105725733873" value="opening file descriptors for reading and writing" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024756657410">
      <property name="value" nameId="tpce.1105725733873" value="&lt;&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468237520690">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563480844">
      <property name="value" nameId="tpce.1105725733873" value="function declaration" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468237560635">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468237560636">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="command" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4857814468237560638" resolveInfo="ICompoundCommand" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468237560645">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <property name="role" nameId="tpce.1071599776563" value="redirections" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4857814468235439120" resolveInfo="Redirection" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2635812496395152821">
      <property name="value" nameId="tpce.1105725733873" value="function" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468237560638" />
  <root id="4857814468237744075">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563480842">
      <property name="value" nameId="tpce.1105725733873" value="function call" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468237744076">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="function" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4857814468237520690" resolveInfo="FunctionDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3147078024757053201">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="params" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580272063536" resolveInfo="WordList" />
    </node>
  </root>
  <root id="4857814468241254994">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468241318042">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468241318043">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="optionDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4857814468241255113" resolveInfo="ExternalOptionDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688754">
      <property name="value" nameId="tpce.1105725733873" value="external commmand declaration" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="4857814468241254997">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468241607046">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="declaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4857814468241254994" resolveInfo="ExternalCommandDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468241607047">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="refToOptions" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4857814468241607048" resolveInfo="ExternalOptionReference" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688753">
      <property name="value" nameId="tpce.1105725733873" value="external command call" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="4857814468241607048">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="7803330421054408117">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="4857814468242547367">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688758">
      <property name="value" nameId="tpce.1105725733873" value="options" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4857814468242547375">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="options" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4857814468242547369" resolveInfo="Option" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902186148397">
      <property name="value" nameId="tpce.1105725733873" value="opts" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468242547369">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468243514692">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468243514690" resolveInfo="ISymbolConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468243514702">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468243514698" resolveInfo="IDescribedConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688755">
      <property name="value" nameId="tpce.1105725733873" value="option" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="4857814468243308834">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688760">
      <property name="value" nameId="tpce.1105725733873" value="option with parameter" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468243514695">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468243514690" resolveInfo="ISymbolConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468243514697">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468243514704">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468243514698" resolveInfo="IDescribedConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902186148398">
      <property name="value" nameId="tpce.1105725733873" value="owp" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4857814468243514690">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4857814468243514691">
      <property name="name" nameId="tpck.1169194664001" value="symbol" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="4857814468243514698">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4857814468243514700">
      <property name="name" nameId="tpck.1169194664001" value="description" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="4857814468241255113">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="4857814468242757972">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="7803330421057156061">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7803330421057584568">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="refToOptions" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7803330421057519636" resolveInfo="OptionReference" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7803330421062325375">
      <property name="value" nameId="tpce.1105725733873" value="-" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7803330421057519636">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7803330421057519637">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="option" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4857814468242547369" resolveInfo="Option" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688756">
      <property name="value" nameId="tpce.1105725733873" value="option" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="7803330421058939228">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7803330421059093017">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="optionWithParam" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4857814468243308834" resolveInfo="OptionWithParam" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7803330421059093028">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="word" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688761">
      <property name="value" nameId="tpce.1105725733873" value="option with parameter" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="7803330421059359220" />
  <root id="7803330421058150857">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7803330421058150858">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="arg" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4857814468243911286" resolveInfo="Argument" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7803330421058150868">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="value" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688752">
      <property name="value" nameId="tpce.1105725733873" value="argument" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="4857814468243911286">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688746">
      <property name="value" nameId="tpce.1105725733873" value="named argument" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468243911287">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4857814468243911289">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468243514698" resolveInfo="IDescribedConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902186148395">
      <property name="value" nameId="tpce.1105725733873" value="arg" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3147078024743869739">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688748">
      <property name="value" nameId="tpce.1105725733873" value="list of arguments" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902186148396">
      <property name="value" nameId="tpce.1105725733873" value="args" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3147078024744633269">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688751">
      <property name="value" nameId="tpce.1105725733873" value="list of arguments" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3147078024744633271">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="words" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902183882414">
      <property name="value" nameId="tpce.1105725733873" value="args" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3147078024747082354">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3147078024747082355">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4857814468237560638" resolveInfo="ICompoundCommand" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3147078024747082356">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="conditionalExpression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="9034131902191439561" resolveInfo="ConditionalExpression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563480836">
      <property name="value" nameId="tpce.1105725733873" value="conditional command" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3147078024747247170">
      <property name="value" nameId="tpce.1105725733873" value="[" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3147078024751877531">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3147078024751877533">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="8353259571485353278" resolveInfo="IGeneralizedWordUnit" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3263637656469253792">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3147078024759753552" resolveInfo="IConcreteWordUnit" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3147078024751877535">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="word" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="3263637656455059148">
      <property name="name" nameId="tpck.1169194664001" value="quotetype" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3263637656455059149">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="3147078024759753552">
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="3147078024759753553">
      <property name="name" nameId="tpck.1169194664001" value="pattern" />
    </node>
  </root>
  <root id="3263637656455059140">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656455599536">
      <property name="value" nameId="tpce.1105725733873" value="'" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3147078024759753553" resolveInfo="pattern" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656455059147">
      <property name="value" nameId="tpce.1105725733873" value="'" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656455059165">
      <property name="value" nameId="tpce.1105725733873" value="'" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656455059148" resolveInfo="quotetype" />
    </node>
  </root>
  <root id="3263637656455059166">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656455059167">
      <property name="value" nameId="tpce.1105725733873" value="&quot;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3147078024759753553" resolveInfo="pattern" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656455059169">
      <property name="value" nameId="tpce.1105725733873" value="&quot;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3263637656455059171">
      <property name="value" nameId="tpce.1105725733873" value="&quot;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3263637656455059148" resolveInfo="quotetype" />
    </node>
  </root>
  <root id="3263637656461715717">
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.IntegerConceptPropertyDeclaration" typeId="tpce.1105725141344" id="3263637656461715718">
      <property name="name" nameId="tpck.1169194664001" value="priority" />
    </node>
  </root>
  <root id="3263637656462020094">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563932413">
      <property name="value" nameId="tpce.1105725733873" value="word" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="3263637656462020098">
      <property name="name" nameId="tpck.1169194664001" value="sign" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3263637656462020095">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="word" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471612025794">
      <property name="value" nameId="tpce.1105725733873" value="w" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="8457058248751600625">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="8457058248751600626">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="8457058248751696156">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688737">
      <property name="value" nameId="tpce.1105725733873" value="comment with commandlist" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8457058248751696157">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="commandList" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3321051580269894529" resolveInfo="CommandList" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3905757829894626360">
      <property name="value" nameId="tpce.1105725733873" value="commented command" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4515773109208483476">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4515773109208483475" resolveInfo="IComment" />
    </node>
  </root>
  <root id="8474643070102636479">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8474643070102636485">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="base" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8474643070110245381" resolveInfo="HeadPipeline" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8474643070102636486">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="following" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8474643070102636489" resolveInfo="FollowingCommandList" />
    </node>
  </root>
  <root id="8474643070102636489">
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="8474643070102636523">
      <property name="name" nameId="tpck.1169194664001" value="operator" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8474643070102636490">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="baseCommand" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8474643070102636479" resolveInfo="HeadCommandList" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="8474643070102636524">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="8474643070102636535">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688729">
      <property name="value" nameId="tpce.1105725733873" value="and operator" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8474643070109792259">
      <property name="value" nameId="tpce.1105725733873" value="&amp;&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8474643070102636538">
      <property name="value" nameId="tpce.1105725733873" value="&amp;&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="8474643070102636523" resolveInfo="operator" />
    </node>
  </root>
  <root id="8474643070102636539">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688733">
      <property name="value" nameId="tpce.1105725733873" value="or operator" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8474643070109792263">
      <property name="value" nameId="tpce.1105725733873" value="||" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8474643070102716346">
      <property name="value" nameId="tpce.1105725733873" value="||" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="8474643070102636523" resolveInfo="operator" />
    </node>
  </root>
  <root id="8474643070110067628">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688742">
      <property name="value" nameId="tpce.1105725733873" value="comment with following commands" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8474643070110067662">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="command" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8474643070102636489" resolveInfo="FollowingCommandList" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4515773109208483477">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4515773109208483475" resolveInfo="IComment" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4515773109208483479">
      <property name="value" nameId="tpce.1105725733873" value="commented following command" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="8474643070110067629">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="8474643070110067632">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="8474643070110245381">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8474643070110463418">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="command" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3905757829901343108" resolveInfo="Command" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8474643070111818352">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="following" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8474643070111818349" resolveInfo="FollowingPipeline" />
    </node>
  </root>
  <root id="8474643070111818349">
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="8474643070111818351">
      <property name="name" nameId="tpck.1169194664001" value="pypetype" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8474643070111988415">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="basePipeline" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8474643070110245381" resolveInfo="HeadPipeline" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="8474643070111988416">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="8474643070111988418">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8474643070111988435">
      <property name="value" nameId="tpce.1105725733873" value="|" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8474643070111988433">
      <property name="value" nameId="tpce.1105725733873" value="|" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="8474643070111818351" resolveInfo="pypetype" />
    </node>
  </root>
  <root id="8474643070111988431">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8474643070111988438">
      <property name="value" nameId="tpce.1105725733873" value="|&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8474643070111988432">
      <property name="value" nameId="tpce.1105725733873" value="|&amp;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="8474643070111818351" resolveInfo="pypetype" />
    </node>
  </root>
  <root id="8457058248751600624">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688744">
      <property name="value" nameId="tpce.1105725733873" value="comment" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="8457058248751600627">
      <property name="name" nameId="tpck.1169194664001" value="comment" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8457058248753132451">
      <property name="value" nameId="tpce.1105725733873" value="#" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4515773109208483478">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4515773109208483475" resolveInfo="IComment" />
    </node>
  </root>
  <root id="3905757829901343108" />
  <root id="4515773109208483475" />
  <root id="4515773109209587383" />
  <root id="9034131902187955342">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="9034131902187955343">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="9034131902187955344">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="9034131902187955345">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="variable" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109506263695" resolveInfo="VariableNameDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="2362837471611561229">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="8353259571485353278" resolveInfo="IGeneralizedWordUnit" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611561230">
      <property name="value" nameId="tpce.1105725733873" value="variable reference" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="9034131902191439561">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="9034131902191439567">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="9034131902191439562">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="9034131902191439564">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="word" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="9034131902191439565">
      <property name="name" nameId="tpck.1169194664001" value="op" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="9034131902191439566">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="9034131902191439577">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243620">
      <property name="value" nameId="tpce.1105725733873" value="true if file exists" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439589">
      <property name="value" nameId="tpce.1105725733873" value="-a" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439579">
      <property name="value" nameId="tpce.1105725733873" value="a" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191439584">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243608">
      <property name="value" nameId="tpce.1105725733873" value="true if file is a block special file" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439587">
      <property name="value" nameId="tpce.1105725733873" value="-b" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439585">
      <property name="value" nameId="tpce.1105725733873" value="b" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191439590">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243610">
      <property name="value" nameId="tpce.1105725733873" value="true if file is a character special file" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439593">
      <property name="value" nameId="tpce.1105725733873" value="-c" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439591">
      <property name="value" nameId="tpce.1105725733873" value="c" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191439594">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243612">
      <property name="value" nameId="tpce.1105725733873" value="true if file is a directory" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439597">
      <property name="value" nameId="tpce.1105725733873" value="-d" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439595">
      <property name="value" nameId="tpce.1105725733873" value="d" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191439598">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243630">
      <property name="value" nameId="tpce.1105725733873" value="true if file exists" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439601">
      <property name="value" nameId="tpce.1105725733873" value="-e" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439599">
      <property name="value" nameId="tpce.1105725733873" value="e" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191439602">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243638">
      <property name="value" nameId="tpce.1105725733873" value="true if file is a regular file" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439605">
      <property name="value" nameId="tpce.1105725733873" value="-f" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439603">
      <property name="value" nameId="tpce.1105725733873" value="f" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191439606">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243622">
      <property name="value" nameId="tpce.1105725733873" value="true if set-group-id bit of file is set" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439609">
      <property name="value" nameId="tpce.1105725733873" value="-g" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439607">
      <property name="value" nameId="tpce.1105725733873" value="g" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191439610">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243647">
      <property name="value" nameId="tpce.1105725733873" value="true if file is a symbolic link" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439613">
      <property name="value" nameId="tpce.1105725733873" value="-h" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439611">
      <property name="value" nameId="tpce.1105725733873" value="h" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191439614">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243644">
      <property name="value" nameId="tpce.1105725733873" value="true if &quot;sticky&quot; bit of file is set" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439617">
      <property name="value" nameId="tpce.1105725733873" value="-k" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439615">
      <property name="value" nameId="tpce.1105725733873" value="k" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191439618">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243634">
      <property name="value" nameId="tpce.1105725733873" value="true if file is a named pipe" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439621">
      <property name="value" nameId="tpce.1105725733873" value="-p" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439619">
      <property name="value" nameId="tpce.1105725733873" value="p" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191439622">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243636">
      <property name="value" nameId="tpce.1105725733873" value="true if file is readable" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439625">
      <property name="value" nameId="tpce.1105725733873" value="-r" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439623">
      <property name="value" nameId="tpce.1105725733873" value="r" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191439626">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243640">
      <property name="value" nameId="tpce.1105725733873" value="true if file has a size greater than zero" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439629">
      <property name="value" nameId="tpce.1105725733873" value="-s" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439627">
      <property name="value" nameId="tpce.1105725733873" value="s" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191439630">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243649">
      <property name="value" nameId="tpce.1105725733873" value="true if file descriptor fd is open and refers to a terminal" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439633">
      <property name="value" nameId="tpce.1105725733873" value="-t" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191439631">
      <property name="value" nameId="tpce.1105725733873" value="t" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191515046">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243651">
      <property name="value" nameId="tpce.1105725733873" value="true if set-user-id bit of file is set" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515050">
      <property name="value" nameId="tpce.1105725733873" value="-u" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515047">
      <property name="value" nameId="tpce.1105725733873" value="u" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191515051">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243653">
      <property name="value" nameId="tpce.1105725733873" value="true if file is writable" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515054">
      <property name="value" nameId="tpce.1105725733873" value="-w" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515052">
      <property name="value" nameId="tpce.1105725733873" value="w" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191515055">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243618">
      <property name="value" nameId="tpce.1105725733873" value="true if file is executable" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515058">
      <property name="value" nameId="tpce.1105725733873" value="-x" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515056">
      <property name="value" nameId="tpce.1105725733873" value="x" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191515059">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243616">
      <property name="value" nameId="tpce.1105725733873" value="true if file is owned by the effective user id" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515062">
      <property name="value" nameId="tpce.1105725733873" value="-O" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515060">
      <property name="value" nameId="tpce.1105725733873" value="O" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191515063">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243614">
      <property name="value" nameId="tpce.1105725733873" value="true if file is owned by the effective group id" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515066">
      <property name="value" nameId="tpce.1105725733873" value="-G" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515064">
      <property name="value" nameId="tpce.1105725733873" value="G" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191515067">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243632">
      <property name="value" nameId="tpce.1105725733873" value="true if file is a symbolic link" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515070">
      <property name="value" nameId="tpce.1105725733873" value="-L" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515068">
      <property name="value" nameId="tpce.1105725733873" value="L" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191515071">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564475840">
      <property name="value" nameId="tpce.1105725733873" value="true if file is a socket" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515074">
      <property name="value" nameId="tpce.1105725733873" value="-S" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515072">
      <property name="value" nameId="tpce.1105725733873" value="S" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191515075">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243624">
      <property name="value" nameId="tpce.1105725733873" value="true if file has been modified since it was last read" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515078">
      <property name="value" nameId="tpce.1105725733873" value="-N" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191515076">
      <property name="value" nameId="tpce.1105725733873" value="N" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191629585">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243628">
      <property name="value" nameId="tpce.1105725733873" value="true if shell option optname is enabled" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191629588">
      <property name="value" nameId="tpce.1105725733873" value="-o" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191629586">
      <property name="value" nameId="tpce.1105725733873" value="o" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191629589">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243655">
      <property name="value" nameId="tpce.1105725733873" value="true if the length of string is zero" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191629592">
      <property name="value" nameId="tpce.1105725733873" value="-z" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191629590">
      <property name="value" nameId="tpce.1105725733873" value="z" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191629593">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564243626">
      <property name="value" nameId="tpce.1105725733873" value="true if the length of string is non-zero" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191629596">
      <property name="value" nameId="tpce.1105725733873" value="-n" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191629594">
      <property name="value" nameId="tpce.1105725733873" value="n" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191439565" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191629597">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="9034131902191629598">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="string" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471612273589">
      <property name="value" nameId="tpce.1105725733873" value="string" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="9034131902191635402">
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="9034131902191635403">
      <property name="name" nameId="tpck.1169194664001" value="op" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="9034131902191635404">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="left" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="9034131902191635405">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="right" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="9034131902191635414">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="9034131902191635417">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359765">
      <property name="value" nameId="tpce.1105725733873" value="newer than file operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635423">
      <property name="value" nameId="tpce.1105725733873" value="nt" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635418">
      <property name="value" nameId="tpce.1105725733873" value="-nt" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191635424">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359767">
      <property name="value" nameId="tpce.1105725733873" value="older than file operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635428">
      <property name="value" nameId="tpce.1105725733873" value="ot" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635425">
      <property name="value" nameId="tpce.1105725733873" value="-ot" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191635429">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359769">
      <property name="value" nameId="tpce.1105725733873" value="true if files refer to the same device and inode numbers." />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635434">
      <property name="value" nameId="tpce.1105725733873" value="ef" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635430">
      <property name="value" nameId="tpce.1105725733873" value="-ef" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191635435">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359747">
      <property name="value" nameId="tpce.1105725733873" value="equals string operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635438">
      <property name="value" nameId="tpce.1105725733873" value="==" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635436">
      <property name="value" nameId="tpce.1105725733873" value="==" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191635439">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359757">
      <property name="value" nameId="tpce.1105725733873" value="inequals string operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635442">
      <property name="value" nameId="tpce.1105725733873" value="!=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635440">
      <property name="value" nameId="tpce.1105725733873" value="!=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191635443">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359763">
      <property name="value" nameId="tpce.1105725733873" value="less than string operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635448">
      <property name="value" nameId="tpce.1105725733873" value="&lt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635444">
      <property name="value" nameId="tpce.1105725733873" value="&lt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902191635449">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359753">
      <property name="value" nameId="tpce.1105725733873" value="greater than string operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635453">
      <property name="value" nameId="tpce.1105725733873" value="&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="9034131902191635450">
      <property name="value" nameId="tpce.1105725733873" value="&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
  <root id="9034131902193581134">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563480840">
      <property name="value" nameId="tpce.1105725733873" value="any command" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="9034131902193581135">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="translatedWord" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8353259571483884165" resolveInfo="GeneralizedWord" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471604595125">
      <property name="value" nameId="tpce.1105725733873" value="words" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="2362837471606677323">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688735">
      <property name="value" nameId="tpce.1105725733873" value="semicolon operator" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471606677326">
      <property name="value" nameId="tpce.1105725733873" value=";" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471606677324">
      <property name="value" nameId="tpce.1105725733873" value=";" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="8474643070102636523" resolveInfo="operator" />
    </node>
  </root>
  <root id="2362837471610329787">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431563688207">
      <property name="value" nameId="tpce.1105725733873" value="'+=' assignment operator" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471610329790">
      <property name="value" nameId="tpce.1105725733873" value="add" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471610329788">
      <property name="value" nameId="tpce.1105725733873" value="+=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="3999172467441293236" resolveInfo="assingmentSign" />
    </node>
  </root>
  <root id="2362837471611764246">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611764247">
      <property name="value" nameId="tpce.1105725733873" value="!" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2362837471611764248">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="command" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7633559109504426816" resolveInfo="AbstractCommand" />
    </node>
  </root>
  <root id="2362837471611859389">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359755">
      <property name="value" nameId="tpce.1105725733873" value="inequals numeric operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859393">
      <property name="value" nameId="tpce.1105725733873" value="-ne" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859391">
      <property name="value" nameId="tpce.1105725733873" value="-ne" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
  <root id="2362837471611859394">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359745">
      <property name="value" nameId="tpce.1105725733873" value="equals numeric operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471612273577">
      <property name="value" nameId="tpce.1105725733873" value="-eq" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859395">
      <property name="value" nameId="tpce.1105725733873" value="-eq" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
  <root id="2362837471611859396">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359759">
      <property name="value" nameId="tpce.1105725733873" value="less than numeric operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859399">
      <property name="value" nameId="tpce.1105725733873" value="-lt" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859397">
      <property name="value" nameId="tpce.1105725733873" value="-lt" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
  <root id="2362837471611859400">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359761">
      <property name="value" nameId="tpce.1105725733873" value="less than or equals numeric operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859403">
      <property name="value" nameId="tpce.1105725733873" value="-le" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859401">
      <property name="value" nameId="tpce.1105725733873" value="-le" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
  <root id="2362837471611859404">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359749">
      <property name="value" nameId="tpce.1105725733873" value="greater than numeric operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859407">
      <property name="value" nameId="tpce.1105725733873" value="-gt" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859405">
      <property name="value" nameId="tpce.1105725733873" value="-gt" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
  <root id="2362837471611859408">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359751">
      <property name="value" nameId="tpce.1105725733873" value="greater than or equals numeric operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859412">
      <property name="value" nameId="tpce.1105725733873" value="-ge" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859409">
      <property name="value" nameId="tpce.1105725733873" value="-ge" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
  <root id="2362837471611859413">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2362837471611859414">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="left" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="9034131902191439561" resolveInfo="ConditionalExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2362837471611859415">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="right" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="9034131902191439561" resolveInfo="ConditionalExpression" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="2362837471611859418">
      <property name="name" nameId="tpck.1169194664001" value="sign" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="2362837471612273586">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="2362837471611859429">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359738">
      <property name="value" nameId="tpce.1105725733873" value="and conditional operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859433">
      <property name="value" nameId="tpce.1105725733873" value="-a" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859430">
      <property name="value" nameId="tpce.1105725733873" value="-a" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="2362837471611859418" resolveInfo="sign" />
    </node>
  </root>
  <root id="2362837471611859434">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359743">
      <property name="value" nameId="tpce.1105725733873" value="or conditional operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859439">
      <property name="value" nameId="tpce.1105725733873" value="-o" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471611859436">
      <property name="value" nameId="tpce.1105725733873" value="-o" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="2362837471611859418" resolveInfo="sign" />
    </node>
  </root>
  <root id="2362837471611859440">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3835416431564359741">
      <property name="value" nameId="tpce.1105725733873" value="( expression )" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2362837471611859441">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="expression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="9034131902191439561" resolveInfo="ConditionalExpression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2362837471612273572">
      <property name="value" nameId="tpce.1105725733873" value="(" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="898011086340135411">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="898011086340135412">
      <property name="value" nameId="tpce.1105725733873" value="equals string operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="898011086340135413">
      <property name="value" nameId="tpce.1105725733873" value="=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="898011086340135414">
      <property name="value" nameId="tpce.1105725733873" value="=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="9034131902191635403" resolveInfo="op" />
    </node>
  </root>
</model>

