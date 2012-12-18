<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:29a1b5f5-cf76-4978-a4ac-fe622e0f96ff(jetbrains.mps.debug.evaluation.transform.tests)">
  <persistence version="7" />
  <language namespace="8585453e-6bfb-4d80-98de-b16074f1d86c(jetbrains.mps.lang.test)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="7da4580f-9d75-4603-8162-51a896d78375(jetbrains.mps.debug.evaluation)" />
  <language namespace="df345b11-b8c7-4213-ac66-48d2a9b75d88(jetbrains.mps.baseLanguageInternal)" />
  <language namespace="7a5dda62-9140-4668-ab76-d5ed1746f2b2(jetbrains.mps.lang.typesystem)" />
  <language namespace="3a13115c-633c-4c5c-bbcc-75c4219e9555(jetbrains.mps.lang.quotation)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="443f4c36-fcf5-4eb6-9500-8d06ed259e3e(jetbrains.mps.baseLanguage.classifiers)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="80208897-4572-437d-b50e-8f050cba9566(jetbrains.mps.debug.privateMembers)" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="te5p" modelUID="r:b4456070-b665-4c03-b3d3-15a7362ba239(jetbrains.mps.debug.evaluation.transform)" version="-1" />
  <import index="l352" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.debug.evaluation.proxies(jetbrains.mps.debug.evaluation.proxies@java_stub)" version="-1" />
  <import index="qyyw" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.debug.evaluation(jetbrains.mps.debug.evaluation@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(java.lang@java_stub)" version="-1" />
  <import index="lkfb" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.smodel(jetbrains.mps.smodel@java_stub)" version="-1" />
  <import index="8413" modelUID="f:java_stub#cf8c9de5-1b4a-4dc8-8e6d-847159af31dd#com.sun.jdi(com.sun.jdi@java_stub)" version="-1" />
  <import index="3yeq" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#com.intellij.tests(MPS.Classpath/com.intellij.tests@java_stub)" version="-1" />
  <import index="22fg" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.net(JDK/java.net@java_stub)" version="-1" />
  <import index="tp5g" modelUID="r:00000000-0000-4000-0000-011c89590388(jetbrains.mps.lang.test.structure)" version="4" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tp68" modelUID="r:00000000-0000-4000-0000-011c895903ac(jetbrains.mps.baseLanguageInternal.structure)" version="1" implicit="yes" />
  <import index="tp3r" modelUID="r:00000000-0000-4000-0000-011c8959034b(jetbrains.mps.lang.quotation.structure)" version="0" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="wch2" modelUID="r:886e64b3-d82c-4444-8cd9-9ede48ec4a0f(jetbrains.mps.debug.privateMembers.structure)" version="-1" implicit="yes" />
  <import index="8sls" modelUID="r:3a27a6eb-dfce-419d-9e4c-ca44cc01a2e2(jetbrains.mps.debug.evaluation.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tp5g.NodesTestCase" typeId="tp5g.1216913645126" id="5543996881668550053">
      <property name="name" nameId="tpck.1169194664001" value="TransformationUtil_Expressions" />
    </node>
    <node type="tp5g.NodesTestCase" typeId="tp5g.1216913645126" id="7696059916860905164">
      <property name="name" nameId="tpck.1169194664001" value="TransformationUtil_Complex" />
    </node>
    <node type="tp5g.TestInfo" typeId="tp5g.5097124989038916362" id="7744266994038462827">
      <property name="projectPath" nameId="tp5g.5097124989038916363" value="${mps_home}/MPS.mpr" />
    </node>
  </roots>
  <root id="5543996881668550053">
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="5543996881668550054">
      <property name="name" nameId="tpck.1169194664001" value="lowLevelVariable" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5543996881668550055" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550056">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295670007">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295670014">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295670008">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295670010">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295670011">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550177" resolveInfo="lowLevelVar" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295670013" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295670018">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="5543996881668550060">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550061">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550177" resolveInfo="lowLevelVar" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550062">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550189" resolveInfo="lowLevelVarResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="1454920206667908434">
      <property name="name" nameId="tpck.1169194664001" value="variableInternal" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1454920206667908435" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667908436">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726642">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726643">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726644">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726645">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726649">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667908429" resolveInfo="variableInternal" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726647" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726648">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="1454920206667908440">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1454920206667908444">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667908429" resolveInfo="variableInternal" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1454920206667908445">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667908420" resolveInfo="variableInternalResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="5543996881668550063">
      <property name="name" nameId="tpck.1169194664001" value="evaluatorsThisExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5543996881668550064" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550065">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726651">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726652">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726653">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726654">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726658">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550223" resolveInfo="thisExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726656" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726657">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="5543996881668550069">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550070">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550223" resolveInfo="thisExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550071">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550232" resolveInfo="thisExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="1454920206667900407">
      <property name="name" nameId="tpck.1169194664001" value="thisInternalExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1454920206667900408" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667900409">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726660">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726661">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726662">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726663">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726667">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667900343" resolveInfo="thisInternalExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726665" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726666">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="1454920206667900413">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1454920206667900419">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667900343" resolveInfo="thisInternalExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1454920206667900418">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667900336" resolveInfo="thisInternalExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="5543996881668550072">
      <property name="name" nameId="tpck.1169194664001" value="field" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5543996881668550073" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550074">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726669">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726670">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726671">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726672">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726676">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550242" resolveInfo="field" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726674" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726675">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="5543996881668550078">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550079">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550242" resolveInfo="field" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550080">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550257" resolveInfo="fieldResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="1454920206667900420">
      <property name="name" nameId="tpck.1169194664001" value="fieldInternal" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1454920206667900421" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667900422">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726678">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726679">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726680">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726681">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726685">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667900370" resolveInfo="fieldInternal" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726683" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726684">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="1454920206667900426">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1454920206667900430">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667900370" resolveInfo="fieldInternal" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1454920206667900431">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667900360" resolveInfo="fieldInternalResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="5543996881668550081">
      <property name="name" nameId="tpck.1169194664001" value="localField" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5543996881668550082" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550083">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5543996881668550084">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5543996881668550085">
            <property name="name" nameId="tpck.1169194664001" value="fieldDeclaration" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="5543996881668550086">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1068390468200" resolveInfo="FieldDeclaration" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5543996881668550087">
              <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="5543996881668550088">
                <link role="concept" roleId="tp25.1140138128738" targetNodeId="tpee.1197029447546" resolveInfo="FieldReferenceOperation" />
                <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5543996881668550089">
                  <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="5543996881668550090">
                    <link role="concept" roleId="tp25.1140138128738" targetNodeId="tpee.1197027756228" resolveInfo="DotExpression" />
                    <node role="leftExpression" roleId="tp25.1140138123956" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550091">
                      <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550241" resolveInfo="fieldReference" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5543996881668550092">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1197027833540" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5543996881668550093">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1197029500499" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5543996881668550094">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5543996881668550095">
            <property name="name" nameId="tpck.1169194664001" value="instanceFieldReference" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="5543996881668550096">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.7785501532031639928" resolveInfo="LocalInstanceFieldReference" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5543996881668550097">
              <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeCreator" typeId="tp25.1180636770613" id="5543996881668550098">
                <node role="createdType" roleId="tp25.1180636770616" type="tp25.SNodeType" typeId="tp25.1138055754698" id="5543996881668550099">
                  <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.7785501532031639928" resolveInfo="LocalInstanceFieldReference" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5543996881668550100">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5543996881668550101">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5543996881668550102">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5543996881668550103">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5543996881668550095" resolveInfo="instanceFieldReference" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5543996881668550104">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.7785501532031731645" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Link_SetTargetOperation" typeId="tp25.1140725362528" id="5543996881668550105">
              <node role="linkTarget" roleId="tp25.1140725362529" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5543996881668550106">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5543996881668550085" resolveInfo="fieldDeclaration" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5543996881668550107">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5543996881668550108">
            <node role="operand" roleId="tpee.1197027771414" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550109">
              <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550241" resolveInfo="fieldReference" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ReplaceWithAnotherOperation" typeId="tp25.1140131837776" id="5543996881668550110">
              <node role="replacementNode" roleId="tp25.1140131861877" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5543996881668550111">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5543996881668550095" resolveInfo="instanceFieldReference" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726687">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726688">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726689">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726690">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726694">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550242" resolveInfo="field" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726692" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726693">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="5543996881668550115">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550116">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550242" resolveInfo="field" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550117">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550257" resolveInfo="fieldResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="5543996881668550118">
      <property name="name" nameId="tpck.1169194664001" value="staticField" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5543996881668550119" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550120">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726696">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726697">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726698">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726699">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726703">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550265" resolveInfo="staticField" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726701" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726702">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="5543996881668550124">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550125">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550265" resolveInfo="staticField" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550126">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550282" resolveInfo="staticFieldResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="1454920206667900432">
      <property name="name" nameId="tpck.1169194664001" value="staticFieldInternal" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1454920206667900433" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667900434">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726705">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726706">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726707">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726708">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726712">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667900398" resolveInfo="staticFieldInternal" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726710" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726711">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="1454920206667900438">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1454920206667900444">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667900398" resolveInfo="staticFieldInternal" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1454920206667900442">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667900390" resolveInfo="staticFieldInternalResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="5543996881668550127">
      <property name="name" nameId="tpck.1169194664001" value="localStaticField" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5543996881668550128" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550129">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5543996881668550130">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5543996881668550131">
            <property name="name" nameId="tpck.1169194664001" value="fieldDeclaration" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="5543996881668550132">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1070462154015" resolveInfo="StaticFieldDeclaration" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5543996881668550133">
              <node role="operand" roleId="tpee.1197027771414" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550134">
                <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550264" resolveInfo="staticFieldReference" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5543996881668550135">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1070568178160" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5543996881668550136">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5543996881668550137">
            <property name="name" nameId="tpck.1169194664001" value="staticFieldReference" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="5543996881668550138">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1172008963197" resolveInfo="LocalStaticFieldReference" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5543996881668550139">
              <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeCreator" typeId="tp25.1180636770613" id="5543996881668550140">
                <node role="createdType" roleId="tp25.1180636770616" type="tp25.SNodeType" typeId="tp25.1138055754698" id="5543996881668550141">
                  <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1172008963197" resolveInfo="LocalStaticFieldReference" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5543996881668550142">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5543996881668550143">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5543996881668550144">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5543996881668550145">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5543996881668550137" resolveInfo="staticFieldReference" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5543996881668550146">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1172008963202" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Link_SetTargetOperation" typeId="tp25.1140725362528" id="5543996881668550147">
              <node role="linkTarget" roleId="tp25.1140725362529" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5543996881668550148">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5543996881668550131" resolveInfo="fieldDeclaration" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5543996881668550149">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5543996881668550150">
            <node role="operand" roleId="tpee.1197027771414" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550151">
              <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550264" resolveInfo="staticFieldReference" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ReplaceWithAnotherOperation" typeId="tp25.1140131837776" id="5543996881668550152">
              <node role="replacementNode" roleId="tp25.1140131861877" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5543996881668550153">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5543996881668550137" resolveInfo="staticFieldReference" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="607759879653673683" />
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726714">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726715">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726716">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726717">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726721">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550265" resolveInfo="staticField" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726719" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726720">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="5543996881668550157">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550158">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550265" resolveInfo="staticField" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550159">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550282" resolveInfo="staticFieldResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="5543996881668550160">
      <property name="name" nameId="tpck.1169194664001" value="method" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5543996881668550161" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550162">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726723">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726724">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726725">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726726">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726731">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550293" resolveInfo="method" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726728" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726729">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="5543996881668550166">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550167">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550293" resolveInfo="method" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5543996881668550168">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550311" resolveInfo="methodResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="1454920206667908446">
      <property name="name" nameId="tpck.1169194664001" value="methodInternal" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1454920206667908447" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667908448">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726733">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726734">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726735">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726736">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726741">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667908308" resolveInfo="methodInternal" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726738" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726739">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="1454920206667908452">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1454920206667908456">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667908308" resolveInfo="methodInternal" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1454920206667908457">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667908297" resolveInfo="methodInternalResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="607759879653655637">
      <property name="name" nameId="tpck.1169194664001" value="localMethod" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="607759879653655638" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="607759879653655639">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="607759879653663279">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="607759879653663280">
            <property name="name" nameId="tpck.1169194664001" value="instanceMethodDeclaration" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="607759879653663281">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1068580123165" resolveInfo="InstanceMethodDeclaration" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="607759879653663282">
              <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="607759879653663283">
                <link role="concept" roleId="tp25.1140138128738" targetNodeId="tpee.1202948039474" resolveInfo="InstanceMethodCallOperation" />
                <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.DotExpression" typeId="tpee.1197027756228" id="607759879653663284">
                  <node role="operand" roleId="tpee.1197027771414" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653663285">
                    <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550292" resolveInfo="methodReference" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="607759879653663286">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1197027833540" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="607759879653663287">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1202948736718" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="607759879653673695">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="607759879653673696">
            <property name="name" nameId="tpck.1169194664001" value="arguments" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="607759879653673697">
              <link role="elementConcept" roleId="tp25.1145383142433" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="607759879653673698">
              <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="607759879653673699">
                <link role="concept" roleId="tp25.1140138128738" targetNodeId="tpee.1202948039474" resolveInfo="InstanceMethodCallOperation" />
                <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.DotExpression" typeId="tpee.1197027756228" id="607759879653673700">
                  <node role="operand" roleId="tpee.1197027771414" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653673701">
                    <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550292" resolveInfo="methodReference" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="607759879653673702">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1197027833540" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="607759879653673703">
                <link role="link" roleId="tp25.1138056546658" targetNodeId="tpee.1068499141038" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="607759879653668582">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="607759879653668583">
            <property name="name" nameId="tpck.1169194664001" value="localInstanceMethodCall" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="607759879653668584">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.3066917033203108594" resolveInfo="LocalInstanceMethodCall" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="607759879653673818">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="607759879653673819">
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="607759879653673820">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                  <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ListAntiquotation" typeId="tp3r.1196350785118" id="607759879653673821">
                    <node role="expression" roleId="tp3r.1196350785111" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="607759879653673822">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="607759879653673696" resolveInfo="arguments" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="607759879653668591">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="607759879653668598">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="607759879653668593">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="607759879653668592">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="607759879653668583" resolveInfo="localInstanceMethodCall" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="607759879653668597">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.3066917033203112509" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Link_SetTargetOperation" typeId="tp25.1140725362528" id="607759879653668602">
              <node role="linkTarget" roleId="tp25.1140725362529" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="607759879653671566">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="607759879653663280" resolveInfo="instanceMethodDeclaration" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="607759879653663289">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="607759879653663291">
            <node role="operand" roleId="tpee.1197027771414" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653663290">
              <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550292" resolveInfo="methodReference" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ReplaceWithAnotherOperation" typeId="tp25.1140131837776" id="607759879653663295">
              <node role="replacementNode" roleId="tp25.1140131861877" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="607759879653673823">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="607759879653668583" resolveInfo="localInstanceMethodCall" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726743">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726744">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726745">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726746">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726751">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550293" resolveInfo="method" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726748" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726749">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="607759879653655643">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653655644">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550293" resolveInfo="method" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653655645">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5543996881668550311" resolveInfo="methodResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="607759879653675013">
      <property name="name" nameId="tpck.1169194664001" value="staticMethod" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="607759879653675014" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="607759879653675015">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726753">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726754">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726755">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726756">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726760">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653675051" resolveInfo="staticMethod" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726758" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726759">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="607759879653675019">
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653675085">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653675040" resolveInfo="staticMethodResult" />
          </node>
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653675086">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653675051" resolveInfo="staticMethod" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="1454920206667908458">
      <property name="name" nameId="tpck.1169194664001" value="staticMethodInternal" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1454920206667908459" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667908460">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726769">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726770">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726771">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726772">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726777">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667908344" resolveInfo="staticMethodInternal" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726774" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726775">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="1454920206667908464">
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1454920206667908469">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667908334" resolveInfo="staticMethodInternalResult" />
          </node>
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1454920206667908468">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1454920206667908344" resolveInfo="staticMethodInternal" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="607759879653674966">
      <property name="name" nameId="tpck.1169194664001" value="staticLocalMethod" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="607759879653674967" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="607759879653674968">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="607759879653674969">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="607759879653674970">
            <property name="name" nameId="tpck.1169194664001" value="staticMethodDeclaration" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="607759879653674971">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1081236700938" resolveInfo="StaticMethodDeclaration" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="607759879653674974">
              <node role="operand" roleId="tpee.1197027771414" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653675087">
                <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653675066" resolveInfo="staticMethodReference" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="607759879653675088">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081236769987" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="607759879653674978">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="607759879653674979">
            <property name="name" nameId="tpck.1169194664001" value="arguments" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="607759879653674980">
              <link role="elementConcept" roleId="tp25.1145383142433" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="607759879653674981">
              <node role="operand" roleId="tpee.1197027771414" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653675093">
                <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653675066" resolveInfo="staticMethodReference" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="607759879653675094">
                <link role="link" roleId="tp25.1138056546658" targetNodeId="tpee.1068499141038" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="607759879653674987">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="607759879653674988">
            <property name="name" nameId="tpck.1169194664001" value="localStaticMethodCall" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="607759879653674989">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1172058436953" resolveInfo="LocalStaticMethodCall" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="607759879653674990">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="607759879653675095">
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="607759879653675097">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                  <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ListAntiquotation" typeId="tp3r.1196350785118" id="607759879653675098">
                    <node role="expression" roleId="tp3r.1196350785111" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="607759879653675100">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="607759879653674979" resolveInfo="arguments" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="607759879653674995">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="607759879653674996">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="607759879653674997">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="607759879653674998">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="607759879653674988" resolveInfo="localStaticMethodCall" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="607759879653676707">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1172058436957" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Link_SetTargetOperation" typeId="tp25.1140725362528" id="607759879653675000">
              <node role="linkTarget" roleId="tp25.1140725362529" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="607759879653675001">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="607759879653674970" resolveInfo="staticMethodDeclaration" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="607759879653675002">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="607759879653675003">
            <node role="operand" roleId="tpee.1197027771414" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653676709">
              <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653675066" resolveInfo="staticMethodReference" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ReplaceWithAnotherOperation" typeId="tp25.1140131837776" id="607759879653675005">
              <node role="replacementNode" roleId="tp25.1140131861877" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="607759879653675006">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="607759879653674988" resolveInfo="localStaticMethodCall" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726779">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726780">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726781">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726782">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726787">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653675051" resolveInfo="staticMethod" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726784" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726785">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="607759879653675010">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653676713">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653675051" resolveInfo="staticMethod" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653676712">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653675040" resolveInfo="staticMethodResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="607759879653681865">
      <property name="name" nameId="tpck.1169194664001" value="arrayAccessOperation" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="607759879653681866" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="607759879653681867">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726789">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726790">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726791">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726792">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726900">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653679965" resolveInfo="arrayAccessOperation" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726794" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726795">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="607759879653681876">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653681877">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653679965" resolveInfo="arrayAccessOperation" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653681878">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653679966" resolveInfo="arrayAccessOperationResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="607759879653681868">
      <property name="name" nameId="tpck.1169194664001" value="arrayLengthOperation" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="607759879653681869" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="607759879653681870">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726797">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726798">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726799">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726800">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726901">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653679996" resolveInfo="arrayLengthOperation" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726802" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726803">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="607759879653681882">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653681887">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653679996" resolveInfo="arrayLengthOperation" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="607759879653681886">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="607759879653680053" resolveInfo="arrayLengthOperationResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="2932187755699712805">
      <property name="name" nameId="tpck.1169194664001" value="instanceof" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2932187755699712806" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699712807">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726805">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726806">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726807">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726808">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726902">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2932187755699710928" resolveInfo="instanceof" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726810" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726811">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="2932187755699712813">
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2932187755699712817">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2932187755699710929" resolveInfo="instanceofResult" />
          </node>
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2932187755699712814">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2932187755699710928" resolveInfo="instanceof" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="2932187755699927593">
      <property name="name" nameId="tpck.1169194664001" value="super" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2932187755699927594" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699927595">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726834">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726835">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726836">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726837">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726903">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2932187755699923982" resolveInfo="super" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726839" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726840">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="2932187755699927601">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2932187755699927602">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2932187755699923982" resolveInfo="super" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2932187755699927603">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2932187755699923972" resolveInfo="superResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="2932187755699938044">
      <property name="name" nameId="tpck.1169194664001" value="constructor" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2932187755699938045" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699938046">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726841">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726842">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726843">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726844">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726904">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2932187755699930368" resolveInfo="constructor" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726846" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726847">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="2932187755699938052">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2932187755699938053">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2932187755699930368" resolveInfo="constructor" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2932187755699938054">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2932187755699930359" resolveInfo="constructorResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="8441349676536412425">
      <property name="name" nameId="tpck.1169194664001" value="constructorInternal" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8441349676536412426" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8441349676536412427">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726848">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726849">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726850">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726851">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726905">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="8441349676536412419" resolveInfo="constructorInternal" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726853" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726854">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="8441349676536412431">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="8441349676536412436">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="8441349676536412419" resolveInfo="constructorInternal" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="8441349676536412435">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="8441349676536412409" resolveInfo="constructorInternalResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="2932187755699951824">
      <property name="name" nameId="tpck.1169194664001" value="plusExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2932187755699951825" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699951826">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726855">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726856">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726857">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726858">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726906">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2932187755699948604" resolveInfo="plusExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726860" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726861">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="2932187755699951830">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2932187755699951834">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2932187755699948604" resolveInfo="plusExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2932187755699951835">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2932187755699948605" resolveInfo="plusExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="3278243436493715633">
      <property name="name" nameId="tpck.1169194664001" value="plusStringExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3278243436493715634" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3278243436493715635">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3278243436493715636">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3278243436493715637">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3278243436493715638">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3278243436493715639">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="3278243436493715647">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="3278243436493715623" resolveInfo="plusStringExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="3278243436493715641" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3278243436493715642">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="3278243436493715643">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="3278243436493715648">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="3278243436493715623" resolveInfo="plusStringExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="3278243436493715649">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="3278243436493715610" resolveInfo="plusStringExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="6721540366799618927">
      <property name="name" nameId="tpck.1169194664001" value="equalsExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6721540366799618928" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6721540366799618929">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726865">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726866">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726867">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726868">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726907">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="6721540366799618959" resolveInfo="equalsExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726870" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726871">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="6721540366799618933">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="6721540366799618987">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="6721540366799618959" resolveInfo="equalsExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="6721540366799618988">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="6721540366799618960" resolveInfo="equalsExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="6721540366799622835">
      <property name="name" nameId="tpck.1169194664001" value="notEqualsExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6721540366799622836" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6721540366799622837">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726872">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726873">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726874">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726875">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726908">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="6721540366799622809" resolveInfo="notEqualsExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726877" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726878">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="6721540366799622841">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="6721540366799622845">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="6721540366799622809" resolveInfo="notEqualsExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="6721540366799622846">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="6721540366799622796" resolveInfo="notEqualsExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="6721540366799631169">
      <property name="name" nameId="tpck.1169194664001" value="notExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6721540366799631170" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6721540366799631171">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726879">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726880">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726881">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726882">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726909">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="6721540366799627035" resolveInfo="notExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726884" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726885">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="6721540366799631175">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="6721540366799631180">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="6721540366799627035" resolveInfo="notExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="6721540366799631179">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="6721540366799627022" resolveInfo="notExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="4693929676428718778">
      <property name="name" nameId="tpck.1169194664001" value="classExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4693929676428718779" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4693929676428718780">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726886">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726887">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726888">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726889">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726910">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4693929676428713104" resolveInfo="classExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726891" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726892">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="4693929676428718784">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="4693929676428718788">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4693929676428713104" resolveInfo="classExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="4693929676428718789">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4693929676428713094" resolveInfo="classExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="8441349676536441186">
      <property name="name" nameId="tpck.1169194664001" value="classInternalExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8441349676536441187" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8441349676536441188">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295726893">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295726894">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295726895">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295726896">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295726911">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="8441349676536441176" resolveInfo="classInternalExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295726898" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295726899">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="8441349676536441192">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="8441349676536441197">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="8441349676536441176" resolveInfo="classInternalExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="8441349676536441196">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="8441349676536441169" resolveInfo="classInternalExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5543996881668550169">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="5543996881668550170">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="5543996881668550171">
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5543996881668550172" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550174">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5543996881668550175">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="5543996881668550176">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="5543996881668550171" resolveInfo="var" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5543996881668550177">
            <property name="name" nameId="tpck.1169194664001" value="lowLevelVar" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5543996881668550178">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550180">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2717152680784277084">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2717152680784277099">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2717152680784277101">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277103">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277104">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277105">
                  <property name="value" nameId="tpee.1070475926801" value="var" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277106">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277107">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277108" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277109">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277110">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277111" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5543996881668550189">
          <property name="name" nameId="tpck.1169194664001" value="lowLevelVarResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1454920206667908421">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="1454920206667908422">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="6196179103670446424">
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6196179103670446426" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667908426">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1454920206667908427">
            <node role="expression" roleId="tpee.1068581517676" type="tp68.InternalVariableReference" typeId="tp68.1176743162354" id="1454920206667908431">
              <property name="name" nameId="tp68.1176743296073" value="var" />
              <node role="type" roleId="tp68.1176743202636" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1454920206667908433" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1454920206667908429">
            <property name="name" nameId="tpck.1169194664001" value="variableInternal" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1454920206667908409">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667908411">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1454920206667908412">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1454920206667908413">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1454920206667908414">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1454920206667908415">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277112">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277113">
                  <property name="value" nameId="tpee.1070475926801" value="var" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277114">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277115">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277116" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277117">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277118">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277119" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1454920206667908420">
          <property name="name" nameId="tpck.1169194664001" value="variableInternalResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="2932187755699923943">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.ClassConcept" typeId="tpee.1068390468198" id="2932187755699923944">
        <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
        <property name="name" nameId="tpck.1169194664001" value="TestSuperClass" />
        <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2932187755699923951">
          <property name="name" nameId="tpck.1169194664001" value="someMethod" />
          <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2932187755699923952">
            <property name="name" nameId="tpck.1169194664001" value="argument" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2932187755699923953" />
          </node>
          <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2932187755699923954">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
          </node>
          <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2932187755699923955" />
          <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699923956">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2932187755699923957">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="2932187755699923958" />
            </node>
          </node>
        </node>
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2932187755699923945" />
        <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="2932187755699923946">
          <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2932187755699923947" />
          <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2932187755699923948" />
          <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699923949" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5543996881668550190">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.ClassConcept" typeId="tpee.1068390468198" id="5543996881668550191">
        <property name="nonStatic" nameId="tpee.521412098689998745" value="true" />
        <property name="name" nameId="tpck.1169194664001" value="TestClass" />
        <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="5543996881668550192">
          <property name="name" nameId="tpck.1169194664001" value="someStaticMethod" />
          <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5543996881668550193">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
          </node>
          <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5543996881668550194" />
          <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550195">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5543996881668550196">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5543996881668550197" />
            </node>
          </node>
          <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="607759879653675053">
            <property name="name" nameId="tpck.1169194664001" value="argument1" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="607759879653675054" />
          </node>
          <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="607759879653675055">
            <property name="name" nameId="tpck.1169194664001" value="argument2" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="607759879653675058">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
            </node>
          </node>
        </node>
        <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="5543996881668550198">
          <property name="name" nameId="tpck.1169194664001" value="someMethod" />
          <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5543996881668550199">
            <property name="name" nameId="tpck.1169194664001" value="argument" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5543996881668550200" />
          </node>
          <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5543996881668550201">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
          </node>
          <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5543996881668550202" />
          <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550203">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5543996881668550204">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5543996881668550205" />
            </node>
          </node>
        </node>
        <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="5543996881668550206">
          <property name="name" nameId="tpck.1169194664001" value="myStaticField" />
          <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5543996881668550207" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5543996881668550208" />
        </node>
        <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="5543996881668550209">
          <property name="name" nameId="tpck.1169194664001" value="myField" />
          <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5543996881668550210" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5543996881668550211" />
        </node>
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5543996881668550212" />
        <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="5543996881668550213">
          <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5543996881668550214" />
          <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5543996881668550215" />
          <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550216" />
        </node>
        <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3385357251123759614">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Cloneable" resolveInfo="Cloneable" />
        </node>
        <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2932187755699923950">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2932187755699923944" resolveInfo="TestSuperClass" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5543996881668550217">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="5543996881668550218">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5543996881668550224">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550220">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5543996881668550221">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.EvaluatorsThisExpression" typeId="8sls.6036237525966315974" id="5543996881668550222" />
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5543996881668550223">
            <property name="name" nameId="tpck.1169194664001" value="thisExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5543996881668550225">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550227">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5543996881668550228">
          <node role="expression" roleId="tpee.1068581517676" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5543996881668550229">
            <property name="methodName" nameId="tp68.1174294288199" value="getThisObject" />
            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5543996881668550230">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
            </node>
            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="5543996881668550231" />
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5543996881668550232">
          <property name="name" nameId="tpck.1169194664001" value="thisExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1454920206667900337">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="1454920206667900338">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1454920206667900344">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667900340">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1454920206667900341">
            <node role="expression" roleId="tpee.1068581517676" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="1454920206667900346" />
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1454920206667900343">
            <property name="name" nameId="tpck.1169194664001" value="thisInternalExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1454920206667900329">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667900331">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1454920206667900332">
          <node role="expression" roleId="tpee.1068581517676" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="1454920206667900333">
            <property name="methodName" nameId="tp68.1174294288199" value="getThisObject" />
            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1454920206667900334">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
            </node>
            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="1454920206667900335" />
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1454920206667900336">
          <property name="name" nameId="tpck.1169194664001" value="thisInternalExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5543996881668550233">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="5543996881668550234">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5543996881668550243">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550236">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5543996881668550237">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5543996881668550238">
              <node role="operand" roleId="tpee.1197027771414" type="8sls.EvaluatorsThisExpression" typeId="8sls.6036237525966315974" id="5543996881668550239" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5543996881668550240">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="5543996881668550209" resolveInfo="myField" />
              </node>
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5543996881668550241">
                <property name="name" nameId="tpck.1169194664001" value="fieldReference" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5543996881668550242">
            <property name="name" nameId="tpck.1169194664001" value="field" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5543996881668550244">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550246">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5543996881668550247">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="5543996881668550248">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5543996881668550249">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5543996881668550250">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5543996881668550251">
                <property name="methodName" nameId="tp68.1174294288199" value="getFieldValue" />
                <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5543996881668550252">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                </node>
                <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5543996881668550253">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThisObject" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5543996881668550254">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="5543996881668550255" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5543996881668550256">
                  <property name="value" nameId="tpee.1070475926801" value="myField" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5543996881668550257">
          <property name="name" nameId="tpck.1169194664001" value="fieldResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1454920206667900361">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="1454920206667900362">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1454920206667900371">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667900364">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1454920206667900365">
            <node role="expression" roleId="tpee.1068581517676" type="tp68.InternalPartialFieldReference" typeId="tp68.1177590007607" id="4583341770697734719">
              <property name="fieldName" nameId="tp68.1177590059093" value="myField" />
              <node role="fieldType" roleId="tp68.1177590063781" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4583341770697734721" />
              <node role="instance" roleId="tp68.1177590086595" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4583341770697734722" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1454920206667900370">
            <property name="name" nameId="tpck.1169194664001" value="fieldInternal" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1454920206667900347">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667900349">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1454920206667900350">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1454920206667900351">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1454920206667900352">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1454920206667900353">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="1454920206667900354">
                <property name="methodName" nameId="tp68.1174294288199" value="getFieldValue" />
                <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1454920206667900355">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                </node>
                <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="1454920206667900356">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThisObject" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1454920206667900357">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="1454920206667900358" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1454920206667900359">
                  <property name="value" nameId="tpee.1070475926801" value="myField" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1454920206667900360">
          <property name="name" nameId="tpck.1169194664001" value="fieldInternalResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5543996881668550258">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="5543996881668550259">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5543996881668550266">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="staticContextType" roleId="8sls.7614982787448003602" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5543996881668550267">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550261">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5543996881668550262">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="5543996881668550263">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5543996881668550206" resolveInfo="myStaticField" />
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5543996881668550264">
                <property name="name" nameId="tpck.1169194664001" value="staticFieldReference" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5543996881668550265">
            <property name="name" nameId="tpck.1169194664001" value="staticField" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5543996881668550268">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550270">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1051067612668763784">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1051067612668763787">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1051067612668763789">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1051067612668763791">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277134">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetStaticFieldValue(java%dlang%dString,java%dlang%dString,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getStaticFieldValue" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277136">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThisFQName" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.StringType" typeId="tpee.1225271177708" id="2717152680784277137" />
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277138" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277140">
                  <property name="value" nameId="tpee.1070475926801" value="myStaticField" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277142">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277143">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277144" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5543996881668550282">
          <property name="name" nameId="tpck.1169194664001" value="staticFieldResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1454920206667900391">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="1454920206667900392">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1454920206667900399">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="staticContextType" roleId="8sls.7614982787448003602" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1454920206667900400">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667900394">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1454920206667900395">
            <node role="expression" roleId="tpee.1068581517676" type="tp68.InternalStaticFieldReference" typeId="tp68.1173995204289" id="1454920206667900402">
              <property name="fqClassName" nameId="tp68.1173995448817" value="java.lang.System" />
              <property name="fieldName" nameId="tp68.1173995466678" value="out" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1454920206667900398">
            <property name="name" nameId="tpck.1169194664001" value="staticFieldInternal" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1454920206667900376">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667900378">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1454920206667900379">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1454920206667900380">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1454920206667900381">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4583341770697725555">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IValueProxy" resolveInfo="IValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277157">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetStaticFieldValue(java%dlang%dString,java%dlang%dString,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getStaticFieldValue" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277158">
                  <property name="value" nameId="tpee.1070475926801" value="java.lang.System" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277160">
                  <property name="value" nameId="tpee.1070475926801" value="out" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277162">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277163">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277164" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1454920206667900390">
          <property name="name" nameId="tpck.1169194664001" value="staticFieldInternalResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5543996881668550283">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="5543996881668550284">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5543996881668550294">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550286">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5543996881668550287">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5543996881668550288">
              <node role="operand" roleId="tpee.1197027771414" type="8sls.EvaluatorsThisExpression" typeId="8sls.6036237525966315974" id="5543996881668550289" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5543996881668550290">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5543996881668550198" resolveInfo="someMethod" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5543996881668550291">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
              </node>
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5543996881668550292">
                <property name="name" nameId="tpck.1169194664001" value="methodReference" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5543996881668550293">
            <property name="name" nameId="tpck.1169194664001" value="method" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5543996881668550295">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="5543996881668550297">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2662691822046453410">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2662691822046453411">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2662691822046453412">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2662691822046453413">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2662691822046453424">
                <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2662691822046453431">
                  <property name="value" nameId="tpee.1070475926801" value="someMethod" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2662691822046453434">
                  <property name="value" nameId="tpee.1070475926801" value="(I)Ljava/lang/Object;" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2662691822046453436">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2662691822046453426">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                </node>
                <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2662691822046453427">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThisObject" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2662691822046453428">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2662691822046453429" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5543996881668550311">
          <property name="name" nameId="tpck.1169194664001" value="methodResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1454920206667908298">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="1454920206667908299">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1454920206667908309">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667908301">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1454920206667908302">
            <node role="expression" roleId="tpee.1068581517676" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="1454920206667908311">
              <property name="methodName" nameId="tp68.1174294288199" value="someMethod" />
              <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1454920206667908316">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1454920206667908313">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="1454920206667908314" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1454920206667908308">
            <property name="name" nameId="tpck.1169194664001" value="methodInternal" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1454920206667908280">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667908282">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2662691822046542628">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2662691822046542629">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2662691822046542630">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2662691822046542631">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2662691822046542632">
                <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2662691822046542633">
                  <property name="value" nameId="tpee.1070475926801" value="someMethod" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2662691822046542634">
                  <property name="value" nameId="tpee.1070475926801" value="(I)Ljava/lang/Object;" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2662691822046542635">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2662691822046542636">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                </node>
                <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2662691822046542637">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThisObject" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2662691822046542638">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2662691822046542639" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1454920206667908297">
          <property name="name" nameId="tpck.1169194664001" value="methodInternalResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="607759879653675041">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="607759879653675042">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="607759879653675052">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="staticContextType" roleId="8sls.7614982787448003602" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="607759879653675067">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="607759879653675044">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="607759879653675045">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="607759879653675061">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5543996881668550192" resolveInfo="someStaticMethod" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="607759879653675063">
                <property name="value" nameId="tpee.1113006610751" value="0.1" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="607759879653675065">
                <property name="value" nameId="tpee.1070475926801" value="arg" />
              </node>
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="607759879653675066">
                <property name="name" nameId="tpck.1169194664001" value="staticMethodReference" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="607759879653675051">
            <property name="name" nameId="tpck.1169194664001" value="staticMethod" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="607759879653675023">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="607759879653675025">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1051067612668763829">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1051067612668763830">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1051067612668763831">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1051067612668763832">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277166">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dinvokeStatic(java%dlang%dString,java%dlang%dString,java%dlang%dString,com%dsun%djdi%dThreadReference,java%dlang%dObject%d%d%d)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="invokeStatic" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277168">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThisFQName" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.StringType" typeId="tpee.1225271177708" id="2717152680784277169" />
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277170" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277172">
                  <property name="value" nameId="tpee.1070475926801" value="someStaticMethod" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277174">
                  <property name="value" nameId="tpee.1070475926801" value="(DLjava/lang/String;)Ljava/lang/Object;" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277183">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277185">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277186" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="2717152680784277189">
                  <property name="value" nameId="tpee.1113006610751" value="0.1" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277191">
                  <property name="value" nameId="tpee.1070475926801" value="arg" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="607759879653675040">
          <property name="name" nameId="tpck.1169194664001" value="staticMethodResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1454920206667908335">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="1454920206667908336">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1454920206667908345">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="staticContextType" roleId="8sls.7614982787448003602" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1454920206667908346">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667908338">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1454920206667908355">
            <node role="expression" roleId="tpee.1068580123156" type="tp68.InternalStaticMethodCall" typeId="tp68.1173990517731" id="1454920206667908348">
              <property name="fqClassName" nameId="tp68.1173992483054" value="java.lang.Thread" />
              <property name="methodName" nameId="tp68.1173992444083" value="sleep" />
              <node role="returnType" roleId="tp68.1175794062018" type="tpee.VoidType" typeId="tpee.1068581517677" id="1454920206667908352" />
              <node role="actualArgument" roleId="tp68.319021450862604085" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1454920206667908351">
                <property name="value" nameId="tpee.1068580320021" value="10" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1454920206667908344">
            <property name="name" nameId="tpck.1169194664001" value="staticMethodInternal" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1454920206667908317">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="1454920206667908319">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2717152680784277208">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2717152680784277209">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2717152680784277210">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277211">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277212">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dinvokeStatic(java%dlang%dString,java%dlang%dString,java%dlang%dString,com%dsun%djdi%dThreadReference,java%dlang%dObject%d%d%d)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="invokeStatic" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277224">
                  <property name="value" nameId="tpee.1070475926801" value="java.lang.Thread" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277216">
                  <property name="value" nameId="tpee.1070475926801" value="sleep" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277225">
                  <property name="value" nameId="tpee.1070475926801" value="(I)V" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277218">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277219">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277220" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2717152680784277227">
                  <property name="value" nameId="tpee.1068580320021" value="10" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1454920206667908334">
          <property name="name" nameId="tpck.1169194664001" value="staticMethodInternalResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="607759879653679926">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="607759879653679927">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="607759879653679928">
          <property name="name" nameId="tpck.1169194664001" value="array" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="607759879653679931">
            <node role="componentType" roleId="tpee.1070534760952" type="tpee.IntegerType" typeId="tpee.1070534370425" id="607759879653679930" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="607759879653679934">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="607759879653679935">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="607759879653679938">
              <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="607759879653679941">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="array" roleId="tpee.1173175590490" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="607759879653683987">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="607759879653679928" resolveInfo="array" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="607759879653679965">
            <property name="name" nameId="tpck.1169194664001" value="arrayAccessOperation" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="607759879653679959">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="607759879653679962">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2717152680784277228">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2717152680784277229">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2717152680784277230">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277231">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277232">
                <property name="methodName" nameId="tp68.1174294288199" value="getElementAt" />
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2717152680784277233">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277234">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                </node>
                <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2717152680784277235">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2717152680784277236">
                    <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277237">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IArrayValueProxy" resolveInfo="IArrayValueProxy" />
                    </node>
                    <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277263">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                      <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277264">
                        <property name="value" nameId="tpee.1070475926801" value="array" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277265">
                        <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                        <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277266">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                        </node>
                        <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277267" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277268">
                        <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                        <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277269">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                        </node>
                        <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277270" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="607759879653679966">
          <property name="name" nameId="tpck.1169194664001" value="arrayAccessOperationResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="607759879653679942">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="607759879653679943">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="607759879653679944">
          <property name="name" nameId="tpck.1169194664001" value="array" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="607759879653679945">
            <node role="componentType" roleId="tpee.1070534760952" type="tpee.IntegerType" typeId="tpee.1070534370425" id="607759879653679946" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="607759879653679948">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="607759879653679949">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="607759879653679954">
              <node role="operand" roleId="tpee.1197027771414" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="607759879653679953">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="607759879653679944" resolveInfo="array" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.ArrayLengthOperation" typeId="tpee.1208890769693" id="607759879653679958" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="607759879653679996">
            <property name="name" nameId="tpck.1169194664001" value="arrayLengthOperation" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="607759879653680036">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="607759879653680038">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="607759879653680039">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="9146569226295736270">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="9146569226295736272">
              <property name="methodName" nameId="tp68.1174294288199" value="getLength" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.IntegerType" typeId="tpee.1070534370425" id="9146569226295736273" />
              <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="9146569226295736274">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="9146569226295736275">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295736276">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IArrayValueProxy" resolveInfo="IArrayValueProxy" />
                  </node>
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="9146569226295736277">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="9146569226295736278">
                      <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295736279">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IArrayValueProxy" resolveInfo="IArrayValueProxy" />
                      </node>
                      <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277293">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                        <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277294">
                          <property name="value" nameId="tpee.1070475926801" value="array" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277295">
                          <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                          <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277296">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                          </node>
                          <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277297" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277298">
                          <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                          <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277299">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                          </node>
                          <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277300" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="9146569226295736285">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295736286">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="9146569226295736287" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="607759879653680053">
          <property name="name" nameId="tpck.1169194664001" value="arrayLengthOperationResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="2932187755699706728">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="2932187755699706729">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2932187755699707953">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699707955">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2932187755699707956">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.InstanceOfExpression" typeId="tpee.1081256982272" id="2932187755699707959">
              <node role="classType" roleId="tpee.1081256993305" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2932187755699707962">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Cloneable" resolveInfo="Cloneable" />
              </node>
              <node role="leftExpression" roleId="tpee.1081256993304" type="8sls.EvaluatorsThisExpression" typeId="8sls.6036237525966315974" id="2932187755699710924" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="2932187755699710928">
            <property name="name" nameId="tpck.1169194664001" value="instanceof" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="2932187755699710925">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699710927">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2932187755699710930">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="9146569226295799151">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="9146569226295799153">
              <property name="methodName" nameId="tp68.1174294288199" value="isInstanceOf" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.BooleanType" typeId="tpee.1070534644030" id="9146569226295799154" />
              <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="9146569226295799155">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="9146569226295799156">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799157">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                  </node>
                  <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="9146569226295799158">
                    <property name="methodName" nameId="tp68.1174294288199" value="getThisObject" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799159">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="9146569226295799160" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="9146569226295799161">
                <property name="value" nameId="tpee.1070475926801" value="Ljava/lang/Cloneable;" />
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="9146569226295799163">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799164">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="9146569226295799165" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="2932187755699710929">
          <property name="name" nameId="tpck.1169194664001" value="instanceofResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="2932187755699923973">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="2932187755699923974">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2932187755699923975">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699923977">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2932187755699923978">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.EvaluatorsSuperMethodCall" typeId="8sls.6036237525966316030" id="2932187755699927574">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2932187755699923951" resolveInfo="someMethod" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2932187755699927575">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="2932187755699923982">
            <property name="name" nameId="tpck.1169194664001" value="super" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="2932187755699923959">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699923961">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2932187755699923962">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="8092021695490157001">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8092021695490157003">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8092021695490157005">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="8092021695490157006">
                <property name="methodName" nameId="tp68.1174294288199" value="invokeSuperMethod" />
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8092021695490157007">
                  <property name="value" nameId="tpee.1070475926801" value="someMethod" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8092021695490157008">
                  <property name="value" nameId="tpee.1070475926801" value="(I)Ljava/lang/Object;" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8092021695490157009">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8092021695490157010">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                </node>
                <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="8092021695490157011">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThisObject" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8092021695490157012">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="8092021695490157013" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="2932187755699923972">
          <property name="name" nameId="tpck.1169194664001" value="superResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="2932187755699930360">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="2932187755699930361">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2932187755699930362">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699930364">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2932187755699930365">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2932187755699930370">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2932187755699930730">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%d&lt;init&gt;(java%dlang%dString)" resolveInfo="StringBuffer" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2932187755699930731">
                  <property name="value" nameId="tpee.1070475926801" value="" />
                </node>
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="2932187755699930368">
            <property name="name" nameId="tpck.1169194664001" value="constructor" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="2932187755699930347">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699930349">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7843490654472659453">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7843490654472659454">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dinvokeConstructor(java%dlang%dString,java%dlang%dString,com%dsun%djdi%dThreadReference,java%dlang%dObject%d%d%d)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIObjectValueProxy" resolveInfo="invokeConstructor" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7843490654472659455">
              <property name="value" nameId="tpee.1070475926801" value="java.lang.StringBuffer" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7843490654472659456">
              <property name="value" nameId="tpee.1070475926801" value="(Ljava/lang/String;)V" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="7843490654472659457">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7843490654472659458">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="7843490654472659459" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7843490654472659460">
              <property name="value" nameId="tpee.1070475926801" value="" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="2932187755699930359">
          <property name="name" nameId="tpck.1169194664001" value="constructorResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="8441349676536412410">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="8441349676536412411">
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8441349676536412412">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="5543996881668550191" resolveInfo="TestClass" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="8441349676536412414">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="8441349676536412415">
            <node role="expression" roleId="tpee.1068581517676" type="tp68.InternalNewExpression" typeId="tp68.1173996401517" id="8441349676536412421">
              <property name="fqClassName" nameId="tp68.1173996588177" value="java.lang.StringBuffer" />
              <node role="actualArgument" roleId="tp68.319021450862590135" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8441349676536412423">
                <property name="value" nameId="tpee.1070475926801" value="" />
              </node>
              <node role="type" roleId="tp68.1179332974947" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8441349676536412424">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~StringBuffer" resolveInfo="StringBuffer" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="8441349676536412419">
            <property name="name" nameId="tpck.1169194664001" value="constructorInternal" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="8441349676536412399">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="8441349676536412401">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7843490654472659439">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7843490654472659442">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dinvokeConstructor(java%dlang%dString,java%dlang%dString,com%dsun%djdi%dThreadReference,java%dlang%dObject%d%d%d)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIObjectValueProxy" resolveInfo="invokeConstructor" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7843490654472659443">
              <property name="value" nameId="tpee.1070475926801" value="java.lang.StringBuffer" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7843490654472659445">
              <property name="value" nameId="tpee.1070475926801" value="(Ljava/lang/String;)V" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="7843490654472659447">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7843490654472659449">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="7843490654472659450" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7843490654472659452">
              <property name="value" nameId="tpee.1070475926801" value="" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="8441349676536412409">
          <property name="name" nameId="tpck.1169194664001" value="constructorInternalResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="2932187755699941120">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="2932187755699941122">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="2932187755699941123">
          <property name="name" nameId="tpck.1169194664001" value="intVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2932187755699941125" />
        </node>
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="2932187755699941126">
          <property name="name" nameId="tpck.1169194664001" value="doubleVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="2932187755699941128" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699941130">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2932187755699941131">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="2932187755699941134">
              <node role="rightExpression" roleId="tpee.1081773367579" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="2932187755699941137">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="2932187755699941126" resolveInfo="doubleVar" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="2932187755699941133">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="2932187755699941123" resolveInfo="intVar" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="2932187755699948604">
            <property name="name" nameId="tpck.1169194664001" value="plusExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="2932187755699941138">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="2932187755699941140">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2932187755699941141">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="9146569226295799168">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="9146569226295799170">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.CastExpression" typeId="tpee.1070534934090" id="9146569226295799171">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799172">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="9146569226295799173">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799174">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="9146569226295799175">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="9146569226295799176">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="9146569226295799177">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799178">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277301">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277302">
                            <property name="value" nameId="tpee.1070475926801" value="intVar" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277303">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277304">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277305" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277306">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277307">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277308" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="9146569226295799183">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799184">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" resolveInfo="Double" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="9146569226295799185">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799186">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="9146569226295799187">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="9146569226295799188">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="9146569226295799189">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799190">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277309">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277310">
                            <property name="value" nameId="tpee.1070475926801" value="doubleVar" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277311">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277312">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277313" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277314">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277315">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277316" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="9146569226295799196">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799197">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="9146569226295799198" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="2932187755699948605">
          <property name="name" nameId="tpck.1169194664001" value="plusExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="3278243436493715611">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="3278243436493715612">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="3278243436493715613">
          <property name="name" nameId="tpck.1169194664001" value="stringVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="3278243436493715625" />
        </node>
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="3278243436493715615">
          <property name="name" nameId="tpck.1169194664001" value="objectVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3278243436493715624">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="3278243436493715618">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="3278243436493715619">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="3278243436493715620">
              <node role="rightExpression" roleId="tpee.1081773367579" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="3278243436493715621">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="3278243436493715615" resolveInfo="objectVar" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="3278243436493715622">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="3278243436493715613" resolveInfo="stringVar" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="3278243436493715623">
            <property name="name" nameId="tpck.1169194664001" value="plusStringExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="3278243436493715569">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="3278243436493715571">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="3278243436493715572">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3278243436493715573">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="3278243436493715574">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.CastExpression" typeId="tpee.1070534934090" id="3278243436493715575">
                <node role="type" roleId="tpee.1070534934091" type="tpee.StringType" typeId="tpee.1225271177708" id="7843490654472659437" />
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="3278243436493715577">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3278243436493715578">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="3278243436493715579">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="3278243436493715580">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="3278243436493715581">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3278243436493715629">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3278243436493715583">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3278243436493715584">
                            <property name="value" nameId="tpee.1070475926801" value="stringVar" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="3278243436493715585">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3278243436493715586">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="3278243436493715587" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="3278243436493715588">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3278243436493715589">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="3278243436493715590" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="3278243436493715591">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3278243436493715627">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="3278243436493836668">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3278243436493836670">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="3278243436493836671">
                    <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3278243436493836687">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IValueProxy" resolveInfo="IValueProxy" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="3278243436493836673">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="3278243436493836674">
                        <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="3278243436493836675">
                          <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3278243436493836676">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                          </node>
                          <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3278243436493836677">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3278243436493836678">
                              <property name="value" nameId="tpee.1070475926801" value="objectVar" />
                            </node>
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="3278243436493836679">
                              <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3278243436493836680">
                                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                              </node>
                              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="3278243436493836681" />
                            </node>
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="3278243436493836682">
                              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3278243436493836683">
                                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                              </node>
                              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="3278243436493836684" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3278243436493836685">
                      <property name="value" nameId="tpee.1070475926801" value="toString" />
                    </node>
                    <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3278243436493836686">
                      <property name="value" nameId="tpee.1070475926801" value="()Ljava/lang/String;" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="3278243436493715607">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3278243436493715608">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="3278243436493715609" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="3278243436493715610">
          <property name="name" nameId="tpck.1169194664001" value="plusStringExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="6721540366799618936">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="6721540366799618937">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="6721540366799618938">
          <property name="name" nameId="tpck.1169194664001" value="var1" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6721540366799618940">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
          </node>
        </node>
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="6721540366799618941">
          <property name="name" nameId="tpck.1169194664001" value="var2" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6721540366799618943">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="6721540366799618945">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6721540366799618948">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="6721540366799618952">
              <node role="rightExpression" roleId="tpee.1081773367579" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="6721540366799618955">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="6721540366799618941" resolveInfo="var2" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="6721540366799618951">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="6721540366799618938" resolveInfo="var1" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="6721540366799618959">
            <property name="name" nameId="tpck.1169194664001" value="equalsExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="6721540366799618956">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="6721540366799618958">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="326937949444917347">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="326937949444917348">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="326937949444917378">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~ProxyEqualsUtil" resolveInfo="ProxyEqualsUtil" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~ProxyEqualsUtil%djavaEquals(jetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy,jetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy)%cboolean" resolveInfo="javaEquals" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="326937949444917402">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="326937949444917403">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917404">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                  </node>
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="326937949444917405">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="326937949444917406">
                      <property name="value" nameId="tpee.1070475926801" value="var1" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="326937949444917407">
                      <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                      <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917408">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                      </node>
                      <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="326937949444917409" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="326937949444917410">
                      <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                      <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917411">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                      </node>
                      <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="326937949444917412" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="326937949444917390">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="326937949444917391">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917392">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                  </node>
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="326937949444917393">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="326937949444917394">
                      <property name="value" nameId="tpee.1070475926801" value="var2" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="326937949444917395">
                      <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                      <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917396">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                      </node>
                      <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="326937949444917397" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="326937949444917398">
                      <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                      <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917399">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                      </node>
                      <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="326937949444917400" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="326937949444917373">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917374">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="326937949444917375" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="6721540366799618960">
          <property name="name" nameId="tpck.1169194664001" value="equalsExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="6721540366799622797">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="6721540366799622798">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="6721540366799622799">
          <property name="name" nameId="tpck.1169194664001" value="var1" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6721540366799622800">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
          </node>
        </node>
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="6721540366799622801">
          <property name="name" nameId="tpck.1169194664001" value="var2" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6721540366799622802">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="6721540366799622804">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6721540366799622805">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="6721540366799622813">
              <node role="leftExpression" roleId="tpee.1081773367580" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="6721540366799622814">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="6721540366799622799" resolveInfo="var1" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="6721540366799622815">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="6721540366799622801" resolveInfo="var2" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="6721540366799622809">
            <property name="name" nameId="tpck.1169194664001" value="notEqualsExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="6721540366799622776">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="6721540366799622778">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="326937949444917443">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="326937949444917444">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NotExpression" typeId="tpee.1081516740877" id="326937949444917471">
              <node role="expression" roleId="tpee.1081516765348" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="326937949444917445">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~ProxyEqualsUtil" resolveInfo="ProxyEqualsUtil" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~ProxyEqualsUtil%djavaEquals(jetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy,jetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy)%cboolean" resolveInfo="javaEquals" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="326937949444917446">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="326937949444917447">
                    <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917448">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                    </node>
                    <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="326937949444917449">
                      <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="326937949444917450">
                        <property name="value" nameId="tpee.1070475926801" value="var1" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="326937949444917451">
                        <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                        <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917452">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                        </node>
                        <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="326937949444917453" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="326937949444917454">
                        <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                        <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917455">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                        </node>
                        <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="326937949444917456" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="326937949444917457">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="326937949444917458">
                    <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917459">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                    </node>
                    <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="326937949444917460">
                      <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="326937949444917461">
                        <property name="value" nameId="tpee.1070475926801" value="var2" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="326937949444917462">
                        <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                        <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917463">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                        </node>
                        <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="326937949444917464" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="326937949444917465">
                        <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                        <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917466">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                        </node>
                        <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="326937949444917467" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="326937949444917468">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="326937949444917469">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="326937949444917470" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="6721540366799622796">
          <property name="name" nameId="tpck.1169194664001" value="notEqualsExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="6721540366799627023">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="6721540366799627024">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="6721540366799627025">
          <property name="name" nameId="tpck.1169194664001" value="var1" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6721540366799627036" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="6721540366799627030">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6721540366799627031">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.NotExpression" typeId="tpee.1081516740877" id="6721540366799627084">
              <node role="expression" roleId="tpee.1081516765348" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="6721540366799627086">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="6721540366799627025" resolveInfo="var1" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="6721540366799627035">
            <property name="name" nameId="tpck.1169194664001" value="notExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="6721540366799627001">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="6721540366799627003">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6721540366799627004">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="9146569226295799266">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NotExpression" typeId="tpee.1081516740877" id="9146569226295799268">
              <node role="expression" roleId="tpee.1081516765348" type="tpee.CastExpression" typeId="tpee.1070534934090" id="9146569226295799269">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799270">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" resolveInfo="Boolean" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="9146569226295799271">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799272">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="9146569226295799273">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="9146569226295799274">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="9146569226295799275">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799276">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277349">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277350">
                            <property name="value" nameId="tpee.1070475926801" value="var1" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277351">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277352">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277353" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277354">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277355">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277356" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="9146569226295799282">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9146569226295799283">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="9146569226295799284" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="6721540366799627022">
          <property name="name" nameId="tpck.1169194664001" value="notExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4693929676428713095">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="4693929676428713096">
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="4693929676428713100">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4693929676428713105">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.ClassifierClassExpression" typeId="tpee.1116615150612" id="4693929676428713108">
              <link role="classifier" roleId="tpee.1116615189566" targetNodeId="e2lb.~Object" resolveInfo="Object" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4693929676428713104">
            <property name="name" nameId="tpck.1169194664001" value="classExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4693929676428713077">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="4693929676428713079">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4693929676428713080">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="4693929676428718768">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="4693929676428718770">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4693929676428718772">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277368">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetClassValue(java%dlang%dString,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getClassValue" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277370">
                  <property name="value" nameId="tpee.1070475926801" value="java.lang.Object" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277372">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277374">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277375" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4693929676428713094">
          <property name="name" nameId="tpck.1169194664001" value="classExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="8441349676536441170">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="8441349676536441171">
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="8441349676536441173">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="8441349676536441174">
            <node role="expression" roleId="tpee.1068581517676" type="tp68.InternalClassExpression" typeId="tp68.1174478619261" id="8441349676536441178">
              <node role="type" roleId="tp68.1174478663778" type="tpee.StringType" typeId="tpee.1225271177708" id="8441349676536441182" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="8441349676536441176">
            <property name="name" nameId="tpck.1169194664001" value="classInternalExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="8441349676536441158">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="8441349676536441160">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="8441349676536441161">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="8441349676536441162">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8441349676536441163">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8441349676536441168">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277377">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetClassValue(java%dlang%dString,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getClassValue" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277379">
                  <property name="value" nameId="tpee.1070475926801" value="java.lang.String" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277382">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277384">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277385" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="8441349676536441169">
          <property name="name" nameId="tpck.1169194664001" value="classInternalExpressionResult" />
        </node>
      </node>
    </node>
  </root>
  <root id="7696059916860905164">
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="7696059916860917977">
      <property name="name" nameId="tpck.1169194664001" value="localIntVariableDeclaration" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7696059916860917978" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7696059916860917979">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295808641">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295808642">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295808643">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295808644">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295808648">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7696059916860905174" resolveInfo="localIntVarDeclaration" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295808646" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295808647">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="7696059916860917985">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7696059916860917986">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7696059916860905174" resolveInfo="localIntVarDeclaration" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7696059916860917987">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7696059916860905186" resolveInfo="localIntVarDeclarationResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="770214570644686158">
      <property name="name" nameId="tpck.1169194664001" value="localBoxedIntVariableDeclaration" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="770214570644686159" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="770214570644686160">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295808649">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295808650">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295808651">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295808652">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295808667">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="770214570644685914" resolveInfo="localBoxedIntVarDeclaration" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295808654" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295808655">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="770214570644686164">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="770214570644686178">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="770214570644685914" resolveInfo="localBoxedIntVarDeclaration" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="770214570644686177">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="770214570644685899" resolveInfo="localBoxedIntVarDeclarationResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="5325372602757310453">
      <property name="name" nameId="tpck.1169194664001" value="localBoxedIntVariableSecondDeclaration" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5325372602757310454" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5325372602757310455">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5325372602757310456">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5325372602757310457">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5325372602757310458">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="5325372602757310459">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5325372602757310466">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5325372602757295250" resolveInfo="localBoxedIntVarSecondDeclaration" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="5325372602757310461" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5325372602757310462">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="5325372602757310463">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5325372602757310467">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5325372602757295250" resolveInfo="localBoxedIntVarSecondDeclaration" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5325372602757310468">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5325372602757295233" resolveInfo="localBoxedIntVarSecondDeclarationResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="7413144797245914020">
      <property name="name" nameId="tpck.1169194664001" value="localIntVariableAssignment" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7413144797245914021" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245914022">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7413144797245914023">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7413144797245914024">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7413144797245914025">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7413144797245914026">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245914033">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245913944" resolveInfo="localIntVarAssignment" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="7413144797245914028" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7413144797245914029">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="7413144797245914030">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245914034">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245913944" resolveInfo="localIntVarAssignment" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245914035">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245913929" resolveInfo="localIntVarAssignmentResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="7413144797245914007">
      <property name="name" nameId="tpck.1169194664001" value="localBoxedIntVariableAssignment" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7413144797245914008" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245914009">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7413144797245914010">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7413144797245914011">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7413144797245914012">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7413144797245914013">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245914036">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245914000" resolveInfo="localBoxedIntVarAssignment" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="7413144797245914015" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7413144797245914016">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="7413144797245914017">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245914037">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245914000" resolveInfo="localBoxedIntVarAssignment" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245914038">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245913983" resolveInfo="localBoxedIntVarAssignmentResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="770214570644686167">
      <property name="name" nameId="tpck.1169194664001" value="localObjectVariableDeclaration" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="770214570644686168" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="770214570644686169">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9146569226295808656">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9146569226295808657">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9146569226295808658">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9146569226295808659">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295808664">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="770214570644685986" resolveInfo="localObjectVarDeclaration" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="9146569226295808661" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9146569226295808662">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="770214570644686173">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295808665">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="770214570644685986" resolveInfo="localObjectVarDeclaration" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="9146569226295808666">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="770214570644686012" resolveInfo="localObjectVarDeclarationResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="7413144797245758014">
      <property name="name" nameId="tpck.1169194664001" value="localObjectVariableAssignment" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7413144797245758015" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245758016">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7413144797245758017">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7413144797245758018">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7413144797245758019">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7413144797245758020">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245758028">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245758007" resolveInfo="localObjectVarAssignment" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="7413144797245758022" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7413144797245758023">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="7413144797245758024">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245758029">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245758007" resolveInfo="localObjectVarAssignment" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245758031">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245757992" resolveInfo="localObjectVarAssignmentResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="7413144797245933323">
      <property name="name" nameId="tpck.1169194664001" value="localUnBoxedIntVarAssignment" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7413144797245933324" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245933325">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7413144797245933326">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7413144797245933327">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7413144797245933328">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7413144797245933329">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245933336">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245923873" resolveInfo="localUnBoxedIntVarAssignment" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="7413144797245933331" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7413144797245933332">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="7413144797245933333">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245933337">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245923873" resolveInfo="localUnBoxedIntVarAssignment" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245933338">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245923909" resolveInfo="localUnBoxedIntVarAssignmentResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="7413144797245933339">
      <property name="name" nameId="tpck.1169194664001" value="localUnBoxedIntVarDeclaration" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7413144797245933340" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245933341">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7413144797245933342">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7413144797245933343">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7413144797245933344">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7413144797245933345">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245933352">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245923971" resolveInfo="localUnBoxedIntVarDeclaration" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="7413144797245933347" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7413144797245933348">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="7413144797245933349">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245933353">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245923971" resolveInfo="localUnBoxedIntVarDeclaration" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="7413144797245933354">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="7413144797245923955" resolveInfo="localUnBoxedIntVarDeclarationResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="89292631370179327">
      <property name="name" nameId="tpck.1169194664001" value="andAssignmentExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="89292631370179328" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370179329">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370179330">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="89292631370179331">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="89292631370179332">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="89292631370179333">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370179340">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370179170" resolveInfo="andAssignmentExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370179335" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="89292631370179336">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="89292631370179337">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370179341">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370179170" resolveInfo="andAssignmentExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370179342">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370179198" resolveInfo="andAssignmentExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="89292631370196969">
      <property name="name" nameId="tpck.1169194664001" value="divAssignmentExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="89292631370196970" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370196971">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370196972">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="89292631370196973">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="89292631370196974">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="89292631370196975">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197099">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370192767" resolveInfo="divAssignmentExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370196977" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="89292631370196978">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="89292631370196979">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197100">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370192767" resolveInfo="divAssignmentExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197101">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370192750" resolveInfo="divAssignmentExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="89292631370196982">
      <property name="name" nameId="tpck.1169194664001" value="leftShiftAssignmentExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="89292631370196983" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370196984">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370196985">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="89292631370196986">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="89292631370196987">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="89292631370196988">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197102">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370192843" resolveInfo="leftShiftAssignmentExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370196990" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="89292631370196991">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="89292631370196992">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197103">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370192843" resolveInfo="leftShiftAssignmentExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197104">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370192826" resolveInfo="leftShiftAssignmentExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="89292631370196995">
      <property name="name" nameId="tpck.1169194664001" value="minusAssignmentExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="89292631370196996" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370196997">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370196998">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="89292631370196999">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="89292631370197000">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="89292631370197001">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197105">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370193087" resolveInfo="minusAssignmentExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370197003" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="89292631370197004">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="89292631370197005">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197106">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370193087" resolveInfo="minusAssignmentExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197107">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370193070" resolveInfo="minusAssignmentExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="89292631370197008">
      <property name="name" nameId="tpck.1169194664001" value="mulAssignmentExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="89292631370197009" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370197010">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370197011">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="89292631370197012">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="89292631370197013">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="89292631370197014">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197108">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370193038" resolveInfo="mulAssignmentExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370197016" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="89292631370197017">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="89292631370197018">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197109">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370193038" resolveInfo="mulAssignmentExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197110">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370193021" resolveInfo="mulAssignmentExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="89292631370197021">
      <property name="name" nameId="tpck.1169194664001" value="orAssignmentExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="89292631370197022" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370197023">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370197024">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="89292631370197025">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="89292631370197026">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="89292631370197027">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197111">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370193185" resolveInfo="orAssignmentExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370197029" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="89292631370197030">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="89292631370197031">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197112">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370193185" resolveInfo="orAssignmentExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197113">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370193168" resolveInfo="orAssignmentExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="89292631370197034">
      <property name="name" nameId="tpck.1169194664001" value="plusAssignmentExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="89292631370197035" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370197036">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370197037">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="89292631370197038">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="89292631370197039">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="89292631370197040">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197114">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370192989" resolveInfo="plusAssignmentExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370197042" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="89292631370197043">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="89292631370197044">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197115">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370192989" resolveInfo="plusAssignmentExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197116">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370192972" resolveInfo="plusAssignmentExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="89292631370197047">
      <property name="name" nameId="tpck.1169194664001" value="remAssignmentExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="89292631370197048" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370197049">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370197050">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="89292631370197051">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="89292631370197052">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="89292631370197053">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197117">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370192940" resolveInfo="remAssignmentExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370197055" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="89292631370197056">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="89292631370197057">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197118">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370192940" resolveInfo="remAssignmentExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197119">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370192923" resolveInfo="remAssignmentExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="89292631370197060">
      <property name="name" nameId="tpck.1169194664001" value="rightShiftAssignmentExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="89292631370197061" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370197062">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370197063">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="89292631370197064">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="89292631370197065">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="89292631370197066">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197120">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370196936" resolveInfo="rightShiftAssignmentExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370197068" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="89292631370197069">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="89292631370197070">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197121">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370196936" resolveInfo="rightShiftAssignmentExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197122">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370196919" resolveInfo="rightShiftAssignmentExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="89292631370197073">
      <property name="name" nameId="tpck.1169194664001" value="xorAssignmentExpression" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="89292631370197074" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370197075">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370197076">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="89292631370197077">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="89292631370197078">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="89292631370197079">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197123">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370193136" resolveInfo="xorAssignmentExpression" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370197081" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="89292631370197082">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="89292631370197083">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197124">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370193136" resolveInfo="xorAssignmentExpression" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="89292631370197125">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="89292631370193119" resolveInfo="xorAssignmentExpressionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="8638796163619058281">
      <property name="name" nameId="tpck.1169194664001" value="lowLevelVariableInForeach" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8638796163619058282" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8638796163619058283">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8638796163619058284">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8638796163619058285">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8638796163619058286">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="8638796163619058287">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="8638796163619058294">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="8638796163619040053" resolveInfo="lowLevelVarInForeach" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="8638796163619058289" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8638796163619058290">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="8638796163619058291">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="8638796163619058295">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="8638796163619040053" resolveInfo="lowLevelVarInForeach" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="8638796163619058296">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="8638796163619040055" resolveInfo="lowLevelVarInForeachResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="1774703052633005958">
      <property name="name" nameId="tpck.1169194664001" value="lowLevelIntVariableInForeach" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1774703052633005959" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1774703052633005960">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1774703052633005961">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1774703052633005962">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1774703052633005963">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1774703052633005964">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1774703052633005971">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1774703052633005943" resolveInfo="lowLevelIntVarInForeach" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1774703052633005966" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1774703052633005967">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="1774703052633005968">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1774703052633005972">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1774703052633005943" resolveInfo="lowLevelIntVarInForeach" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="8497468421530358159">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1774703052633005918" resolveInfo="lowLevelIntVarInForeachResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="6583956526375659769">
      <property name="name" nameId="tpck.1169194664001" value="notNullString" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6583956526375659770" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6583956526375659771">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6583956526375659772">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6583956526375659779">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6583956526375659773">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6583956526375659775">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="6583956526375659776">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="6583956526375659764" resolveInfo="notNullString" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="6583956526375659778">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6583956526375659783">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="6583956526375659785">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="6583956526375659786">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="6583956526375659764" resolveInfo="notNullString" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="6583956526375659787">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="6583956526375659765" resolveInfo="notNullStringResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="3473983539747082593">
      <property name="name" nameId="tpck.1169194664001" value="nodeReferenceCountViewer" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3473983539747082594" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3473983539747082595">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3473983539747082596">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3473983539747082597">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3473983539747082598">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3473983539747082599">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="3473983539747082606">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4322674958982459643" resolveInfo="nodeReferenceCountViewer" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="3473983539747082601">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3473983539747082602">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="3473983539747082603">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="3473983539747082607">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4322674958982459643" resolveInfo="nodeReferenceCountViewer" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="3473983539747082608">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4322674958982459621" resolveInfo="nodeReferenceCountViewerResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="2281056005883157628">
      <property name="name" nameId="tpck.1169194664001" value="arrayInForeach" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2281056005883157629" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2281056005883157630">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2281056005883157631">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2281056005883157632">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2281056005883157633">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2281056005883157634">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2281056005883157641">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2281056005883150433" resolveInfo="arrayInForeach" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="2281056005883157636">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2281056005883157637">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="2281056005883157638">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2281056005883157642">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2281056005883150433" resolveInfo="arrayInForeach" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2281056005883157643">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="2281056005883150414" resolveInfo="arrayInForeachResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="335932010435400791">
      <property name="name" nameId="tpck.1169194664001" value="newArrayOfString" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="335932010435400792" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="335932010435400793">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="335932010435400794">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="335932010435400795">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="335932010435400796">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="335932010435400797">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="335932010435400804">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="8071722462615359851" resolveInfo="newArrayOfString" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="335932010435400799">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="335932010435400800">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="335932010435400801">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="335932010435400805">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="8071722462615359851" resolveInfo="newArrayOfString" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="335932010435400806">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="8071722462615359838" resolveInfo="newArrayOfStringResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="335932010435400807">
      <property name="name" nameId="tpck.1169194664001" value="newEmptyArrayOfString" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="335932010435400808" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="335932010435400809">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="335932010435400810">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="335932010435400811">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="335932010435400812">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="335932010435400813">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="335932010435400820">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="335932010435400783" resolveInfo="newEmptyArrayOfString" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="335932010435400815">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="335932010435400816">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="335932010435400817">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="335932010435400821">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="335932010435400783" resolveInfo="newEmptyArrayOfString" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="335932010435400822">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="335932010435400772" resolveInfo="newEmptyArrayOfStringResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="4609929908986493513">
      <property name="name" nameId="tpck.1169194664001" value="newEmptyArrayOfInt" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4609929908986493514" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4609929908986493515">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4609929908986493516">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4609929908986493517">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4609929908986493518">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="4609929908986493519">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="4609929908986493526">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4609929908986493511" resolveInfo="newEmptyArrayOfInt" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="4609929908986493521">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4609929908986493522">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="4609929908986493523">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="4609929908986493527">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4609929908986493511" resolveInfo="newEmptyArrayOfInt" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="4609929908986493528">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4609929908986493500" resolveInfo="newEmptyArrayOfIntResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="4816137365279751177">
      <property name="name" nameId="tpck.1169194664001" value="optimizeToStringForString" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4816137365279751178" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4816137365279751179">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4816137365279751180">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4816137365279751181">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4816137365279751182">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="4816137365279751183">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="4816137365279751191">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4816137365279714853" resolveInfo="optimizeToStringForString" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="4816137365279751185">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4816137365279751186">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="4816137365279751187">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="4816137365279751192">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4816137365279714853" resolveInfo="optimizeToStringForString" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="4816137365279751193">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4816137365279714843" resolveInfo="optimizeToStringForStringResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="4587766555754887141">
      <property name="name" nameId="tpck.1169194664001" value="ternaryOperatorForString" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4587766555754887142" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4587766555754887143">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4587766555754887144">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4587766555754887145">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4587766555754887146">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="4587766555754887147">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="4587766555754887154">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4587766555754887085" resolveInfo="ternaryOperatorForString" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="4587766555754887149">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4587766555754887150">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="4587766555754887151">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="4587766555754887155">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4587766555754887085" resolveInfo="ternaryOperatorForString" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="4587766555754887156">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4587766555754887081" resolveInfo="ternaryOperatorForStringResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="2307774969379841007">
      <property name="name" nameId="tpck.1169194664001" value="ternaryOperatorForStringIfTrue" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2307774969379841008" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2307774969379841009">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2307774969379841010">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2307774969379841011">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2307774969379841012">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2307774969379841013">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2307774969379841033">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4587766555754950816" resolveInfo="ternaryOperatorForStringIfTrue" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="2307774969379841015">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2307774969379841016">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="2307774969379841017">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2307774969379841034">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4587766555754950816" resolveInfo="ternaryOperatorForStringIfTrue" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2307774969379841035">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4587766555754950812" resolveInfo="ternaryOperatorForStringIfTrueResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="2307774969379841020">
      <property name="name" nameId="tpck.1169194664001" value="ternaryOperatorForStringCondition" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2307774969379841021" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2307774969379841022">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2307774969379841023">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2307774969379841024">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2307774969379841025">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2307774969379841026">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2307774969379841036">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4587766555754950766" resolveInfo="ternaryOperatorForStringCondition" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="2307774969379841028">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2307774969379841029">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="2307774969379841030">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2307774969379841037">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4587766555754950766" resolveInfo="ternaryOperatorForStringCondition" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="2307774969379841038">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="4587766555754950762" resolveInfo="ternaryOperatorForStringConditionResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="1247401079809869907">
      <property name="name" nameId="tpck.1169194664001" value="urlClassloaderCast" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1247401079809869908" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1247401079809869909">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1247401079809869910">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1247401079809869917">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1247401079809869911">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1247401079809869913">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1247401079809869914">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1247401079809823526" resolveInfo="urlClassloaderCast" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1247401079809869916">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1247401079809869921">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="1247401079809869925">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1247401079809869926">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1247401079809823526" resolveInfo="urlClassloaderCast" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="1247401079809869927">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="1247401079809823522" resolveInfo="urlClassloaderCastResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="5586226261252412191">
      <property name="name" nameId="tpck.1169194664001" value="primitiveCast" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5586226261252412192" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5586226261252412193">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5586226261252412194">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5586226261252412195">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5586226261252412196">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="5586226261252412197">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5586226261252412217">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5586226261252332125" resolveInfo="primitiveCast" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="5586226261252412199">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5586226261252412200">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="5586226261252412201">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5586226261252412218">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5586226261252332125" resolveInfo="primitiveCast" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5586226261252412219">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5586226261252332107" resolveInfo="primitiveCastResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="3525964900474536346">
      <property name="name" nameId="tpck.1169194664001" value="objectCast" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3525964900474536347" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3525964900474536348">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3525964900474536349">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3525964900474536350">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3525964900474536351">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3525964900474536352">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="3525964900474536359">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="3525964900474412387" resolveInfo="objectCast" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="3525964900474536354">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3525964900474536355">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="3525964900474536356">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="3525964900474536360">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="3525964900474412387" resolveInfo="objectCast" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="3525964900474536361">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="3525964900474412368" resolveInfo="objectCastResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="testMethods" roleId="tp5g.1217501895093" type="tp5g.SimpleNodeTest" typeId="tp5g.1225978065297" id="5586226261252412204">
      <property name="name" nameId="tpck.1169194664001" value="arrayCast" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5586226261252412205" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5586226261252412206">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5586226261252412207">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5586226261252412208">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5586226261252412209">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="5586226261252412210">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422059816" resolveInfo="Transformator" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5586226261252412220">
                  <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5586226261252332096" resolveInfo="arrayCast" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="5586226261252412212">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5586226261252412213">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="te5p.4422953018422199168" resolveInfo="transformEvaluator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp5g.AssertMatch" typeId="tp5g.1211979288880" id="5586226261252412214">
          <node role="before" roleId="tp5g.1211979305365" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5586226261252412222">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5586226261252332096" resolveInfo="arrayCast" />
          </node>
          <node role="after" roleId="tp5g.1211979322383" type="tp5g.TestNodeReference" typeId="tp5g.1210674524691" id="5586226261252412223">
            <link role="declaration" roleId="tp5g.1210674534086" targetNodeId="5586226261252332078" resolveInfo="arrayCastResult" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="7696059916860905166">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="7696059916860905167">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="7696059916860914275">
          <property name="name" nameId="tpck.1169194664001" value="intVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7696059916860914277">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="7696059916860905171">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7696059916860905187">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7696059916860905188">
              <property name="name" nameId="tpck.1169194664001" value="intValue" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="7696059916860914278" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7696059916860914281">
                <node role="operand" roleId="tpee.1197027771414" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="7696059916860914280">
                  <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="7696059916860914275" resolveInfo="intVar" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7696059916860914285">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dintValue()%cint" resolveInfo="intValue" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7696059916860914287">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7696059916860914289">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7696059916860905188" resolveInfo="intValue" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="7696059916860905174">
            <property name="name" nameId="tpck.1169194664001" value="localIntVarDeclaration" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="7696059916860905175">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="7696059916860905177">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7696059916860914291">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7696059916860914292">
            <property name="name" nameId="tpck.1169194664001" value="intValue" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245878256">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7413144797245878258">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7413144797245878259">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245878260">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="7413144797245878261">
                  <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245878262">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                  </node>
                  <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7413144797245878263">
                    <property name="value" nameId="tpee.1070475926801" value="intValue" />
                  </node>
                  <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7413144797245878264">
                    <property name="value" nameId="tpee.1070475926801" value="()I" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7413144797245878265">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7413144797245878266">
                      <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245878267">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                      </node>
                      <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277386">
                        <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277387">
                          <property name="value" nameId="tpee.1070475926801" value="intVar" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277388">
                          <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                          <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277389">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                          </node>
                          <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277390" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277391">
                          <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                          <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277392">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                          </node>
                          <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277393" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7696059916860914297">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7696059916860914298">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7696059916860914292" resolveInfo="intValue" />
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="7696059916860905186">
          <property name="name" nameId="tpck.1169194664001" value="localIntVarDeclarationResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="7413144797245913930">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="7413144797245913931">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="7413144797245913932">
          <property name="name" nameId="tpck.1169194664001" value="intVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245913933">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245913935">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7413144797245913936">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7413144797245913937">
              <property name="name" nameId="tpck.1169194664001" value="intValue" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="7413144797245913938" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7413144797245913945">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7413144797245913946">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7413144797245913939">
                <node role="operand" roleId="tpee.1197027771414" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="7413144797245913940">
                  <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="7413144797245913932" resolveInfo="intVar" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7413144797245913941">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dintValue()%cint" resolveInfo="intValue" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7413144797245913947">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7413144797245913937" resolveInfo="intValue" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7413144797245913942">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7413144797245913943">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7413144797245913937" resolveInfo="intValue" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="7413144797245913944">
            <property name="name" nameId="tpck.1169194664001" value="localIntVarAssignment" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="7413144797245913907">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245913909">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7413144797245913910">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7413144797245913911">
            <property name="name" nameId="tpck.1169194664001" value="intValue" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245913912">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7413144797245913948">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7413144797245913949">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7413144797245913913">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7413144797245913914">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245913915">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="7413144797245913916">
                  <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245913917">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                  </node>
                  <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7413144797245913918">
                    <property name="value" nameId="tpee.1070475926801" value="intValue" />
                  </node>
                  <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7413144797245913919">
                    <property name="value" nameId="tpee.1070475926801" value="()I" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7413144797245913920">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7413144797245913921">
                      <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245913922">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                      </node>
                      <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277394">
                        <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277395">
                          <property name="value" nameId="tpee.1070475926801" value="intVar" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277396">
                          <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                          <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277397">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                          </node>
                          <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277398" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277399">
                          <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                          <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277400">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                          </node>
                          <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277401" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7413144797245913950">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7413144797245913911" resolveInfo="intValue" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7413144797245913927">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7413144797245913928">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7413144797245913911" resolveInfo="intValue" />
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="7413144797245913929">
          <property name="name" nameId="tpck.1169194664001" value="localIntVarAssignmentResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="770214570644685900">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="770214570644685901">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="770214570644685902">
          <property name="name" nameId="tpck.1169194664001" value="intVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="770214570644685903">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="770214570644685905">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="770214570644685906">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="770214570644685907">
              <property name="name" nameId="tpck.1169194664001" value="intValue" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="770214570644685909">
                <node role="operand" roleId="tpee.1197027771414" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="770214570644685910">
                  <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="770214570644685902" resolveInfo="intVar" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="770214570644685911">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dintValue()%cint" resolveInfo="intValue" />
                </node>
              </node>
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="770214570644685915">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="770214570644685912">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="770214570644685932">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="770214570644685913">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="770214570644685907" resolveInfo="intValue" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="770214570644685936">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Object%dhashCode()%cint" resolveInfo="hashCode" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="770214570644685914">
            <property name="name" nameId="tpck.1169194664001" value="localBoxedIntVarDeclaration" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="770214570644685874">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="770214570644685876">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2717152680784273379">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2717152680784273380">
            <property name="name" nameId="tpck.1169194664001" value="intValue" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784273381">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784477391">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dbox(jetbrains%dmps%ddebug%devaluation%dproxies%dPrimitiveValueProxy,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIObjectValueProxy" resolveInfo="box" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7295371247045145339">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7295371247045145341">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7295371247045145343">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                  </node>
                  <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="7295371247045145344">
                    <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                    <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7295371247045145345">
                      <property name="value" nameId="tpee.1070475926801" value="intValue" />
                    </node>
                    <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7295371247045145346">
                      <property name="value" nameId="tpee.1070475926801" value="()I" />
                    </node>
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7295371247045145347">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7295371247045145348">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7295371247045145349">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7295371247045145350">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7295371247045145351">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7295371247045145352">
                            <property name="value" nameId="tpee.1070475926801" value="intVar" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="7295371247045145353">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7295371247045145354">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="7295371247045145355" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="7295371247045145356">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7295371247045145357">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="7295371247045145358" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784477407">
                <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784477408">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                </node>
                <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784477409" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="770214570644685897">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7413144797245878299">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7413144797245878301">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245878304">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="7413144797245878292">
                <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245878298">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                </node>
                <node role="instance" roleId="tp68.1174317636233" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7413144797245878294">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2717152680784273380" resolveInfo="intValue" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7413144797245878295">
                  <property name="value" nameId="tpee.1070475926801" value="hashCode" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7413144797245878297">
                  <property name="value" nameId="tpee.1070475926801" value="()I" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="770214570644685899">
          <property name="name" nameId="tpck.1169194664001" value="localBoxedIntVarDeclarationResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5325372602757295234">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="5325372602757295235">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="5325372602757295236">
          <property name="name" nameId="tpck.1169194664001" value="intVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5325372602757295237">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="5325372602757295239">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5325372602757295252">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5325372602757295253">
              <property name="name" nameId="tpck.1169194664001" value="i" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5325372602757295254" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5325372602757295256">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5325372602757295240">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5325372602757295241">
              <property name="name" nameId="tpck.1169194664001" value="intValue" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5325372602757295242">
                <node role="operand" roleId="tpee.1197027771414" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="5325372602757295243">
                  <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="5325372602757295236" resolveInfo="intVar" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5325372602757295244">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dintValue()%cint" resolveInfo="intValue" />
                </node>
              </node>
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5325372602757295245">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5325372602757295246">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5325372602757295247">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5325372602757295248">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5325372602757295241" resolveInfo="intValue" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5325372602757295249">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Object%dhashCode()%cint" resolveInfo="hashCode" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5325372602757295250">
            <property name="name" nameId="tpck.1169194664001" value="localBoxedIntVarSecondDeclaration" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5325372602757295196">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="5325372602757295198">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5325372602757295258">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5325372602757295259">
            <property name="name" nameId="tpck.1169194664001" value="i" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5325372602757295260" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5325372602757295262">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5325372602757295199">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5325372602757295200">
            <property name="name" nameId="tpck.1169194664001" value="intValue" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5325372602757295201">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5325372602757295202">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dbox(jetbrains%dmps%ddebug%devaluation%dproxies%dPrimitiveValueProxy,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIObjectValueProxy" resolveInfo="box" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="5325372602757295203">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5325372602757295204">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5325372602757295205">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                  </node>
                  <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5325372602757295206">
                    <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                    <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5325372602757295207">
                      <property name="value" nameId="tpee.1070475926801" value="intValue" />
                    </node>
                    <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5325372602757295208">
                      <property name="value" nameId="tpee.1070475926801" value="()I" />
                    </node>
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5325372602757295209">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="5325372602757295210">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5325372602757295211">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5325372602757295212">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5325372602757295213">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5325372602757295214">
                            <property name="value" nameId="tpee.1070475926801" value="intVar" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5325372602757295215">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5325372602757295216">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="5325372602757295217" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5325372602757295218">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5325372602757295219">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="5325372602757295220" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5325372602757295221">
                <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5325372602757295222">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                </node>
                <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="5325372602757295223" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5325372602757295224">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="5325372602757295225">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5325372602757295226">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5325372602757295227">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5325372602757295228">
                <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5325372602757295229">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                </node>
                <node role="instance" roleId="tp68.1174317636233" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5325372602757295230">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5325372602757295200" resolveInfo="intValue" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5325372602757295231">
                  <property name="value" nameId="tpee.1070475926801" value="hashCode" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5325372602757295232">
                  <property name="value" nameId="tpee.1070475926801" value="()I" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5325372602757295233">
          <property name="name" nameId="tpck.1169194664001" value="localBoxedIntVarSecondDeclarationResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="7413144797245913984">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="7413144797245913985">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="7413144797245913986">
          <property name="name" nameId="tpck.1169194664001" value="intVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245913987">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245913989">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7413144797245913990">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7413144797245913991">
              <property name="name" nameId="tpck.1169194664001" value="intValue" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245913995">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7413144797245914001">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7413144797245914002">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7413144797245913992">
                <node role="operand" roleId="tpee.1197027771414" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="7413144797245913993">
                  <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="7413144797245913986" resolveInfo="intVar" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7413144797245913994">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dintValue()%cint" resolveInfo="intValue" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7413144797245914003">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7413144797245913991" resolveInfo="intValue" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7413144797245913996">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7413144797245913997">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7413144797245913998">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7413144797245913991" resolveInfo="intValue" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7413144797245913999">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Object%dhashCode()%cint" resolveInfo="hashCode" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="7413144797245914000">
            <property name="name" nameId="tpck.1169194664001" value="localBoxedIntVarAssignment" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="7413144797245913951">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245913953">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2717152680784463464">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2717152680784463465">
            <property name="name" nameId="tpck.1169194664001" value="intValue" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784463466">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2717152680784463498">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2717152680784463532">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2717152680784463500">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2717152680784463465" resolveInfo="intValue" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784463535">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dbox(jetbrains%dmps%ddebug%devaluation%dproxies%dPrimitiveValueProxy,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIObjectValueProxy" resolveInfo="box" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7295371247045160468">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7295371247045160470">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7295371247045160472">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                  </node>
                  <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="7295371247045160473">
                    <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                    <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7295371247045160474">
                      <property name="value" nameId="tpee.1070475926801" value="intValue" />
                    </node>
                    <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7295371247045160475">
                      <property name="value" nameId="tpee.1070475926801" value="()I" />
                    </node>
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7295371247045160476">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7295371247045160477">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7295371247045160478">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7295371247045160479">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7295371247045160480">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7295371247045160481">
                            <property name="value" nameId="tpee.1070475926801" value="intVar" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="7295371247045160482">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7295371247045160483">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="7295371247045160484" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="7295371247045160485">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7295371247045160486">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="7295371247045160487" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784463547">
                <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784463548">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                </node>
                <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784463549" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2717152680784463489">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2717152680784463490">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2717152680784463491">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784463492">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784463493">
                <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784463494">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                </node>
                <node role="instance" roleId="tp68.1174317636233" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2717152680784463495">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2717152680784463465" resolveInfo="intValue" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784463496">
                  <property name="value" nameId="tpee.1070475926801" value="hashCode" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784463497">
                  <property name="value" nameId="tpee.1070475926801" value="()I" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="7413144797245913983">
          <property name="name" nameId="tpck.1169194664001" value="localBoxedIntVarAssignmentResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="770214570644685972">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="770214570644685973">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="770214570644685974">
          <property name="name" nameId="tpck.1169194664001" value="intVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="770214570644685975">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="770214570644685977">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="770214570644685978">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="770214570644685979">
              <property name="name" nameId="tpck.1169194664001" value="classValue" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="770214570644686019">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Class" resolveInfo="Class" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="770214570644686014">
                <node role="operand" roleId="tpee.1197027771414" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="770214570644685982">
                  <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="770214570644685974" resolveInfo="intVar" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="770214570644686018">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Object%dgetClass()%cjava%dlang%dClass" resolveInfo="getClass" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="770214570644685984">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="770214570644685985">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="770214570644685979" resolveInfo="classValue" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="770214570644685986">
            <property name="name" nameId="tpck.1169194664001" value="localObjectVarDeclaration" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="770214570644685987">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="770214570644685989">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="770214570644685990">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="770214570644685991">
            <property name="name" nameId="tpck.1169194664001" value="classValue" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="770214570644686035">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="770214570644686142">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="770214570644686143">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="770214570644686156">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="770214570644686145">
                  <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="770214570644686157">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                  </node>
                  <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="770214570644686147">
                    <property name="value" nameId="tpee.1070475926801" value="getClass" />
                  </node>
                  <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="770214570644686148">
                    <property name="value" nameId="tpee.1070475926801" value="()Ljava/lang/Class;" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="770214570644686149">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="770214570644686150">
                      <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="770214570644686151">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                      </node>
                      <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277418">
                        <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277419">
                          <property name="value" nameId="tpee.1070475926801" value="intVar" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277420">
                          <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                          <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277421">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                          </node>
                          <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277422" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277423">
                          <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                          <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277424">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                          </node>
                          <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277425" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="770214570644686010">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="770214570644686011">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="770214570644685991" resolveInfo="classValue" />
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="770214570644686012">
          <property name="name" nameId="tpck.1169194664001" value="localObjectVarDeclarationResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="7413144797245757993">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="7413144797245757994">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="7413144797245757995">
          <property name="name" nameId="tpck.1169194664001" value="intVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245757996">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245757998">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7413144797245757999">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7413144797245758000">
              <property name="name" nameId="tpck.1169194664001" value="classValue" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245758001">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Class" resolveInfo="Class" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7413144797245758008">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7413144797245758009">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7413144797245758002">
                <node role="operand" roleId="tpee.1197027771414" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="7413144797245758003">
                  <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="7413144797245757995" resolveInfo="intVar" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7413144797245758004">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Object%dgetClass()%cjava%dlang%dClass" resolveInfo="getClass" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7413144797245758010">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7413144797245758000" resolveInfo="classValue" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7413144797245758005">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7413144797245758006">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7413144797245758000" resolveInfo="classValue" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="7413144797245758007">
            <property name="name" nameId="tpck.1169194664001" value="localObjectVarAssignment" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="7413144797245757970">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245757972">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7413144797245757973">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7413144797245757974">
            <property name="name" nameId="tpck.1169194664001" value="classValue" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245757975">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7413144797245758011">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7413144797245758012">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7413144797245757976">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7413144797245757977">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245757978">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="7413144797245757979">
                  <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245757980">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                  </node>
                  <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7413144797245757981">
                    <property name="value" nameId="tpee.1070475926801" value="getClass" />
                  </node>
                  <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7413144797245757982">
                    <property name="value" nameId="tpee.1070475926801" value="()Ljava/lang/Class;" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7413144797245757983">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7413144797245757984">
                      <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245757985">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                      </node>
                      <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277426">
                        <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277427">
                          <property name="value" nameId="tpee.1070475926801" value="intVar" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277428">
                          <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                          <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277429">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                          </node>
                          <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277430" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277431">
                          <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                          <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277432">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                          </node>
                          <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277433" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7413144797245758013">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7413144797245757974" resolveInfo="classValue" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7413144797245757990">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7413144797245757991">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7413144797245757974" resolveInfo="classValue" />
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="7413144797245757992">
          <property name="name" nameId="tpck.1169194664001" value="localObjectVarAssignmentResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="7413144797245923854">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="7413144797245923855">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="7413144797245923856">
          <property name="name" nameId="tpck.1169194664001" value="intVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245923857">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245923859">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7413144797245923860">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7413144797245923861">
              <property name="name" nameId="tpck.1169194664001" value="intValue" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="7413144797245923910" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7413144797245923863">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7413144797245923864">
              <node role="rValue" roleId="tpee.1068498886297" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="7413144797245923866">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="7413144797245923856" resolveInfo="intVar" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7413144797245923868">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7413144797245923861" resolveInfo="intValue" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7413144797245923869">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="7413144797245923922">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="7413144797245923856" resolveInfo="intVar" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="7413144797245923873">
            <property name="name" nameId="tpck.1169194664001" value="localUnBoxedIntVarAssignment" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="7413144797245923874">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245923876">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7413144797245923877">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7413144797245923878">
            <property name="name" nameId="tpck.1169194664001" value="intValue" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245923911">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7413144797245923880">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2717152680784273449">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784273453">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dunbox(jetbrains%dmps%ddebug%devaluation%dproxies%dIObjectValueProxy)%cjetbrains%dmps%ddebug%devaluation%dproxies%dPrimitiveValueProxy" resolveInfo="unbox" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2717152680784273454">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2717152680784273455">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784273456">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                  </node>
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277434">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277435">
                      <property name="value" nameId="tpee.1070475926801" value="intVar" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277436">
                      <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                      <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277437">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                      </node>
                      <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277438" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277439">
                      <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                      <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277440">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                      </node>
                      <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277441" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7413144797245923899">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7413144797245923878" resolveInfo="intValue" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7413144797245923900">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7413144797245923924">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7413144797245923925">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245923926">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277442">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277443">
                  <property name="value" nameId="tpee.1070475926801" value="intVar" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277444">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277445">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277446" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277447">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277448">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277449" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="7413144797245923909">
          <property name="name" nameId="tpck.1169194664001" value="localUnBoxedIntVarAssignmentResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="7413144797245923956">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="7413144797245923957">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="7413144797245923958">
          <property name="name" nameId="tpck.1169194664001" value="intVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245923959">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245923961">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7413144797245923962">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7413144797245923963">
              <property name="name" nameId="tpck.1169194664001" value="intValue" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="7413144797245923964" />
              <node role="initializer" roleId="tpee.1068431790190" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="7413144797245923981">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="7413144797245923958" resolveInfo="intVar" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7413144797245923969">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="7413144797245923970">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="7413144797245923958" resolveInfo="intVar" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="7413144797245923971">
            <property name="name" nameId="tpck.1169194664001" value="localUnBoxedIntVarDeclaration" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="7413144797245923931">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="7413144797245923933">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7413144797245923934">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7413144797245923935">
            <property name="name" nameId="tpck.1169194664001" value="intValue" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245923936">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784449131">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dunbox(jetbrains%dmps%ddebug%devaluation%dproxies%dIObjectValueProxy)%cjetbrains%dmps%ddebug%devaluation%dproxies%dPrimitiveValueProxy" resolveInfo="unbox" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2717152680784449133">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2717152680784449134">
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784449135">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                  </node>
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784449136">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784449137">
                      <property name="value" nameId="tpee.1070475926801" value="intVar" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784449138">
                      <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                      <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784449139">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                      </node>
                      <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784449140" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784449141">
                      <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                      <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784449142">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                      </node>
                      <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784449143" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7413144797245923947">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7413144797245923948">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7413144797245923949">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7413144797245923950">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277458">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277459">
                  <property name="value" nameId="tpee.1070475926801" value="intVar" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277460">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277461">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277462" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277463">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277464">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277465" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="7413144797245923955">
          <property name="name" nameId="tpck.1169194664001" value="localUnBoxedIntVarDeclarationResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370179155">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="89292631370179156">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="89292631370179157">
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="89292631370179202" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370179160">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370179203">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370179204">
              <property name="name" nameId="tpck.1169194664001" value="b" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="89292631370179205" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370179207">
                <property name="value" nameId="tpee.1068580123138" value="true" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370179209">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AndAssignmentExpression" typeId="tpee.7024111702304501418" id="89292631370179211">
              <node role="rValue" roleId="tpee.1068498886297" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370179214">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370179157" resolveInfo="var" />
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370179210">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370179204" resolveInfo="b" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370179217">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370179219">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370179157" resolveInfo="var" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370179170">
            <property name="name" nameId="tpck.1169194664001" value="andAssignmentExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370179171">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370179173">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370179249">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370179250">
            <property name="name" nameId="tpck.1169194664001" value="b" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="89292631370179251" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370179253">
              <property name="value" nameId="tpee.1068580123138" value="true" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370179255">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="89292631370179257">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.AndExpression" typeId="tpee.1080120340718" id="89292631370179288">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370179265">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370179250" resolveInfo="b" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370179306">
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="89292631370179315">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370179317">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="473795539390535178">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="473795539390535180">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="473795539390535181">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="473795539390535182">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277466">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277467">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277468">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277469">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277470" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277471">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277472">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277473" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370179308">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" resolveInfo="Boolean" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370179256">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370179250" resolveInfo="b" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370179190">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="89292631370179191">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370179192">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370179247">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277522">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277523">
                  <property name="value" nameId="tpee.1070475926801" value="var" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277524">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277525">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277526" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277527">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277528">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277529" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370179198">
          <property name="name" nameId="tpck.1169194664001" value="andAssignmentExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370193169">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="89292631370193170">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="89292631370193171">
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="89292631370193172" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370193174">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370193175">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370193176">
              <property name="name" nameId="tpck.1169194664001" value="b" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="89292631370193177" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370193178">
                <property name="value" nameId="tpee.1068580123138" value="true" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370193179">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.OrAssignmentExpression" typeId="tpee.7024111702304501416" id="89292631370193189">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370193190">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370193176" resolveInfo="b" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370193191">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370193171" resolveInfo="var" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370193183">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370193184">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370193171" resolveInfo="var" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370193185">
            <property name="name" nameId="tpck.1169194664001" value="orAssignmentExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370193137">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370193139">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370193140">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370193141">
            <property name="name" nameId="tpck.1169194664001" value="b" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="89292631370193142" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370193143">
              <property name="value" nameId="tpee.1068580123138" value="true" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370193144">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="89292631370193145">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.OrExpression" typeId="tpee.1080223426719" id="89292631370196798">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196799">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370193141" resolveInfo="b" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370196801">
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="89292631370196802">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196803">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067460949">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067460951">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7289900034067460953">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7289900034067460954">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277482">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277483">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277484">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277485">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277486" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277487">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277488">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277489" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196810">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" resolveInfo="Boolean" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370193159">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370193141" resolveInfo="b" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370193160">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="89292631370193161">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370193162">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370193163">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277490">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277491">
                  <property name="value" nameId="tpee.1070475926801" value="var" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277492">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277493">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277494" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277495">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277496">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277497" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370193168">
          <property name="name" nameId="tpck.1169194664001" value="orAssignmentExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370193120">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="89292631370193121">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="89292631370193122">
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="89292631370193123" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370193125">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370193126">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370193127">
              <property name="name" nameId="tpck.1169194664001" value="b" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="89292631370193128" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370193129">
                <property name="value" nameId="tpee.1068580123138" value="true" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370193130">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.XorAssignmentExpression" typeId="tpee.7024111702304501420" id="89292631370196811">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196812">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370193127" resolveInfo="b" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370196813">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370193122" resolveInfo="var" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370193134">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370193135">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370193122" resolveInfo="var" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370193136">
            <property name="name" nameId="tpck.1169194664001" value="xorAssignmentExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370193088">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370193090">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370193091">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370193092">
            <property name="name" nameId="tpck.1169194664001" value="b" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="89292631370193093" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="89292631370193094">
              <property name="value" nameId="tpee.1068580123138" value="true" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370193095">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="89292631370193096">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.BitwiseXorExpression" typeId="tpee.1224500799915" id="89292631370196814">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196815">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370193092" resolveInfo="b" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370196817">
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="89292631370196818">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196819">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067460959">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067460961">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7289900034067460963">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7289900034067460964">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277498">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277499">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277500">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277501">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277502" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277503">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277504">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277505" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196826">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" resolveInfo="Boolean" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370193110">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370193092" resolveInfo="b" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370193111">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="89292631370193112">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370193113">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370193114">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277506">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277507">
                  <property name="value" nameId="tpee.1070475926801" value="var" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277508">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277509">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277510" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277511">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277512">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277513" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370193119">
          <property name="name" nameId="tpck.1169194664001" value="xorAssignmentExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370192751">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="89292631370192752">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="89292631370192753">
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370192768" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370192756">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370192757">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370192758">
              <property name="name" nameId="tpck.1169194664001" value="b" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370192769" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370192770">
                <property name="value" nameId="tpee.1068580320021" value="4" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370192772">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DivAssignmentExpression" typeId="tpee.7024111702304501412" id="89292631370192774">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370192773">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192758" resolveInfo="b" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370192778">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370192753" resolveInfo="var" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370192765">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370192766">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370192753" resolveInfo="var" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370192767">
            <property name="name" nameId="tpck.1169194664001" value="divAssignmentExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370192719">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370192721">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370192722">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370192723">
            <property name="name" nameId="tpck.1169194664001" value="b" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370192779" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370192780">
              <property name="value" nameId="tpee.1068580320021" value="4" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370192726">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="89292631370192727">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.DivExpression" typeId="tpee.1095950406618" id="89292631370192781">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370192782">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192723" resolveInfo="b" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370192784">
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="89292631370192785">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370192786">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067460969">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067460971">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7289900034067460973">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7289900034067460974">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277514">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277515">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277516">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277517">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277518" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277519">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277520">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277521" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370192794">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370192741">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192723" resolveInfo="b" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370192742">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="89292631370192743">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370192744">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370192745">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277530">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277531">
                  <property name="value" nameId="tpee.1070475926801" value="var" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277532">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277533">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277534" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277535">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277536">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277537" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370192750">
          <property name="name" nameId="tpck.1169194664001" value="divAssignmentExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370192827">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="89292631370192828">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="89292631370192829">
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370192830" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370192832">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370192833">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370192834">
              <property name="name" nameId="tpck.1169194664001" value="b" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370192835" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370192836">
                <property name="value" nameId="tpee.1068580320021" value="4" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370192837">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.LeftShiftAssignmentExpression" typeId="tpee.7024111702304501422" id="89292631370192850">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370192851">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192834" resolveInfo="b" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370192852">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370192829" resolveInfo="var" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370192841">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370192842">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370192829" resolveInfo="var" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370192843">
            <property name="name" nameId="tpck.1169194664001" value="leftShiftAssignmentExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370192795">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370192797">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370192798">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370192799">
            <property name="name" nameId="tpck.1169194664001" value="b" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370192800" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370192801">
              <property name="value" nameId="tpee.1068580320021" value="4" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370192802">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="89292631370192803">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ShiftLeftExpression" typeId="tpee.1225892208569" id="89292631370192879">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370192880">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192799" resolveInfo="b" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370192882">
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="89292631370192883">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370192884">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067460979">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067460981">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7289900034067460983">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7289900034067460984">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277538">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277539">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277540">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277541">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277542" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277543">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277544">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277545" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370192891">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370192817">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192799" resolveInfo="b" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370192818">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="89292631370192819">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370192820">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370192821">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277546">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277547">
                  <property name="value" nameId="tpee.1070475926801" value="var" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277548">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277549">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277550" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277551">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277552">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277553" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370192826">
          <property name="name" nameId="tpck.1169194664001" value="leftShiftAssignmentExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370193071">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="89292631370193072">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="89292631370193073">
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370193074" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370193076">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370193077">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370193078">
              <property name="name" nameId="tpck.1169194664001" value="b" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370193079" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370193080">
                <property name="value" nameId="tpee.1068580320021" value="4" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370193081">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.MinusAssignmentExpression" typeId="tpee.1215695201514" id="89292631370196827">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196828">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370193078" resolveInfo="b" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370196829">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370193073" resolveInfo="var" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370193085">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370193086">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370193073" resolveInfo="var" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370193087">
            <property name="name" nameId="tpck.1169194664001" value="minusAssignmentExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370193039">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370193041">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370193042">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370193043">
            <property name="name" nameId="tpck.1169194664001" value="b" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370193044" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370193045">
              <property name="value" nameId="tpee.1068580320021" value="4" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370193046">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="89292631370193047">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="89292631370196843">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196844">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370193043" resolveInfo="b" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370196846">
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="89292631370196847">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196848">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067460989">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067460991">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7289900034067460993">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7289900034067460994">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277554">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277555">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277556">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277557">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277558" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277559">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277560">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277561" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196855">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370193061">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370193043" resolveInfo="b" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370193062">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="89292631370193063">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370193064">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370193065">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277562">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277563">
                  <property name="value" nameId="tpee.1070475926801" value="var" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277564">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277565">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277566" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277567">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277568">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277569" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370193070">
          <property name="name" nameId="tpck.1169194664001" value="minusAssignmentExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370193022">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="89292631370193023">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="89292631370193024">
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370193025" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370193027">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370193028">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370193029">
              <property name="name" nameId="tpck.1169194664001" value="b" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370193030" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370193031">
                <property name="value" nameId="tpee.1068580320021" value="4" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370193032">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.MulAssignmentExpression" typeId="tpee.7024111702304495340" id="89292631370196856">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196857">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370193029" resolveInfo="b" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370196858">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370193024" resolveInfo="var" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370193036">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370193037">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370193024" resolveInfo="var" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370193038">
            <property name="name" nameId="tpck.1169194664001" value="mulAssignmentExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370192990">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370192992">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370192993">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370192994">
            <property name="name" nameId="tpck.1169194664001" value="b" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370192995" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370192996">
              <property name="value" nameId="tpee.1068580320021" value="4" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370192997">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="89292631370192998">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.MulExpression" typeId="tpee.1092119917967" id="89292631370196859">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196860">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192994" resolveInfo="b" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370196862">
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="89292631370196863">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196864">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067460999">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067461001">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7289900034067461003">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7289900034067461004">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277570">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277571">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277572">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277573">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277574" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277575">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277576">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277577" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196871">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370193012">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192994" resolveInfo="b" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370193013">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="89292631370193014">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370193015">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370193016">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277578">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277579">
                  <property name="value" nameId="tpee.1070475926801" value="var" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277580">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277581">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277582" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277583">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277584">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277585" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370193021">
          <property name="name" nameId="tpck.1169194664001" value="mulAssignmentExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370192973">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="89292631370192974">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="89292631370192975">
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370192976" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370192978">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370192979">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370192980">
              <property name="name" nameId="tpck.1169194664001" value="b" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370192981" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370192982">
                <property name="value" nameId="tpee.1068580320021" value="4" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370192983">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusAssignmentExpression" typeId="tpee.1215695189714" id="89292631370196872">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196873">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192980" resolveInfo="b" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370196874">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370192975" resolveInfo="var" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370192987">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370192988">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370192975" resolveInfo="var" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370192989">
            <property name="name" nameId="tpck.1169194664001" value="plusAssignmentExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370192941">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370192943">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370192944">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370192945">
            <property name="name" nameId="tpck.1169194664001" value="b" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370192946" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370192947">
              <property name="value" nameId="tpee.1068580320021" value="4" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370192948">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="89292631370192949">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="89292631370196875">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196876">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192945" resolveInfo="b" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370196878">
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="89292631370196879">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196880">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067461009">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067461011">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7289900034067461013">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7289900034067461014">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277586">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277587">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277588">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277589">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277590" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277591">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277592">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277593" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196887">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370192963">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192945" resolveInfo="b" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370192964">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="89292631370192965">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370192966">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370192967">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277594">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277595">
                  <property name="value" nameId="tpee.1070475926801" value="var" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277596">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277597">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277598" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277599">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277600">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277601" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370192972">
          <property name="name" nameId="tpck.1169194664001" value="plusAssignmentExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370192924">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="89292631370192925">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="89292631370192926">
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370192927" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370192929">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370192930">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370192931">
              <property name="name" nameId="tpck.1169194664001" value="b" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370192932" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370192933">
                <property name="value" nameId="tpee.1068580320021" value="4" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370192934">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.RemAssignmentExpression" typeId="tpee.7024111702304501414" id="89292631370196937">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196938">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192931" resolveInfo="b" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370196939">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370192926" resolveInfo="var" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370192938">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370192939">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370192926" resolveInfo="var" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370192940">
            <property name="name" nameId="tpck.1169194664001" value="remAssignmentExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370192892">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370192894">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370192895">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370192896">
            <property name="name" nameId="tpck.1169194664001" value="b" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370192897" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370192898">
              <property name="value" nameId="tpee.1068580320021" value="4" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370192899">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="89292631370192900">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.RemExpression" typeId="tpee.1153422105332" id="89292631370196940">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196941">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192896" resolveInfo="b" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370196943">
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="89292631370196944">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196945">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067461019">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067461021">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7289900034067461023">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7289900034067461024">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277602">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277603">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277604">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277605">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277606" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277607">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277608">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277609" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196952">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370192914">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370192896" resolveInfo="b" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370192915">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="89292631370192916">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370192917">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370192918">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277610">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277611">
                  <property name="value" nameId="tpee.1070475926801" value="var" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277612">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277613">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277614" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277615">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277616">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277617" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370192923">
          <property name="name" nameId="tpck.1169194664001" value="remAssignmentExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370196920">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="89292631370196921">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="89292631370196922">
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370196923" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370196925">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370196926">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370196927">
              <property name="name" nameId="tpck.1169194664001" value="b" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370196928" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370196929">
                <property name="value" nameId="tpee.1068580320021" value="4" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370196930">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.RightShiftAssignmentExpression" typeId="tpee.7024111702304501424" id="89292631370196953">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196954">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370196927" resolveInfo="b" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370196955">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370196922" resolveInfo="var" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370196934">
            <node role="expression" roleId="tpee.1068581517676" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="89292631370196935">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="89292631370196922" resolveInfo="var" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370196936">
            <property name="name" nameId="tpck.1169194664001" value="rightShiftAssignmentExpression" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="89292631370196888">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="89292631370196890">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="89292631370196891">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="89292631370196892">
            <property name="name" nameId="tpck.1169194664001" value="b" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="89292631370196893" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="89292631370196894">
              <property name="value" nameId="tpee.1068580320021" value="4" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="89292631370196895">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="89292631370196896">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ShiftRightExpression" typeId="tpee.1225892319711" id="89292631370196956">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196957">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370196892" resolveInfo="b" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370196959">
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="89292631370196960">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196961">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067461029">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="7289900034067461031">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="7289900034067461033">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7289900034067461034">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277618">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277619">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277620">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277621">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277622" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277623">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277624">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277625" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196968">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="89292631370196910">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="89292631370196892" resolveInfo="b" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="89292631370196911">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="89292631370196912">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="89292631370196913">
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="89292631370196914">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
              </node>
              <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277626">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277627">
                  <property name="value" nameId="tpee.1070475926801" value="var" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277628">
                  <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277629">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277630" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277631">
                  <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277632">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277633" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="89292631370196919">
          <property name="name" nameId="tpck.1169194664001" value="rightShiftAssignmentExpressionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="8638796163619025272">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="8638796163619025273">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="8638796163619025274">
          <property name="name" nameId="tpck.1169194664001" value="strings" />
          <node role="deducedType" roleId="8sls.6036237525966189269" type="tp2q.ListType" typeId="tp2q.1151688443754" id="8638796163619040021">
            <node role="elementType" roleId="tp2q.1151688676805" type="tpee.StringType" typeId="tpee.1225271177708" id="8638796163619040022" />
          </node>
          <node role="type" roleId="tpee.5680397130376446158" type="tp2q.LinkedListType" typeId="tp2q.3358009230509553641" id="8638796163619040023">
            <node role="elementType" roleId="tp2q.1151688676805" type="tpee.StringType" typeId="tpee.1225271177708" id="8638796163619040025" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="8638796163619040027">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8638796163619040035">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8638796163619040036">
              <property name="name" nameId="tpck.1169194664001" value="sum" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="8638796163619040037" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8638796163619040039">
                <property name="value" nameId="tpee.1070475926801" value="" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="8638796163619040028">
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8638796163619040029">
              <property name="name" nameId="tpck.1169194664001" value="s" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="8638796163619040032" />
            </node>
            <node role="iterable" roleId="tpee.1144226360166" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="8638796163619040033">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="8638796163619025274" resolveInfo="strings" />
            </node>
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="8638796163619040031">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8638796163619040040">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusAssignmentExpression" typeId="tpee.1215695189714" id="8638796163619040042">
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8638796163619040045">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8638796163619040029" resolveInfo="s" />
                  </node>
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8638796163619040041">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8638796163619040036" resolveInfo="sum" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="8638796163619040047">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8638796163619040049">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8638796163619040036" resolveInfo="sum" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="8638796163619040053">
            <property name="name" nameId="tpck.1169194664001" value="lowLevelVarInForeach" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="8638796163619040050">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="8638796163619040052">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8638796163619040058">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8638796163619040059">
            <property name="name" nameId="tpck.1169194664001" value="sum" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="8638796163619040107" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8638796163619040061">
              <property name="value" nameId="tpee.1070475926801" value="" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="8638796163619040062">
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8638796163619040063">
            <property name="name" nameId="tpck.1169194664001" value="s" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8638796163619040074">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="8638796163619040066">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8638796163619040090">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="8638796163619040092">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1555673226663390351">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8638796163619040095">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8638796163619040059" resolveInfo="sum" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1555673226663390354">
                    <node role="type" roleId="tpee.1070534934091" type="tpee.StringType" typeId="tpee.1225271177708" id="4587766555754816245" />
                    <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="1555673226663390356">
                      <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                      <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1555673226663390357">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                      </node>
                      <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="4587766555754837069">
                        <node role="expression" roleId="tpee.1079359253376" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4587766555754837071">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8638796163619040063" resolveInfo="s" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8638796163619040091">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8638796163619040059" resolveInfo="sum" />
                </node>
              </node>
            </node>
          </node>
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277643">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dtoIterable(jetbrains%dmps%ddebug%devaluation%dproxies%dIObjectValueProxy)%cjava%dlang%dIterable" resolveInfo="toIterable" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2717152680784277644">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2717152680784277645">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277646">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2717152680784277647">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2717152680784277648">
                    <property name="value" nameId="tpee.1070475926801" value="strings" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277649">
                    <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277650">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277651" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2717152680784277652">
                    <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2717152680784277653">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2717152680784277654" />
                  </node>
                </node>
              </node>
            </node>
            <node role="typeArgument" roleId="tpee.4972241301747169160" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8256349518541711254">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="8638796163619040071">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1429427586727359575">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1429427586727359577">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8638796163619040059" resolveInfo="sum" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="1429427586727377218">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1429427586727377219">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="1429427586727377220" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="8638796163619040055">
          <property name="name" nameId="tpck.1169194664001" value="lowLevelVarInForeachResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1774703052633005919">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="1774703052633005920">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="1774703052633005921">
          <property name="name" nameId="tpck.1169194664001" value="integers" />
          <node role="deducedType" roleId="8sls.6036237525966189269" type="tp2q.ListType" typeId="tp2q.1151688443754" id="1774703052633005922">
            <node role="elementType" roleId="tp2q.1151688676805" type="tpee.StringType" typeId="tpee.1225271177708" id="1774703052633005923" />
          </node>
          <node role="type" roleId="tpee.5680397130376446158" type="tp2q.LinkedListType" typeId="tp2q.3358009230509553641" id="1774703052633005924">
            <node role="elementType" roleId="tp2q.1151688676805" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1774703052633005944" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="1774703052633005927">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1774703052633005928">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1774703052633005929">
              <property name="name" nameId="tpck.1169194664001" value="sum" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1774703052633005945" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1774703052633005947">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="1774703052633005932">
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1774703052633005933">
              <property name="name" nameId="tpck.1169194664001" value="i" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1774703052633005948" />
            </node>
            <node role="iterable" roleId="tpee.1144226360166" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="1774703052633005935">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="1774703052633005921" resolveInfo="integers" />
            </node>
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1774703052633005936">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1774703052633005937">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusAssignmentExpression" typeId="tpee.1215695189714" id="1774703052633005938">
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1774703052633005939">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1774703052633005933" resolveInfo="i" />
                  </node>
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1774703052633005940">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1774703052633005929" resolveInfo="sum" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1774703052633005941">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1774703052633005942">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1774703052633005929" resolveInfo="sum" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1774703052633005943">
            <property name="name" nameId="tpck.1169194664001" value="lowLevelIntVarInForeach" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1774703052633005889">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="1774703052633005891">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1774703052633005892">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1774703052633005893">
            <property name="name" nameId="tpck.1169194664001" value="sum" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1774703052633005949" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1774703052633005951">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="1774703052633005896">
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1774703052633005897">
            <property name="name" nameId="tpck.1169194664001" value="i" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1774703052633005952">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1774703052633005899">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1774703052633005900">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1774703052633005901">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1774703052633005902">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1774703052633005903">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1774703052633005893" resolveInfo="sum" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1774703052633005954">
                    <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1774703052633005957">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                    </node>
                    <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="1774703052633005904">
                      <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                      <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1774703052633005905">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                      </node>
                      <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="8497468421530424979">
                        <node role="expression" roleId="tpee.1079359253376" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8497468421530424981">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1774703052633005897" resolveInfo="i" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1774703052633005907">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1774703052633005893" resolveInfo="sum" />
                </node>
              </node>
            </node>
          </node>
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4854718415082573630">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dtoIterable(jetbrains%dmps%ddebug%devaluation%dproxies%dIObjectValueProxy)%cjava%dlang%dIterable" resolveInfo="toIterable" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="4854718415082573631">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="4854718415082573632">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4854718415082573633">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4854718415082573634">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4854718415082573635">
                    <property name="value" nameId="tpee.1070475926801" value="integers" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4854718415082573636">
                    <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4854718415082573637">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4854718415082573638" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4854718415082573639">
                    <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4854718415082573640">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4854718415082573641" />
                  </node>
                </node>
              </node>
            </node>
            <node role="typeArgument" roleId="tpee.4972241301747169160" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1227646886970841436">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1774703052633005916">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1429427586727377222">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1429427586727377227">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1774703052633005893" resolveInfo="sum" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="1429427586727377224">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1429427586727377225">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="1429427586727377226" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1774703052633005918">
          <property name="name" nameId="tpck.1169194664001" value="lowLevelIntVarInForeachResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="6583956526375658284">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="6583956526375658285">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="6583956526375658286">
          <property name="name" nameId="tpck.1169194664001" value="stringValue" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="6583956526375658288" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="6583956526375658290">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6583956526375658291">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6583956526375658292">
              <property name="name" nameId="tpck.1169194664001" value="notNullStringValue" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="6583956526375658293" />
              <node role="initializer" roleId="tpee.1068431790190" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="6583956526375658295">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="6583956526375658286" resolveInfo="stringValue" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6583956526375658297">
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6583956526375658298">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6583956526375658307">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6583956526375658309">
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6583956526375658312">
                    <property name="value" nameId="tpee.1070475926801" value="" />
                  </node>
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6583956526375658308">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6583956526375658292" resolveInfo="notNullStringValue" />
                  </node>
                </node>
              </node>
            </node>
            <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="6583956526375658302">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6583956526375658305" />
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6583956526375658306">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6583956526375658292" resolveInfo="notNullStringValue" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6583956526375658314">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6583956526375658317">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6583956526375658292" resolveInfo="notNullStringValue" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="6583956526375659764">
            <property name="name" nameId="tpck.1169194664001" value="notNullString" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="6583956526375658318">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="6583956526375658320">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6583956526375658322">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6583956526375658323">
            <property name="name" nameId="tpck.1169194664001" value="notNullStringValue" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6583956526375658367">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6583956526375658356">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6583956526375658357">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6583956526375658358">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6583956526375658359">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6583956526375658360">
                    <property name="value" nameId="tpee.1070475926801" value="stringValue" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="6583956526375658361">
                    <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6583956526375658362">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="6583956526375658363" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="6583956526375658364">
                    <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6583956526375658365">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="6583956526375658366" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6583956526375658326">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6583956526375658327">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6583956526375658328">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6583956526375659742">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6583956526375658331">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6583956526375658323" resolveInfo="notNullStringValue" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6583956526375659754">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6583956526375659756">
                    <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6583956526375659758">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                    </node>
                    <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6583956526375659759">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
                      <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6583956526375659760">
                        <property name="value" nameId="tpee.1070475926801" value="" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="6583956526375659761">
                        <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                        <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6583956526375659762">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                        </node>
                        <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="6583956526375659763" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6583956526375658369">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~ProxyEqualsUtil" resolveInfo="ProxyEqualsUtil" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~ProxyEqualsUtil%djavaEquals(jetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy,jetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy)%cboolean" resolveInfo="javaEquals" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6583956526375658370">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6583956526375658323" resolveInfo="notNullStringValue" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6583956526375658372" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6583956526375658335">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6583956526375658336">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6583956526375658323" resolveInfo="notNullStringValue" />
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="6583956526375659765">
          <property name="name" nameId="tpck.1169194664001" value="notNullStringResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4322674958982459622">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="4322674958982459623">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="4322674958982459644">
          <property name="name" nameId="tpck.1169194664001" value="node" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3473983539747237799">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNode" resolveInfo="SNode" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="4322674958982459627">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4322674958982459659">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4322674958982459660">
              <property name="name" nameId="tpck.1169194664001" value="references" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="4322674958982459661">
                <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3473983539747237802">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SReference" resolveInfo="SReference" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4322674958982459664">
                <node role="operand" roleId="tpee.1197027771414" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="3473983539747237800">
                  <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="4322674958982459644" resolveInfo="node" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="wch2.PrivateFieldReferenceOperation" typeId="wch2.6825241477451043705" id="3473983539747237801">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="lkfb.~SNode%dmyReferences" resolveInfo="myReferences" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4322674958982459673">
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4322674958982459674" />
            <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="4322674958982459678">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4322674958982459681" />
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4322674958982459677">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4322674958982459660" resolveInfo="references" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4322674958982459643">
            <property name="name" nameId="tpck.1169194664001" value="nodeReferenceCountViewer" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4322674958982459586">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="4322674958982459588">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4322674958982459697">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4322674958982459698">
            <property name="name" nameId="tpck.1169194664001" value="references" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4322674958982459716">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IArrayValueProxy" resolveInfo="IArrayValueProxy" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="4322674958982459733">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="4322674958982459730">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4322674958982459731">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IArrayValueProxy" resolveInfo="IArrayValueProxy" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4322674958982464646">
                  <property name="methodName" nameId="tp68.1174294288199" value="getFieldValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4322674958982464648">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IArrayValueProxy" resolveInfo="IArrayValueProxy" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="4322674958982464649">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="4322674958982464650">
                      <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4322674958982464651">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                      </node>
                      <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4322674958982464652">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                        <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4322674958982464653">
                          <property name="value" nameId="tpee.1070475926801" value="node" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4322674958982464654">
                          <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                          <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4322674958982464655">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                          </node>
                          <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4322674958982464656" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4322674958982464657">
                          <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                          <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4322674958982464658">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                          </node>
                          <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4322674958982464659" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4322674958982464660">
                    <property name="value" nameId="tpee.1070475926801" value="myReferences" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4322674958982459705">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4322674958982459706" />
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotExpression" typeId="tpee.1081516740877" id="3473983539747082588">
            <node role="expression" roleId="tpee.1081516765348" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3741995341062090759">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~ProxyEqualsUtil%djavaEquals(jetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy,jetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy)%cboolean" resolveInfo="javaEquals" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~ProxyEqualsUtil" resolveInfo="ProxyEqualsUtil" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3741995341062090760">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4322674958982459698" resolveInfo="references" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="3741995341062090761" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4322674958982459621">
          <property name="name" nameId="tpck.1169194664001" value="nodeReferenceCountViewerResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="2281056005883150415">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="2281056005883150416">
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="2281056005883150417">
          <property name="name" nameId="tpck.1169194664001" value="objectVar" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="2281056005883150435">
            <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2281056005883150434">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
            </node>
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="2281056005883150420">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="2281056005883150437">
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2281056005883150438">
              <property name="name" nameId="tpck.1169194664001" value="o" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2281056005883150441">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
              </node>
            </node>
            <node role="iterable" roleId="tpee.1144226360166" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="2281056005883150442">
              <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="2281056005883150417" resolveInfo="objectVar" />
            </node>
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="2281056005883150440" />
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="2281056005883150433">
            <property name="name" nameId="tpck.1169194664001" value="arrayInForeach" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="2281056005883150385">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="2281056005883150387">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="2281056005883150454">
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2281056005883150455">
            <property name="name" nameId="tpck.1169194664001" value="o" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2281056005883150458">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="2281056005883150457" />
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="386801750265878477">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dtoIterableFromArray(jetbrains%dmps%ddebug%devaluation%dproxies%dIArrayValueProxy)%cjava%dlang%dIterable" resolveInfo="toIterableFromArray" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="386801750265878478">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="386801750265878479">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="386801750265878480">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IArrayValueProxy" resolveInfo="IArrayValueProxy" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="386801750265878481">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="386801750265878482">
                    <property name="value" nameId="tpee.1070475926801" value="objectVar" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="386801750265878483">
                    <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="386801750265878484">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="386801750265878485" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="386801750265878486">
                    <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="386801750265878487">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="386801750265878488" />
                  </node>
                </node>
              </node>
            </node>
            <node role="typeArgument" roleId="tpee.4972241301747169160" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1227646886970841434">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="2281056005883150414">
          <property name="name" nameId="tpck.1169194664001" value="arrayInForeachResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="8071722462615359839">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="8071722462615359840">
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="8071722462615359845">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8071722462615359852">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8071722462615359853">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="8071722462615359859">
                <node role="componentType" roleId="tpee.1154542793668" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8071722462615359858">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8071722462615359861">
                  <property name="value" nameId="tpee.1070475926801" value="one" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8071722462615359863">
                  <property name="value" nameId="tpee.1070475926801" value="two" />
                </node>
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="8071722462615359851">
            <property name="name" nameId="tpck.1169194664001" value="newArrayOfString" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="8071722462615359818">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="8071722462615359820">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="215665606921554813">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2836258709954279487">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dcreateArrayFromValues(java%dlang%dString,com%dsun%djdi%dThreadReference,java%dlang%dObject%d%d%d)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIArrayValueProxy" resolveInfo="createArrayFromValues" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2836258709954279488">
              <property name="value" nameId="tpee.1070475926801" value="java.lang.String" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="2836258709954279489">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2836258709954279490">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="2836258709954279491" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2836258709954279492">
              <property name="value" nameId="tpee.1070475926801" value="one" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2836258709954279493">
              <property name="value" nameId="tpee.1070475926801" value="two" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="8071722462615359838">
          <property name="name" nameId="tpck.1169194664001" value="newArrayOfStringResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="335932010435400773">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="335932010435400774">
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="335932010435400776">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="335932010435400777">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="335932010435400778">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreator" typeId="tpee.1184950988562" id="335932010435400784">
                <node role="dimensionExpression" roleId="tpee.1184952969026" type="tpee.DimensionExpression" typeId="tpee.1184952934362" id="335932010435400785">
                  <node role="expression" roleId="tpee.1184953288404" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="335932010435400788">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                </node>
                <node role="componentType" roleId="tpee.1184951007469" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="335932010435400787">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
                </node>
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="335932010435400783">
            <property name="name" nameId="tpck.1169194664001" value="newEmptyArrayOfString" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="335932010435400761">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="335932010435400763">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="215665606921554821">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="215665606921554822">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dcreateArray(java%dlang%dString,com%dsun%djdi%dThreadReference,int)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIArrayValueProxy" resolveInfo="createArray" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="215665606921554823">
              <property name="value" nameId="tpee.1070475926801" value="java.lang.String" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="215665606921554824">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="215665606921554825">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="215665606921554826" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="215665606921554827">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="335932010435400772">
          <property name="name" nameId="tpck.1169194664001" value="newEmptyArrayOfStringResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4609929908986493501">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="4609929908986493502">
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="4609929908986493504">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4609929908986493505">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4609929908986493506">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreator" typeId="tpee.1184950988562" id="4609929908986493507">
                <node role="dimensionExpression" roleId="tpee.1184952969026" type="tpee.DimensionExpression" typeId="tpee.1184952934362" id="4609929908986493508">
                  <node role="expression" roleId="tpee.1184953288404" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4609929908986493509">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                </node>
                <node role="componentType" roleId="tpee.1184951007469" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4609929908986493512" />
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4609929908986493511">
            <property name="name" nameId="tpck.1169194664001" value="newEmptyArrayOfInt" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4609929908986493490">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="4609929908986493492">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4609929908986493493">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4609929908986493494">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dcreateArray(java%dlang%dString,com%dsun%djdi%dThreadReference,int)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIArrayValueProxy" resolveInfo="createArray" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4609929908986493495">
              <property name="value" nameId="tpee.1070475926801" value="int" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4609929908986493496">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4609929908986493497">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4609929908986493498" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4609929908986493499">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4609929908986493500">
          <property name="name" nameId="tpck.1169194664001" value="newEmptyArrayOfIntResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4816137365279714844">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="4816137365279714845">
        <property name="isShowContext" nameId="8sls.6036237525966243739" value="true" />
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="4816137365279714846">
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4816137365279714853">
            <property name="name" nameId="tpck.1169194664001" value="optimizeToStringForString" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4816137365279729505">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4816137365279729506">
              <property name="name" nameId="tpck.1169194664001" value="stringVar" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4816137365279729507" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4816137365279729509">
                <property name="value" nameId="tpee.1070475926801" value="" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4816137365279729534">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4816137365279729536">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4816137365279729537">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4816137365279729506" resolveInfo="stringVar" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="4816137365279729538">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="4816137365279729469" resolveInfo="var" />
              </node>
            </node>
          </node>
        </node>
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="4816137365279729469">
          <property name="isOutOfScope" nameId="8sls.6146091894852355121" value="true" />
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4816137365279729471" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4816137365279714834">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="4816137365279714835">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4816137365279729516">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4816137365279729517">
            <property name="name" nameId="tpck.1169194664001" value="stringVar" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4816137365279729518" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4816137365279729519">
              <property name="value" nameId="tpee.1070475926801" value="" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5098404879615976874">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5098404879615976876">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="5098404879615976877">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5098404879615976878">
                <node role="type" roleId="tpee.1070534934091" type="tpee.StringType" typeId="tpee.1225271177708" id="5098404879616064288" />
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5098404879615976880">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5098404879615976881">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="5098404879616030179">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="5098404879616030181">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5098404879616030183">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5098404879616030184">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5098404879616030185">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5098404879616030186">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5098404879616030187">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5098404879616030188">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="5098404879616030189" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5098404879616030190">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5098404879616030191">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="5098404879616030192" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5098404879615976893">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4816137365279729517" resolveInfo="stringVar" />
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5098404879615976894">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5098404879615976895">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="5098404879615976896" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4816137365279714843">
          <property name="name" nameId="tpck.1169194664001" value="optimizeToStringForStringResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4587766555754887082">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="4587766555754887083">
        <property name="isShowContext" nameId="8sls.6036237525966243739" value="true" />
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="4587766555754887084">
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4587766555754887085">
            <property name="name" nameId="tpck.1169194664001" value="ternaryOperatorForString" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4587766555754887086">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4587766555754887087">
              <property name="name" nameId="tpck.1169194664001" value="stringVar" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4587766555754887088" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4587766555754887089">
                <property name="value" nameId="tpee.1070475926801" value="" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4587766555754887090">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="4587766555754887097">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="4587766555754887110">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4587766555754887113" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4587766555754887101">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4587766555754887087" resolveInfo="stringVar" />
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="4587766555754887109">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="4587766555754887094" resolveInfo="var" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4587766555754887108">
                <property name="value" nameId="tpee.1070475926801" value="" />
              </node>
            </node>
          </node>
        </node>
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="4587766555754887094">
          <property name="isOutOfScope" nameId="8sls.6146091894852355121" value="true" />
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4587766555754887095" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4587766555754887052">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="4587766555754887053">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4587766555754887054">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4587766555754887055">
            <property name="name" nameId="tpck.1169194664001" value="stringVar" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4587766555754887056" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4587766555754887057">
              <property name="value" nameId="tpee.1070475926801" value="" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4587766555754887058">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4587766555754887059">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="4587766555754887115">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="4587766555754887120">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4587766555754887123" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4587766555754887119">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4587766555754887055" resolveInfo="stringVar" />
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4587766555754887124">
                <property name="value" nameId="tpee.1070475926801" value="" />
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.CastExpression" typeId="tpee.1070534934090" id="4587766555754887125">
                <node role="type" roleId="tpee.1070534934091" type="tpee.StringType" typeId="tpee.1225271177708" id="4587766555754887126" />
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4587766555754887127">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754887128">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="4587766555754887129">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="4587766555754887130">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="4587766555754887131">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754887132">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4587766555754887133">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4587766555754887134">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4587766555754887135">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754887136">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4587766555754887137" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4587766555754887138">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754887139">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4587766555754887140" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4587766555754887078">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754887079">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4587766555754887080" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4587766555754887081">
          <property name="name" nameId="tpck.1169194664001" value="ternaryOperatorForStringResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4587766555754950813">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="4587766555754950814">
        <property name="isShowContext" nameId="8sls.6036237525966243739" value="true" />
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="4587766555754950815">
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4587766555754950816">
            <property name="name" nameId="tpck.1169194664001" value="ternaryOperatorForStringIfTrue" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4587766555754950817">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4587766555754950818">
              <property name="name" nameId="tpck.1169194664001" value="stringVar" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4587766555754950819" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4587766555754950820">
                <property name="value" nameId="tpee.1070475926801" value="" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4587766555754950821">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="4587766555754950822">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="4587766555754950823">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4587766555754950824" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4587766555754950825">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4587766555754950818" resolveInfo="stringVar" />
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="4587766555754950831">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="4587766555754950828" resolveInfo="var" />
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4587766555754950832">
                <property name="value" nameId="tpee.1070475926801" value="" />
              </node>
            </node>
          </node>
        </node>
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="4587766555754950828">
          <property name="isOutOfScope" nameId="8sls.6146091894852355121" value="true" />
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4587766555754950829" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4587766555754950780">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="4587766555754950781">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4587766555754950782">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4587766555754950783">
            <property name="name" nameId="tpck.1169194664001" value="stringVar" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4587766555754950784" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4587766555754950785">
              <property name="value" nameId="tpee.1070475926801" value="" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4587766555754950786">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4587766555754950787">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="4587766555754950788">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="4587766555754950789">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4587766555754950790" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4587766555754950791">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4587766555754950783" resolveInfo="stringVar" />
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.CastExpression" typeId="tpee.1070534934090" id="4587766555754950833">
                <node role="type" roleId="tpee.1070534934091" type="tpee.StringType" typeId="tpee.1225271177708" id="4587766555754950834" />
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4587766555754950835">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754950836">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="4587766555754950837">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="4587766555754950838">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="4587766555754950839">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754950840">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4587766555754950841">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4587766555754950842">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4587766555754950843">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754950844">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4587766555754950845" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4587766555754950846">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754950847">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4587766555754950848" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4587766555754950849">
                <property name="value" nameId="tpee.1070475926801" value="" />
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4587766555754950809">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754950810">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4587766555754950811" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4587766555754950812">
          <property name="name" nameId="tpck.1169194664001" value="ternaryOperatorForStringIfTrueResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4587766555754950763">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="4587766555754950764">
        <property name="isShowContext" nameId="8sls.6036237525966243739" value="true" />
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="4587766555754950765">
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4587766555754950766">
            <property name="name" nameId="tpck.1169194664001" value="ternaryOperatorForStringCondition" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4587766555754950771">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="4587766555754950772">
              <node role="condition" roleId="tpee.1163668914799" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="4587766555754950851">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="4587766555754950778" resolveInfo="var" />
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4587766555754950852">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4587766555754950853">
                <property name="value" nameId="tpee.1068580320021" value="2" />
              </node>
            </node>
          </node>
        </node>
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="4587766555754950778">
          <property name="isOutOfScope" nameId="8sls.6146091894852355121" value="true" />
          <property name="name" nameId="tpck.1169194664001" value="var" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="4587766555754950850" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="4587766555754950730">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="4587766555754950731">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4587766555754950736">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4587766555754950737">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="l352.~MirrorUtil" resolveInfo="MirrorUtil" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="l352.~MirrorUtil%dgetValueProxyFromJavaValue(java%dlang%dObject,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValueProxyFromJavaValue" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="4587766555754950738">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.CastExpression" typeId="tpee.1070534934090" id="4587766555754950904">
                <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4587766555754950905">
                  <property name="methodName" nameId="tp68.1174294288199" value="getJavaValue" />
                  <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754950906">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
                  </node>
                  <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="4587766555754950907">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="4587766555754950908">
                      <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="4587766555754950909">
                        <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7658771663429129423">
                          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                        </node>
                        <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4587766555754950911">
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4587766555754950912">
                            <property name="value" nameId="tpee.1070475926801" value="var" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4587766555754950913">
                            <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754950914">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4587766555754950915" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4587766555754950916">
                            <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                            <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754950917">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                            </node>
                            <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4587766555754950918" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7658771663429129424">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" resolveInfo="Boolean" />
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4587766555754950920">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4587766555754950921">
                <property name="value" nameId="tpee.1068580320021" value="2" />
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="4587766555754950759">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4587766555754950760">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="4587766555754950761" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="4587766555754950762">
          <property name="name" nameId="tpck.1169194664001" value="ternaryOperatorForStringConditionResult" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1247401079809823523">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="1247401079809823524">
        <property name="isShowContext" nameId="8sls.6036237525966243739" value="true" />
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="1247401079809823525">
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1247401079809823526">
            <property name="name" nameId="tpck.1169194664001" value="urlClassloaderCast" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1247401079809848359">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1247401079809830187">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1247401079809823576">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1247401079809823578">
                  <node role="expression" roleId="tpee.1070534934092" type="8sls.EvaluatorsThisExpression" typeId="8sls.6036237525966315974" id="1247401079809848358" />
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1247401079809830185">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="22fg.~URLClassLoader" resolveInfo="URLClassLoader" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1247401079809848357">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="22fg.~URLClassLoader%dgetURLs()%cjava%dnet%dURL[]" resolveInfo="getURLs" />
              </node>
            </node>
          </node>
        </node>
        <node role="thisType" roleId="8sls.6036237525966243736" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1247401079809823574">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3yeq.~ExternalClasspathClassLoader" resolveInfo="ExternalClasspathClassLoader" />
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="1247401079809823496">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="1247401079809823497">
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="1247401079809823522">
          <property name="name" nameId="tpck.1169194664001" value="urlClassloaderCastResult" />
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="8057800702000453153">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="8057800702000453155">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8057800702000453157">
              <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="8057800702000505878">
                <property name="methodName" nameId="tp68.1174294288199" value="invokeMethod" />
                <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8057800702000505880">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IArrayValueProxy" resolveInfo="IArrayValueProxy" />
                </node>
                <node role="instance" roleId="tp68.1174317636233" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="9117676066431104284">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="4370794800458755688">
                    <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4370794800458755691">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                    </node>
                    <node role="expression" roleId="tpee.1070534934092" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="9117676066431104281">
                      <property name="methodName" nameId="tp68.1174294288199" value="getThisObject" />
                      <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9117676066431104282">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                      </node>
                      <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="9117676066431104283" />
                    </node>
                  </node>
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8057800702000505881">
                  <property name="value" nameId="tpee.1070475926801" value="getURLs" />
                </node>
                <node role="actualArgument" roleId="tp68.1174318197094" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="9117676066431104292">
                  <property name="value" nameId="tpee.1070475926801" value="()[Ljava/net/URL;" />
                </node>
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8057800702000453159">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IArrayValueProxy" resolveInfo="IArrayValueProxy" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5586226261252332122">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="5586226261252332123">
        <property name="isShowContext" nameId="8sls.6036237525966243739" value="true" />
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="5586226261252332134">
          <property name="isOutOfScope" nameId="8sls.6146091894852355121" value="true" />
          <property name="name" nameId="tpck.1169194664001" value="value" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5586226261252332136">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="5586226261252332124">
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5586226261252332125">
            <property name="name" nameId="tpck.1169194664001" value="primitiveCast" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5586226261252332126">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5586226261252332129">
              <node role="type" roleId="tpee.1070534934091" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5586226261252332137" />
              <node role="expression" roleId="tpee.1070534934092" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="8828574841075726383">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="5586226261252332134" resolveInfo="value" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5586226261252332105">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="5586226261252332106">
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5586226261252332107">
          <property name="name" nameId="tpck.1169194664001" value="primitiveCastResult" />
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5586226261252332108">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3525964900474412365">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dunbox(jetbrains%dmps%ddebug%devaluation%dproxies%dIObjectValueProxy)%cjetbrains%dmps%ddebug%devaluation%dproxies%dPrimitiveValueProxy" resolveInfo="unbox" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="5586226261252384858">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5586226261252384860">
                <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5586226261252384865">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5586226261252384866">
                    <property name="value" nameId="tpee.1070475926801" value="value" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5586226261252384868">
                    <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5586226261252384869">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="5586226261252384870" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5586226261252384872">
                    <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5586226261252384873">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="5586226261252384874" />
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5586226261252384863">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="3525964900474412382">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="3525964900474412383">
        <property name="isShowContext" nameId="8sls.6036237525966243739" value="true" />
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="3525964900474412384">
          <property name="isOutOfScope" nameId="8sls.6146091894852355121" value="true" />
          <property name="name" nameId="tpck.1169194664001" value="value" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="3525964900474412392" />
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="3525964900474412386">
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="3525964900474412387">
            <property name="name" nameId="tpck.1169194664001" value="objectCast" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="3525964900474412388">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.CastExpression" typeId="tpee.1070534934090" id="3525964900474412389">
              <node role="expression" roleId="tpee.1070534934092" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="8828574841075726381">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="3525964900474412384" resolveInfo="value" />
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3525964900474412393">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="3525964900474412366">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="3525964900474412367">
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="3525964900474412368">
          <property name="name" nameId="tpck.1169194664001" value="objectCastResult" />
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="3525964900474412369">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3525964900474412394">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dbox(jetbrains%dmps%ddebug%devaluation%dproxies%dPrimitiveValueProxy,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIObjectValueProxy" resolveInfo="box" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="3525964900474412395">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="3525964900474412396">
                <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3525964900474412397">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3525964900474412398">
                    <property name="value" nameId="tpee.1070475926801" value="value" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="3525964900474412399">
                    <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3525964900474412400">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="3525964900474412401" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="3525964900474412402">
                    <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3525964900474412403">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="3525964900474412404" />
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3525964900474412406">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~PrimitiveValueProxy" resolveInfo="PrimitiveValueProxy" />
                </node>
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="8828574841075702277">
              <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
              <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8828574841075702278">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
              </node>
              <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="8828574841075702279" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5586226261252332093">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="8sls.EvaluatorConcept" typeId="8sls.6036237525966182693" id="5586226261252332094">
        <property name="isShowContext" nameId="8sls.6036237525966243739" value="true" />
        <node role="variables" roleId="8sls.6036237525966243735" type="8sls.LowLevelVariable" typeId="8sls.6036237525966182694" id="5586226261252384875">
          <property name="isOutOfScope" nameId="8sls.6146091894852355121" value="true" />
          <property name="name" nameId="tpck.1169194664001" value="value" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5586226261252384883">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
          </node>
        </node>
        <node role="evaluatedStatements" roleId="8sls.1155520443816777472" type="tpee.StatementList" typeId="tpee.1068580123136" id="5586226261252332095">
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5586226261252332096">
            <property name="name" nameId="tpck.1169194664001" value="arrayCast" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5586226261252332097">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5586226261252332100">
              <node role="expression" roleId="tpee.1070534934092" type="8sls.LowLevelVariableReference" typeId="8sls.9050639307831392587" id="8828574841075726382">
                <link role="baseVariableDeclaration" roleId="tpee.5497648299878491909" targetNodeId="5586226261252384875" resolveInfo="value" />
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ArrayType" typeId="tpee.1070534760951" id="5586226261252384881">
                <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5586226261252384880">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodesToCheck" roleId="tp5g.1217501822150" type="tp5g.TestNode" typeId="tp5g.1216989428737" id="5586226261252332076">
      <node role="nodeToCheck" roleId="tp5g.1216989461394" type="tpee.StatementList" typeId="tpee.1068580123136" id="5586226261252332077">
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp5g.TestNodeAnnotation" typeId="tp5g.1210673684636" id="5586226261252332078">
          <property name="name" nameId="tpck.1169194664001" value="arrayCastResult" />
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5586226261252332079">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5586226261252384887">
            <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5586226261252384900">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IArrayValueProxy" resolveInfo="IArrayValueProxy" />
            </node>
            <node role="expression" roleId="tpee.1070534934092" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="5586226261252384889">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="5586226261252384890">
                <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5586226261252384891">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qyyw.~EvaluationUtils%dgetValue(java%dlang%dString,com%dsun%djdi%dStackFrame,com%dsun%djdi%dThreadReference)%cjetbrains%dmps%ddebug%devaluation%dproxies%dIValueProxy" resolveInfo="getValue" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qyyw.~EvaluationUtils" resolveInfo="EvaluationUtils" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5586226261252384892">
                    <property name="value" nameId="tpee.1070475926801" value="value" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5586226261252384893">
                    <property name="methodName" nameId="tp68.1174294288199" value="getStackFrame" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5586226261252384894">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~StackFrame" resolveInfo="StackFrame" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="5586226261252384895" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp68.InternalPartialInstanceMethodCall" typeId="tp68.1174294166120" id="5586226261252384896">
                    <property name="methodName" nameId="tp68.1174294288199" value="getThreadReference" />
                    <node role="returnType" roleId="tp68.1174313653259" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5586226261252384897">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8413.~ThreadReference" resolveInfo="ThreadReference" />
                    </node>
                    <node role="instance" roleId="tp68.1174317636233" type="tp68.InternalThisExpression" typeId="tp68.1202838164916" id="5586226261252384898" />
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5586226261252384899">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="l352.~IObjectValueProxy" resolveInfo="IObjectValueProxy" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="7744266994038462827" />
</model>

