<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:453eba07-be06-4d79-be27-e839de91fcf2(sax)">
  <persistence version="7" />
  <language namespace="f61473f9-130f-42f6-b98d-6c438812c2f6(jetbrains.mps.baseLanguage.unitTest)" />
  <language namespace="a8fdde77-2e6c-41f6-ac79-8e9b6449c271(jetbrains.mps.xmlQuery)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="9yi" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.xml.parsers(JDK/javax.xml.parsers@java_stub)" version="-1" />
  <import index="exzn" modelUID="f:java_stub#2f499867-d42a-4e31-a93d-33e16883e187#sax(jetbrains.mps.xml.tests/sax@java_stub)" version="-1" />
  <import index="fmpa" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#org.xml.sax(JDK/org.xml.sax@java_stub)" version="-1" />
  <import index="fxg7" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.io(JDK/java.io@java_stub)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="mlj4" modelUID="r:bd6e2c7d-3a5d-4eed-9ff9-27f23ecb34e2(jetbrains.mps.xmlQuery.structure)" version="4" implicit="yes" />
  <import index="tpe3" modelUID="r:00000000-0000-4000-0000-011c895902d7(jetbrains.mps.baseLanguage.unitTest.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="mlj4.XMLSAXParser" typeId="mlj4.4635390255047863050" id="2059681291147340382">
      <property name="name" nameId="tpck.1169194664001" value="TestParser" />
      <link role="root" roleId="mlj4.4635390255047981684" targetNodeId="2059681291147340383" resolveInfo="rootElement" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="2059681291147340385">
      <property name="name" nameId="tpck.1169194664001" value="AstRoot" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="2059681291147419773">
      <property name="name" nameId="tpck.1169194664001" value="AstChild" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="2059681291147434338">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="testParser" />
    </node>
  </roots>
  <root id="2059681291147340382">
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="2059681291147340383">
      <property name="name" nameId="tpck.1169194664001" value="rootElement" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="root" />
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2059681291147422744">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="child" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2059681291147419771" resolveInfo="childElement" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="2059681291147422777">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147422778">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2059681291147422779">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147422781">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="2059681291147422780" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2059681291147422785">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2059681291147422765" resolveInfo="setMainChild" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2059681291147422786" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="2059681291147419709">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="2059681291147419711">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147419712">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2059681291147419713">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147419715">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="2059681291147419714" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2059681291147419719">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2059681291147340427" resolveInfo="setName" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="2059681291147419720" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147419708">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2059681291147340385" resolveInfo="AstRoot" />
      </node>
      <node role="text" roleId="mlj4.4635390255048098149" type="mlj4.XMLSAXTextRule" typeId="mlj4.4635390255048097272" id="2059681291147419721">
        <node role="handler" roleId="mlj4.4635390255048098137" type="mlj4.XMLSAXTextHandler" typeId="mlj4.4635390255048097273" id="2059681291147419722">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147419723">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2059681291147419758">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147419760">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="2059681291147419759" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2059681291147419764">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2059681291147340407" resolveInfo="addText" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147419766">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXTextHandler_value" typeId="mlj4.4635390255048098132" id="2059681291147419765" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2059681291147419770">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dtrim()%cjava%dlang%dString" resolveInfo="trim" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="2059681291147419771">
      <property name="name" nameId="tpck.1169194664001" value="childElement" />
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2059681291147422741">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="mine" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2059681291147419771" resolveInfo="childElement" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2059681291147422743">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="theirs" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2059681291147419771" resolveInfo="childElement" />
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147422740">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2059681291147419773" resolveInfo="AstChild" />
      </node>
    </node>
  </root>
  <root id="2059681291147340385">
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="2059681291147340391">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="2059681291147340394" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="2059681291147340395">
      <property name="name" nameId="tpck.1169194664001" value="name" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="2059681291147340398" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="2059681291147422753">
      <property name="name" nameId="tpck.1169194664001" value="mainChild" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147422756">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2059681291147419773" resolveInfo="AstChild" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2059681291147340386" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="2059681291147340387">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2059681291147340388" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2059681291147340389" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147340390" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2059681291147340399">
      <property name="name" nameId="tpck.1169194664001" value="getText" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="2059681291147340400" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2059681291147340401" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147340402">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2059681291147340403">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147340404">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2059681291147340405" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2059681291147340406">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2059681291147340391" resolveInfo="text" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2059681291147340407">
      <property name="name" nameId="tpck.1169194664001" value="addText" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2059681291147340408" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2059681291147340409" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147340410">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2059681291147340411">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2059681291147340412">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="2059681291147419731">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2059681291147340413">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2059681291147340417" resolveInfo="text" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2059681291147419734">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="2059681291147419747">
                  <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147419752">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2059681291147419751" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2059681291147419756">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2059681291147340391" resolveInfo="text" />
                    </node>
                  </node>
                  <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2059681291147419757">
                    <property name="value" nameId="tpee.1070475926801" value="" />
                  </node>
                  <node role="condition" roleId="tpee.1163668914799" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147419742">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147419737">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2059681291147419736" />
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2059681291147419741">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2059681291147340391" resolveInfo="text" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.IsNotEmptyOperation" typeId="tpee.1225271408483" id="2059681291147419746" />
                  </node>
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147340414">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2059681291147340415" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2059681291147340416">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2059681291147340391" resolveInfo="text" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2059681291147340417">
        <property name="name" nameId="tpck.1169194664001" value="text" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="2059681291147340418" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2059681291147340419">
      <property name="name" nameId="tpck.1169194664001" value="getName" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="2059681291147340420" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2059681291147340421" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147340422">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2059681291147340423">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147340424">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2059681291147340425" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2059681291147340426">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2059681291147340395" resolveInfo="name" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2059681291147340427">
      <property name="name" nameId="tpck.1169194664001" value="setName" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2059681291147340428" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2059681291147340429" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147340430">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2059681291147340431">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2059681291147340432">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2059681291147340433">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2059681291147340437" resolveInfo="name" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147340434">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2059681291147340435" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2059681291147340436">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2059681291147340395" resolveInfo="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2059681291147340437">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="2059681291147340438" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2059681291147422757">
      <property name="name" nameId="tpck.1169194664001" value="getMainChild" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147422758">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2059681291147419773" resolveInfo="AstChild" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2059681291147422759" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147422760">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2059681291147422761">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147422762">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2059681291147422763" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2059681291147422764">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2059681291147422753" resolveInfo="mainChild" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2059681291147422765">
      <property name="name" nameId="tpck.1169194664001" value="setMainChild" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2059681291147422766" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2059681291147422767" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147422768">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2059681291147422769">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2059681291147422770">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2059681291147422771">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2059681291147422775" resolveInfo="mainChild" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147422772">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2059681291147422773" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2059681291147422774">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2059681291147422753" resolveInfo="mainChild" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2059681291147422775">
        <property name="name" nameId="tpck.1169194664001" value="mainChild" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147422776">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2059681291147419773" resolveInfo="AstChild" />
        </node>
      </node>
    </node>
  </root>
  <root id="2059681291147419773">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2059681291147419774" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="2059681291147419775">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2059681291147419776" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2059681291147419777" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147419778" />
    </node>
  </root>
  <root id="2059681291147434338">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2059681291147434353">
      <property name="name" nameId="tpck.1169194664001" value="parse" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147434358">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2059681291147340385" resolveInfo="AstRoot" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="2059681291147434357" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147434356">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.TryCatchStatement" typeId="tpee.1164879751025" id="2059681291147440591">
          <node role="body" roleId="tpee.1164879758292" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147440592">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2059681291147440600">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2059681291147440601">
                <property name="name" nameId="tpck.1169194664001" value="saxParser" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147440602">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="9yi.~SAXParser" resolveInfo="SAXParser" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147440603">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2059681291147440604">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9yi.~SAXParserFactory%dnewInstance()%cjavax%dxml%dparsers%dSAXParserFactory" resolveInfo="newInstance" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="9yi.~SAXParserFactory" resolveInfo="SAXParserFactory" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2059681291147440605">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9yi.~SAXParserFactory%dnewSAXParser()%cjavax%dxml%dparsers%dSAXParser" resolveInfo="newSAXParser" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2059681291147443380">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2059681291147443381">
                <property name="name" nameId="tpck.1169194664001" value="handler" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147443382">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="exzn.~TestParserHandler" resolveInfo="TestParserHandler" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2059681291147443383">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2059681291147443384">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="exzn.~TestParserHandler%d&lt;init&gt;()" resolveInfo="TestParserHandler" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2059681291147440606">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147440607">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2059681291147440608">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2059681291147440601" resolveInfo="saxParser" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2059681291147440609">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9yi.~SAXParser%dparse(org%dxml%dsax%dInputSource,org%dxml%dsax%dhelpers%dDefaultHandler)%cvoid" resolveInfo="parse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2059681291147450812">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2059681291147450814">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fmpa.~InputSource%d&lt;init&gt;(java%dio%dReader)" resolveInfo="InputSource" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2059681291147450815">
                        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2059681291147450816">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~CharArrayReader%d&lt;init&gt;(char[])" resolveInfo="CharArrayReader" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147450817">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2059681291147450818">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2059681291147436050" resolveInfo="text" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2059681291147450819">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dtoCharArray()%cchar[]" resolveInfo="toCharArray" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2059681291147443385">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2059681291147443381" resolveInfo="handler" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2059681291147440612">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.CastExpression" typeId="tpee.1070534934090" id="2059681291147443392">
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147443395">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2059681291147340385" resolveInfo="AstRoot" />
                </node>
                <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147443387">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2059681291147443386">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2059681291147443381" resolveInfo="handler" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2059681291147443391">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="exzn.~TestParserHandler%dgetResult()%csax%dAstRoot" resolveInfo="getResult" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="2059681291147440594">
            <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2059681291147440595">
              <property name="name" nameId="tpck.1169194664001" value="ex" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147440598">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~IOException" resolveInfo="IOException" />
              </node>
            </node>
            <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147440597">
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.Fail" typeId="tpe3.1172017222794" id="2059681291147440619">
                <node role="message" roleId="tpe3.1172075534298" type="tpe3.Message" typeId="tpe3.1172073500303" id="2059681291147440620">
                  <node role="message" roleId="tpe3.1172073511101" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="2059681291147440627">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2059681291147440630">
                      <property name="value" nameId="tpee.1070475926801" value=": exception" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147440622">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2059681291147440621">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2059681291147440595" resolveInfo="ex" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2059681291147440626">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Throwable%dgetMessage()%cjava%dlang%dString" resolveInfo="getMessage" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2059681291147440614">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="2059681291147440616" />
              </node>
            </node>
          </node>
          <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="2059681291147440631">
            <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2059681291147440632">
              <property name="name" nameId="tpck.1169194664001" value="ex" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147440635">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="9yi.~ParserConfigurationException" resolveInfo="ParserConfigurationException" />
              </node>
            </node>
            <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147440634">
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.Fail" typeId="tpe3.1172017222794" id="2059681291147440636">
                <node role="message" roleId="tpe3.1172075534298" type="tpe3.Message" typeId="tpe3.1172073500303" id="2059681291147440637">
                  <node role="message" roleId="tpe3.1172073511101" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="2059681291147440638">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2059681291147440639">
                      <property name="value" nameId="tpee.1070475926801" value=": exception" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147440640">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2059681291147440641">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2059681291147440632" resolveInfo="ex" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2059681291147440642">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Throwable%dgetMessage()%cjava%dlang%dString" resolveInfo="getMessage" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2059681291147440643">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="2059681291147440644" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2059681291147436050">
        <property name="name" nameId="tpck.1169194664001" value="text" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="2059681291147436051" />
      </node>
      <node role="throwsItem" roleId="tpee.1164879685961" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147440581">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fmpa.~SAXException" resolveInfo="SAXException" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2059681291147434339" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="2059681291147434340">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2059681291147434341" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2059681291147434342" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147434343" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="2059681291147434344">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="2059681291147434345">
        <property name="methodName" nameId="tpe3.1171931690128" value="testValid" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2059681291147434346" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2059681291147434347" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147434348">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.TryCatchStatement" typeId="tpee.1164879751025" id="2059681291147444051">
            <node role="body" roleId="tpee.1164879758292" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147444052">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2059681291147444058">
                <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2059681291147444059">
                  <property name="name" nameId="tpck.1169194664001" value="res" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147444060">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2059681291147340385" resolveInfo="AstRoot" />
                  </node>
                  <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="2059681291147444061">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2059681291147434353" resolveInfo="parse" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2059681291147444062">
                      <property name="value" nameId="tpee.1070475926801" value="&lt;root/&gt;" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.Fail" typeId="tpe3.1172017222794" id="2059681291147451479">
                <node role="message" roleId="tpe3.1172075534298" type="tpe3.Message" typeId="tpe3.1172073500303" id="2059681291147451480">
                  <node role="message" roleId="tpe3.1172073511101" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2059681291147451481">
                    <property name="value" nameId="tpee.1070475926801" value="no exception" />
                  </node>
                </node>
              </node>
            </node>
            <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="2059681291147444054">
              <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2059681291147444055">
                <property name="name" nameId="tpck.1169194664001" value="ex" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2059681291147444063">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fmpa.~SAXException" resolveInfo="SAXException" />
                </node>
              </node>
              <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="2059681291147444057">
                <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="2059681291147451469">
                  <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2059681291147451472">
                    <property name="value" nameId="tpee.1070475926801" value="attribute name is absent" />
                  </node>
                  <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2059681291147451474">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2059681291147451473">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2059681291147444055" resolveInfo="ex" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2059681291147451478">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fmpa.~SAXException%dgetMessage()%cjava%dlang%dString" resolveInfo="getMessage" />
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

