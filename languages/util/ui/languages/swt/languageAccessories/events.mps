<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:b5bea281-ab90-4fa9-bfa9-a6d130009710(jetbrains.mps.ui.swt.events)">
  <persistence version="7" />
  <language namespace="8a448bd0-1380-4c01-9820-0f051d33888c(jetbrains.mps.ui.modeling)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <import index="3ly5" modelUID="r:840b989b-d75d-4268-abaa-4676d1720c58(jetbrains.mps.ui.events)" version="-1" />
  <import index="zgwc" modelUID="f:java_stub#69934240-945d-492b-83e7-39bda70200e7#org.eclipse.swt.events(jetbrains.mps.ui.swt.runtime/org.eclipse.swt.events@java_stub)" version="-1" />
  <import index="3c2k" modelUID="f:java_stub#69934240-945d-492b-83e7-39bda70200e7#org.eclipse.swt.widgets(jetbrains.mps.ui.swt.runtime/org.eclipse.swt.widgets@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="sqp9" modelUID="r:ba1d89ed-800e-4d0a-ad09-221b1011fbd1(jetbrains.mps.ui.modeling.structure)" version="2" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" implicit="yes" />
  <roots>
    <node type="sqp9.EventHandlerTemplate" typeId="sqp9.8115675450774717215" id="3980696573555893435">
      <property name="name" nameId="tpck.1169194664001" value="SelectEvent" />
      <link role="event" roleId="sqp9.8115675450775148415" targetNodeId="3ly5.5275753781174783545" resolveInfo="ActionEvent" />
    </node>
  </roots>
  <root id="3980696573555893435">
    <node role="eventType" roleId="sqp9.8115675450774806489" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3980696573555895748">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="zgwc.~SelectionEvent" resolveInfo="SelectionEvent" />
    </node>
    <node role="producerType" roleId="sqp9.5703963167136336336" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3980696573555895749">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3c2k.~Button" resolveInfo="Button" />
    </node>
    <node role="setup" roleId="sqp9.8115675450774806490" type="sqp9.EventHandlerSetup" typeId="sqp9.8115675450774806491" id="3980696573555893438">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3980696573555893439">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3980696573555895750">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3980696573555895752">
            <node role="operand" roleId="tpee.1197027771414" type="sqp9.EventProducerParam" typeId="sqp9.5703963167136660800" id="3980696573555895751" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3980696573555908520">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3c2k.~Button%daddSelectionListener(org%declipse%dswt%devents%dSelectionListener)%cvoid" resolveInfo="addSelectionListener" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3980696573555908521">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="3980696573555909125">
                  <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="3980696573555909126">
                    <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
                    <link role="classifier" roleId="tpee.1170346070688" targetNodeId="zgwc.~SelectionAdapter" resolveInfo="SelectionAdapter" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zgwc.~SelectionAdapter%d&lt;init&gt;()" resolveInfo="SelectionAdapter" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3980696573555909127" />
                    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="3980696573555909128">
                      <property name="name" nameId="tpck.1169194664001" value="widgetSelected" />
                      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3980696573555909129" />
                      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3980696573555909130" />
                      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="3980696573555909131">
                        <property name="name" nameId="tpck.1169194664001" value="e" />
                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3980696573555909132">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="zgwc.~SelectionEvent" resolveInfo="SelectionEvent" />
                        </node>
                      </node>
                      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3980696573555909133">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4181924746626299689">
                          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4181924746626299690">
                            <property name="name" nameId="tpck.1169194664001" value="h" />
                            <node role="type" roleId="tpee.5680397130376446158" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="4181924746626299691">
                              <node role="parameterType" roleId="tp2c.1199542501692" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4181924746626299692">
                                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="zgwc.~SelectionEvent" resolveInfo="SelectionEvent" />
                              </node>
                              <node role="resultType" roleId="tp2c.1199542457201" type="tpee.VoidType" typeId="tpee.1068581517677" id="4181924746626299693" />
                            </node>
                            <node role="initializer" roleId="tpee.1068431790190" type="sqp9.EventHandlerParam" typeId="sqp9.8115675450774807738" id="4181924746626299694" />
                          </node>
                        </node>
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3980696573555909237">
                          <node role="expression" roleId="tpee.1068580123156" type="tp2c.CompactInvokeFunctionExpression" typeId="tp2c.1235746970280" id="3980696573555909239">
                            <node role="parameter" roleId="tp2c.1235747002942" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3980696573555909258">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3980696573555909131" resolveInfo="event" />
                            </node>
                            <node role="function" roleId="tp2c.1235746996653" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4181924746626299695">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4181924746626299690" resolveInfo="h" />
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="3980696573555909134">
                        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" />
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
  </root>
</model>

