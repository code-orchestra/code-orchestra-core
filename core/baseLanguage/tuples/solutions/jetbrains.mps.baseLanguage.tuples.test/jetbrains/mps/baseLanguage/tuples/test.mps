<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:76e159e6-4560-4446-8a14-1eeae92b1a00(jetbrains.mps.baseLanguage.tuples.test)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="f61473f9-130f-42f6-b98d-6c438812c2f6(jetbrains.mps.baseLanguage.unitTest)" />
  <language namespace="a247e09e-2435-45ba-b8d2-07e93feba96a(jetbrains.mps.baseLanguage.tuples)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <import index="digr" modelUID="r:f52cb0e4-0aa9-419b-85cb-0e6e9e8071aa(jetbrains.mps.baseLanguage.tuples.util)" version="-1" />
  <import index="xz5j" modelUID="r:26fc506c-44aa-4c44-b7bf-9712d972460d(jetbrains.mps.baseLanguage.tuples.shared)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" implicit="yes" />
  <import index="cx9y" modelUID="r:309aeee7-bee8-445c-b31d-35928d1da75f(jetbrains.mps.baseLanguage.tuples.structure)" version="2" implicit="yes" />
  <import index="tpe3" modelUID="r:00000000-0000-4000-0000-011c895902d7(jetbrains.mps.baseLanguage.unitTest.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="1238952260515">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="IndexedTuples" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="1239714501613">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="NamedTuples" />
    </node>
    <node type="cx9y.NamedTupleDeclaration" typeId="cx9y.1239360506533" id="1239715318677">
      <property name="name" nameId="tpck.1169194664001" value="Data" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="1239977019775">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="GenericNamedTuples" />
    </node>
    <node type="cx9y.NamedTupleDeclaration" typeId="cx9y.1239360506533" id="1239977036413">
      <property name="name" nameId="tpck.1169194664001" value="Pair" />
    </node>
    <node type="cx9y.NamedTupleDeclaration" typeId="cx9y.1239360506533" id="1240574537739">
      <property name="name" nameId="tpck.1169194664001" value="Bool" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="8209339320719679363">
      <property name="name" nameId="tpck.1169194664001" value="MPS7408" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="3142843783245432636">
      <property name="name" nameId="tpck.1169194664001" value="ExtendedNamedTuples" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="4483021482224672488">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="ExtendedNamedTuples" />
    </node>
    <node type="cx9y.NamedTupleDeclaration" typeId="cx9y.1239360506533" id="1157155146536632949">
      <property name="name" nameId="tpck.1169194664001" value="Record" />
    </node>
    <node type="cx9y.NamedTupleDeclaration" typeId="cx9y.1239360506533" id="7781156898616395636">
      <property name="name" nameId="tpck.1169194664001" value="IntPair" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="429408675341331209">
      <property name="name" nameId="tpck.1169194664001" value="Nulls" />
    </node>
    <node type="tpee.Interface" typeId="tpee.1107796713796" id="6562295948842314981">
      <property name="name" nameId="tpck.1169194664001" value="ISample" />
    </node>
    <node type="cx9y.NamedTupleDeclaration" typeId="cx9y.1239360506533" id="6562295948842315074">
      <property name="name" nameId="tpck.1169194664001" value="Sample" />
    </node>
  </roots>
  <root id="1238952260515">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1238953768403">
      <property name="name" nameId="tpck.1169194664001" value="toTuple" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1238953789187">
        <property name="name" nameId="tpck.1169194664001" value="s" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1238953790213" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1238953791942">
        <property name="name" nameId="tpck.1169194664001" value="c" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.CharType" typeId="tpee.1070534555686" id="1238953793472" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1238953768405" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238953768406">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1238953797570">
          <node role="expression" roleId="tpee.1068580123156" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1238953797571">
            <node role="component" roleId="cx9y.1238853845806" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238953800991">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953789187" resolveInfo="s" />
            </node>
            <node role="component" roleId="cx9y.1238853845806" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238953802659">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953791942" resolveInfo="c" />
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="1238953770657">
        <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="1238953774665" />
        <node role="componentType" roleId="cx9y.1238852204892" type="tpee.CharType" typeId="tpee.1070534555686" id="1238953779157" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1238952260516" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="1238952260517">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1238952260518" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1238952260519" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238952260520" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="1238952260521">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1238952264871">
        <property name="methodName" nameId="tpe3.1171931690128" value="empty" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1238952264872" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238952264873">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1238952304220">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1238952304221">
              <property name="name" nameId="tpck.1169194664001" value="empty" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="1238952304222" />
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1239701859089" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1238952312754">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1238952315681">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952312755">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952304221" resolveInfo="empty" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1238952321030" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1238952432697">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1238952432698">
              <property name="name" nameId="tpck.1169194664001" value="emptyToo" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="1238952432699" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952444085">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952304221" resolveInfo="empty" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1238952459235">
        <property name="methodName" nameId="tpe3.1171931690128" value="creatingAndAssigning" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1238952459236" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238952459237">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1238952487459">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1238952487460">
              <property name="name" nameId="tpck.1169194664001" value="pair" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="1238952487461">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1238952487462" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="1238952487463" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1238952487464">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952487465">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1238952487466">
                  <property name="value" nameId="tpee.1070475926801" value="a" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1238952777017">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952777512">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1238952781756">
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952781757">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952487460" resolveInfo="pair" />
              </node>
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952781758">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1238952509847">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1238952510950">
              <property name="value" nameId="tpee.1070475926801" value="a" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1238952513987">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952514123">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952512866">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952487460" resolveInfo="pair" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1238952528965">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1238952528966">
              <property name="name" nameId="tpck.1169194664001" value="anotherPair" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="1238952528967">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1238952532030" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="1238952533584" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952540131">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952487460" resolveInfo="pair" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.CommentedStatementsBlock" typeId="tpee.1177326519037" id="5844390696996894937">
            <node role="statement" roleId="tpee.1177326540772" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="5844390696996894939">
              <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="5844390696996894941">
                <property name="text" nameId="tpee.6329021646629104958" value="This use case no longer supported (yeah, that's right, just like that!)" />
              </node>
            </node>
            <node role="statement" roleId="tpee.1177326540772" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="1239724293560">
              <node role="condition" roleId="tpe3.1171983854940" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1239724308041">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1239724313064">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1239724310541">
                    <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239724317547">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952487460" resolveInfo="pair" />
                    </node>
                    <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1239724315225">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                    </node>
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1239724298767">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1239724296025">
                    <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1239724302328">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                    </node>
                    <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239724306528">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952528966" resolveInfo="anotherPair" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="5844390696996896664">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="5844390696996896666">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="5844390696996896667">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5844390696996896668">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5844390696996896669">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952487460" resolveInfo="pair" />
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5844390696996896670">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="5844390696996896671">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5844390696996896672">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5844390696996896673">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5844390696996896674">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952528966" resolveInfo="anotherPair" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1239724285939">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1239724289370">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239724289371">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952487460" resolveInfo="pair" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239724289372">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952528966" resolveInfo="anotherPair" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1238952733944">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952737161">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952487460" resolveInfo="pair" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952769813">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952528966" resolveInfo="anotherPair" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1238952681008">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952681462">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1238952686244">
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952686245">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952528966" resolveInfo="anotherPair" />
              </node>
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952686246">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1238952545138">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1238952545139">
              <property name="value" nameId="tpee.1070475926801" value="a" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1238952545140">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952545141">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952557096">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952528966" resolveInfo="anotherPair" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1238952560915">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1238952566374">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952568144">
                <property name="value" nameId="tpee.1068580320021" value="111" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1238952562116">
                <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952563084">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952560916">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952487460" resolveInfo="pair" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1238952571823">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1238952576272">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1238952577244">
                <property name="value" nameId="tpee.1070475926801" value="aaaa" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1238952573106">
                <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952573351">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952571824">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952487460" resolveInfo="pair" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.CommentedStatementsBlock" typeId="tpee.1177326519037" id="5844390696996896675">
            <node role="statement" roleId="tpee.1177326540772" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1238952790193">
              <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952790688">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1238952794573">
                <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952794574">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952528966" resolveInfo="anotherPair" />
                </node>
                <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952794575">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1177326540772" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1238952582943">
              <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1238952582944">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1238952582945">
                <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952582946">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952582947">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952528966" resolveInfo="anotherPair" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="5844390696996896677">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5844390696996896678">
              <property name="value" nameId="tpee.1068580320021" value="111" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="5844390696996896679">
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5844390696996896680">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952528966" resolveInfo="anotherPair" />
              </node>
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5844390696996896681">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="5844390696996896682">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5844390696996896683">
              <property name="value" nameId="tpee.1070475926801" value="aaaa" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="5844390696996896684">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5844390696996896685">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5844390696996896686">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952528966" resolveInfo="anotherPair" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1238952800730">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952802048">
              <property name="value" nameId="tpee.1068580320021" value="111" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1238952807925">
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952878731">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952487460" resolveInfo="pair" />
              </node>
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952807927">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1238952618048">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1238952618049">
              <property name="value" nameId="tpee.1070475926801" value="aaaa" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1238952618050">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238952618051">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238952880908">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238952487460" resolveInfo="pair" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1238953041212">
        <property name="methodName" nameId="tpe3.1171931690128" value="writeVar" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1238953041213" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238953041214">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1238953067657">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1238953067658">
              <property name="name" nameId="tpck.1169194664001" value="a" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1238953067659" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1238953073445">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1238953083669">
              <node role="rValue" roleId="tpee.1068498886297" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1238953089218">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238953091887">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1238953073446">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953081035">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953067658" resolveInfo="a" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1238953095896">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238953096903">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953101804">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953067658" resolveInfo="a" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1238953640416">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1238953640417">
              <property name="name" nameId="tpck.1169194664001" value="c" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.CharType" typeId="tpee.1070534555686" id="1238953640418" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.CharConstant" typeId="tpee.1200397529627" id="1238953643623">
                <property name="charConstant" nameId="tpee.1200397540847" value="a" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1238953654863">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1238953665447">
              <node role="rValue" roleId="tpee.1068498886297" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1238953669213">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238953679232">
                  <property name="value" nameId="tpee.1068580320021" value="2" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.CharConstant" typeId="tpee.1200397529627" id="1238953680586">
                  <property name="charConstant" nameId="tpee.1200397540847" value="b" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1238953654864">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953658642">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953067658" resolveInfo="a" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953662353">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953640417" resolveInfo="c" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1238953699293">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238953700124">
              <property name="value" nameId="tpee.1068580320021" value="2" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953704128">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953067658" resolveInfo="a" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1238953711941">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.CharConstant" typeId="tpee.1200397529627" id="1238953713724">
              <property name="charConstant" nameId="tpee.1200397540847" value="b" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953717526">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953640417" resolveInfo="c" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1238953119221">
        <property name="methodName" nameId="tpe3.1171931690128" value="swapVars" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1238953119222" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238953119223">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1238953125634">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1238953125635">
              <property name="name" nameId="tpck.1169194664001" value="foo" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1238953125636" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1238953127817">
                <property name="value" nameId="tpee.1070475926801" value="bar" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1238953134824">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1238953134825">
              <property name="name" nameId="tpck.1169194664001" value="bar" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1238953134826" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1238953136424">
                <property name="value" nameId="tpee.1070475926801" value="foo" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1238953142591">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1238953147858">
              <node role="rValue" roleId="tpee.1068498886297" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1238953149631">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953151198">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953134825" resolveInfo="bar" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953152231">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953125635" resolveInfo="foo" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1238953142592">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953144450">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953125635" resolveInfo="foo" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953145511">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953134825" resolveInfo="bar" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1238953155093">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1238953155588">
              <property name="value" nameId="tpee.1070475926801" value="foo" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953157257">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953125635" resolveInfo="foo" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1238953160324">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1238953161187">
              <property name="value" nameId="tpee.1070475926801" value="bar" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953163136">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953134825" resolveInfo="bar" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1238953806293">
        <property name="methodName" nameId="tpe3.1171931690128" value="multiValueReturn" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1238953806294" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238953806295">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1238953836181">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1238953836182">
              <property name="name" nameId="tpck.1169194664001" value="pair" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="1238953836183">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="1238953836184" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.CharType" typeId="tpee.1070534555686" id="1238953836185" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238953836186">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1238953836187" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1238953836188">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1238953768403" resolveInfo="toTuple" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1238953836189">
                    <property name="value" nameId="tpee.1070475926801" value="abc" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.CharConstant" typeId="tpee.1200397529627" id="1238953836190">
                    <property name="charConstant" nameId="tpee.1200397540847" value="d" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1238953841385">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1238953842584">
              <property name="value" nameId="tpee.1070475926801" value="abc" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1238953849657">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238953850349">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953849359">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953836182" resolveInfo="pair" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1238953863272">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.CharConstant" typeId="tpee.1200397529627" id="1238953864271">
              <property name="charConstant" nameId="tpee.1200397540847" value="d" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1238953869469">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1238953870020">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238953867900">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238953836182" resolveInfo="pair" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1239723082710">
        <property name="methodName" nameId="tpe3.1171931690128" value="equalsOperator" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1239723082711" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239723082712">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239723098724">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239723098725">
              <property name="name" nameId="tpck.1169194664001" value="tpl1" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="1239723098726">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1239723101339" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.CharType" typeId="tpee.1070534555686" id="1239723107386" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1239723255896">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1239723263531">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.CharConstant" typeId="tpee.1200397529627" id="1239723265264">
                  <property name="charConstant" nameId="tpee.1200397540847" value="a" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239723272181">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239723272182">
              <property name="name" nameId="tpck.1169194664001" value="tpl2" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="1239723272183">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1239723272184" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.CharType" typeId="tpee.1070534555686" id="1239723272185" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1239723272186">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1239723272187">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.CharConstant" typeId="tpee.1200397529627" id="1239723272188">
                  <property name="charConstant" nameId="tpee.1200397540847" value="a" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1239723297894">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1239723300152">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239723301304">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239723272182" resolveInfo="tpl2" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239723299351">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239723098725" resolveInfo="tpl1" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="1239724478066">
            <node role="condition" roleId="tpe3.1171983854940" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="1239724482061">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239724483350">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239723272182" resolveInfo="tpl2" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239724479396">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239723098725" resolveInfo="tpl1" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1239724448625">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1239724452732">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1239724454284">
                <property name="value" nameId="tpee.1068580320021" value="2" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1239724449429">
                <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1239724450863">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239724448626">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239723272182" resolveInfo="tpl2" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1239724456583">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1239724461599">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.CharConstant" typeId="tpee.1200397529627" id="1239724461617">
                <property name="charConstant" nameId="tpee.1200397540847" value="b" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1239724457578">
                <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1239724457721">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239724456584">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239723098725" resolveInfo="tpl1" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1239724468355">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="1239724471660">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239724473095">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239723272182" resolveInfo="tpl2" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239724470428">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239723098725" resolveInfo="tpl1" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="1239724487586">
            <node role="condition" roleId="tpe3.1171983854940" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1239724490032">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239724491049">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239723272182" resolveInfo="tpl2" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239724489445">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239723098725" resolveInfo="tpl1" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="974579920306753694">
        <property name="methodName" nameId="tpe3.1171931690128" value="mps5466" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="974579920306753695" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="974579920306753696">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="974579920306753702">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="974579920306753703">
              <property name="name" nameId="tpck.1169194664001" value="seq" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SequenceType" typeId="tp2q.1151689724996" id="974579920306753704">
                <node role="elementType" roleId="tp2q.1151689745422" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="974579920306753705">
                  <node role="componentType" roleId="cx9y.1238852204892" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="974579920306753706">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
                  </node>
                  <node role="componentType" roleId="cx9y.1238852204892" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="751918362894380664">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" resolveInfo="Boolean" />
                  </node>
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="974579920306753708">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="digr.974579920306753652" resolveInfo="A" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="digr.974579920306753653" resolveInfo="foo" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="974579920306757544">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="974579920306757547">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="974579920306757548">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="974579920306757549">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="974579920306757550">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="974579920306753703" resolveInfo="seq" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.WhereOperation" typeId="tp2q.1202120902084" id="974579920306757551">
                  <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="974579920306757552">
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="974579920306757553">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="974579920306757554">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="974579920306757555">
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="751918362894380666">
                            <property name="value" nameId="tpee.1068580123138" value="true" />
                          </node>
                          <node role="leftExpression" roleId="tpee.1081773367580" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="974579920306757557">
                            <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="974579920306757558">
                              <property name="value" nameId="tpee.1068580320021" value="1" />
                            </node>
                            <node role="tuple" roleId="cx9y.1238857764950" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="974579920306757559">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="974579920306757560" resolveInfo="it" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="974579920306757560">
                      <property name="name" nameId="tpck.1169194664001" value="it" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490683" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="974579920306757562" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="4005114072270948667">
        <property name="methodName" nameId="tpe3.1171931690128" value="listOfTuples" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4005114072270948668" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4005114072270948669" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4005114072270948670">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4005114072270948671">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4005114072270948672">
              <property name="name" nameId="tpck.1169194664001" value="lot" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="4005114072270948673">
                <node role="elementType" roleId="tp2q.1151688676805" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="4005114072270948675">
                  <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4005114072270948677" />
                  <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="4005114072270948679" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4005114072270948681">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="4005114072270948682">
                  <node role="elementType" roleId="tp2q.1237721435807" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="4005114072270948683">
                    <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4005114072270948684" />
                    <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="4005114072270948685" />
                  </node>
                  <node role="initValue" roleId="tp2q.1237721435808" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="4005114072270948687">
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4005114072270948688">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4005114072270948696">
                      <property name="value" nameId="tpee.1070475926801" value="A" />
                    </node>
                  </node>
                  <node role="initValue" roleId="tp2q.1237721435808" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="4005114072270948710">
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4005114072270948717">
                      <property name="value" nameId="tpee.1068580320021" value="2" />
                    </node>
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4005114072270948723">
                      <property name="value" nameId="tpee.1070475926801" value="B" />
                    </node>
                  </node>
                  <node role="initValue" roleId="tp2q.1237721435808" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="4005114072270948733">
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4005114072270948738">
                      <property name="value" nameId="tpee.1068580320021" value="3" />
                    </node>
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4005114072270948751">
                      <property name="value" nameId="tpee.1070475926801" value="C" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="4005114072270948759">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4005114072270948762">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4005114072270948776">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4005114072270948763">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4005114072270948672" resolveInfo="lot" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="4005114072270948786" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="4005114072270948789">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4005114072270948792">
              <property name="value" nameId="tpee.1070475926801" value="B" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="4005114072270948826">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4005114072270948830">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tp2q.ListElementAccessExpression" typeId="tp2q.1225711141656" id="4005114072270948806">
                <node role="index" roleId="tp2q.1225711191269" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4005114072270948810">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="list" roleId="tp2q.1225711182005" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4005114072270948793">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4005114072270948672" resolveInfo="lot" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8084779556530417847">
        <property name="methodName" nameId="tpe3.1171931690128" value="arrayOfTuples" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8084779556530417848" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8084779556530417849" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8084779556530417850">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8084779556530420807">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8084779556530420808">
              <property name="name" nameId="tpck.1169194664001" value="arr1" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="8084779556530425204">
                <node role="componentType" roleId="tpee.1070534760952" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="8084779556530420809">
                  <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="8084779556530420811" />
                  <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="8084779556530420813" />
                  <node role="componentType" roleId="cx9y.1238852204892" type="tpee.BooleanType" typeId="tpee.1070534644030" id="8084779556530420815" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8084779556530430296">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="8084779556530430306">
                  <node role="componentType" roleId="tpee.1154542793668" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="8084779556530430300">
                    <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="8084779556530430301" />
                    <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="8084779556530430302" />
                    <node role="componentType" roleId="cx9y.1238852204892" type="tpee.BooleanType" typeId="tpee.1070534644030" id="8084779556530430303" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="8084779556530430309">
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8084779556530430311">
                      <property name="value" nameId="tpee.1070475926801" value="foo" />
                    </node>
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8084779556530430318">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="8084779556530430353">
                      <property name="value" nameId="tpee.1068580123138" value="false" />
                    </node>
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1604260043160283831">
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1604260043160283832">
                      <property name="value" nameId="tpee.1070475926801" value="bar" />
                    </node>
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1604260043160283833">
                      <property name="value" nameId="tpee.1068580320021" value="2" />
                    </node>
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1604260043160283834">
                      <property name="value" nameId="tpee.1068580123138" value="true" />
                    </node>
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1604260043160283850">
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1604260043160283851">
                      <property name="value" nameId="tpee.1070475926801" value="baz" />
                    </node>
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1604260043160283852">
                      <property name="value" nameId="tpee.1068580320021" value="3" />
                    </node>
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1604260043160283853">
                      <property name="value" nameId="tpee.1068580123138" value="false" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="8084779556530425210">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8084779556530425213">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8084779556530425221">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8084779556530425214">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8084779556530420808" resolveInfo="arr" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.ArrayLengthOperation" typeId="tpee.1208890769693" id="8084779556530425228" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8084779556530425230">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8084779556530425233">
              <property name="value" nameId="tpee.1070475926801" value="foo" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="8084779556530425255">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8084779556530425259">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8084779556530425241">
                <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8084779556530425245">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8084779556530425234">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8084779556530420808" resolveInfo="arr" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1604260043160283865">
            <node role="condition" roleId="tpe3.1171981057159" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1604260043160283912">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1604260043160283916">
                <property name="value" nameId="tpee.1068580320021" value="2" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="1604260043160283886">
                <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1604260043160283890">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1604260043160283867">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8084779556530420808" resolveInfo="arr" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1604260043160283918">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1604260043160283921">
              <property name="value" nameId="tpee.1070475926801" value="baz" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1604260043160283967">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1604260043160283970">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="1604260043160283941">
                <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1604260043160283945">
                  <property name="value" nameId="tpee.1068580320021" value="2" />
                </node>
                <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1604260043160283922">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8084779556530420808" resolveInfo="arr" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="8755343252889980999">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252889981000">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="8755343252889981009">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252889981010">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8755343252889981011">
                <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252889981012">
                  <property name="value" nameId="tpee.1068580320021" value="2" />
                </node>
                <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252889981013">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8084779556530420808" resolveInfo="arr" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1604260043160283986">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1604260043160283987">
              <property name="name" nameId="tpck.1169194664001" value="arr2" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="1604260043160283988">
                <node role="componentType" roleId="tpee.1070534760952" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="1604260043160283989">
                  <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="1604260043160283991" />
                  <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="8755343252889990437" />
                  <node role="componentType" roleId="cx9y.1238852204892" type="tpee.BooleanType" typeId="tpee.1070534644030" id="8755343252889990443" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1604260043160283992">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreator" typeId="tpee.1184950988562" id="1604260043160283993">
                  <node role="componentType" roleId="tpee.1184951007469" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="1604260043160283994">
                    <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="1604260043160283996" />
                    <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="8755343252889990417" />
                    <node role="componentType" roleId="cx9y.1238852204892" type="tpee.BooleanType" typeId="tpee.1070534644030" id="8755343252889990423" />
                  </node>
                  <node role="dimensionExpression" roleId="tpee.1184952969026" type="tpee.DimensionExpression" typeId="tpee.1184952934362" id="1604260043160283997">
                    <node role="expression" roleId="tpee.1184953288404" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1604260043160283998">
                      <property name="value" nameId="tpee.1068580320021" value="3" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1604260043160284001">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1604260043160284004">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1604260043160284006">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1604260043160284005">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1604260043160283987" resolveInfo="pairs" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.ArrayLengthOperation" typeId="tpee.1208890769693" id="1604260043160284010" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="8755343252889990278">
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="8755343252889990279">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8755343252889990326">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="8755343252889990336">
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8755343252889990342">
                    <node role="index" roleId="tpee.1173175577737" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252889990347">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252889990281" resolveInfo="idx" />
                    </node>
                    <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252889990396">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8084779556530420808" resolveInfo="arr1" />
                    </node>
                  </node>
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8755343252889990328">
                    <node role="index" roleId="tpee.1173175577737" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252889990332">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252889990281" resolveInfo="idx" />
                    </node>
                    <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252889990327">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1604260043160283987" resolveInfo="arr2" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8755343252889990281">
              <property name="name" nameId="tpck.1169194664001" value="idx" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="8755343252889990283" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252889990285">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
            <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="8755343252889990287">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8755343252889990309">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252889990290">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8084779556530420808" resolveInfo="arr1" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.ArrayLengthOperation" typeId="tpee.1208890769693" id="8755343252889990322" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252889990286">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252889990281" resolveInfo="idx" />
              </node>
            </node>
            <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="8755343252889990324">
              <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252889990325">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252889990281" resolveInfo="idx" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8755343252889990357">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8755343252889990358">
              <property name="value" nameId="tpee.1070475926801" value="bar" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="8755343252889990359">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252889990360">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8755343252889990361">
                <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252889990362">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252889990388">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1604260043160283987" resolveInfo="arr2" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="8755343252889990449">
            <node role="condition" roleId="tpe3.1171983854940" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="8755343252889990451">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252889990452">
                <property name="value" nameId="tpee.1068580320021" value="2" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8755343252889990453">
                <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252889990454">
                  <property name="value" nameId="tpee.1068580320021" value="2" />
                </node>
                <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252889990455">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1604260043160283987" resolveInfo="arr2" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8755343252889990370">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8755343252889990371">
              <property name="value" nameId="tpee.1070475926801" value="baz" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="8755343252889990372">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252889990373">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8755343252889990374">
                <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252889990375">
                  <property name="value" nameId="tpee.1068580320021" value="2" />
                </node>
                <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252889990457">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1604260043160283987" resolveInfo="arr2" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="8755343252889990377">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252889990378">
              <property name="value" nameId="tpee.1068580320021" value="2" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="8755343252889990379">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252889990380">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8755343252889990381">
                <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252889990382">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252889990459">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1604260043160283987" resolveInfo="arr2" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="3633487734389105383">
        <property name="methodName" nameId="tpe3.1171931690128" value="tupleDecl" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3633487734389105384" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3633487734389105385" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3633487734389105386">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3633487734389105389">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3633487734389105390">
              <property name="name" nameId="tpck.1169194664001" value="sit" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="3633487734389105391">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="3633487734389105393" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.LongType" typeId="tpee.1068581242867" id="3633487734389105395" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3633487734389105397">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="3633487734389105399">
              <node role="rValue" roleId="tpee.1068498886297" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="3633487734389105402">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3633487734389105403">
                  <property name="value" nameId="tpee.1070475926801" value="A" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.LongLiteral" typeId="tpee.4269842503726207156" id="3633487734389105411">
                  <property name="value" nameId="tpee.4269842503726207157" value="-1L" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3633487734389105398">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3633487734389105390" resolveInfo="sit" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="4817470067537857321">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4817470067537857324">
              <property name="value" nameId="tpee.1070475926801" value="A" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="4817470067537857326">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4817470067537857329">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4817470067537857325">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3633487734389105390" resolveInfo="sit" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8209339320719687089">
        <property name="methodName" nameId="tpe3.1171931690128" value="mps7408" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8209339320719687090" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8209339320719687091" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8209339320719687093">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8209339320719687098">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8209339320719687099">
              <property name="name" nameId="tpck.1169194664001" value="foo" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8209339320719687100">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8209339320719679363" resolveInfo="MPS7408" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8209339320719687101">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="8209339320719687102">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8209339320719679365" resolveInfo="MPS7408" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8209339320719706952">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8209339320719706953">
              <property name="name" nameId="tpck.1169194664001" value="asd" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="8209339320719706954">
                <node role="componentType" roleId="cx9y.1238852204892" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="8209339320719706955">
                  <node role="resultType" roleId="tp2c.1199542457201" type="tpee.BooleanType" typeId="tpee.1070534644030" id="8209339320719706956" />
                </node>
                <node role="componentType" roleId="cx9y.1238852204892" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="8209339320719706957">
                  <node role="resultType" roleId="tp2c.1199542457201" type="tpee.VoidType" typeId="tpee.1068581517677" id="8209339320719706958" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="8209339320719817948">
                <node role="component" roleId="cx9y.1238853845806" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="8209339320719820943">
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="8209339320719820944">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8209339320719820947">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="8209339320719820948">
                        <property name="value" nameId="tpee.1068580123138" value="true" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="8209339320719817969">
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="8209339320719817970" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8209339320719687104">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8209339320719687106">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8209339320719687105">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8209339320719687099" resolveInfo="foo" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8209339320719687110">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8209339320719682348" resolveInfo="waitFor" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8209339320719706966">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8209339320719706953" resolveInfo="asd" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="8209339320719687137">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8209339320719687140">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8209339320719687149">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8209339320719687142">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8209339320719687141">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8209339320719687099" resolveInfo="foo" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="8209339320719687148">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="8209339320719679369" resolveInfo="jobs" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="8209339320719687153" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="3340526992428335521">
        <property name="methodName" nameId="tpe3.1171931690128" value="mps7409" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3340526992428335522" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3340526992428335523" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3340526992428335524">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3340526992428335525">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3340526992428335526">
              <property name="name" nameId="tpck.1169194664001" value="t" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="3340526992428335527">
                <node role="componentType" roleId="cx9y.1238852204892" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="3340526992428338495">
                  <node role="resultType" roleId="tp2c.1199542457201" type="tpee.BooleanType" typeId="tpee.1070534644030" id="3340526992428338497" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="3340526992428338499">
                <node role="component" roleId="cx9y.1238853845806" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="3340526992428338502">
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="3340526992428338503">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3340526992428338505">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="3340526992428338506">
                        <property name="value" nameId="tpee.1068580123138" value="false" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="3340526992428338511">
            <node role="condition" roleId="tpe3.1171983854940" type="tp2c.CompactInvokeFunctionExpression" typeId="tp2c.1235746970280" id="3340526992428338530">
              <node role="function" roleId="tp2c.1235746996653" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="3340526992428338531">
                <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3340526992428338532">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3340526992428338533">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3340526992428335526" resolveInfo="t" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6272899139367862288">
        <property name="methodName" nameId="tpe3.1171931690128" value="mps8674" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6272899139367862289" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6272899139367862290" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6272899139367862291">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6272899139367862292">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6272899139367862293">
              <property name="name" nameId="tpck.1169194664001" value="t" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="6272899139367862294">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6272899139367862296" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="6272899139367862298" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="6272899139367862300">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6272899139367862301">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6272899139367862303" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertInNotNull" typeId="tpe3.7080278351417106679" id="6272899139367862305">
            <node role="expression" roleId="tpe3.7080278351417106681" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6272899139367862307">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6272899139367862293" resolveInfo="t" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="6272899139367862309">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6272899139367862312">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="6272899139367862314">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6272899139367862317">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6272899139367862313">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6272899139367862293" resolveInfo="t" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertIsNull" typeId="tpe3.1172028177041" id="6272899139367862319">
            <node role="expression" roleId="tpe3.1172028236559" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="6272899139367862322">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6272899139367862325">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6272899139367862321">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6272899139367862293" resolveInfo="t" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6395420914225303279">
        <property name="methodName" nameId="tpe3.1171931690128" value="mps11114" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6395420914225303280" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6395420914225303281" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6395420914225303282">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="6395420914225306513">
            <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.StatementCommentPart" typeId="tpee.6329021646629175143" id="6395420914225306514">
              <node role="commentedStatement" roleId="tpee.6329021646629175144" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="6395420914225303310">
                <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="6395420914225303311">
                  <property name="name" nameId="tpck.1169194664001" value="tt" />
                </node>
                <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6395420914225303315">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="digr.1543650586506860265" resolveInfo="returnTuples" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="digr.1543650586506860264" resolveInfo="MPS11114" />
                </node>
                <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6395420914225303313">
                  <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertInNotNull" typeId="tpe3.7080278351417106679" id="6395420914225303316">
                    <node role="expression" roleId="tpe3.7080278351417106681" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="6395420914225303318">
                      <link role="variable" roleId="tp2q.1153944258490" targetNodeId="6395420914225303311" resolveInfo="tt" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6395420914225306523">
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6395420914225306519">
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertInNotNull" typeId="tpe3.7080278351417106679" id="6395420914225306520">
                <node role="expression" roleId="tpe3.7080278351417106681" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6395420914225306537">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6395420914225306532" resolveInfo="tt" />
                </node>
              </node>
            </node>
            <node role="iterable" roleId="tpee.1144226360166" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6395420914225306518">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="digr.1543650586506860264" resolveInfo="MPS11114" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="digr.1543650586506860265" resolveInfo="returnTuples" />
            </node>
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6395420914225306532">
              <property name="name" nameId="tpck.1169194664001" value="tt" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="6395420914225306534">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6395420914225306535" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="6395420914225306536" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="5114546151926262828">
        <property name="methodName" nameId="tpe3.1171931690128" value="mps11134" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5114546151926262829" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5114546151926262830" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5114546151926262831">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5114546151926262844">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5114546151926262845">
              <property name="name" nameId="tpck.1169194664001" value="pair" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="5114546151926262846">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5114546151926262847" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5114546151926262848" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="5114546151926262849">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5114546151926262850">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5114546151926262851">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="5114546151926262853">
            <node role="expected" roleId="tpe3.8427750732757990724" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="5114546151926262857">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5114546151926262860">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5114546151926262856">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5114546151926262845" resolveInfo="pair" />
              </node>
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="5114546151926262862">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5114546151926262865">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5114546151926262861">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5114546151926262845" resolveInfo="pair" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5114546151926262867">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5114546151926262868">
              <property name="name" nameId="tpck.1169194664001" value="pair2" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="5114546151926262869">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5114546151926262870" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5114546151926262871" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="5114546151926262872">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="3400244382425900834">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3400244382425900837">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5114546151926262873">
                    <property name="value" nameId="tpee.1068580320021" value="9999" />
                  </node>
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="3400244382425900844">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3400244382425900839">
                    <property name="value" nameId="tpee.1068580320021" value="10001" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3400244382425900843">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="3400244382425900234">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="3400244382425903499">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3400244382425903502">
                <property name="value" nameId="tpee.1068580320021" value="10000" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="3400244382425900236">
                <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3400244382425900237">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3400244382425903519">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5114546151926262868" resolveInfo="pair2" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="3400244382425903504">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="3400244382425903511">
              <node role="rightExpression" roleId="tpee.1081773367579" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="3400244382425903515">
                <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3400244382425903518">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3400244382425903514">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5114546151926262868" resolveInfo="pair2" />
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3400244382425903506">
                <property name="value" nameId="tpee.1068580320021" value="10000" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="429408675341322665">
        <property name="methodName" nameId="tpe3.1171931690128" value="mps6985" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="429408675341322666" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="429408675341322667" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="429408675341322668">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="429408675341322686">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="429408675341322687">
              <property name="name" nameId="tpck.1169194664001" value="pair" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="429408675341322688">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="429408675341322689" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="429408675341322690" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="429408675341322698">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="429408675341322699">
              <node role="rValue" roleId="tpee.1068498886297" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="429408675341322691">
                <node role="key" roleId="tp2q.1197932525128" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="429408675341322692">
                  <property name="value" nameId="tpee.1068580320021" value="42" />
                </node>
                <node role="map" roleId="tp2q.1197932505799" type="tpee.DotExpression" typeId="tpee.1197027756228" id="429408675341322693">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="429408675341322694">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="429408675341322695">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="digr.429408675341322628" resolveInfo="What" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="429408675341322696">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="digr.429408675341322632" resolveInfo="map" />
                  </node>
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="429408675341322700">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="429408675341322687" resolveInfo="pair" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6944702357865114752">
        <property name="methodName" nameId="tpe3.1171931690128" value="mps11447" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6944702357865114753" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6944702357865114754" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6944702357865114755">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6944702357865114777">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6944702357865114778">
              <property name="name" nameId="tpck.1169194664001" value="pair" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="6944702357865114779">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6944702357865114780">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                </node>
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6944702357865114781">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6944702357865114786">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6944702357865114787">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6944702357865114782">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6944702357865114783">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6944702357865114784">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6944702357865114767" resolveInfo="Nulls" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6944702357865114785">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="429408675341331211" resolveInfo="returnsNulls" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6944702357865114788">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6944702357865114778" resolveInfo="pair" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertIsNull" typeId="tpe3.1172028177041" id="6944702357865114790">
            <node role="expression" roleId="tpe3.1172028236559" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="6944702357865114793">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6944702357865114796">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6944702357865114792">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6944702357865114778" resolveInfo="pair" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertIsNull" typeId="tpe3.1172028177041" id="6944702357865114798">
            <node role="expression" roleId="tpe3.1172028236559" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="6944702357865114801">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6944702357865114804">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6944702357865114800">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6944702357865114778" resolveInfo="pair" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1839439077527300892">
        <property name="methodName" nameId="tpe3.1171931690128" value="nulls" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1839439077527300893" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1839439077527300894" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1839439077527300895">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1839439077527302388">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1839439077527302389">
              <property name="name" nameId="tpck.1169194664001" value="pair" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="1839439077527302390">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1839439077527302391" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="1839439077527302392" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1839439077527302401" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertIsNull" typeId="tpe3.1172028177041" id="1839439077527302403">
            <node role="expression" roleId="tpe3.1172028236559" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1839439077527302405">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1839439077527302389" resolveInfo="pair" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1839439077527302397">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1839439077527302398">
              <node role="rValue" roleId="tpee.1068498886297" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1839439077527302393">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1839439077527302394">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1839439077527302395">
                  <property name="value" nameId="tpee.1070475926801" value="1" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1839439077527302399">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1839439077527302389" resolveInfo="pair" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertInNotNull" typeId="tpe3.7080278351417106679" id="1839439077527302407">
            <node role="expression" roleId="tpe3.7080278351417106681" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1839439077527302409">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1839439077527302389" resolveInfo="pair" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1839439077527344120">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1839439077527344121">
              <property name="name" nameId="tpck.1169194664001" value="pair2" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="1839439077527344122">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1839439077527344123" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="1839439077527344124" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1839439077527344128">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1839439077527344130">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1839439077527344133" />
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1839439077527344129">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1839439077527344121" resolveInfo="pair2" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertIsNull" typeId="tpe3.1172028177041" id="1839439077527344135">
            <node role="expression" roleId="tpe3.1172028236559" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1839439077527344147">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1839439077527344121" resolveInfo="pair2" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1839439077527344137">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1839439077527344138">
              <node role="rValue" roleId="tpee.1068498886297" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1839439077527344139">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1839439077527344140">
                  <property name="value" nameId="tpee.1068580320021" value="2" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1839439077527344141">
                  <property name="value" nameId="tpee.1070475926801" value="2" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1839439077527344143">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1839439077527344121" resolveInfo="pair2" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertInNotNull" typeId="tpe3.7080278351417106679" id="1839439077527344144">
            <node role="expression" roleId="tpe3.7080278351417106681" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1839439077527344146">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1839439077527344121" resolveInfo="pair2" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="1239714501613">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1241009559927">
      <property name="name" nameId="tpck.1169194664001" value="getString" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1241009567933">
        <property name="name" nameId="tpck.1169194664001" value="tuples" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.VariableArityType" typeId="tpee.1219920932475" id="1241009567934">
          <node role="componentType" roleId="tpee.1219921048460" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1241009567978">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="Pair" />
            <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="1241009633552" />
            <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="1241009634885" />
          </node>
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1241009559929" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1241009559930">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1241009587741">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1241009587742">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1241009587743">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1241009587744">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1241009587745">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1241009567933" resolveInfo="tuples" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.AsSequenceOperation" typeId="tp2q.1240325842691" id="1241009587746" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.SelectOperation" typeId="tp2q.1202128969694" id="1241009587747">
                <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1241009587748">
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1241009587749">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1241009587750">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1241009587752">
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1241009587753">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1241009587754">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1241009587760" resolveInfo="t" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="4499241871418903159">
                            <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977055868" resolveInfo="second" />
                          </node>
                        </node>
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1241009587751">
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1241009587757">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1241009587758">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1241009587760" resolveInfo="t" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="4499241871418903140">
                              <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977053138" resolveInfo="first" />
                            </node>
                          </node>
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009587756">
                            <property name="value" nameId="tpee.1070475926801" value="=" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1241009587760">
                    <property name="name" nameId="tpck.1169194664001" value="t" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489897" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.JoinOperation" typeId="tp2q.1240687580870" id="1241009587762">
              <node role="delimiter" roleId="tp2q.1240687658305" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009587763">
                <property name="value" nameId="tpee.1070475926801" value=", " />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="1241009677133" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1241009714371">
      <property name="name" nameId="tpck.1169194664001" value="getString" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1241009714372">
        <property name="name" nameId="tpck.1169194664001" value="tuples" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.VariableArityType" typeId="tpee.1219920932475" id="1241009714373">
          <node role="componentType" roleId="tpee.1219921048460" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1241009714408">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="xz5j.1241009437488" resolveInfo="GlobalSharedPair" />
            <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="1241009786674" />
            <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="1241009787949" />
          </node>
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1241009714377" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1241009714378">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1241009714379">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1241009714380">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1241009714381">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1241009714382">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1241009714383">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1241009714372" resolveInfo="tuples" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.AsSequenceOperation" typeId="tp2q.1240325842691" id="1241009714384" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.SelectOperation" typeId="tp2q.1202128969694" id="1241009714385">
                <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1241009714386">
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1241009714387">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="668576388509553871">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="668576388509553873">
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="668576388509553874">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="668576388509553875">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1241009714398" resolveInfo="t" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="668576388509553924">
                            <link role="component" roleId="cx9y.1239576542472" targetNodeId="xz5j.1241009497930" resolveInfo="second" />
                          </node>
                        </node>
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="668576388509553872">
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="668576388509553878">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="668576388509553879">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1241009714398" resolveInfo="t" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="668576388509553905">
                              <link role="component" roleId="cx9y.1239576542472" targetNodeId="xz5j.1241009495081" resolveInfo="first" />
                            </node>
                          </node>
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="668576388509553877">
                            <property name="value" nameId="tpee.1070475926801" value="=" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1241009714398">
                    <property name="name" nameId="tpck.1169194664001" value="t" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490754" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.JoinOperation" typeId="tp2q.1240687580870" id="1241009714400">
              <node role="delimiter" roleId="tp2q.1240687658305" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009714401">
                <property name="value" nameId="tpee.1070475926801" value=", " />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="1241009714402" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1239719969664">
      <property name="name" nameId="tpck.1169194664001" value="getData" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1239719969666" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239719969667">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1239719980559">
          <node role="expression" roleId="tpee.1068580123156" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1239719980560">
            <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239715318677" resolveInfo="Data" />
            <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239719980561">
              <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718410851" resolveInfo="foo" />
              <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239719981888">
                <property name="value" nameId="tpee.1070475926801" value="ABC" />
              </node>
            </node>
            <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239719980563">
              <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718417158" resolveInfo="bar" />
              <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239719985217">
                <property name="value" nameId="tpee.1070475926801" value="XYZ" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1239719973428">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239715318677" resolveInfo="Data" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1239720061720">
      <property name="name" nameId="tpck.1169194664001" value="getSequence" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1239720061722" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239720061723">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1239720095043">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1239720097676">
            <node role="creator" roleId="tpee.1145553007750" type="tp2q.SequenceCreator" typeId="tp2q.1224414427926" id="1239720097677">
              <node role="elementType" roleId="tp2q.1224414456414" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1239720097678">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239715318677" resolveInfo="Data" />
              </node>
              <node role="initializer" roleId="tp2q.1224414466839" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1239720100328">
                <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239720100329">
                  <node role="statement" roleId="tpee.1068581517665" type="tp2c.YieldStatement" typeId="tp2c.1200830824066" id="1239720102562">
                    <node role="expression" roleId="tp2c.1200830928149" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1239720105393">
                      <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239715318677" resolveInfo="Data" />
                      <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239720105394">
                        <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718410851" resolveInfo="foo" />
                        <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239720106632">
                          <property name="value" nameId="tpee.1070475926801" value="ABC" />
                        </node>
                      </node>
                      <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239720105396">
                        <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718417158" resolveInfo="bar" />
                        <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239720109376">
                          <property name="value" nameId="tpee.1070475926801" value="XYZ" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="tp2c.YieldStatement" typeId="tp2c.1200830824066" id="1239720114071">
                    <node role="expression" roleId="tp2c.1200830928149" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1239720116338">
                      <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239715318677" resolveInfo="Data" />
                      <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239720116339">
                        <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718410851" resolveInfo="foo" />
                        <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239720117550">
                          <property name="value" nameId="tpee.1070475926801" value="abc" />
                        </node>
                      </node>
                      <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239720116341">
                        <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718417158" resolveInfo="bar" />
                        <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239720120127">
                          <property name="value" nameId="tpee.1070475926801" value="xyz" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tp2q.SequenceType" typeId="tp2q.1151689724996" id="1239720072261">
        <node role="elementType" roleId="tp2q.1151689745422" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1239720077424">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239715318677" resolveInfo="Data" />
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1239714501614" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="1239714501615">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1239714501616" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1239714501617" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239714501618" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="1239714501619">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1239718482269">
        <property name="methodName" nameId="tpe3.1171931690128" value="createAndAssign" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1239718482270" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239718482271">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="6278501903477416711">
            <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="6278501903477416712">
              <property name="text" nameId="tpee.6329021646629104958" value="this test no longer applies" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6278501903477416704">
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6278501903477416705">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6278501903477416709" />
            </node>
            <node role="condition" roleId="tpee.1068580123160" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="6278501903477416708">
              <property name="value" nameId="tpee.1068580123138" value="true" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239718507781">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239718507782">
              <property name="name" nameId="tpck.1169194664001" value="tpl" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1239718507783">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239715318677" resolveInfo="Data" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1239718514243">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239715318677" resolveInfo="Data" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239718514244">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718410851" resolveInfo="foo" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718515653">
                    <property name="value" nameId="tpee.1070475926801" value="ABC" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239718514246">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718417158" resolveInfo="bar" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718522259">
                    <property name="value" nameId="tpee.1070475926801" value="XYZ" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239718529851">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718530320">
              <property name="value" nameId="tpee.1070475926801" value="ABC" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718533417">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718533178">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718507782" resolveInfo="tpl" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718534826">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718410851" resolveInfo="foo" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239718537185">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718538252">
              <property name="value" nameId="tpee.1070475926801" value="XYZ" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718540514">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718540305">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718507782" resolveInfo="tpl" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718541765">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718417158" resolveInfo="bar" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239718550650">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239718550651">
              <property name="name" nameId="tpck.1169194664001" value="tpl2" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1239718550652">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239715318677" resolveInfo="Data" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718558215">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718507782" resolveInfo="tpl" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239718566658">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718566659">
              <property name="value" nameId="tpee.1070475926801" value="ABC" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718566660">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718570691">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718550651" resolveInfo="tpl2" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718566662">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718410851" resolveInfo="foo" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239718566663">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718566664">
              <property name="value" nameId="tpee.1070475926801" value="XYZ" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718566665">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718571621">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718550651" resolveInfo="tpl2" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718566667">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718417158" resolveInfo="bar" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1239718578255">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1239718581462">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718583120">
                <property name="value" nameId="tpee.1070475926801" value="abc" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718578276">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718578256">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718507782" resolveInfo="tpl" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718579436">
                  <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718410851" resolveInfo="foo" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1239718595508">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1239718597266">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718597287">
                <property name="value" nameId="tpee.1070475926801" value="xyz" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718595529">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718595509">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718507782" resolveInfo="tpl" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718596536">
                  <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718417158" resolveInfo="bar" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239718613100">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718613101">
              <property name="value" nameId="tpee.1070475926801" value="abc" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718613102">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718613103">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718507782" resolveInfo="tpl" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718613104">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718410851" resolveInfo="foo" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239718613105">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718613106">
              <property name="value" nameId="tpee.1070475926801" value="xyz" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718613107">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718613108">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718507782" resolveInfo="tpl" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718613109">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718417158" resolveInfo="bar" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239718604208">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718604209">
              <property name="value" nameId="tpee.1070475926801" value="ABC" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718604210">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718604211">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718550651" resolveInfo="tpl2" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718604212">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718410851" resolveInfo="foo" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239718604213">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718604214">
              <property name="value" nameId="tpee.1070475926801" value="XYZ" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718604215">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718604216">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718550651" resolveInfo="tpl2" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718604217">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718417158" resolveInfo="bar" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1239718627135">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1239718633471">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718635705">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718507782" resolveInfo="tpl" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718631204">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718550651" resolveInfo="tpl2" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239718641740">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718641741">
              <property name="value" nameId="tpee.1070475926801" value="abc" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718641742">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718646129">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718550651" resolveInfo="tpl2" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718641744">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718410851" resolveInfo="foo" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239718641745">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718641746">
              <property name="value" nameId="tpee.1070475926801" value="xyz" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718641747">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718646738">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718550651" resolveInfo="tpl2" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718641749">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718417158" resolveInfo="bar" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1239718652163">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1239718653310">
              <node role="rValue" roleId="tpee.1068498886297" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1239718655623">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239715318677" resolveInfo="Data" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239718655624">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718410851" resolveInfo="foo" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718658897">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718658754">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718507782" resolveInfo="tpl" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718661615">
                      <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718417158" resolveInfo="bar" />
                    </node>
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239718655626">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718417158" resolveInfo="bar" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718663578">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718663561">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718507782" resolveInfo="tpl" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718664501">
                      <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718410851" resolveInfo="foo" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718652164">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718507782" resolveInfo="tpl" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239718670185">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718670186">
              <property name="value" nameId="tpee.1070475926801" value="abc" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718670187">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718670188">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718507782" resolveInfo="tpl" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718674585">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718417158" resolveInfo="bar" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239718670190">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239718670191">
              <property name="value" nameId="tpee.1070475926801" value="xyz" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239718670192">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239718670193">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718507782" resolveInfo="tpl" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239718676434">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718410851" resolveInfo="foo" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1239721803493">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1239721804958">
              <node role="rValue" roleId="tpee.1068498886297" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1239721806628">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239715318677" resolveInfo="Data" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239721806631">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718417158" resolveInfo="bar" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239721813402">
                    <property name="value" nameId="tpee.1070475926801" value="xyz" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239721806629">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718410851" resolveInfo="foo" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239721816046">
                    <property name="value" nameId="tpee.1070475926801" value="abc" />
                  </node>
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239721803494">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718550651" resolveInfo="tpl2" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239721823631">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239721823632">
              <property name="value" nameId="tpee.1070475926801" value="abc" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239721823633">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239721823634">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718550651" resolveInfo="tpl2" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239721823635">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718410851" resolveInfo="foo" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239721823636">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239721823637">
              <property name="value" nameId="tpee.1070475926801" value="xyz" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239721823638">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239721823639">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239718550651" resolveInfo="tpl2" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239721823640">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718417158" resolveInfo="bar" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1239719988389">
        <property name="methodName" nameId="tpe3.1171931690128" value="returnValue" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1239719988390" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239719999843">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239720006876">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239720006877">
              <property name="name" nameId="tpck.1169194664001" value="data" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1239720006878">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239715318677" resolveInfo="Data" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239720006879">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1239720006880" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1239720006881">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1239719969664" resolveInfo="getData" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239720033497">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239720033498">
              <property name="value" nameId="tpee.1070475926801" value="ABC" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239720033499">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239720033501">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239720006877" resolveInfo="tpl" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239720033502">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718410851" resolveInfo="foo" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239720033503">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239720033504">
              <property name="value" nameId="tpee.1070475926801" value="XYZ" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239720033505">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239720033506">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239720006877" resolveInfo="tpl" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239720033507">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718417158" resolveInfo="bar" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1239720051532">
        <property name="methodName" nameId="tpe3.1171931690128" value="sequenceOfTuples" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1239720051533" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239720051534">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239720135281">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239720135282">
              <property name="name" nameId="tpck.1169194664001" value="seq" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SequenceType" typeId="tp2q.1151689724996" id="1239720135283">
                <node role="elementType" roleId="tp2q.1151689745422" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1239720135284">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239715318677" resolveInfo="Data" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239720135285">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1239720135286" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1239720135287">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1239720061720" resolveInfo="getSequence" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="1239720139050">
            <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="1239720139051">
              <property name="name" nameId="tpck.1169194664001" value="tpl" />
            </node>
            <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239720145199">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239720135282" resolveInfo="seq" />
            </node>
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239720139053">
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1239720157209">
                <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239720160877">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239720158520">
                    <property name="value" nameId="tpee.1070475926801" value="abc" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1239720162145">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dequalsIgnoreCase(java%dlang%dString)%cboolean" resolveInfo="equalsIgnoreCase" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239720164453">
                      <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1239720164147">
                        <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1239720139051" resolveInfo="tpl" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239720166128">
                        <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718410851" resolveInfo="foo" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1239720170604">
                <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239720174030">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239720171899">
                    <property name="value" nameId="tpee.1070475926801" value="xyz" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1239720175387">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dequalsIgnoreCase(java%dlang%dString)%cboolean" resolveInfo="equalsIgnoreCase" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239720176876">
                      <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1239720176668">
                        <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1239720139051" resolveInfo="tpl" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239720177307">
                        <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718417158" resolveInfo="bar" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1239722532676">
        <property name="methodName" nameId="tpe3.1171931690128" value="assignToIndexedTupleType" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1239722532677" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239722532678">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239722554917">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239722554918">
              <property name="name" nameId="tpck.1169194664001" value="itpl" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="1239722554919">
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="1239722558447" />
                <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="1239722559862" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239722577522">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1239722577454" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1239722579666">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1239719969664" resolveInfo="getData" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239722585118">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239722586657">
              <property name="value" nameId="tpee.1070475926801" value="ABC" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1239722591261">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1239722591453">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239722590209">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239722554918" resolveInfo="itpl" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239722595264">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239722596340">
              <property name="value" nameId="tpee.1070475926801" value="XYZ" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="cx9y.IndexedTupleMemberAccessExpression" typeId="cx9y.1238857743184" id="1239722600872">
              <node role="index" roleId="cx9y.1238857834412" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1239722601023">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="tuple" roleId="cx9y.1238857764950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239722599820">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239722554918" resolveInfo="itpl" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1239722626730">
        <property name="methodName" nameId="tpe3.1171931690128" value="patternMatching" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1239722626731" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239722626732">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239722632311">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239722632312">
              <property name="name" nameId="tpck.1169194664001" value="foo" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1239722632313" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239722636202">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239722636203">
              <property name="name" nameId="tpck.1169194664001" value="bar" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1239722636204" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1239722643439">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1239722650553">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239722652996">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1239722652833" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1239722654088">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1239719969664" resolveInfo="getData" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1239722643440">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239722646819">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239722632312" resolveInfo="foo" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239722648048">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239722636203" resolveInfo="bar" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239722657605">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239722668350">
              <property name="value" nameId="tpee.1070475926801" value="ABC" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239722674105">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239722632312" resolveInfo="foo" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239722663374">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239722677009">
              <property name="value" nameId="tpee.1070475926801" value="XYZ" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239722681707">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239722636203" resolveInfo="bar" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1239725291893">
        <property name="methodName" nameId="tpe3.1171931690128" value="equalsOperator" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1239725291894" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239725291895">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239725406046">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239725406047">
              <property name="name" nameId="tpck.1169194664001" value="tpl1" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1239725406048">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239715318677" resolveInfo="Data" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239725406049">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1239725406050" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1239725406051">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1239719969664" resolveInfo="getData" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239725422339">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239725422340">
              <property name="name" nameId="tpck.1169194664001" value="tpl2" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1239725422341">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239715318677" resolveInfo="Data" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239725422342">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1239725422343" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1239725422344">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1239719969664" resolveInfo="getData" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="1239725426923">
            <node role="condition" roleId="tpe3.1171983854940" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1239725444247">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1239725432149">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1239725437919">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239725442898">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239725406047" resolveInfo="tpl1" />
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1239725441169">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1239725447990">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1239725450491">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239725453717">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239725422340" resolveInfo="tpl2" />
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1239725452443">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1239725466095">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1239725468061">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239725469157">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239725422340" resolveInfo="tpl2" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239725467505">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239725406047" resolveInfo="tpl1" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="1239725504041">
            <node role="condition" roleId="tpe3.1171983854940" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="1239725507101">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239725508240">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239725422340" resolveInfo="tpl2" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239725505957">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239725406047" resolveInfo="tpl1" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1239725473849">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1239725475856">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239725473850">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239725422340" resolveInfo="tpl2" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1239725486136">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239715318677" resolveInfo="Data" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239725486137">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718410851" resolveInfo="foo" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239725489359">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239725489149">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239725422340" resolveInfo="tpl2" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239725490865">
                      <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718417158" resolveInfo="bar" />
                    </node>
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239725486139">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239718417158" resolveInfo="bar" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239725492856">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239725492515">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239725422340" resolveInfo="tpl2" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239725493439">
                      <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718410851" resolveInfo="foo" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="1239725496617">
            <node role="condition" roleId="tpe3.1171983854940" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1239725500060">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239725500896">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239725422340" resolveInfo="tpl2" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239725499676">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239725406047" resolveInfo="tpl1" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1239725512690">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="1239725514949">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239725515938">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239725422340" resolveInfo="tpl2" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239725514220">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239725406047" resolveInfo="tpl1" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1240574553396">
        <property name="methodName" nameId="tpe3.1171931690128" value="boolean" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1240574553397" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1240574553398">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1240574562853">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1240574562854">
              <property name="name" nameId="tpck.1169194664001" value="truth" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1240574562855">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1240574537739" resolveInfo="Bool" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1240574574363">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1240574537739" resolveInfo="Bool" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1240574574364">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1240574543210" resolveInfo="value" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1240574576406">
                    <property name="value" nameId="tpee.1068580123138" value="true" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1240577891572">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240577895075">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1240577892567">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240574562854" resolveInfo="foo" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1240577895760">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1240574543210" resolveInfo="value" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1240933085547">
        <property name="methodName" nameId="tpe3.1171931690128" value="filter" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1240933085548" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1240933085549">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1240933099759">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1240933099760">
              <property name="name" nameId="tpck.1169194664001" value="seq" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SequenceType" typeId="tp2q.1151689724996" id="1240933099761">
                <node role="elementType" roleId="tp2q.1151689745422" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1240933099762">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239715318677" resolveInfo="Data" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240933099763">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1240933099764" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1240933099765">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1239720061720" resolveInfo="getSequence" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1240933104041">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240933104092">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1240933104042">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240933099760" resolveInfo="seq" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AnyOperation" typeId="tp2q.1235566554328" id="1240933105390">
                <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1240933105391">
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1240933105392">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1240933117800">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1240933118948">
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240933117832">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1240933117801">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240933105393" resolveInfo="it" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1240933118500">
                            <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718410851" resolveInfo="foo" />
                          </node>
                        </node>
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240933121035">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1240933120800">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240933105393" resolveInfo="it" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1240933121886">
                            <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239718417158" resolveInfo="bar" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1240933105393">
                    <property name="name" nameId="tpck.1169194664001" value="it" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490432" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1240940185105">
        <property name="methodName" nameId="tpe3.1171931690128" value="pair" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1240940185106" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1240940185107">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1240940195433">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1240940195434">
              <property name="name" nameId="tpck.1169194664001" value="p" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1240940195561">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="Pair" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1240940233187" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="1240940234377" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1240940220870">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="Pair" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1240940220871">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1240940221914">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1240940220873">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1240940222961">
                    <property name="value" nameId="tpee.1070475926801" value="a" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1240940195443">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1240940195444">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240940195445">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1240940195446">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240940195434" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1240940224787">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977053138" resolveInfo="first" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1240940195448">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1240940195449">
              <property name="value" nameId="tpee.1070475926801" value="a" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240940195450">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1240940195451">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240940195434" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1240940226851">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977055868" resolveInfo="second" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1240940195453">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1240940195454">
              <property name="name" nameId="tpck.1169194664001" value="pp" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1240940195567">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="Pair" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1240940244847" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="1240940246210" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1240940195458">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240940195434" resolveInfo="p" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="6278501903477416701">
            <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.StatementCommentPart" typeId="tpee.6329021646629175143" id="6278501903477416702">
              <node role="commentedStatement" roleId="tpee.6329021646629175144" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="1240940195459">
                <node role="condition" roleId="tpe3.1171983854940" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1240940195460">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1240940195461">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1240940195462">
                      <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1240940195463">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240940195454" resolveInfo="pp" />
                      </node>
                      <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1240940195464">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                      </node>
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1240940195465">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1240940195466">
                      <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1240940195467">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                      </node>
                      <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1240940195468">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240940195434" resolveInfo="p" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1240940195469">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1240940195470">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240940195471">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1240940195472">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240940195454" resolveInfo="pp" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1240940250255">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977053138" resolveInfo="first" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1240940195474">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1240940195475">
              <property name="value" nameId="tpee.1070475926801" value="a" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240940195476">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1240940195477">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240940195454" resolveInfo="pp" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1240940251225">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977055868" resolveInfo="second" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1823663182164682391">
        <property name="methodName" nameId="tpe3.1171931690128" value="valueOfAssignment" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1823663182164682392" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1823663182164682393">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1823663182164682412">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1823663182164682413">
              <property name="name" nameId="tpck.1169194664001" value="pair" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1823663182164682414">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="Pair" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="1823663182164682415" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1823663182164682416" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1823663182164682417">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="Pair" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1823663182164682418">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1823663182164682419">
                    <property name="value" nameId="tpee.1070475926801" value="foo" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1823663182164682420">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1823663182164682421">
                    <property name="value" nameId="tpee.1068580320021" value="13" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1823663182164682444">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1823663182164682445">
              <property name="name" nameId="tpck.1169194664001" value="res" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1823663182164682446" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1823663182164682447">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1823663182164682448">
                  <property name="value" nameId="tpee.1070475926801" value="bar" />
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1823663182164682449">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1823663182164682450">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1823663182164682413" resolveInfo="pair" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1823663182164682451">
                    <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977053138" resolveInfo="first" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1823663182164682455">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1823663182164682458">
              <property name="value" nameId="tpee.1070475926801" value="bar" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1823663182164682459">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1823663182164682445" resolveInfo="res" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1823663182164682478">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1823663182164682479">
              <property name="name" nameId="tpck.1169194664001" value="i" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1823663182164682480" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1823663182164682481">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1823663182164682482">
                  <property name="value" nameId="tpee.1068580320021" value="99" />
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1823663182164682483">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1823663182164682484">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1823663182164682413" resolveInfo="pair" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1823663182164682485">
                    <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977055868" resolveInfo="second" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1823663182164682489">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1823663182164682492">
              <property name="value" nameId="tpee.1068580320021" value="99" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1823663182164682493">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1823663182164682479" resolveInfo="i" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1241009525853">
        <property name="methodName" nameId="tpe3.1171931690128" value="vararg1" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1241009525854" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1241009525855">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1241009642160">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1241009642161">
              <property name="name" nameId="tpck.1169194664001" value="string" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1241009642162" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1241009642163">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1241009642164" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1241009642165">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1241009559927" resolveInfo="getString" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1241009642166">
                    <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="Pair" />
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1241009642167">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009642168">
                        <property name="value" nameId="tpee.1070475926801" value="a" />
                      </node>
                    </node>
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1241009642169">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009642170">
                        <property name="value" nameId="tpee.1070475926801" value="A" />
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1241009642171">
                    <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="Pair" />
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1241009642172">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009642173">
                        <property name="value" nameId="tpee.1070475926801" value="b" />
                      </node>
                    </node>
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1241009642174">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009642175">
                        <property name="value" nameId="tpee.1070475926801" value="B" />
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1241009642176">
                    <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="Pair" />
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1241009642177">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009642178">
                        <property name="value" nameId="tpee.1070475926801" value="c" />
                      </node>
                    </node>
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1241009642179">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009642180">
                        <property name="value" nameId="tpee.1070475926801" value="C" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1241009668957">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009668958">
              <property name="value" nameId="tpee.1070475926801" value="a=A, b=B, c=C" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1241009668959">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1241009642161" resolveInfo="string" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1241009797608">
        <property name="methodName" nameId="tpe3.1171931690128" value="vararg3" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1241009797609" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1241009797610">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1241009797611">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1241009797612">
              <property name="name" nameId="tpck.1169194664001" value="string" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1241009797613" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1241009797614">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1241009797615" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1241009797616">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1241009714371" resolveInfo="getString" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1241009797617">
                    <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="xz5j.1241009437488" resolveInfo="GlobalSharedPair" />
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1241009797618">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="xz5j.1241009495081" resolveInfo="left" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009797619">
                        <property name="value" nameId="tpee.1070475926801" value="a" />
                      </node>
                    </node>
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1241009797620">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="xz5j.1241009497930" resolveInfo="right" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009797621">
                        <property name="value" nameId="tpee.1070475926801" value="A" />
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1241009797622">
                    <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="xz5j.1241009437488" resolveInfo="GlobalSharedPair" />
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1241009797623">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="xz5j.1241009495081" resolveInfo="first" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009797624">
                        <property name="value" nameId="tpee.1070475926801" value="b" />
                      </node>
                    </node>
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1241009797625">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="xz5j.1241009497930" resolveInfo="second" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009797626">
                        <property name="value" nameId="tpee.1070475926801" value="B" />
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1241009797627">
                    <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="xz5j.1241009437488" resolveInfo="GlobalSharedPair" />
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1241009797628">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="xz5j.1241009495081" resolveInfo="first" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009797629">
                        <property name="value" nameId="tpee.1070475926801" value="c" />
                      </node>
                    </node>
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1241009797630">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="xz5j.1241009497930" resolveInfo="second" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009797631">
                        <property name="value" nameId="tpee.1070475926801" value="C" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1241009797632">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1241009797633">
              <property name="value" nameId="tpee.1070475926801" value="a=A, b=B, c=C" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1241009797634">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1241009797612" resolveInfo="string" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="4817470067537861733">
        <property name="methodName" nameId="tpe3.1171931690128" value="listOfTuples" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4817470067537861734" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4817470067537861735" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4817470067537861736">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4817470067537861737">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4817470067537861738">
              <property name="name" nameId="tpck.1169194664001" value="lot" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="4817470067537861739">
                <node role="elementType" roleId="tp2q.1151688676805" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="4817470067537861741">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="(first, second) Pair" />
                  <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="4817470067537861743" />
                  <node role="parameter" roleId="tpee.1109201940907" type="tpee.LongType" typeId="tpee.1068581242867" id="4817470067537861745" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4817470067537861747">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="4817470067537861748">
                  <node role="elementType" roleId="tp2q.1237721435807" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="4817470067537861749">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="(first, second) Pair" />
                    <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="4817470067537861750" />
                    <node role="parameter" roleId="tpee.1109201940907" type="tpee.LongType" typeId="tpee.1068581242867" id="4817470067537861751" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4817470067537861753">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4817470067537861755">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4817470067537861754">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4817470067537861738" resolveInfo="lot" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="4817470067537861759">
                <node role="argument" roleId="tp2q.1160612519549" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="4817470067537861763">
                  <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="(first, second) Pair" />
                  <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="4817470067537861764">
                    <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
                    <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4817470067537861772">
                      <property name="value" nameId="tpee.1070475926801" value="A" />
                    </node>
                  </node>
                  <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="4817470067537861766">
                    <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
                    <node role="value" roleId="cx9y.1239560837729" type="tpee.LongLiteral" typeId="tpee.4269842503726207156" id="4817470067537861782">
                      <property name="value" nameId="tpee.4269842503726207157" value="1L" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4817470067537861792">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4817470067537861794">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4817470067537861793">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4817470067537861738" resolveInfo="lot" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="4817470067537861798">
                <node role="argument" roleId="tp2q.1160612519549" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="4817470067537861802">
                  <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="(first, second) Pair" />
                  <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="4817470067537861803">
                    <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
                    <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4817470067537861811">
                      <property name="value" nameId="tpee.1070475926801" value="B" />
                    </node>
                  </node>
                  <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="4817470067537861805">
                    <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
                    <node role="value" roleId="cx9y.1239560837729" type="tpee.LongLiteral" typeId="tpee.4269842503726207156" id="4817470067537861825">
                      <property name="value" nameId="tpee.4269842503726207157" value="2L" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="4817470067537861835">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4817470067537861838">
              <property name="value" nameId="tpee.1068580320021" value="2" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4817470067537861840">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4817470067537861839">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4817470067537861738" resolveInfo="lot" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="4817470067537861844" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="4817470067537861847">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4817470067537861850">
              <property name="value" nameId="tpee.1070475926801" value="B" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4817470067537861860">
              <node role="operand" roleId="tpee.1197027771414" type="tp2q.ListElementAccessExpression" typeId="tp2q.1225711141656" id="4817470067537861852">
                <node role="index" roleId="tp2q.1225711191269" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4817470067537861856">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="list" roleId="tp2q.1225711182005" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4817470067537861851">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4817470067537861738" resolveInfo="lot" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="4817470067537861866">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977053138" resolveInfo="first" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8755343252890002865">
        <property name="methodName" nameId="tpe3.1171931690128" value="arrayOfTuples" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8755343252890002866" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8755343252890002867" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8755343252890002868">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8755343252890002880">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8755343252890002881">
              <property name="name" nameId="tpck.1169194664001" value="arr1" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="8755343252890002882">
                <node role="componentType" roleId="tpee.1070534760952" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="8755343252890002883">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="(first, second) Pair" />
                  <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="8755343252890002884" />
                  <node role="parameter" roleId="tpee.1109201940907" type="tpee.LongType" typeId="tpee.1068581242867" id="8755343252890002885" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8755343252890002886">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="8755343252890002893">
                  <node role="initValue" roleId="tpee.1154542803372" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="8755343252890002895">
                    <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="Pair" />
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="8755343252890002896">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8755343252890002897">
                        <property name="value" nameId="tpee.1070475926801" value="A" />
                      </node>
                    </node>
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="8755343252890002898">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.LongLiteral" typeId="tpee.4269842503726207156" id="8755343252890002899">
                        <property name="value" nameId="tpee.4269842503726207157" value="1L" />
                      </node>
                    </node>
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="8755343252890002905">
                    <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="Pair" />
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="8755343252890002906">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8755343252890002907">
                        <property name="value" nameId="tpee.1070475926801" value="B" />
                      </node>
                    </node>
                    <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="8755343252890002908">
                      <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
                      <node role="value" roleId="cx9y.1239560837729" type="tpee.LongLiteral" typeId="tpee.4269842503726207156" id="8755343252890002909">
                        <property name="value" nameId="tpee.4269842503726207157" value="2L" />
                      </node>
                    </node>
                  </node>
                  <node role="componentType" roleId="tpee.1154542793668" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="8755343252890002890">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="(first, second) Pair" />
                    <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="8755343252890002891" />
                    <node role="parameter" roleId="tpee.1109201940907" type="tpee.LongType" typeId="tpee.1068581242867" id="8755343252890002892" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8755343252890002915">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8755343252890002916">
              <property name="name" nameId="tpck.1169194664001" value="arr2" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="8755343252890002917">
                <node role="componentType" roleId="tpee.1070534760952" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="8755343252890002918">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="Pair" />
                  <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="8755343252890002919" />
                  <node role="parameter" roleId="tpee.1109201940907" type="tpee.LongType" typeId="tpee.1068581242867" id="8755343252890002920" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8755343252890002921">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreator" typeId="tpee.1184950988562" id="8755343252890007311">
                  <node role="componentType" roleId="tpee.1184951007469" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="8755343252890010271">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="(first, second) Pair" />
                    <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="8755343252890010275" />
                    <node role="parameter" roleId="tpee.1109201940907" type="tpee.LongType" typeId="tpee.1068581242867" id="8755343252890010277" />
                  </node>
                  <node role="dimensionExpression" roleId="tpee.1184952969026" type="tpee.DimensionExpression" typeId="tpee.1184952934362" id="8755343252890007313">
                    <node role="expression" roleId="tpee.1184953288404" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252890010272">
                      <property name="value" nameId="tpee.1068580320021" value="2" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="8755343252890010279">
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="8755343252890010280">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8755343252890010316">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="8755343252890010326">
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8755343252890010340">
                    <node role="index" roleId="tpee.1173175577737" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252890010345">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252890010282" resolveInfo="idx" />
                    </node>
                    <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252890010330">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252890002881" resolveInfo="arr1" />
                    </node>
                  </node>
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8755343252890010318">
                    <node role="index" roleId="tpee.1173175577737" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252890010322">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252890010282" resolveInfo="idx" />
                    </node>
                    <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252890010317">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252890002916" resolveInfo="arr2" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8755343252890010282">
              <property name="name" nameId="tpck.1169194664001" value="idx" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="8755343252890010284" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252890010286">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
            <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="8755343252890010288">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8755343252890010300">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252890010291">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252890002881" resolveInfo="arr1" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.ArrayLengthOperation" typeId="tpee.1208890769693" id="8755343252890010312" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252890010287">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252890010282" resolveInfo="idx" />
              </node>
            </node>
            <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="8755343252890010314">
              <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252890010315">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252890010282" resolveInfo="idx" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8755343252890214767">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8755343252890214779">
              <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252890214782">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252890214770">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252890002881" resolveInfo="arr1" />
              </node>
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8755343252890214785">
              <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252890214789">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252890214784">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252890002916" resolveInfo="arr2" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="8755343252890214793">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.LongLiteral" typeId="tpee.4269842503726207156" id="8755343252890214797">
              <property name="value" nameId="tpee.4269842503726207157" value="1L" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8755343252890214809">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8755343252890214799">
                <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252890214803">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252890214798">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252890002916" resolveInfo="arr2" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="8755343252890214815">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977055868" resolveInfo="second" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8755343252890214819">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8755343252890214822">
              <property name="value" nameId="tpee.1070475926801" value="B" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8755343252890214832">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8755343252890214824">
                <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8755343252890214828">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
                <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8755343252890214823">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8755343252890002916" resolveInfo="arr2" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="8755343252890214838">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977053138" resolveInfo="first" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="4817470067537861870">
        <property name="methodName" nameId="tpe3.1171931690128" value="tupleDecl" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4817470067537861871" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4817470067537861872" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4817470067537861873">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4817470067537861882">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4817470067537861883">
              <property name="name" nameId="tpck.1169194664001" value="pair" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="4817470067537861884">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="(first, second) Pair" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4817470067537861886" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="4817470067537861888" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4817470067537861890">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4817470067537861892">
              <node role="rValue" roleId="tpee.1068498886297" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="4817470067537861895">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="(first, second) Pair" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="4817470067537861896">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4817470067537861910">
                    <property name="value" nameId="tpee.1068580320021" value="-1" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="4817470067537861898">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4817470067537861913">
                    <property name="value" nameId="tpee.1070475926801" value="Z" />
                  </node>
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4817470067537861891">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4817470067537861883" resolveInfo="pair" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertInNotNull" typeId="tpe3.7080278351417106679" id="4817470067537861917">
            <node role="expression" roleId="tpe3.7080278351417106681" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4817470067537861919">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4817470067537861883" resolveInfo="pair" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="4817470067537861921">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4817470067537861924">
              <property name="value" nameId="tpee.1070475926801" value="Z" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4817470067537861926">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4817470067537861925">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4817470067537861883" resolveInfo="pair" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="4817470067537861930">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977055868" resolveInfo="second" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1157155146536637810">
        <property name="methodName" nameId="tpe3.1171931690128" value="record" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1157155146536637811" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1157155146536637812" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1157155146536637813">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1157155146536637827">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1157155146536637828">
              <property name="name" nameId="tpck.1169194664001" value="r" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1157155146536637829">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1157155146536632949" resolveInfo="Record" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1157155146536637830">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1157155146536632949" resolveInfo="Record" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1157155146536637831">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1157155146536632951" resolveInfo="name" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1157155146536637832">
                    <property name="value" nameId="tpee.1070475926801" value="Foo" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1157155146536637833">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1157155146536632954" resolveInfo="age" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1157155146536637834">
                    <property name="value" nameId="tpee.1068580320021" value="567" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1157155146536637835">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1157155146536632957" resolveInfo="size" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.FloatingPointFloatConstant" typeId="tpee.5279705229678483897" id="1157155146536637836">
                    <property name="value" nameId="tpee.5279705229678483899" value="0.5f" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1157155146536637838">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1157155146536637841">
              <property name="value" nameId="tpee.1070475926801" value="Foo:567:0.5" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2224133399080996881">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2224133399080996880">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1157155146536637828" resolveInfo="r" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2224133399080996885">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1157155146536632964" resolveInfo="toString" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="7781156898616395644">
        <property name="methodName" nameId="tpe3.1171931690128" value="mps11134" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7781156898616395645" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7781156898616395646" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7781156898616395647">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7781156898616395656">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7781156898616395657">
              <property name="name" nameId="tpck.1169194664001" value="ip" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="7781156898616395658">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="7781156898616395636" resolveInfo="IntPair" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="7781156898616395659">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="7781156898616395636" resolveInfo="IntPair" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="7781156898616395660">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="7781156898616395638" resolveInfo="a" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7781156898616395661">
                    <property name="value" nameId="tpee.1068580320021" value="7" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="7781156898616395662">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="7781156898616395641" resolveInfo="b" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7781156898616395663">
                    <property name="value" nameId="tpee.1068580320021" value="7" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="4897857316091551900">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="4897857316091551908">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4897857316091551912">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4897857316091551911">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7781156898616395657" resolveInfo="ip" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="4897857316091551916">
                  <link role="component" roleId="cx9y.1239576542472" targetNodeId="7781156898616395641" resolveInfo="b" />
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4897857316091551903">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4897857316091551902">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7781156898616395657" resolveInfo="ip" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="4897857316091551907">
                  <link role="component" roleId="cx9y.1239576542472" targetNodeId="7781156898616395638" resolveInfo="a" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7781156898616395697">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7781156898616395698">
              <property name="name" nameId="tpck.1169194664001" value="ip2" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="7781156898616395699">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="7781156898616395636" resolveInfo="IntPair" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="7781156898616395700">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="7781156898616395636" resolveInfo="IntPair" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="7781156898616395701">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="7781156898616395638" resolveInfo="a" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="7781156898616395702">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7781156898616395703">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7781156898616395704">
                      <property name="value" nameId="tpee.1068580320021" value="9999" />
                    </node>
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="7781156898616395705">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="7781156898616395641" resolveInfo="b" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="7781156898616395706">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7781156898616395707">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7781156898616395708">
                      <property name="value" nameId="tpee.1068580320021" value="10001" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="4897857316091551918">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="4897857316091551926">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4897857316091551930">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4897857316091551929">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7781156898616395698" resolveInfo="ip2" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="4897857316091551934">
                  <link role="component" roleId="cx9y.1239576542472" targetNodeId="7781156898616395641" resolveInfo="b" />
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4897857316091551921">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4897857316091551920">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7781156898616395698" resolveInfo="ip2" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="4897857316091551925">
                  <link role="component" roleId="cx9y.1239576542472" targetNodeId="7781156898616395638" resolveInfo="a" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1839439077527302410">
        <property name="methodName" nameId="tpe3.1171931690128" value="nulls" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1839439077527302411" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1839439077527302412" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1839439077527302413">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1839439077527302422">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1839439077527302423">
              <property name="name" nameId="tpck.1169194664001" value="pair" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1839439077527302424">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="7781156898616395636" resolveInfo="IntPair" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1839439077527302434" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertIsNull" typeId="tpe3.1172028177041" id="1839439077527302436">
            <node role="expression" roleId="tpe3.1172028236559" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1839439077527302438">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1839439077527302423" resolveInfo="pair" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1839439077527302430">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1839439077527302431">
              <node role="rValue" roleId="tpee.1068498886297" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1839439077527302425">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="7781156898616395636" resolveInfo="IntPair" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1839439077527302426">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="7781156898616395638" resolveInfo="a" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1839439077527302427">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1839439077527302428">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="7781156898616395641" resolveInfo="b" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1839439077527302429">
                    <property name="value" nameId="tpee.1068580320021" value="2" />
                  </node>
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1839439077527302432">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1839439077527302423" resolveInfo="pair" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertInNotNull" typeId="tpe3.7080278351417106679" id="1839439077527302440">
            <node role="expression" roleId="tpe3.7080278351417106681" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1839439077527302442">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1839439077527302423" resolveInfo="pair" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6562295948842607129">
        <property name="methodName" nameId="tpe3.1171931690128" value="implementsInterface" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6562295948842607130" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6562295948842607131" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6562295948842607132">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6562295948842607138">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6562295948842607139">
              <property name="name" nameId="tpck.1169194664001" value="sample" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="6562295948842607140">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6562295948842315074" resolveInfo="Sample" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="6562295948842607141">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="6562295948842315074" resolveInfo="Sample" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="6562295948842607142">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="6562295948842486243" resolveInfo="i" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6562295948842607143">
                    <property name="value" nameId="tpee.1068580320021" value="42" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="6562295948842609639">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6562295948842609642">
              <property name="value" nameId="tpee.1068580320021" value="42" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6562295948842609644">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6562295948842609643">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6562295948842607139" resolveInfo="sample" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6562295948842609648">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6562295948842609625" resolveInfo="get" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6562295948842608405">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6562295948842608406">
              <property name="value" nameId="tpee.1070475926801" value="&lt;42&gt;" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6562295948842608407">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6562295948842608410">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6562295948842607139" resolveInfo="sample" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6562295948842608409">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6562295948842607164" resolveInfo="getSample" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6562295948842607147">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6562295948842607148">
              <property name="name" nameId="tpck.1169194664001" value="s" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6562295948842607149">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6562295948842314981" resolveInfo="ISample" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6562295948842607151">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6562295948842607139" resolveInfo="sample" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6562295948842608397">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6562295948842608400">
              <property name="value" nameId="tpee.1070475926801" value="&lt;42&gt;" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6562295948842608401">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6562295948842608402">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6562295948842607148" resolveInfo="s" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6562295948842608403">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6562295948842314983" resolveInfo="getSample" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="1239715318677">
    <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="1239718410851">
      <property name="name" nameId="tpck.1169194664001" value="foo" />
      <node role="type" roleId="cx9y.1239462974287" type="tpee.StringType" typeId="tpee.1225271177708" id="1239718415614" />
    </node>
    <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="1239718417158">
      <property name="name" nameId="tpck.1169194664001" value="bar" />
      <node role="type" roleId="cx9y.1239462974287" type="tpee.StringType" typeId="tpee.1225271177708" id="1239718418125" />
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1239715318678" />
  </root>
  <root id="1239977019775">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1240073848853">
      <property name="name" nameId="tpck.1169194664001" value="pairOfStrings" />
      <node role="returnType" roleId="tpee.1068580123133" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1240073854188">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="Pair" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="1240073859058" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="1240073861144" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1240073848855" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1240073848856">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1240073873703">
          <node role="expression" roleId="tpee.1068580123156" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1240073873704">
            <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="Pair" />
            <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1240073873705">
              <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
              <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1240073875053">
                <property name="value" nameId="tpee.1070475926801" value="X" />
              </node>
            </node>
            <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1240073873707">
              <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
              <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1240073877358">
                <property name="value" nameId="tpee.1070475926801" value="Y" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1239977019776" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="1239977019777">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1239977019778" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1239977019779" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239977019780" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="1239977019781">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1239977032461">
        <property name="methodName" nameId="tpe3.1171931690128" value="pair" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1239977032462" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239977032463">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239977080197">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239977080198">
              <property name="name" nameId="tpck.1169194664001" value="pair" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1239977080199">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="Pair" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="1239977080200" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1239977080201" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1239977080202">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="Pair" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239977080203">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239977080204">
                    <property name="value" nameId="tpee.1070475926801" value="abcd" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239977080205">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1239977080206">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239977086790">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239977087240">
              <property name="value" nameId="tpee.1070475926801" value="abcd" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239977092913">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239977092666">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239977080198" resolveInfo="pair" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239977093818">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977053138" resolveInfo="first" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1239977114203">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1239977114608">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239977117083">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239977116865">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239977080198" resolveInfo="pair" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239977118781">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977055868" resolveInfo="second" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1239977257718">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1239977259904">
              <node role="rValue" roleId="tpee.1068498886297" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1239977262935">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="Pair" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239977262936">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239977264652">
                    <property name="value" nameId="tpee.1070475926801" value="dbca" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239977262938">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1239977269335">
                    <property name="value" nameId="tpee.1068580320021" value="2" />
                  </node>
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239977257719">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239977080198" resolveInfo="pair" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239977274745">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239977274746">
              <property name="value" nameId="tpee.1070475926801" value="dbca" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239977274747">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239977274748">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239977080198" resolveInfo="pair" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239977274749">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977053138" resolveInfo="first" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1239977274750">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1239977274751">
              <property name="value" nameId="tpee.1068580320021" value="2" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1239977274752">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239977274753">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239977080198" resolveInfo="pair" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1239977274754">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1239977055868" resolveInfo="second" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1239977136862">
        <property name="methodName" nameId="tpe3.1171931690128" value="pairToIndexedTuple" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1239977136863" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1239977136864">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239977223488">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239977223489">
              <property name="name" nameId="tpck.1169194664001" value="pair" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="1239977223490">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1239977036413" resolveInfo="Pair" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1239977223491" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="1239977223492" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="1239977223493">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="1239977036413" resolveInfo="Pair" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239977223494">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977053138" resolveInfo="first" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1239977223495">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="1239977223496">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="1239977055868" resolveInfo="second" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239977223497">
                    <property name="value" nameId="tpee.1070475926801" value="abc" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239977238561">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239977238562">
              <property name="name" nameId="tpck.1169194664001" value="x" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1239977238563" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1239977244348">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1239977244349">
              <property name="name" nameId="tpck.1169194664001" value="y" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1239977244350" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1239977231412">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1239977249774">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239977252196">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239977223489" resolveInfo="pair" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="1239977231413">
                <node role="component" roleId="cx9y.1238853845806" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239977246173">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239977238562" resolveInfo="x" />
                </node>
                <node role="component" roleId="cx9y.1238853845806" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239977247272">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239977244349" resolveInfo="y" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1239977286033">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1239977286893">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239977288164">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239977238562" resolveInfo="x" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1239977290885">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1239977292017">
              <property name="value" nameId="tpee.1070475926801" value="abc" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1239977294776">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1239977244349" resolveInfo="y" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="1239977036413">
    <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="1239977053138">
      <property name="name" nameId="tpck.1169194664001" value="first" />
      <node role="type" roleId="cx9y.1239462974287" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="1239977054102">
        <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="1239977047344" resolveInfo="S" />
      </node>
    </node>
    <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="1239977055868">
      <property name="name" nameId="tpck.1169194664001" value="second" />
      <node role="type" roleId="cx9y.1239462974287" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="1239977057067">
        <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="1239977051212" resolveInfo="T" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1239977036414" />
    <node role="typeVariableDeclaration" roleId="tpee.1109279881614" type="tpee.TypeVariableDeclaration" typeId="tpee.1109279763828" id="1239977047344">
      <property name="name" nameId="tpck.1169194664001" value="S" />
    </node>
    <node role="typeVariableDeclaration" roleId="tpee.1109279881614" type="tpee.TypeVariableDeclaration" typeId="tpee.1109279763828" id="1239977051212">
      <property name="name" nameId="tpck.1169194664001" value="T" />
    </node>
  </root>
  <root id="1240574537739">
    <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="1240574543210">
      <property name="final" nameId="cx9y.1240400839614" value="false" />
      <property name="name" nameId="tpck.1169194664001" value="isTrue" />
      <node role="type" roleId="cx9y.1239462974287" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1240574545911" />
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1240574537740" />
  </root>
  <root id="8209339320719679363">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8209339320719682348">
      <property name="name" nameId="tpck.1169194664001" value="waitFor" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8209339320719682352">
        <property name="name" nameId="tpck.1169194664001" value="j" />
        <node role="type" roleId="tpee.5680397130376446158" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="8209339320719682355">
          <node role="componentType" roleId="cx9y.1238852204892" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="8209339320719682356">
            <node role="resultType" roleId="tp2c.1199542457201" type="tpee.BooleanType" typeId="tpee.1070534644030" id="8209339320719682357" />
          </node>
          <node role="componentType" roleId="cx9y.1238852204892" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="8209339320719682358">
            <node role="resultType" roleId="tp2c.1199542457201" type="tpee.VoidType" typeId="tpee.1068581517677" id="8209339320719682359" />
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8209339320719682349" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8209339320719682350" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8209339320719682351">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SynchronizedStatement" typeId="tpee.1170075670744" id="8209339320719682360">
          <node role="expression" roleId="tpee.1170075728144" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8209339320719682364">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="8209339320719682363" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="8209339320719682368">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="8209339320719679369" resolveInfo="jobs" />
            </node>
          </node>
          <node role="block" roleId="tpee.1170075736412" type="tpee.StatementList" typeId="tpee.1068580123136" id="8209339320719682362">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8209339320719682369">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8209339320719682376">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8209339320719682371">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="8209339320719682370" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="8209339320719682375">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="8209339320719679369" resolveInfo="jobs" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="8209339320719682380">
                  <node role="argument" roleId="tp2q.1160612519549" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8209339320719682384">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8209339320719682352" resolveInfo="j" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8209339320719961230">
      <property name="name" nameId="tpck.1169194664001" value="waitFor2" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8209339320719961231" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8209339320719961232" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8209339320719961233">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SynchronizedStatement" typeId="tpee.1170075670744" id="8209339320719961245">
          <node role="expression" roleId="tpee.1170075728144" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8209339320719961248">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="8209339320719961249">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="8209339320719679369" resolveInfo="jobs" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="8209339320719961250" />
          </node>
          <node role="block" roleId="tpee.1170075736412" type="tpee.StatementList" typeId="tpee.1068580123136" id="8209339320719961247">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8209339320719961251">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8209339320719961255">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8209339320719961252">
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="8209339320719961253">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="8209339320719679369" resolveInfo="jobs" />
                  </node>
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="8209339320719961254" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="8209339320719961259">
                  <node role="argument" roleId="tp2q.1160612519549" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="8209339320719961265">
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8209339320719961272">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8209339320719961236" resolveInfo="cond" />
                    </node>
                    <node role="component" roleId="cx9y.1238853845806" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8209339320719961278">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8209339320719961240" resolveInfo="run" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8209339320719961236">
        <property name="name" nameId="tpck.1169194664001" value="cond" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="8209339320719961237">
          <node role="resultType" roleId="tp2c.1199542457201" type="tpee.BooleanType" typeId="tpee.1070534644030" id="8209339320719961239" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8209339320719961240">
        <property name="name" nameId="tpck.1169194664001" value="run" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="8209339320719961242">
          <node role="resultType" roleId="tp2c.1199542457201" type="tpee.VoidType" typeId="tpee.1068581517677" id="8209339320719961244" />
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="8209339320719679369">
      <property name="name" nameId="tpck.1169194664001" value="jobs" />
      <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="8209339320719679372">
        <node role="elementType" roleId="tp2q.1151688676805" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="8209339320719682339">
          <node role="componentType" roleId="cx9y.1238852204892" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="8209339320719682342">
            <node role="resultType" roleId="tp2c.1199542457201" type="tpee.BooleanType" typeId="tpee.1070534644030" id="8209339320719682344" />
          </node>
          <node role="componentType" roleId="cx9y.1238852204892" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="8209339320719682345">
            <node role="resultType" roleId="tp2c.1199542457201" type="tpee.VoidType" typeId="tpee.1068581517677" id="8209339320719682347" />
          </node>
        </node>
      </node>
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="851816110124704733">
        <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="851816110124704734">
          <node role="elementType" roleId="tp2q.1237721435807" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="851816110124704735">
            <node role="componentType" roleId="cx9y.1238852204892" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="851816110124704736">
              <node role="resultType" roleId="tp2c.1199542457201" type="tpee.BooleanType" typeId="tpee.1070534644030" id="851816110124704737" />
            </node>
            <node role="componentType" roleId="cx9y.1238852204892" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="851816110124704738">
              <node role="resultType" roleId="tp2c.1199542457201" type="tpee.VoidType" typeId="tpee.1068581517677" id="851816110124704739" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8209339320719679364" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="8209339320719679365">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8209339320719679366" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8209339320719679367" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8209339320719679368" />
    </node>
  </root>
  <root id="3142843783245432636">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3142843783245432637" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="3142843783245432638">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3142843783245432639" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3142843783245432640" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3142843783245432641" />
    </node>
    <node role="staticInnerClassifiers" roleId="tpee.1178616825527" type="cx9y.NamedTupleDeclaration" typeId="cx9y.1239360506533" id="3142843783245432642">
      <property name="name" nameId="tpck.1169194664001" value="Foo" />
      <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="3142843783245432644">
        <property name="final" nameId="cx9y.1240400839614" value="false" />
        <property name="name" nameId="tpck.1169194664001" value="num" />
        <node role="type" roleId="cx9y.1239462974287" type="tpee.IntegerType" typeId="tpee.1070534370425" id="3142843783245432646" />
      </node>
      <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="3142843783245432647">
        <property name="final" nameId="cx9y.1240400839614" value="false" />
        <property name="name" nameId="tpck.1169194664001" value="str" />
        <node role="type" roleId="cx9y.1239462974287" type="tpee.StringType" typeId="tpee.1225271177708" id="3142843783245432649" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3142843783245432643" />
    </node>
    <node role="staticInnerClassifiers" roleId="tpee.1178616825527" type="cx9y.NamedTupleDeclaration" typeId="cx9y.1239360506533" id="7367153454745440808">
      <property name="name" nameId="tpck.1169194664001" value="Bar" />
      <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="7367153454745566187">
        <property name="final" nameId="cx9y.1240400839614" value="false" />
        <property name="name" nameId="tpck.1169194664001" value="id" />
        <node role="type" roleId="cx9y.1239462974287" type="tpee.StringType" typeId="tpee.1225271177708" id="7367153454745566189" />
      </node>
      <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="7367153454745570764">
        <property name="final" nameId="cx9y.1240400839614" value="false" />
        <property name="name" nameId="tpck.1169194664001" value="size" />
        <node role="type" roleId="cx9y.1239462974287" type="tpee.IntegerType" typeId="tpee.1070534370425" id="7367153454745570766" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7367153454745440809" />
      <node role="extended" roleId="cx9y.322547369016009796" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="322547369016118907">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3142843783245432642" resolveInfo="(num, str) ExtendedNamedTuples.Foo" />
      </node>
    </node>
  </root>
  <root id="4483021482224672488">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4483021482224672489" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="4483021482224672490">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4483021482224672491" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4483021482224672492" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4483021482224672493" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="4483021482224672494">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="4483021482224672495">
        <property name="methodName" nameId="tpe3.1171931690128" value="subtyping" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4483021482224672496" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4483021482224672497" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4483021482224672498">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2912004279740772132">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2912004279740772133">
              <property name="name" nameId="tpck.1169194664001" value="foo" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="2912004279740772134">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3142843783245432642" resolveInfo="(num, str) ExtendedNamedTuples.Foo" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="2912004279740772135">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="3142843783245432642" resolveInfo="(num, str) ExtendedNamedTuples.Foo" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="2912004279740772136">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="3142843783245432644" resolveInfo="num" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2912004279740772137">
                    <property name="value" nameId="tpee.1068580320021" value="123" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="2912004279740772138">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="3142843783245432647" resolveInfo="str" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2912004279740772139">
                    <property name="value" nameId="tpee.1070475926801" value="abc" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6880792723344866594">
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6880792723344866600">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2912004279740772133" resolveInfo="foo" />
            </node>
            <node role="expected" roleId="tpe3.8427750732757990724" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="6880792723345006969">
              <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="3142843783245432642" resolveInfo="ExtendedNamedTuples.Foo" />
              <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="6880792723345006970">
                <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="3142843783245432644" resolveInfo="num" />
                <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6880792723345006976">
                  <property name="value" nameId="tpee.1068580320021" value="123" />
                </node>
              </node>
              <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="6880792723345006974">
                <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="3142843783245432647" resolveInfo="str" />
                <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6880792723345006977">
                  <property name="value" nameId="tpee.1070475926801" value="abc" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2912004279740772158">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2912004279740772159">
              <property name="name" nameId="tpck.1169194664001" value="bar" />
              <node role="type" roleId="tpee.5680397130376446158" type="cx9y.NamedTupleType" typeId="cx9y.1239531918181" id="2912004279740772160">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="7367153454745440808" resolveInfo="(num, str, id, size) ExtendedNamedTuples.Bar" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="2912004279740772161">
                <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="7367153454745440808" resolveInfo="(num, str, id, size) ExtendedNamedTuples.Bar" />
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="2912004279740772162">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="3142843783245432644" resolveInfo="num" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2912004279740772163">
                    <property name="value" nameId="tpee.1068580320021" value="321" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="2912004279740772164">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="3142843783245432647" resolveInfo="str" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2912004279740772165">
                    <property name="value" nameId="tpee.1070475926801" value="CBA" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="2912004279740772166">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="7367153454745566187" resolveInfo="id" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2912004279740772167">
                    <property name="value" nameId="tpee.1070475926801" value="XYZ" />
                  </node>
                </node>
                <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="2912004279740772168">
                  <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="7367153454745570764" resolveInfo="size" />
                  <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2912004279740772169">
                    <property name="value" nameId="tpee.1068580320021" value="42" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2912004279740810727">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2912004279740810729">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2912004279740810732">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2912004279740772159" resolveInfo="bar" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2912004279740810728">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2912004279740772133" resolveInfo="foo" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="2912004279740815602">
            <node role="expected" roleId="tpe3.8427750732757990724" type="cx9y.NamedTupleLiteral" typeId="cx9y.1239559992092" id="2912004279740815605">
              <link role="tupleDeclaration" roleId="cx9y.1239560008022" targetNodeId="3142843783245432642" resolveInfo="(num, str) ExtendedNamedTuples.Foo" />
              <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="2912004279740815606">
                <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="3142843783245432644" resolveInfo="num" />
                <node role="value" roleId="cx9y.1239560837729" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2912004279740815610">
                  <property name="value" nameId="tpee.1068580320021" value="321" />
                </node>
              </node>
              <node role="componentRef" roleId="cx9y.1239560910577" type="cx9y.NamedTupleComponentReference" typeId="cx9y.1239560581441" id="2912004279740815608">
                <link role="componentDeclaration" roleId="cx9y.1239560595302" targetNodeId="3142843783245432647" resolveInfo="str" />
                <node role="value" roleId="cx9y.1239560837729" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2912004279740815611">
                  <property name="value" nameId="tpee.1070475926801" value="CBA" />
                </node>
              </node>
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2912004279740815612">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2912004279740772133" resolveInfo="foo" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="1157155146536632949">
    <node role="method" roleId="cx9y.1500000307918327556" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1157155146536632964">
      <property name="name" nameId="tpck.1169194664001" value="toString" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1157155146536632966" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="1157155146536632968" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1157155146536632975">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1157155146536632976">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1157155146536632992">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1157155146536632996">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1157155146536632995" />
              <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1157155146536633000">
                <link role="component" roleId="cx9y.1239576542472" targetNodeId="1157155146536632957" resolveInfo="size" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1157155146536633005">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1157155146536633008">
                <property name="value" nameId="tpee.1070475926801" value=":" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1157155146536633001">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1157155146536632983">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1157155146536632978">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1157155146536632977" />
                    <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1157155146536632982">
                      <link role="component" roleId="cx9y.1239576542472" targetNodeId="1157155146536632951" resolveInfo="name" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1157155146536633004">
                    <property name="value" nameId="tpee.1070475926801" value=":" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1157155146536632987">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1157155146536632986" />
                  <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="1157155146536632991">
                    <link role="component" roleId="cx9y.1239576542472" targetNodeId="1157155146536632954" resolveInfo="age" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="1157155146536632951">
      <property name="final" nameId="cx9y.1240400839614" value="false" />
      <property name="name" nameId="tpck.1169194664001" value="name" />
      <node role="type" roleId="cx9y.1239462974287" type="tpee.StringType" typeId="tpee.1225271177708" id="1157155146536632953" />
    </node>
    <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="1157155146536632954">
      <property name="final" nameId="cx9y.1240400839614" value="false" />
      <property name="name" nameId="tpck.1169194664001" value="age" />
      <node role="type" roleId="cx9y.1239462974287" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1157155146536632956" />
    </node>
    <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="1157155146536632957">
      <property name="final" nameId="cx9y.1240400839614" value="false" />
      <property name="name" nameId="tpck.1169194664001" value="size" />
      <node role="type" roleId="cx9y.1239462974287" type="tpee.FloatType" typeId="tpee.1070534436861" id="1157155146536632959" />
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1157155146536632950" />
  </root>
  <root id="7781156898616395636">
    <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="7781156898616395638">
      <property name="final" nameId="cx9y.1240400839614" value="false" />
      <property name="name" nameId="tpck.1169194664001" value="a" />
      <node role="type" roleId="cx9y.1239462974287" type="tpee.IntegerType" typeId="tpee.1070534370425" id="7781156898616395640" />
    </node>
    <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="7781156898616395641">
      <property name="final" nameId="cx9y.1240400839614" value="false" />
      <property name="name" nameId="tpck.1169194664001" value="b" />
      <node role="type" roleId="cx9y.1239462974287" type="tpee.IntegerType" typeId="tpee.1070534370425" id="7781156898616395643" />
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7781156898616395637" />
  </root>
  <root id="429408675341331209">
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6944702357865114767">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6944702357865114768" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6944702357865114769" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6944702357865114770" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="429408675341331211">
      <property name="name" nameId="tpck.1169194664001" value="returnsNulls" />
      <node role="returnType" roleId="tpee.1068580123133" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="429408675341331215">
        <node role="componentType" roleId="cx9y.1238852204892" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="429408675341331217">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
        </node>
        <node role="componentType" roleId="cx9y.1238852204892" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="429408675341331219">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="429408675341331213">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="429408675341331220">
          <node role="expression" roleId="tpee.1068580123156" type="cx9y.IndexedTupleLiteral" typeId="cx9y.1238853782547" id="429408675341331221">
            <node role="component" roleId="cx9y.1238853845806" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="429408675341331223" />
            <node role="component" roleId="cx9y.1238853845806" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="429408675341331225" />
          </node>
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="429408675341331214" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6944702357865114726">
      <property name="name" nameId="tpck.1169194664001" value="returnsNull" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6944702357865114728" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6944702357865114729">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6944702357865114735">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6944702357865114736" />
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="cx9y.IndexedTupleType" typeId="cx9y.1238852151516" id="6944702357865114730">
        <node role="componentType" roleId="cx9y.1238852204892" type="tpee.StringType" typeId="tpee.1225271177708" id="6944702357865114732" />
        <node role="componentType" roleId="cx9y.1238852204892" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6944702357865114734" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="429408675341331210" />
  </root>
  <root id="6562295948842314981">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6562295948842314983">
      <property name="isAbstract" nameId="tpee.1178608670077" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="getSample" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="6562295948842315073" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6562295948842314985" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6562295948842314986" />
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6562295948842314982" />
  </root>
  <root id="6562295948842315074">
    <node role="method" roleId="cx9y.1500000307918327556" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6562295948842607164">
      <property name="name" nameId="tpck.1169194664001" value="getSample" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6562295948842607166" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6562295948842607167">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6562295948842607169">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6562295948842607171">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6562295948842607177">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6562295948842607174">
                <property name="value" nameId="tpee.1070475926801" value="&lt;" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6562295948842607181">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6562295948842607180" />
                <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="6562295948842607185">
                  <link role="component" roleId="cx9y.1239576542472" targetNodeId="6562295948842486243" resolveInfo="i" />
                </node>
              </node>
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6562295948842607175">
              <property name="value" nameId="tpee.1070475926801" value="&gt;" />
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="6562295948842607168" />
    </node>
    <node role="method" roleId="cx9y.1500000307918327556" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6562295948842609625">
      <property name="name" nameId="tpck.1169194664001" value="get" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6562295948842609627" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6562295948842609628">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6562295948842609630">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6562295948842609632">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6562295948842609631" />
            <node role="operation" roleId="tpee.1197027833540" type="cx9y.NamedTupleComponentAccessOperation" typeId="cx9y.1239576519914" id="6562295948842609637">
              <link role="component" roleId="cx9y.1239576542472" targetNodeId="6562295948842486243" resolveInfo="i" />
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6562295948842609629" />
    </node>
    <node role="component" roleId="cx9y.1239529553065" type="cx9y.NamedTupleComponentDeclaration" typeId="cx9y.1239462176079" id="6562295948842486243">
      <property name="final" nameId="cx9y.1240400839614" value="false" />
      <property name="name" nameId="tpck.1169194664001" value="i" />
      <node role="type" roleId="cx9y.1239462974287" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6562295948842486245" />
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6562295948842315075" />
    <node role="implements" roleId="cx9y.2423993921025641700" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6562295948842607128">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6562295948842314981" resolveInfo="ISample" />
    </node>
  </root>
</model>

