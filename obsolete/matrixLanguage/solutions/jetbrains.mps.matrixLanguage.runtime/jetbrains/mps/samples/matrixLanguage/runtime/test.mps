<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c89590458(jetbrains.mps.samples.matrixLanguage.runtime.test)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="f61473f9-130f-42f6-b98d-6c438812c2f6(jetbrains.mps.baseLanguage.unitTest)" />
  <import index="tpor" modelUID="r:00000000-0000-4000-0000-011c89590457(jetbrains.mps.samples.matrixLanguage.runtime)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpe3" modelUID="r:00000000-0000-4000-0000-011c895902d7(jetbrains.mps.baseLanguage.unitTest.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="1209979054679">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="MatrixTest" />
    </node>
  </roots>
  <root id="1209979054679">
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="1209997010404">
      <property name="name" nameId="tpck.1169194664001" value="EPSILON" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="1209997010405" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="1209997015099" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1209997023347">
        <property name="value" nameId="tpee.1113006610751" value="0.00001" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1209982076238">
      <property name="name" nameId="tpck.1169194664001" value="makeMatrix" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1209982388255">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210159496371">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" resolveInfo="Double" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1209982076240" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1209982581526">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1209982666104">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1216562295414">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1216562295417">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1210153033269" resolveInfo="Matrix" />
              <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210159500237">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" resolveInfo="Double" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1209982669820">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="1209982669821">
                  <node role="componentType" roleId="tpee.1154542793668" type="tpee.ArrayType" typeId="tpee.1070534760951" id="1209982669822">
                    <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210159521368">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" resolveInfo="Double" />
                    </node>
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.ArrayLiteral" typeId="tpee.1188220165133" id="1209982669824">
                    <node role="item" roleId="tpee.1188220173759" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1209982669825">
                      <property name="value" nameId="tpee.1113006610751" value="10.0" />
                    </node>
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.ArrayLiteral" typeId="tpee.1188220165133" id="1209982669826">
                    <node role="item" roleId="tpee.1188220173759" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1209982669827">
                      <property name="value" nameId="tpee.1113006610751" value="20.0" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1216562298710">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1216562298712">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1210153463385" resolveInfo="DoubleFieldOperations" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1209979054680" />
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="1209979054681">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1209979058932">
        <property name="methodName" nameId="tpe3.1171931690128" value="matixCreation" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1209979058933" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1209979058934">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1209979090779">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1209979090780">
              <property name="name" nameId="tpck.1169194664001" value="m" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1209979090781">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210159531131">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" resolveInfo="Double" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209982711038">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209982711039">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1209982076238" resolveInfo="makeMatrix" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1209982711040" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1209981222467">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1209981226206">
              <property name="value" nameId="tpee.1113006610751" value="10.0" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1210159534257">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209981235170">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1209981231754">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209979090780" resolveInfo="m" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209981239736">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1209980434079" resolveInfo="getValueAt" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1209981241081">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1209981284313">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1210159538995">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Double%ddoubleValue()%cdouble" resolveInfo="doubleValue" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1209981292644">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1209981294570">
              <property name="value" nameId="tpee.1113006610751" value="20.0" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1210159543371">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209981299847">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1209981298809">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209979090780" resolveInfo="m" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209981304804">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1209980434079" resolveInfo="getValueAt" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1209981325247">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1209981319323">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1210159544671">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Double%ddoubleValue()%cdouble" resolveInfo="doubleValue" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1209982716187">
        <property name="methodName" nameId="tpe3.1171931690128" value="matrixCopy" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1209982716188" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1209982716189">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1209982729573">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1209982729574">
              <property name="name" nameId="tpck.1169194664001" value="m" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1209982729575">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209982785215">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209982785216">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1209982076238" resolveInfo="makeMatrix" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1209982785217" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1209982826984">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1209982826985">
              <property name="name" nameId="tpck.1169194664001" value="c" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1209982826986">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209982833673">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1209982833640">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209982729574" resolveInfo="m" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209982843905">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1209981406336" resolveInfo="clone" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1209983125105">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1209983133698">
              <property name="value" nameId="tpee.1113006610751" value="10.0" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209983141098">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1209983141081">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209982826985" resolveInfo="c" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209983147135">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1209980434079" resolveInfo="getValueAt" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1209983148970">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1209983209726">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1209984795518">
        <property name="methodName" nameId="tpe3.1171931690128" value="multiplicationByDouble" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1209984795519" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1209984795520">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1209984818563">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1209984818564">
              <property name="name" nameId="tpck.1169194664001" value="m" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1209984818565">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209984823861">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209984823862">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1209982076238" resolveInfo="makeMatrix" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1209984823863" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1209984833107">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1209984833108">
              <property name="name" nameId="tpck.1169194664001" value="result" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1209984833109">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209984843779">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1209984843778">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209984818564" resolveInfo="m" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209984850486">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1209984254660" resolveInfo="mult" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1210159576554">
                    <property name="value" nameId="tpee.1113006610751" value="2.0" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1209984861767">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1209984861768">
              <property name="value" nameId="tpee.1113006610751" value="20.0" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209984861769">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1209984869465">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209984833108" resolveInfo="result" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209984861771">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1209980434079" resolveInfo="getValueAt" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1209984861772">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1209984861773">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1209986019324">
        <property name="methodName" nameId="tpe3.1171931690128" value="matrixAddition" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1209986019325" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1209986019326">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1209986103646">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1209986103647">
              <property name="name" nameId="tpck.1169194664001" value="m" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1209986103648">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209986137563">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209986137564">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1209982076238" resolveInfo="makeMatrix" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1209986137565" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1209986155001">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1209986155002">
              <property name="name" nameId="tpck.1169194664001" value="d" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1209986155003">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209986164595">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1209986163119">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209986103647" resolveInfo="m" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209986167089">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1209984941837" resolveInfo="add" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1209986170614">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209986103647" resolveInfo="m" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1209986178855">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1209986178856">
              <property name="value" nameId="tpee.1113006610751" value="20.0" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209986178857">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1209986208224">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209986155002" resolveInfo="d" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209986178859">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1209980434079" resolveInfo="getValueAt" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1209986178860">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1209986178861">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1209996084279">
        <property name="methodName" nameId="tpe3.1171931690128" value="matrixDeterminant2" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1209996084280" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1209996084281">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1209996084282">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1209996084283">
              <property name="name" nameId="tpck.1169194664001" value="m" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1209996084284">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210159427972">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" resolveInfo="Double" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1216562281989">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1216562281992">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1210153033269" resolveInfo="Matrix" />
                  <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210159422477">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" resolveInfo="Double" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1209996084286">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="1209996084287">
                      <node role="componentType" roleId="tpee.1154542793668" type="tpee.ArrayType" typeId="tpee.1070534760951" id="1209996084288">
                        <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210159392056">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" resolveInfo="Double" />
                        </node>
                      </node>
                      <node role="initValue" roleId="tpee.1154542803372" type="tpee.ArrayLiteral" typeId="tpee.1188220165133" id="1209996084290">
                        <node role="item" roleId="tpee.1188220173759" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1209996084291">
                          <property name="value" nameId="tpee.1113006610751" value="1.0" />
                        </node>
                        <node role="item" roleId="tpee.1188220173759" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1209996107051">
                          <property name="value" nameId="tpee.1113006610751" value="2.0" />
                        </node>
                      </node>
                      <node role="initValue" roleId="tpee.1154542803372" type="tpee.ArrayLiteral" typeId="tpee.1188220165133" id="1209996100652">
                        <node role="item" roleId="tpee.1188220173759" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1209996100653">
                          <property name="value" nameId="tpee.1113006610751" value="3.0" />
                        </node>
                        <node role="item" roleId="tpee.1188220173759" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1209996113012">
                          <property name="value" nameId="tpee.1113006610751" value="4.0" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1216562286091">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1216562286093">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1210153463385" resolveInfo="DoubleFieldOperations" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1209996961073">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="1209997042461">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="1209997044039">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209997010404" resolveInfo="EPSILON" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1209996977145">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209996967411">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1209996967373">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209996084283" resolveInfo="m" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209996970469">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1209990108954" resolveInfo="determinant" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1209996978130">
                  <property name="value" nameId="tpee.1068580320021" value="2" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1209998882758">
        <property name="methodName" nameId="tpe3.1171931690128" value="matrixTranspose" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1209998882759" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1209998882760">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1209998882761">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1209998882762">
              <property name="name" nameId="tpck.1169194664001" value="m" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1209998893988">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209998882764">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209998882765">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1209982076238" resolveInfo="makeMatrix" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1209998882766" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1209998917638">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1209998917639">
              <property name="name" nameId="tpck.1169194664001" value="t" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1209998917640">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209998925752">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1209998924812">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209998882762" resolveInfo="m" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209998930868">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1209986357670" resolveInfo="transpose" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1209998882774">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1209998882775">
              <property name="value" nameId="tpee.1113006610751" value="20.0" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1209998882776">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1209998937119">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209998917639" resolveInfo="t" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1209998882778">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1209980434079" resolveInfo="getValueAt" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1209998882779">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1209998882780">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1210002752505">
        <property name="methodName" nameId="tpe3.1171931690128" value="matrixMultiplication" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1210002752506" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1210002752507">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1210002787763">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1210002787764">
              <property name="name" nameId="tpck.1169194664001" value="m" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210002787765">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1210002801171">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1210002801172">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1209982076238" resolveInfo="makeMatrix" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1210002801173" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1210002810262">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1210002810263">
              <property name="name" nameId="tpck.1169194664001" value="t" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210002810264">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1210002810265">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210002810266">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1210002787764" resolveInfo="m" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1210002810267">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1209986357670" resolveInfo="transpose" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1210002843413">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1210002959302">
              <property name="value" nameId="tpee.1113006610751" value="500.0" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1210002862800">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1210002852567">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210002852551">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1210002810263" resolveInfo="t" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1210002855026">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1210002194351" resolveInfo="mult" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210002866290">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1210002787764" resolveInfo="m" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1210002883120">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1209980434079" resolveInfo="getValueAt" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1210002884544">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1210002923547">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1210242075071">
        <property name="methodName" nameId="tpe3.1171931690128" value="iteratorTest" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1210242075072" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1210242075073">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1210242090506">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1210242090507">
              <property name="name" nameId="tpck.1169194664001" value="m" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210242090508">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1209978932613" resolveInfo="Matrix" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210242118265">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" resolveInfo="Double" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1210242101906">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1210242101907">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1209982076238" resolveInfo="makeMatrix" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1210242101908" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1210242112040">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1210242112041">
              <property name="name" nameId="tpck.1169194664001" value="i" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210242112042">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="tpor.1210241674240" resolveInfo="MatrixIterator" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1216562291504">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1216562291506">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1210241718295" resolveInfo="MatrixIterator" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210242126975">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1210242090507" resolveInfo="m" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1210242143583">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1210242146323">
              <property name="value" nameId="tpee.1113006610751" value="10.0" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1210242151392">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210242151373">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1210242112041" resolveInfo="i" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1210242153990">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1210241770067" resolveInfo="getNext" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1210242158791">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1210242158792">
              <property name="value" nameId="tpee.1113006610751" value="20.0" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1210242158793">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210242158794">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1210242112041" resolveInfo="i" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1210242158795">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpor.1210241770067" resolveInfo="getNext" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

