<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c895905bf(ypath_test1)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="f61473f9-130f-42f6-b98d-6c438812c2f6(jetbrains.mps.baseLanguage.unitTest)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="d4e445fa-e1ac-4fc8-8d3b-e62b05d0ea4c(jetbrains.mps.ypath)" />
  <import index="tpk9" modelUID="r:00000000-0000-4000-0000-011c895905b5(treepath_dom)" version="-1" />
  <import index="kvg6" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#org.w3c.dom(JDK/org.w3c.dom@java_stub)" version="-1" />
  <import index="fxg7" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.io(JDK/java.io@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="9yi" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.xml.parsers(JDK/javax.xml.parsers@java_stub)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpki" modelUID="r:00000000-0000-4000-0000-011c895905ae(jetbrains.mps.ypath.structure)" version="0" implicit="yes" />
  <import index="tpe3" modelUID="r:00000000-0000-4000-0000-011c895902d7(jetbrains.mps.baseLanguage.unitTest.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="1178886476824">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="XMLTreeSimple" />
    </node>
  </roots>
  <root id="1178886476824">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1179329314254">
      <property name="name" nameId="tpck.1169194664001" value="parse" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1179329327531">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Document" resolveInfo="Document" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1179329314256" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1179329314257">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1179329359486">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1179329359487">
            <property name="name" nameId="tpck.1169194664001" value="is" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1179329359488">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~InputStream" resolveInfo="InputStream" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1217888397155">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1217888397157">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~ByteArrayInputStream%d&lt;init&gt;(byte[])" resolveInfo="ByteArrayInputStream" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628903067">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1179329366843">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179329335510" resolveInfo="xml" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628903068">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dgetBytes()%cbyte[]" resolveInfo="getBytes" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1179329380471">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1179329380472">
            <property name="name" nameId="tpck.1169194664001" value="doc" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1179329380473">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Document" resolveInfo="Document" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628913496">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628919252">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1179329380476">
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="9yi.~DocumentBuilderFactory" resolveInfo="DocumentBuilderFactory" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9yi.~DocumentBuilderFactory%dnewInstance()%cjavax%dxml%dparsers%dDocumentBuilderFactory" resolveInfo="newInstance" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628919253">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9yi.~DocumentBuilderFactory%dnewDocumentBuilder()%cjavax%dxml%dparsers%dDocumentBuilder" resolveInfo="newDocumentBuilder" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628913497">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9yi.~DocumentBuilder%dparse(java%dio%dInputStream)%corg%dw3c%ddom%dDocument" resolveInfo="parse" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1179329386920">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179329359487" resolveInfo="is" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1179329389594">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1179329391383">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179329380472" resolveInfo="doc" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1179329335510">
        <property name="name" nameId="tpck.1169194664001" value="xml" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196713153" />
      </node>
      <node role="throwsItem" roleId="tpee.1164879685961" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1179329420313">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Exception" resolveInfo="Exception" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1181230758114">
      <property name="name" nameId="tpck.1169194664001" value="toString" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196713561" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1181230758116" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1181230758117">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1181230794384">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1181230794385">
            <property name="name" nameId="tpck.1169194664001" value="sb" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1181230794386">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~StringBuilder" resolveInfo="StringBuilder" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1217888390274">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1217888390276">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%d&lt;init&gt;()" resolveInfo="StringBuilder" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1181230781776">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1181230781777">
            <property name="name" nameId="tpck.1169194664001" value="sep" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196714250" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1181230785537">
              <property name="value" nameId="tpee.1070475926801" value="" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="1181230813655">
          <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="1181230813656">
            <property name="name" nameId="tpck.1169194664001" value="n" />
          </node>
          <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1181230817756">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230773329" resolveInfo="nodes" />
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1181230813658">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1181230826079">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628908235">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628896304">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181230826080">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230794385" resolveInfo="sb" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628896305">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%dappend(java%dlang%dCharSequence)%cjava%dlang%dStringBuilder" resolveInfo="append" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181230835499">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230781777" resolveInfo="sep" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628908236">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%dappend(java%dlang%dCharSequence)%cjava%dlang%dStringBuilder" resolveInfo="append" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628907431">
                    <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1181230849115">
                      <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1181230813656" resolveInfo="n" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628907432">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~Node%dgetNodeName()%cjava%dlang%dString" resolveInfo="getNodeName" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1181230861774">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1181230862237">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1181230863415">
                  <property name="value" nameId="tpee.1070475926801" value=", " />
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181230861775">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230781777" resolveInfo="sep" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1181230867913">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628908876">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181230869025">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230794385" resolveInfo="sb" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628908877">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%dtoString()%cjava%dlang%dString" resolveInfo="toString" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1181230773329">
        <property name="name" nameId="tpck.1169194664001" value="nodes" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SequenceType" typeId="tp2q.1151689724996" id="1181230773330">
          <node role="elementType" roleId="tp2q.1151689745422" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1181230775245">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="1179329286838">
      <property name="name" nameId="tpck.1169194664001" value="SINGLE_NODE" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="1179329286839" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196712762" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1179329303547">
        <property name="value" nameId="tpee.1070475926801" value="&lt;foo/&gt;" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="1179400521623">
      <property name="name" nameId="tpck.1169194664001" value="SIMPLE_TREE" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="1179400521624" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196714595" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1179400541683">
        <property name="value" nameId="tpee.1070475926801" value="&lt;root&gt;&lt;a1&gt;&lt;b1/&gt;&lt;b2/&gt;&lt;/a1&gt;&lt;a2&gt;&lt;b3&gt;&lt;c1/&gt;&lt;/b3&gt;&lt;/a2&gt;&lt;/root&gt;" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1178886476825" />
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="1178886476826">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1178886483044">
        <property name="methodName" nameId="tpe3.1171931690128" value="single" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1178886483046">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1179329407627">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1179329407628">
              <property name="name" nameId="tpck.1169194664001" value="doc" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1179329407629">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Document" resolveInfo="Document" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628903478">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1179329412191" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628903479">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1179329314254" resolveInfo="parse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="1179329415214">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179329286838" resolveInfo="SINGLE_NODE" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1179329423766">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1179329423767">
              <property name="name" nameId="tpck.1169194664001" value="tp" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpki.TreePathType" typeId="tpki.1168428529658" id="1179329423768">
                <node role="nodeType" roleId="tpki.1168428551640" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1179329427566">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1179329504857">
                <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="tpk9.1175083364493" />
                <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1179329437209">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179329407628" resolveInfo="doc" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1179399173230">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625317237">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1179399175656">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179329423767" resolveInfo="tp" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="1179399214650" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1179399217930">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1179400444721">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625339348">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1179400446011">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179329423767" resolveInfo="tp" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetFirstOperation" typeId="tp2q.1165525191778" id="1179400448123" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1179400451966">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179329407628" resolveInfo="doc" />
            </node>
          </node>
        </node>
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1198168231664" />
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1179400510523">
        <property name="methodName" nameId="tpe3.1171931690128" value="children" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1179400510525">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1179400611279">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1179400611280">
              <property name="name" nameId="tpck.1169194664001" value="doc" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1179400611281">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Document" resolveInfo="Document" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628916963">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1179400616290" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628916964">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1179329314254" resolveInfo="parse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="1179400620874">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179400521623" resolveInfo="SIMPLE_TREE" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1181230985693">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1181230985694">
              <property name="name" nameId="tpck.1169194664001" value="nodes1" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpki.TreePathType" typeId="tpki.1168428529658" id="1181230985695">
                <node role="nodeType" roleId="tpki.1168428551640" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1181230985696">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1179400643373">
                <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1179400640169">
                  <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="tpk9.1175083364493" />
                  <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1179400638826">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179400611280" resolveInfo="doc" />
                  </node>
                </node>
                <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1179400643379">
                  <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1179400634421">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625335144">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181230985698">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230985694" resolveInfo="nodes1" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="1179400655953" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1179400657692">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1181230989711">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1181230990599">
              <property name="value" nameId="tpee.1070475926801" value="root" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628894442">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1181230994018" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628894443">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1181230758114" resolveInfo="toString" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181230996652">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230985694" resolveInfo="nodes1" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1181231003380">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1181231003381">
              <property name="name" nameId="tpck.1169194664001" value="nodes2" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpki.TreePathType" typeId="tpki.1168428529658" id="1181231003382">
                <node role="nodeType" roleId="tpki.1168428551640" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1181231003383">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1179400944982">
                <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1179400944983">
                  <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1179400944984">
                    <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="tpk9.1175083364493" />
                    <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1179400944985">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179400611280" resolveInfo="doc" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1179400944986">
                    <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
                  </node>
                </node>
                <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1179400944987">
                  <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1179400939783">
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1179400950012">
              <property name="value" nameId="tpee.1068580320021" value="2" />
            </node>
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625347195">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181231003385">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181231003381" resolveInfo="nodes2" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="1179400944988" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1181231007127">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1181231007966">
              <property name="value" nameId="tpee.1070475926801" value="a1, a2" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628904389">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1181231010754" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628904390">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1181230758114" resolveInfo="toString" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181231012766">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181231003381" resolveInfo="nodes2" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1198168231276" />
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1179401046867">
        <property name="methodName" nameId="tpe3.1171931690128" value="descendants" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1179401046869">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1179401070248">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1179401070249">
              <property name="name" nameId="tpck.1169194664001" value="doc" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1179401070250">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Document" resolveInfo="Document" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628912167">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1179401070252" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628912168">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1179329314254" resolveInfo="parse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="1179401070253">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179400521623" resolveInfo="SIMPLE_TREE" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1181230939954">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1181230939955">
              <property name="name" nameId="tpck.1169194664001" value="nodes" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpki.TreePathType" typeId="tpki.1168428529658" id="1181230939956">
                <node role="nodeType" roleId="tpki.1168428551640" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1181230939957">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1179401084517">
                <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1179401084518">
                  <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="tpk9.1175083364493" />
                  <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1179401084519">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179401070249" resolveInfo="doc" />
                  </node>
                </node>
                <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1179401084520">
                  <property name="axis" nameId="tpki.1168527174196" value="DESCENDANTS" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1179401084515">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625327654">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181230939959">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230939955" resolveInfo="nodes" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="1179401084521" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1179401084522">
              <property name="value" nameId="tpee.1068580320021" value="7" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1181230957240">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1181230958270">
              <property name="value" nameId="tpee.1070475926801" value="root, a1, b1, b2, a2, b3, c1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628872933">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1181230963115" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628872934">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1181230758114" resolveInfo="toString" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181230964714">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230939955" resolveInfo="nodes" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1198168231802" />
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1179401424799">
        <property name="methodName" nameId="tpe3.1171931690128" value="defautProperty" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1179401424801">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1179401438197">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1179401438198">
              <property name="name" nameId="tpck.1169194664001" value="doc" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1179401438199">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Document" resolveInfo="Document" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628904293">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1179401438201" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628904294">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1179329314254" resolveInfo="parse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="1179401438202">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179400521623" resolveInfo="SIMPLE_TREE" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1181230915986">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1181230915987">
              <property name="name" nameId="tpck.1169194664001" value="nodes" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpki.TreePathType" typeId="tpki.1168428529658" id="1181230915988">
                <node role="nodeType" roleId="tpki.1168428551640" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1181230915989">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1179401457177">
                <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1179401452829">
                  <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1179401449927">
                    <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="tpk9.1175083364493" />
                    <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1179401448724">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179401438198" resolveInfo="doc" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1179401452833">
                    <property name="axis" nameId="tpki.1168527174196" value="DESCENDANTS" />
                  </node>
                </node>
                <node role="operation" roleId="tpki.1168468671991" type="tpki.MatchDefaultPropertyOperation" typeId="tpki.1175879071372" id="1179401457184">
                  <node role="matchExpression" roleId="tpki.1175879605156" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1179401461437">
                    <property name="value" nameId="tpee.1070475926801" value="b3" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1181230951974">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625345477">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181230951976">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230915987" resolveInfo="nodes" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="1181230951977" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1181230951978">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1181230926059">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1181230927270">
              <property name="value" nameId="tpee.1070475926801" value="b3" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628917203">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1181230930650" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628917204">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1181230758114" resolveInfo="toString" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181230932668">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230915987" resolveInfo="nodes" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1198168231678" />
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1181230118836">
        <property name="methodName" nameId="tpe3.1171931690128" value="sibling_descendants" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1181230118838">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1181230140364">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1181230140365">
              <property name="name" nameId="tpck.1169194664001" value="doc" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1181230140366">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Document" resolveInfo="Document" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628887948">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1181230140368" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628887949">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1179329314254" resolveInfo="parse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="1181230140369">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1179400521623" resolveInfo="SIMPLE_TREE" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1181231319625">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1181231319626">
              <property name="name" nameId="tpck.1169194664001" value="a1" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1181231319627">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625313887">
                <node role="operand" roleId="tpee.1197027771414" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1181230277004">
                  <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1181230180841">
                    <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1181230175804">
                      <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="tpk9.1175083364493" />
                      <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181230174252">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230140365" resolveInfo="doc" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1181230180845">
                      <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1181230277008">
                    <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetFirstOperation" typeId="tp2q.1165525191778" id="1181231279032" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1181231335637">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1181231337348">
              <property name="value" nameId="tpee.1070475926801" value="a1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628916496">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181231342550">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181231319626" resolveInfo="a1" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628916497">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~Node%dgetNodeName()%cjava%dlang%dString" resolveInfo="getNodeName" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1181230144466">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1181230144467">
              <property name="name" nameId="tpck.1169194664001" value="nodes" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SequenceType" typeId="tp2q.1151689724996" id="1181230144468">
                <node role="elementType" roleId="tp2q.1151689745422" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1181230146192">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1181230190950">
                <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1181230184848">
                  <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1181231280134">
                    <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="tpk9.1175083364493" />
                    <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181231319628">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181231319626" resolveInfo="foo" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1181230184852">
                    <property name="axis" nameId="tpki.1168527174196" value="SELF_FOLLOWING_SIBLINGS" />
                  </node>
                </node>
                <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1181230190954">
                  <property name="axis" nameId="tpki.1168527174196" value="SELF_DESCENDANTS" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertSame" typeId="tpe3.1171985735491" id="1181231425252">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1181231425253">
              <property name="value" nameId="tpee.1068580320021" value="6" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625351040">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181231425255">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230144467" resolveInfo="nodes" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="1181231425256" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1181230881047">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1181230882359">
              <property name="value" nameId="tpee.1070475926801" value="a1, b1, b2, a2, b3, c1" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628872757">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1181230885021" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628872758">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1181230758114" resolveInfo="toString" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1181230888458">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1181230144467" resolveInfo="nodes" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1198168231363" />
      </node>
    </node>
  </root>
</model>

