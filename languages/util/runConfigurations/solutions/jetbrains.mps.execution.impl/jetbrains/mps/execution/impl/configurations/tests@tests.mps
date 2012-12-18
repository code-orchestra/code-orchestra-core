<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00c1e1d0-e3c4-4d43-82f5-4c4f80539a57(jetbrains.mps.execution.impl.configurations.tests@tests)">
  <persistence version="7" />
  <language namespace="f61473f9-130f-42f6-b98d-6c438812c2f6(jetbrains.mps.baseLanguage.unitTest)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="760a0a8c-eabb-4521-8bfd-65db761a9ba3(jetbrains.mps.baseLanguage.logging)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="df345b11-b8c7-4213-ac66-48d2a9b75d88(jetbrains.mps.baseLanguageInternal)" />
  <language namespace="823d79c6-2e26-4b0e-92a0-e1884a10bba9(jetbrains.mps.xml.deprecated)" />
  <language namespace="8585453e-6bfb-4d80-98de-b16074f1d86c(jetbrains.mps.lang.test)" />
  <language namespace="443f4c36-fcf5-4eb6-9500-8d06ed259e3e(jetbrains.mps.baseLanguage.classifiers)" />
  <import index="zr3i" modelUID="r:c10c60c4-8193-4b28-a3f2-372a46125628(jetbrains.mps.execution.impl.configurations)" version="-1" />
  <import index="fxg7" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.io(JDK/java.io@java_stub)" version="-1" />
  <import index="xuot" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#org.jdom(MPS.Classpath/org.jdom@java_stub)" version="-1" />
  <import index="30pf" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.util(MPS.Classpath/jetbrains.mps.util@java_stub)" version="-1" />
  <import index="yv6j" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#org.jdom.transform(MPS.Classpath/org.jdom.transform@java_stub)" version="-1" />
  <import index="bmea" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.xml.transform(JDK/javax.xml.transform@java_stub)" version="-1" />
  <import index="9m8c" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.xml.transform.stream(JDK/javax.xml.transform.stream@java_stub)" version="-1" />
  <import index="u5xh" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#com.intellij.execution.impl(MPS.Classpath/com.intellij.execution.impl@java_stub)" version="-1" />
  <import index="8a0f" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#com.intellij.openapi.util(MPS.Classpath/com.intellij.openapi.util@java_stub)" version="-1" />
  <import index="27v0" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#com.intellij.openapi.project(MPS.Classpath/com.intellij.openapi.project@java_stub)" version="-1" />
  <import index="vfxe" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#com.intellij.execution.configurations(MPS.Classpath/com.intellij.execution.configurations@java_stub)" version="-1" />
  <import index="lk2n" modelUID="r:da044acc-81a4-4fd8-b89a-91df4cfe6214(jetbrains.mps.execution.api.commands)" version="-1" />
  <import index="k7g3" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.util(JDK/java.util@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp5g" modelUID="r:00000000-0000-4000-0000-011c89590388(jetbrains.mps.lang.test.structure)" version="4" implicit="yes" />
  <import index="tpib" modelUID="r:00000000-0000-4000-0000-011c8959057f(jetbrains.mps.baseLanguage.logging.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpkv" modelUID="r:00000000-0000-4000-0000-011c895905a3(jetbrains.mps.xml.deprecated.structure)" version="0" implicit="yes" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" implicit="yes" />
  <import index="tpe3" modelUID="r:00000000-0000-4000-0000-011c895902d7(jetbrains.mps.baseLanguage.unitTest.structure)" version="-1" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="tp4f" modelUID="r:00000000-0000-4000-0000-011c89590373(jetbrains.mps.baseLanguage.classifiers.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tp5g.NodesTestCase" typeId="tp5g.1216913645126" id="7141662564075383485">
      <property name="name" nameId="tpck.1169194664001" value="TestConfigurationsMigration" />
    </node>
    <node type="tpkv.Document" typeId="tpkv.1119976146404" id="7141662564075383487">
      <property name="extension" nameId="tpkv.1234428502488" value="xml" />
      <property name="name" nameId="tpck.1169194664001" value="configurations" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="7141662564075383555">
      <property name="name" nameId="tpck.1169194664001" value="XslTest" />
    </node>
    <node type="tpkv.Document" typeId="tpkv.1119976146404" id="7141662564075383666">
      <property name="extension" nameId="tpkv.1234428502488" value="xml" />
      <property name="name" nameId="tpck.1169194664001" value="old.java.configuration" />
    </node>
    <node type="tpkv.Document" typeId="tpkv.1119976146404" id="2356551895168358975">
      <property name="extension" nameId="tpkv.1234428502488" value="xml" />
      <property name="name" nameId="tpck.1169194664001" value="old.junit.configuration" />
    </node>
    <node type="tp5g.TestInfo" typeId="tp5g.5097124989038916362" id="1720689066387515336">
      <property name="projectPath" nameId="tp5g.5097124989038916363" value="${mps_home}/workbench/runConfigurations/runConfigurations.mpr" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="677474076745506235">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="SplitCommandInParts" />
    </node>
  </roots>
  <root id="7141662564075383485">
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="6496002361768451915">
      <property name="name" nameId="tpck.1169194664001" value="java" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6496002361768451916" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6496002361768451917">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5440470834283012108">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5440470834283012109">
            <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="5440470834283012110" />
            <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierMethodCallOperation" typeId="tp4f.1205769149993" id="5440470834283012111">
              <link role="member" roleId="tp4f.1205756909548" targetNodeId="5440470834283012038" resolveInfo="testConfigurationMigrated" />
              <node role="actualArgument" roleId="tp4f.1205770614681" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5440470834283012113">
                <property name="value" nameId="tpee.1070475926801" value="old.java.configuration.xml" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="2356551895168359035">
      <property name="name" nameId="tpck.1169194664001" value="junit" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2356551895168359036" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2356551895168359037">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2356551895168359038">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2356551895168359039">
            <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="2356551895168359040" />
            <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierMethodCallOperation" typeId="tp4f.1205769149993" id="2356551895168359041">
              <link role="member" roleId="tp4f.1205756909548" targetNodeId="5440470834283012038" resolveInfo="testConfigurationMigrated" />
              <node role="actualArgument" roleId="tp4f.1205770614681" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2356551895168359042">
                <property name="value" nameId="tpee.1070475926801" value="old.junit.configuration.xml" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="methods" roleId="tp5g.1216993439383" type="tp4f.DefaultClassifierMethodDeclaration" typeId="tp4f.1205769003971" id="5440470834283012038">
      <property name="name" nameId="tpck.1169194664001" value="testConfigurationMigrated" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="5440470834283012039" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5440470834283012040" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5440470834283012037">
        <property name="name" nameId="tpck.1169194664001" value="configFile" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="5440470834283012041" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5440470834283012042">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5440470834283012043">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5440470834283012031">
            <property name="name" nameId="tpck.1169194664001" value="element" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5440470834283012044">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="xuot.~Element" resolveInfo="Element" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5440470834283012045">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7141662564075383750" resolveInfo="readAndTransform" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="7141662564075383555" resolveInfo="XslTest" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5440470834283012046">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5440470834283012037" resolveInfo="configFile" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="5440470834283012047">
          <node role="condition" roleId="tpe3.1171981057159" type="tpee.GreaterThanExpression" typeId="tpee.1081506762703" id="5440470834283012048">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5440470834283012049">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5440470834283012050">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5440470834283012051">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5440470834283012052">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5440470834283012031" resolveInfo="element" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5440470834283012053">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="xuot.~Element%dgetChildren()%cjava%dutil%dList" resolveInfo="getChildren" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5440470834283012054">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dsize()%cint" resolveInfo="size" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="5440470834283012055" />
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5440470834283012056">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5440470834283012032">
            <property name="name" nameId="tpck.1169194664001" value="project" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5440470834283012057">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="27v0.~Project" resolveInfo="Project" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="5440470834283012058">
              <node role="array" roleId="tpee.1173175590490" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5440470834283012059">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5440470834283012060">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="27v0.~ProjectManager%dgetInstance()%ccom%dintellij%dopenapi%dproject%dProjectManager" resolveInfo="getInstance" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="27v0.~ProjectManager" resolveInfo="ProjectManager" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5440470834283012061">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="27v0.~ProjectManager%dgetOpenProjects()%ccom%dintellij%dopenapi%dproject%dProject[]" resolveInfo="getOpenProjects" />
                </node>
              </node>
              <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5440470834283012062">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5440470834283012063">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5440470834283012033">
            <property name="name" nameId="tpck.1169194664001" value="runManagerImpl" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5440470834283012064">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="u5xh.~RunManagerImpl" resolveInfo="RunManagerImpl" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5440470834283012065">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="u5xh.~RunManagerImpl%dgetInstanceImpl(com%dintellij%dopenapi%dproject%dProject)%ccom%dintellij%dexecution%dimpl%dRunManagerImpl" resolveInfo="getInstanceImpl" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="u5xh.~RunManagerImpl" resolveInfo="RunManagerImpl" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5440470834283012066">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5440470834283012032" resolveInfo="project" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5440470834283012067">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5440470834283012068">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5440470834283012069">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5440470834283012033" resolveInfo="runManagerImpl" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5440470834283012070">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="u5xh.~RunManagerImpl%dinitializeConfigurationTypes(com%dintellij%dexecution%dconfigurations%dConfigurationType[])%cvoid" resolveInfo="initializeConfigurationTypes" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5440470834283012071">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zr3i.5145867626676112949" resolveInfo="getConfigurationTypes" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="zr3i.5145867626676099642" resolveInfo="RunConfigurationsStateManager" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="5440470834283012072" />
        <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="5440470834283012073">
          <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="5440470834283012035">
            <property name="name" nameId="tpck.1169194664001" value="child" />
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="5440470834283012074">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5440470834283012075">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5440470834283012034">
                <property name="name" nameId="tpck.1169194664001" value="settings" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5440470834283012076">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="u5xh.~RunnerAndConfigurationSettingsImpl" resolveInfo="RunnerAndConfigurationSettingsImpl" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5440470834283012077">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="5440470834283012078">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="u5xh.~RunnerAndConfigurationSettingsImpl%d&lt;init&gt;(com%dintellij%dexecution%dimpl%dRunManagerImpl)" resolveInfo="RunnerAndConfigurationSettingsImpl" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5440470834283012079">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5440470834283012033" resolveInfo="runManagerImpl" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.TryCatchStatement" typeId="tpee.1164879751025" id="5440470834283012080">
              <node role="body" roleId="tpee.1164879758292" type="tpee.StatementList" typeId="tpee.1068580123136" id="5440470834283012081">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5440470834283012082">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5440470834283012083">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5440470834283012084">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5440470834283012034" resolveInfo="settings" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5440470834283012085">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="u5xh.~RunnerAndConfigurationSettingsImpl%dreadExternal(org%djdom%dElement)%cvoid" resolveInfo="readExternal" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5440470834283012086">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5440470834283012087">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="xuot.~Element" resolveInfo="Element" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="5440470834283012088">
                          <link role="variable" roleId="tp2q.1153944258490" targetNodeId="5440470834283012035" resolveInfo="child" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="5440470834283012089">
                  <node role="condition" roleId="tpe3.1171983854940" type="tpee.InstanceOfExpression" typeId="tpee.1081256982272" id="5440470834283012090">
                    <node role="classType" roleId="tpee.1081256993305" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5440470834283012091">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="vfxe.~UnknownConfigurationType" resolveInfo="UnknownConfigurationType" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081256993304" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5440470834283012092">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5440470834283012093">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5440470834283012094">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5440470834283012034" resolveInfo="settings" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5440470834283012095">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="u5xh.~RunnerAndConfigurationSettingsImpl%dgetConfiguration()%ccom%dintellij%dexecution%dconfigurations%dRunConfiguration" resolveInfo="getConfiguration" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5440470834283012096">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="vfxe.~RunConfiguration%dgetType()%ccom%dintellij%dexecution%dconfigurations%dConfigurationType" resolveInfo="getType" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="5440470834283012097">
                <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5440470834283012036">
                  <property name="name" nameId="tpck.1169194664001" value="e" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5440470834283012098">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8a0f.~InvalidDataException" resolveInfo="InvalidDataException" />
                  </node>
                </node>
                <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="5440470834283012099">
                  <node role="statement" roleId="tpee.1068581517665" type="tpe3.Fail" typeId="tpe3.1172017222794" id="5440470834283012100">
                    <node role="message" roleId="tpe3.1172075534298" type="tpe3.Message" typeId="tpe3.1172073500303" id="5440470834283012101">
                      <node role="message" roleId="tpe3.1172073511101" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5440470834283012102">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5440470834283012103">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5440470834283012036" resolveInfo="e" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5440470834283012104">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Throwable%dgetMessage()%cjava%dlang%dString" resolveInfo="getMessage" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5440470834283012105">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5440470834283012106">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5440470834283012031" resolveInfo="element" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5440470834283012107">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="xuot.~Element%dgetChildren()%cjava%dutil%dList" resolveInfo="getChildren" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="7141662564075383487">
    <node role="rootElement" roleId="tpkv.1119976595358" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383488">
      <property name="name" nameId="tpck.1169194664001" value="root" />
      <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383489">
        <property name="name" nameId="tpck.1169194664001" value="configuration" />
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383490">
          <property name="name" nameId="tpck.1169194664001" value="default" />
          <property name="value" nameId="tpkv.1107866755246" value="false" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383491">
          <property name="name" nameId="tpck.1169194664001" value="name" />
          <property name="value" nameId="tpkv.1107866755246" value="Test old" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383492">
          <property name="name" nameId="tpck.1169194664001" value="type" />
          <property name="value" nameId="tpkv.1107866755246" value="JavaApplication" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383493">
          <property name="name" nameId="tpck.1169194664001" value="factoryName" />
          <property name="value" nameId="tpkv.1107866755246" value="Java Application" />
        </node>
        <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383494">
          <property name="name" nameId="tpck.1169194664001" value="MyState" />
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383495">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383496">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="myJavaRunParameters" />
            </node>
            <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383497">
              <property name="name" nameId="tpck.1169194664001" value="ConfigRunParameters" />
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383498">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383499">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="name1" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383500">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="value1 old" />
                </node>
              </node>
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383501">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383502">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="name2" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383503">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="value2 old" />
                </node>
              </node>
            </node>
          </node>
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383504">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383505">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="modelId" />
            </node>
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383506">
              <property name="name" nameId="tpck.1169194664001" value="value" />
              <property name="value" nameId="tpkv.1107866755246" value="modelIdValue old" />
            </node>
          </node>
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383507">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383508">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="nodeId" />
            </node>
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383509">
              <property name="name" nameId="tpck.1169194664001" value="value" />
              <property name="value" nameId="tpkv.1107866755246" value="nodeIdValue old" />
            </node>
          </node>
        </node>
      </node>
      <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383510">
        <property name="name" nameId="tpck.1169194664001" value="configuration" />
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383511">
          <property name="name" nameId="tpck.1169194664001" value="default" />
          <property name="value" nameId="tpkv.1107866755246" value="false" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383512">
          <property name="name" nameId="tpck.1169194664001" value="name" />
          <property name="value" nameId="tpkv.1107866755246" value="Test old" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383513">
          <property name="name" nameId="tpck.1169194664001" value="type" />
          <property name="value" nameId="tpkv.1107866755246" value="balh blah blah" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383514">
          <property name="name" nameId="tpck.1169194664001" value="factoryName" />
          <property name="value" nameId="tpkv.1107866755246" value="I said blah blah blah" />
        </node>
        <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383515">
          <property name="name" nameId="tpck.1169194664001" value="MyState" />
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383516">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383517">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="myJavaRunParameters" />
            </node>
            <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383518">
              <property name="name" nameId="tpck.1169194664001" value="ConfigRunParameters" />
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383519">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383520">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="name1" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383521">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="value1 blah" />
                </node>
              </node>
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383522">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383523">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="name2" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383524">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="value2 blah" />
                </node>
              </node>
            </node>
          </node>
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383525">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383526">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="modelId" />
            </node>
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383527">
              <property name="name" nameId="tpck.1169194664001" value="value" />
              <property name="value" nameId="tpkv.1107866755246" value="modelIdValue blah" />
            </node>
          </node>
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383528">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383529">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="nodeId" />
            </node>
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383530">
              <property name="name" nameId="tpck.1169194664001" value="value" />
              <property name="value" nameId="tpkv.1107866755246" value="nodeIdValue blah" />
            </node>
          </node>
        </node>
      </node>
      <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383531">
        <property name="name" nameId="tpck.1169194664001" value="configuration" />
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383532">
          <property name="name" nameId="tpck.1169194664001" value="default" />
          <property name="value" nameId="tpkv.1107866755246" value="false" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383533">
          <property name="name" nameId="tpck.1169194664001" value="name" />
          <property name="value" nameId="tpkv.1107866755246" value="Test new" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383534">
          <property name="name" nameId="tpck.1169194664001" value="type" />
          <property name="value" nameId="tpkv.1107866755246" value="Java Application" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383535">
          <property name="name" nameId="tpck.1169194664001" value="factoryName" />
          <property name="value" nameId="tpkv.1107866755246" value="Java" />
        </node>
        <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383536">
          <property name="name" nameId="tpck.1169194664001" value="MyState" />
          <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
        </node>
        <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383537">
          <property name="name" nameId="tpck.1169194664001" value="myRunParameters" />
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383538">
            <property name="name" nameId="tpck.1169194664001" value="MyState" />
            <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383539">
              <property name="name" nameId="tpck.1169194664001" value="option" />
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383540">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383541">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="name1" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383542">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="value1 new" />
                </node>
              </node>
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383543">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383544">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="name2" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383545">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="value2 new" />
                </node>
              </node>
              <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383546">
                <property name="name" nameId="tpck.1169194664001" value="name" />
                <property name="value" nameId="tpkv.1107866755246" value="myJavaRunParameters" />
              </node>
            </node>
          </node>
        </node>
        <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383547">
          <property name="name" nameId="tpck.1169194664001" value="myNode" />
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383548">
            <property name="name" nameId="tpck.1169194664001" value="MyState" />
            <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383549">
              <property name="name" nameId="tpck.1169194664001" value="option" />
              <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
              <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383550">
                <property name="name" nameId="tpck.1169194664001" value="name" />
                <property name="value" nameId="tpkv.1107866755246" value="modelId" />
              </node>
              <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383551">
                <property name="name" nameId="tpck.1169194664001" value="value" />
                <property name="value" nameId="tpkv.1107866755246" value="modelIdValue new" />
              </node>
            </node>
            <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="7141662564075383552">
              <property name="name" nameId="tpck.1169194664001" value="option" />
              <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
              <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383553">
                <property name="name" nameId="tpck.1169194664001" value="name" />
                <property name="value" nameId="tpkv.1107866755246" value="nodeId" />
              </node>
              <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="7141662564075383554">
                <property name="name" nameId="tpck.1169194664001" value="value" />
                <property name="value" nameId="tpkv.1107866755246" value="nodeIdValue new" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="7141662564075383555">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7141662564075383556" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="7141662564075383557">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7141662564075383558" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7141662564075383559" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7141662564075383560" />
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="7141662564075383561">
      <property name="name" nameId="tpck.1169194664001" value="main" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7141662564075383562">
        <property name="name" nameId="tpck.1169194664001" value="args" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="7141662564075383563">
          <node role="componentType" roleId="tpee.1070534760952" type="tpee.StringType" typeId="tpee.1225271177708" id="7141662564075383564" />
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7141662564075383565" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7141662564075383566" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7141662564075383567">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7141662564075412230">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7141662564075412231">
            <property name="name" nameId="tpck.1169194664001" value="element" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7141662564075412232">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="xuot.~Element" resolveInfo="Element" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="7141662564075412233">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7141662564075383750" resolveInfo="readAndTransform" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7141662564075412234">
                <property name="value" nameId="tpee.1070475926801" value="old.junit.configuration.xml" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="7141662564075412236">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="7141662564075412237">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7141662564075412245">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7141662564075412246">
                <property name="name" nameId="tpck.1169194664001" value="writer" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7141662564075412247">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~StringWriter" resolveInfo="StringWriter" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7141662564075412248">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7141662564075412249">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~StringWriter%d&lt;init&gt;()" resolveInfo="StringWriter" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7141662564075412251">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7141662564075412252">
                <property name="name" nameId="tpck.1169194664001" value="resultDocument" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7141662564075412253">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="xuot.~Document" resolveInfo="Document" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7141662564075412254">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7141662564075412255">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="xuot.~Document%d&lt;init&gt;(org%djdom%dElement)" resolveInfo="Document" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075412268">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075412231" resolveInfo="element" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.TryCatchStatement" typeId="tpee.1164879751025" id="7141662564075412270">
              <node role="body" roleId="tpee.1164879758292" type="tpee.StatementList" typeId="tpee.1068580123136" id="7141662564075412271">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7141662564075412277">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7141662564075412278">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="30pf.~JDOMUtil" resolveInfo="JDOMUtil" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="30pf.~JDOMUtil%dwriteDocument(org%djdom%dDocument,java%dio%dWriter)%cvoid" resolveInfo="writeDocument" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075412279">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075412252" resolveInfo="resultDocument" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075412280">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075412246" resolveInfo="writer" />
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7141662564075412281">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7141662564075412282">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="7141662564075412283">
                      <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7141662564075412284">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln(java%dlang%dString)%cvoid" resolveInfo="println" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7141662564075412285">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075412286">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075412246" resolveInfo="writer" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7141662564075412287">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~StringWriter%dtoString()%cjava%dlang%dString" resolveInfo="toString" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="7141662564075412273">
                <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7141662564075412274">
                  <property name="name" nameId="tpck.1169194664001" value="e" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7141662564075412289">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~IOException" resolveInfo="IOException" />
                  </node>
                </node>
                <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="7141662564075412276" />
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="7141662564075412241">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="7141662564075412244" />
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075412240">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075412231" resolveInfo="element" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="7141662564075383750">
      <property name="name" nameId="tpck.1169194664001" value="readAndTransform" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7141662564075412221">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="xuot.~Element" resolveInfo="Element" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7141662564075383752" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7141662564075383753">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.TryCatchStatement" typeId="tpee.1164879751025" id="7141662564075383764">
          <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="7141662564075383765">
            <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7141662564075383766">
              <property name="name" nameId="tpck.1169194664001" value="e" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7141662564075383767">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~IOException" resolveInfo="IOException" />
              </node>
            </node>
            <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="7141662564075383768">
              <node role="statement" roleId="tpee.1068581517665" type="tpib.LogStatement" typeId="tpib.1167227138527" id="7141662564075383769">
                <property name="severity" nameId="tpib.1167245565795" value="error" />
                <property name="hasException" nameId="tpib.1167228628751" value="true" />
                <node role="logExpression" roleId="tpib.1167227463056" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7141662564075383770" />
                <node role="exception" roleId="tpib.1167227561449" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075383771">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075383766" resolveInfo="e" />
                </node>
              </node>
            </node>
          </node>
          <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="7141662564075383772">
            <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7141662564075383773">
              <property name="name" nameId="tpck.1169194664001" value="e" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7141662564075383774">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="xuot.~JDOMException" resolveInfo="JDOMException" />
              </node>
            </node>
            <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="7141662564075383775">
              <node role="statement" roleId="tpee.1068581517665" type="tpib.LogStatement" typeId="tpib.1167227138527" id="7141662564075383776">
                <property name="severity" nameId="tpib.1167245565795" value="error" />
                <property name="hasException" nameId="tpib.1167228628751" value="true" />
                <node role="logExpression" roleId="tpib.1167227463056" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7141662564075383777" />
                <node role="exception" roleId="tpib.1167227561449" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075383778">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075383773" resolveInfo="e" />
                </node>
              </node>
            </node>
          </node>
          <node role="body" roleId="tpee.1164879758292" type="tpee.StatementList" typeId="tpee.1068580123136" id="7141662564075383779">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7141662564075383780">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7141662564075383781">
                <property name="name" nameId="tpck.1169194664001" value="document" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7141662564075383782">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="xuot.~Document" resolveInfo="Document" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7141662564075383783">
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="30pf.~JDOMUtil" resolveInfo="JDOMUtil" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="30pf.~JDOMUtil%dloadDocument(java%dio%dInputStream)%corg%djdom%dDocument" resolveInfo="loadDocument" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7141662564075383784">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ClassifierClassExpression" typeId="tpee.1116615150612" id="7141662564075383785">
                      <link role="classifier" roleId="tpee.1116615189566" targetNodeId="7141662564075383555" resolveInfo="XslTest" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7141662564075383786">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Class%dgetResourceAsStream(java%dlang%dString)%cjava%dio%dInputStream" resolveInfo="getResourceAsStream" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7141662564075383864">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075383862" resolveInfo="resourceName" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="7141662564075383788" />
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7141662564075383789">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7141662564075383790">
                <property name="name" nameId="tpck.1169194664001" value="source" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7141662564075383791">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yv6j.~JDOMSource" resolveInfo="JDOMSource" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7141662564075383792">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7141662564075383793">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv6j.~JDOMSource%d&lt;init&gt;(org%djdom%dDocument)" resolveInfo="JDOMSource" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075383794">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075383781" resolveInfo="document" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7141662564075383795">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7141662564075383796">
                <property name="name" nameId="tpck.1169194664001" value="result" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7141662564075383797">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yv6j.~JDOMResult" resolveInfo="JDOMResult" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7141662564075383798">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7141662564075383799">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv6j.~JDOMResult%d&lt;init&gt;()" resolveInfo="JDOMResult" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="7141662564075383800" />
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7141662564075383801">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7141662564075383802">
                <property name="name" nameId="tpck.1169194664001" value="transformer" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7141662564075383803">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bmea.~Transformer" resolveInfo="Transformer" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7141662564075383804">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7141662564075383805">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="bmea.~TransformerFactory" resolveInfo="TransformerFactory" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="bmea.~TransformerFactory%dnewInstance()%cjavax%dxml%dtransform%dTransformerFactory" resolveInfo="newInstance" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7141662564075383806">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="bmea.~TransformerFactory%dnewTransformer(javax%dxml%dtransform%dSource)%cjavax%dxml%dtransform%dTransformer" resolveInfo="newTransformer" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7141662564075383807">
                      <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7141662564075383808">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9m8c.~StreamSource%d&lt;init&gt;(java%dio%dInputStream)" resolveInfo="StreamSource" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7141662564075383809">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ClassifierClassExpression" typeId="tpee.1116615150612" id="7141662564075383810">
                            <link role="classifier" roleId="tpee.1116615189566" targetNodeId="7141662564075383555" resolveInfo="XslTest" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7141662564075383811">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Class%dgetResourceAsStream(java%dlang%dString)%cjava%dio%dInputStream" resolveInfo="getResourceAsStream" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7141662564075383812">
                              <property name="value" nameId="tpee.1070475926801" value="../junit.transform.xml" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7141662564075383813">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7141662564075383814">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075383815">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075383802" resolveInfo="transformer" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7141662564075383816">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="bmea.~Transformer%dtransform(javax%dxml%dtransform%dSource,javax%dxml%dtransform%dResult)%cvoid" resolveInfo="transform" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075383817">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075383790" resolveInfo="source" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075383818">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075383796" resolveInfo="result" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="7141662564075383819" />
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7141662564075383825">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7141662564075383826">
                <property name="name" nameId="tpck.1169194664001" value="root" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7141662564075383827">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="xuot.~Element" resolveInfo="Element" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7141662564075383828">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7141662564075383829">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="xuot.~Element%d&lt;init&gt;(java%dlang%dString)" resolveInfo="Element" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7141662564075383830">
                      <property name="value" nameId="tpee.1070475926801" value="root" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7141662564075383831">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7141662564075383832">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075383833">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075383826" resolveInfo="root" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7141662564075383834">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="xuot.~Element%daddContent(java%dutil%dCollection)%corg%djdom%dElement" resolveInfo="addContent" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7141662564075383835">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075383836">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075383796" resolveInfo="result" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7141662564075383837">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="yv6j.~JDOMResult%dgetResult()%cjava%dutil%dList" resolveInfo="getResult" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7141662564075383867">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075383869">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075383826" resolveInfo="root" />
              </node>
            </node>
          </node>
          <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="7141662564075383855">
            <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7141662564075383856">
              <property name="name" nameId="tpck.1169194664001" value="e" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7141662564075383857">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bmea.~TransformerException" resolveInfo="TransformerException" />
              </node>
            </node>
            <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="7141662564075383858">
              <node role="statement" roleId="tpee.1068581517665" type="tpib.LogStatement" typeId="tpib.1167227138527" id="7141662564075383859">
                <property name="severity" nameId="tpib.1167245565795" value="error" />
                <property name="hasException" nameId="tpib.1167228628751" value="true" />
                <node role="logExpression" roleId="tpib.1167227463056" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7141662564075383860">
                  <property name="value" nameId="tpee.1070475926801" value="Cant transform" />
                </node>
                <node role="exception" roleId="tpib.1167227561449" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7141662564075383861">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7141662564075383856" resolveInfo="e" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7141662564075412223">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="7141662564075412225" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7141662564075383862">
        <property name="name" nameId="tpck.1169194664001" value="resourceName" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="7141662564075383863" />
      </node>
    </node>
  </root>
  <root id="7141662564075383666">
    <node role="rootElement" roleId="tpkv.1119976595358" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358944">
      <property name="name" nameId="tpck.1169194664001" value="root" />
      <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358945">
        <property name="name" nameId="tpck.1169194664001" value="configuration" />
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358946">
          <property name="name" nameId="tpck.1169194664001" value="default" />
          <property name="value" nameId="tpkv.1107866755246" value="false" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358947">
          <property name="name" nameId="tpck.1169194664001" value="name" />
          <property name="value" nameId="tpkv.1107866755246" value="Test old" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358948">
          <property name="name" nameId="tpck.1169194664001" value="type" />
          <property name="value" nameId="tpkv.1107866755246" value="JavaApplication" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358949">
          <property name="name" nameId="tpck.1169194664001" value="factoryName" />
          <property name="value" nameId="tpkv.1107866755246" value="Java Application" />
        </node>
        <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358950">
          <property name="name" nameId="tpck.1169194664001" value="MyState" />
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358951">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358952">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="myJavaRunParameters" />
            </node>
            <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358953">
              <property name="name" nameId="tpck.1169194664001" value="ConfigRunParameters" />
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358954">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358955">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="VMParameters" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358956">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="VMParameters old" />
                </node>
              </node>
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358957">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358958">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="alternativeJRE" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358959">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="alternativeJRE old" />
                </node>
              </node>
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358960">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358961">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="programParameters" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358962">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="programParameters old" />
                </node>
              </node>
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358963">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358964">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="useAlternativeJRE" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358965">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="true" />
                </node>
              </node>
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358966">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358967">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="workingDirectory" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358968">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="workingDirectory old" />
                </node>
              </node>
            </node>
          </node>
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358969">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358970">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="modelId" />
            </node>
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358971">
              <property name="name" nameId="tpck.1169194664001" value="value" />
              <property name="value" nameId="tpkv.1107866755246" value="modelIdValue old" />
            </node>
          </node>
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358972">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358973">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="nodeId" />
            </node>
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358974">
              <property name="name" nameId="tpck.1169194664001" value="value" />
              <property name="value" nameId="tpkv.1107866755246" value="nodeIdValue old" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="2356551895168358975">
    <node role="rootElement" roleId="tpkv.1119976595358" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358976">
      <property name="name" nameId="tpck.1169194664001" value="root" />
      <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358977">
        <property name="name" nameId="tpck.1169194664001" value="configuration" />
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358978">
          <property name="name" nameId="tpck.1169194664001" value="default" />
          <property name="value" nameId="tpkv.1107866755246" value="false" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358979">
          <property name="name" nameId="tpck.1169194664001" value="name" />
          <property name="value" nameId="tpkv.1107866755246" value="Test old" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358980">
          <property name="name" nameId="tpck.1169194664001" value="type" />
          <property name="value" nameId="tpkv.1107866755246" value="JUnit" />
        </node>
        <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358981">
          <property name="name" nameId="tpck.1169194664001" value="factoryName" />
          <property name="value" nameId="tpkv.1107866755246" value="JUnit" />
        </node>
        <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358982">
          <property name="name" nameId="tpck.1169194664001" value="MyState" />
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358983">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358984">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="myJavaRunParameters" />
            </node>
            <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358985">
              <property name="name" nameId="tpck.1169194664001" value="ConfigRunParameters" />
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358986">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358987">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="VMParameters" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358988">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="VMParameters old" />
                </node>
              </node>
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358989">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358990">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="alternativeJRE" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358991">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="alternativeJRE old" />
                </node>
              </node>
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358992">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358993">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="programParameters" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358994">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="programParameters old" />
                </node>
              </node>
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358995">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358996">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="useAlternativeJRE" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358997">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="true" />
                </node>
              </node>
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168358998">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168358999">
                  <property name="name" nameId="tpck.1169194664001" value="name" />
                  <property name="value" nameId="tpkv.1107866755246" value="workingDirectory" />
                </node>
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359000">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="workingDirectory old" />
                </node>
              </node>
            </node>
          </node>
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359008">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359009">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="nodes" />
            </node>
          </node>
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359010">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
            <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359012">
              <property name="name" nameId="tpck.1169194664001" value="option" />
              <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
              <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359013">
                <property name="name" nameId="tpck.1169194664001" value="name" />
                <property name="value" nameId="tpkv.1107866755246" value="fullMethodNames" />
              </node>
            </node>
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359011">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="fullMethodNames" />
            </node>
          </node>
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359884">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359885">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="model" />
            </node>
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359886">
              <property name="name" nameId="tpck.1169194664001" value="value" />
              <property name="value" nameId="tpkv.1107866755246" value="jetbrains.mps.asTest" />
            </node>
          </node>
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359880">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
            <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359881">
              <property name="name" nameId="tpck.1169194664001" value="option" />
              <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
              <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359882">
                <property name="name" nameId="tpck.1169194664001" value="name" />
                <property name="value" nameId="tpkv.1107866755246" value="fullMethodNames" />
              </node>
            </node>
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359883">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="module" />
            </node>
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359887">
              <property name="name" nameId="tpck.1169194664001" value="value" />
              <property name="value" nameId="tpkv.1107866755246" value="collections_unittest" />
            </node>
          </node>
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359024">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359025">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="testMethods" />
            </node>
            <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359027">
              <property name="name" nameId="tpck.1169194664001" value="list" />
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="1626917511854908302">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="1626917511854908303">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="r:914ee49a-537d-44b2-a5fb-bac87a54743d(jetbrains.mps.editorTest)%1883175908513185012" />
                </node>
              </node>
            </node>
          </node>
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359028">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359029">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="testCases" />
            </node>
            <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359030">
              <property name="name" nameId="tpck.1169194664001" value="list" />
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359031">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359032">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="r:914ee49a-537d-44b2-a5fb-bac87a54743d(jetbrains.mps.editorTest)%1883175908513185012" />
                </node>
              </node>
              <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359033">
                <property name="name" nameId="tpck.1169194664001" value="option" />
                <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359034">
                  <property name="name" nameId="tpck.1169194664001" value="value" />
                  <property name="value" nameId="tpkv.1107866755246" value="r:0d165b79-85c3-4fee-8efc-b69a37e1c2ee(orthogonalLayoutTest)%4422427343208739409" />
                </node>
              </node>
            </node>
          </node>
          <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359014">
            <property name="name" nameId="tpck.1169194664001" value="option" />
            <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
            <node role="content" roleId="tpkv.1107866800972" type="tpkv.Element" typeId="tpkv.1107866778860" id="2356551895168359015">
              <property name="name" nameId="tpck.1169194664001" value="option" />
              <property name="collapse" nameId="tpkv.5252685582976647062" value="true" />
              <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359016">
                <property name="name" nameId="tpck.1169194664001" value="name" />
                <property name="value" nameId="tpkv.1107866755246" value="fullMethodNames" />
              </node>
            </node>
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359017">
              <property name="name" nameId="tpck.1169194664001" value="name" />
              <property name="value" nameId="tpkv.1107866755246" value="type" />
            </node>
            <node role="attribute" roleId="tpkv.1107866791721" type="tpkv.Attribute" typeId="tpkv.1107866742882" id="2356551895168359018">
              <property name="name" nameId="tpck.1169194664001" value="value" />
              <property name="value" nameId="tpkv.1107866755246" value="MODULE" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="1720689066387515336" />
  <root id="677474076745506235">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="677474076745506236" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="677474076745506237">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="677474076745506238" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="677474076745506239" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="677474076745506240" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="677474076745506241">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="677474076745509639">
        <property name="methodName" nameId="tpe3.1171931690128" value="withoutSpaces" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="677474076745509640" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="677474076745509641" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="677474076745509642">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1555448025108312809">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1555448025108312812">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dequals(java%dlang%dObject[],java%dlang%dObject[])%cboolean" resolveInfo="equals" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="677474076745509659">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="677474076745509674">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lk2n.8851756219471015167" resolveInfo="splitCommandInParts" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lk2n.3908032508224771422" resolveInfo="ProcessHandlerBuilder" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="677474076745509675">
                    <property name="value" nameId="tpee.1070475926801" value="commandwithoutspaces" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.ToArrayOperation" typeId="tp2q.1184963466173" id="677474076745509663" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="677474076745509664">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="677474076745509671">
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="677474076745509673">
                    <property name="value" nameId="tpee.1070475926801" value="commandwithoutspaces" />
                  </node>
                  <node role="componentType" roleId="tpee.1154542793668" type="tpee.StringType" typeId="tpee.1225271177708" id="677474076745509669" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="677474076745509676">
        <property name="methodName" nameId="tpe3.1171931690128" value="withSpaces" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="677474076745509677" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="677474076745509678" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="677474076745509679">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1555448025108386282">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1555448025108386283">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dequals(java%dlang%dObject[],java%dlang%dObject[])%cboolean" resolveInfo="equals" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1555448025108386284">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1555448025108386285">
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lk2n.3908032508224771422" resolveInfo="ProcessHandlerBuilder" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lk2n.8851756219471015167" resolveInfo="splitCommandInParts" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="677474076745509683">
                    <property name="value" nameId="tpee.1070475926801" value="command with  spaces" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.ToArrayOperation" typeId="tp2q.1184963466173" id="1555448025108386287" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="677474076745509685">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="677474076745509686">
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="677474076745509687">
                    <property name="value" nameId="tpee.1070475926801" value="command" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="677474076745509703">
                    <property name="value" nameId="tpee.1070475926801" value="with" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="677474076745509705">
                    <property name="value" nameId="tpee.1070475926801" value="spaces" />
                  </node>
                  <node role="componentType" roleId="tpee.1154542793668" type="tpee.StringType" typeId="tpee.1225271177708" id="677474076745509688" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="561659872079645209">
        <property name="methodName" nameId="tpe3.1171931690128" value="javaProperties" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="561659872079645210" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="561659872079645211" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="561659872079645212">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="561659872079645213">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="561659872079645214">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dequals(java%dlang%dObject[],java%dlang%dObject[])%cboolean" resolveInfo="equals" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="561659872079645215">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="561659872079645216">
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lk2n.3908032508224771422" resolveInfo="ProcessHandlerBuilder" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lk2n.8851756219471015167" resolveInfo="splitCommandInParts" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="561659872079645217">
                    <property name="value" nameId="tpee.1070475926801" value="-Dxx=xxx   -Dyyy=\&quot;YYY YYY YYY\&quot; -Dzz=zzz" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.ToArrayOperation" typeId="tp2q.1184963466173" id="561659872079645218" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="561659872079645219">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="561659872079645220">
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="561659872079645221">
                    <property name="value" nameId="tpee.1070475926801" value="-Dxx=xxx" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="561659872079645222">
                    <property name="value" nameId="tpee.1070475926801" value="-Dyyy=YYY YYY YYY" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="561659872079645223">
                    <property name="value" nameId="tpee.1070475926801" value="-Dzz=zzz" />
                  </node>
                  <node role="componentType" roleId="tpee.1154542793668" type="tpee.StringType" typeId="tpee.1225271177708" id="561659872079645224" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6709861905465141172">
        <property name="methodName" nameId="tpe3.1171931690128" value="javaCommand" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6709861905465141173" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6709861905465141174" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6709861905465141175">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="6709861905465141176">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6709861905465141177">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dequals(java%dlang%dObject[],java%dlang%dObject[])%cboolean" resolveInfo="equals" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6709861905465141178">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6709861905465141179">
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lk2n.3908032508224771422" resolveInfo="ProcessHandlerBuilder" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lk2n.8851756219471015167" resolveInfo="splitCommandInParts" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465141180">
                    <property name="value" nameId="tpee.1070475926801" value="\&quot;C:\\Program Files (x86)\\Java\\java.exe\&quot; -Dxx=xxx -Dyyy=\&quot;YYY YYY YYY\&quot; -Dzz=zzz -classpath \&quot;C:\\MPS 2.0\\lib\\mps.jar\&quot;:\&quot;C:\\MPS 2.0\\lib\\idea-patch.jar\&quot;:C:\\Path jetbrains.mps.Launcher" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.ToArrayOperation" typeId="tp2q.1184963466173" id="6709861905465141181" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6709861905465141182">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="6709861905465141183">
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465145447">
                    <property name="value" nameId="tpee.1070475926801" value="C:\\Program Files (x86)\\Java\\java.exe" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465141184">
                    <property name="value" nameId="tpee.1070475926801" value="-Dxx=xxx" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465141185">
                    <property name="value" nameId="tpee.1070475926801" value="-Dyyy=YYY YYY YYY" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465141186">
                    <property name="value" nameId="tpee.1070475926801" value="-Dzz=zzz" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465145449">
                    <property name="value" nameId="tpee.1070475926801" value="-classpath" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465145451">
                    <property name="value" nameId="tpee.1070475926801" value="C:\\MPS 2.0\\lib\\mps.jar:C:\\MPS 2.0\\lib\\idea-patch.jar:C:\\Path" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465145453">
                    <property name="value" nameId="tpee.1070475926801" value="jetbrains.mps.Launcher" />
                  </node>
                  <node role="componentType" roleId="tpee.1154542793668" type="tpee.StringType" typeId="tpee.1225271177708" id="6709861905465141187" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6709861905465329438">
        <property name="methodName" nameId="tpe3.1171931690128" value="quotsInCommand" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6709861905465329439" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6709861905465329440" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6709861905465329441">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="6709861905465329442">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6709861905465329445">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dequals(java%dlang%dObject[],java%dlang%dObject[])%cboolean" resolveInfo="equals" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6709861905465329449">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6709861905465329447">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lk2n.8851756219471015167" resolveInfo="splitCommandInParts" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lk2n.3908032508224771422" resolveInfo="ProcessHandlerBuilder" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465329448">
                    <property name="value" nameId="tpee.1070475926801" value="-Dxxx=xxx -Dquoted=\\\&quot;Quoted!\\\&quot; -Dyyy=yyy" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.ToArrayOperation" typeId="tp2q.1184963466173" id="6709861905465329453" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6709861905465329455">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="6709861905465329462">
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465329464">
                    <property name="value" nameId="tpee.1070475926801" value="-Dxxx=xxx" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465329466">
                    <property name="value" nameId="tpee.1070475926801" value="-Dquoted=\&quot;Quoted!\&quot;" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465329468">
                    <property name="value" nameId="tpee.1070475926801" value="-Dyyy=yyy" />
                  </node>
                  <node role="componentType" roleId="tpee.1154542793668" type="tpee.StringType" typeId="tpee.1225271177708" id="6709861905465329460" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6709861905465329469">
        <property name="methodName" nameId="tpe3.1171931690128" value="quotsInCommandStart" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6709861905465329470" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6709861905465329471" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6709861905465329472">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="6709861905465329473">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6709861905465329474">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dequals(java%dlang%dObject[],java%dlang%dObject[])%cboolean" resolveInfo="equals" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6709861905465329475">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6709861905465329476">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lk2n.8851756219471015167" resolveInfo="splitCommandInParts" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lk2n.3908032508224771422" resolveInfo="ProcessHandlerBuilder" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465329477">
                    <property name="value" nameId="tpee.1070475926801" value="\\\&quot;Quoted!\\\&quot; -Dyyy=yyy  " />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.ToArrayOperation" typeId="tp2q.1184963466173" id="6709861905465329478" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6709861905465329479">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="6709861905465329480">
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465329482">
                    <property name="value" nameId="tpee.1070475926801" value="\&quot;Quoted!\&quot;" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465329483">
                    <property name="value" nameId="tpee.1070475926801" value="-Dyyy=yyy" />
                  </node>
                  <node role="componentType" roleId="tpee.1154542793668" type="tpee.StringType" typeId="tpee.1225271177708" id="6709861905465329484" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6709861905465329485">
        <property name="methodName" nameId="tpe3.1171931690128" value="quotsInCommandEnd" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6709861905465329486" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6709861905465329487" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6709861905465329488">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="6709861905465329489">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6709861905465329490">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" resolveInfo="Arrays" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dequals(java%dlang%dObject[],java%dlang%dObject[])%cboolean" resolveInfo="equals" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6709861905465329491">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6709861905465329492">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lk2n.8851756219471015167" resolveInfo="splitCommandInParts" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lk2n.3908032508224771422" resolveInfo="ProcessHandlerBuilder" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465329493">
                    <property name="value" nameId="tpee.1070475926801" value="-Dxxx=xxx -Dquoted=\\\&quot;Quoted!\\\&quot;" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.ToArrayOperation" typeId="tp2q.1184963466173" id="6709861905465329494" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6709861905465329495">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="6709861905465329496">
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465329497">
                    <property name="value" nameId="tpee.1070475926801" value="-Dxxx=xxx" />
                  </node>
                  <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6709861905465329498">
                    <property name="value" nameId="tpee.1070475926801" value="-Dquoted=\&quot;Quoted!\&quot;" />
                  </node>
                  <node role="componentType" roleId="tpee.1154542793668" type="tpee.StringType" typeId="tpee.1225271177708" id="6709861905465329500" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

