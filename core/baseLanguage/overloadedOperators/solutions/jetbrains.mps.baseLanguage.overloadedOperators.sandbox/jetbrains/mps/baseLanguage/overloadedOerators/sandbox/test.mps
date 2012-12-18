<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:3ad93d2f-47fe-4070-8a77-383dab3a6def(jetbrains.mps.baseLanguage.overloadedOerators.sandbox.test)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="fc8d557e-5de6-4dd8-b749-aab2fb23aefc(jetbrains.mps.baseLanguage.overloadedOperators)" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="fxg7" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.io(JDK/java.io@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="vgj4" modelUID="r:a258f9a5-18d3-4bea-a833-20735290774c(jetbrains.mps.baseLanguage.overloadedOperators.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="4226637275972869608">
      <property name="name" nameId="tpck.1169194664001" value="Complex" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="4226637275972869614">
      <property name="name" nameId="tpck.1169194664001" value="TestComplex" />
    </node>
    <node type="vgj4.OverloadedOperatorContainer" typeId="vgj4.483844232470139399" id="4226637275972869620">
      <property name="name" nameId="tpck.1169194664001" value="ComplexOperators" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6517886960437939909">
      <property name="name" nameId="tpck.1169194664001" value="Complex2" />
    </node>
    <node type="vgj4.OverloadedOperatorContainer" typeId="vgj4.483844232470139399" id="4888428037514503250">
      <property name="name" nameId="tpck.1169194664001" value="StringOperators" />
    </node>
  </roots>
  <root id="4226637275972869608">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4226637275972869633">
      <property name="name" nameId="tpck.1169194664001" value="set" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4226637275972869634" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4226637275972869635" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4226637275972869636">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4226637275972869642">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4226637275972869646">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4226637275972869649">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4226637275972869637" resolveInfo="r" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972869643">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4226637275972869644">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4226637275972869621" resolveInfo="re" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4226637275972869645" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4226637275972869651">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4226637275972869655">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4226637275972869658">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4226637275972869639" resolveInfo="i" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972869652">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4226637275972869653">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4226637275972869627" resolveInfo="im" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4226637275972869654" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4226637275972869637">
        <property name="name" nameId="tpck.1169194664001" value="r" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="4226637275972869638" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4226637275972869639">
        <property name="name" nameId="tpck.1169194664001" value="i" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="4226637275972869641" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4226637275972869659">
      <property name="name" nameId="tpck.1169194664001" value="getIm" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.DoubleType" typeId="tpee.1070534513062" id="4226637275972869663" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4226637275972869661" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4226637275972869662">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4226637275972869664">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972869666">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4226637275972869667">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4226637275972869627" resolveInfo="im" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4226637275972869668" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4226637275972869669">
      <property name="name" nameId="tpck.1169194664001" value="getRe" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.DoubleType" typeId="tpee.1070534513062" id="4226637275972869673" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4226637275972869671" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4226637275972869672">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4226637275972869674">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972869675">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4226637275972869676">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4226637275972869621" resolveInfo="re" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4226637275972869677" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4226637275972869678">
      <property name="name" nameId="tpck.1169194664001" value="print" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4226637275972869679" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4226637275972869680" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4226637275972869681">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4226637275972869685">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972870362">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="4226637275972869686">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4226637275972870366">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln(java%dlang%dString)%cvoid" resolveInfo="println" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4226637275972870380">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4226637275972870383">
                  <property name="value" nameId="tpee.1070475926801" value="i" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4226637275972870374">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4226637275972870370">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972870367">
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4226637275972870368">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4226637275972869621" resolveInfo="re" />
                      </node>
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4226637275972870369" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4226637275972870373">
                      <property name="value" nameId="tpee.1070475926801" value="+" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972870377">
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4226637275972870378">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="4226637275972869627" resolveInfo="im" />
                    </node>
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="4226637275972870379" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="4226637275972869621">
      <property name="name" nameId="tpck.1169194664001" value="re" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4226637275972869622" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="4226637275972869624" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4226637275972869626">
        <property name="value" nameId="tpee.1068580320021" value="0" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="4226637275972869627">
      <property name="name" nameId="tpck.1169194664001" value="im" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4226637275972869628" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="4226637275972869630" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4226637275972869632">
        <property name="value" nameId="tpee.1068580320021" value="0" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4226637275972869609" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="4226637275972869610">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4226637275972869611" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4226637275972869612" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4226637275972869613" />
    </node>
  </root>
  <root id="4226637275972869614">
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="4226637275972870384">
      <property name="name" nameId="tpck.1169194664001" value="main" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4226637275972870385" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4226637275972870386" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4226637275972870387">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4226637275972870394">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4226637275972870395">
            <property name="name" nameId="tpck.1169194664001" value="a" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6517886960437940799">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6517886960437939909" resolveInfo="Complex2" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4226637275972873354">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="4226637275972873355">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6517886960437939911" resolveInfo="Complex2" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4226637275972873357">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4226637275972873358">
            <property name="name" nameId="tpck.1169194664001" value="b" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6517886960437940972">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6517886960437939909" resolveInfo="Complex2" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4226637275972873360">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="4226637275972873361">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6517886960437939911" resolveInfo="Complex2" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4226637275972873363">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972873365">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4226637275972873364">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4226637275972870395" resolveInfo="a" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4226637275972873369">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869633" resolveInfo="set" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4226637275972873370">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4226637275972873385">
                <property name="value" nameId="tpee.1068580320021" value="-4" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4226637275972873374">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972873376">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4226637275972873375">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4226637275972873358" resolveInfo="b" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4226637275972873380">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869633" resolveInfo="set" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4226637275972873381">
                <property name="value" nameId="tpee.1068580320021" value="2" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4226637275972873383">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="162210779026732155">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="162210779026732156">
            <property name="name" nameId="tpck.1169194664001" value="c" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3855395826139545512">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6517886960437939909" resolveInfo="Complex2" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="162210779026732160">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="162210779026732163">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4226637275972873358" resolveInfo="b" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="162210779026732159">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4226637275972870395" resolveInfo="a" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="162210779026732167">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="162210779026732168">
            <property name="name" nameId="tpck.1169194664001" value="d" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="162210779026732169">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="3855395826139545507">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3855395826139545510">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4226637275972873358" resolveInfo="b" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3855395826139545504">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="162210779026732156" resolveInfo="c" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="162210779026732177">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="162210779026732179">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="162210779026732178">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4226637275972870395" resolveInfo="a" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="162210779026732183">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6517886960437939916" resolveInfo="print" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="162210779026732185">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="162210779026732187">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="162210779026732186">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4226637275972873358" resolveInfo="b" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="162210779026732191">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6517886960437939916" resolveInfo="print" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="162210779026732193">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="162210779026732195">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="162210779026732194">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="162210779026732156" resolveInfo="c" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="162210779026732199">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6517886960437939916" resolveInfo="print" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="162210779026732201">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="162210779026732203">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="162210779026732202">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="162210779026732168" resolveInfo="d" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="162210779026732207">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869678" resolveInfo="print" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4888428037514421011">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4888428037514421012">
            <property name="name" nameId="tpck.1169194664001" value="str" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4888428037514421013" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4888428037514421015">
              <property name="value" nameId="tpee.1070475926801" value="str" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="4888428037514503266" />
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4888428037514423986">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4888428037514423987">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="4888428037514423988" />
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="vgj4.CustomOperatorUsage" typeId="vgj4.1569627462441399919" id="4888428037514423995">
            <link role="operator" roleId="vgj4.1569627462441399920" targetNodeId="4888428037514503252" resolveInfo="&gt;-" />
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4888428037514503259">
              <property name="value" nameId="tpee.1070475926801" value="abc" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4888428037514423992">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4888428037514421012" resolveInfo="str" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2673276898228773531">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2673276898228773533">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.MulExpression" typeId="tpee.1092119917967" id="2673276898228773537">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2673276898228773540">
                <property name="value" nameId="tpee.1068580320021" value="3" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2673276898228773536">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="162210779026732156" resolveInfo="c" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2673276898228773532">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="162210779026732168" resolveInfo="d" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2673276898228773758">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2673276898228773760">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.MulExpression" typeId="tpee.1092119917967" id="2673276898228773764">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2673276898228773767">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="162210779026732156" resolveInfo="c" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2673276898228773763">
                <property name="value" nameId="tpee.1068580320021" value="3" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2673276898228773759">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="162210779026732168" resolveInfo="d" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4226637275972870388">
        <property name="name" nameId="tpck.1169194664001" value="args" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="4226637275972870390">
          <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4226637275972870389">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4226637275972869615" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="4226637275972869616">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4226637275972869617" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4226637275972869618" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4226637275972869619" />
    </node>
  </root>
  <root id="4226637275972869620">
    <node role="operators" roleId="vgj4.483844232470139400" type="vgj4.OverloadedBinaryOperator" typeId="vgj4.483844232470132813" id="4226637275972873397">
      <node role="returnType" roleId="vgj4.6677452554237917709" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4226637275972873404">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
      </node>
      <node role="leftType" roleId="vgj4.6677452554239170993" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4226637275972873402">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
      </node>
      <node role="rightType" roleId="vgj4.6677452554239170994" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4226637275972873403">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
      </node>
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4226637275972873401">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4226637275972873407">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4226637275972873408">
            <property name="name" nameId="tpck.1169194664001" value="res" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4226637275972873409">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4226637275972873411">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="4226637275972878676">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869610" resolveInfo="Complex" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4226637275972878678">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972878680">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4226637275972878679">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4226637275972873408" resolveInfo="res" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4226637275972878684">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869633" resolveInfo="set" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4226637275972878691">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972878695">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.RightOperand" typeId="vgj4.7789383629180756961" id="4226637275972878694" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4226637275972878699">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869669" resolveInfo="getRe" />
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972878686">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.LeftOperand" typeId="vgj4.483844232470668960" id="4226637275972878685" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4226637275972878690">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869669" resolveInfo="getRe" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4226637275972878707">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972878711">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.RightOperand" typeId="vgj4.7789383629180756961" id="4226637275972878710" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4226637275972878715">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4226637275972878702">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.LeftOperand" typeId="vgj4.483844232470668960" id="4226637275972878701" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4226637275972878706">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4226637275972878717">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4226637275972878718">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4226637275972873408" resolveInfo="res" />
          </node>
        </node>
      </node>
      <node role="operator" roleId="vgj4.2838654975957155510" type="vgj4.BinaryOperationReference" typeId="vgj4.2838654975957155508" id="509285016998751535">
        <link role="binaryOperation" roleId="vgj4.2838654975957155509" targetNodeId="tpee.1068581242875" resolveInfo="PlusExpression" />
      </node>
    </node>
    <node role="operators" roleId="vgj4.483844232470139400" type="vgj4.OverloadedBinaryOperator" typeId="vgj4.483844232470132813" id="162210779026732085">
      <node role="returnType" roleId="vgj4.6677452554237917709" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="162210779026732092">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
      </node>
      <node role="leftType" roleId="vgj4.6677452554239170993" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="162210779026732090">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
      </node>
      <node role="rightType" roleId="vgj4.6677452554239170994" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="162210779026732091">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
      </node>
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="162210779026732089">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="162210779026732094">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="162210779026732095">
            <property name="name" nameId="tpck.1169194664001" value="res" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="162210779026732096">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="162210779026732097">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="162210779026732098">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869610" resolveInfo="Complex" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="162210779026732099">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="162210779026732100">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="162210779026732101">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="162210779026732095" resolveInfo="res" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="162210779026732102">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869633" resolveInfo="set" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="162210779026732136">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MulExpression" typeId="tpee.1092119917967" id="162210779026732119">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="162210779026732120">
                    <node role="operand" roleId="tpee.1197027771414" type="vgj4.LeftOperand" typeId="vgj4.483844232470668960" id="162210779026732121" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="162210779026732122">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869669" resolveInfo="getRe" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="162210779026732123">
                    <node role="operand" roleId="tpee.1197027771414" type="vgj4.RightOperand" typeId="vgj4.7789383629180756961" id="162210779026732124" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="162210779026732125">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869669" resolveInfo="getRe" />
                    </node>
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.MulExpression" typeId="tpee.1092119917967" id="162210779026732139">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="162210779026732140">
                    <node role="operand" roleId="tpee.1197027771414" type="vgj4.LeftOperand" typeId="vgj4.483844232470668960" id="162210779026732141" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="162210779026732142">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="162210779026732143">
                    <node role="operand" roleId="tpee.1197027771414" type="vgj4.RightOperand" typeId="vgj4.7789383629180756961" id="162210779026732144" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="162210779026732145">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="162210779026732133">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MulExpression" typeId="tpee.1092119917967" id="162210779026732126">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="162210779026732127">
                    <node role="operand" roleId="tpee.1197027771414" type="vgj4.LeftOperand" typeId="vgj4.483844232470668960" id="162210779026732128" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="162210779026732129">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869669" resolveInfo="getRe" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="162210779026732130">
                    <node role="operand" roleId="tpee.1197027771414" type="vgj4.RightOperand" typeId="vgj4.7789383629180756961" id="162210779026732131" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="162210779026732132">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
                    </node>
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.MulExpression" typeId="tpee.1092119917967" id="162210779026732146">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="162210779026732147">
                    <node role="operand" roleId="tpee.1197027771414" type="vgj4.LeftOperand" typeId="vgj4.483844232470668960" id="162210779026732148" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="162210779026732149">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="162210779026732150">
                    <node role="operand" roleId="tpee.1197027771414" type="vgj4.RightOperand" typeId="vgj4.7789383629180756961" id="162210779026732151" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="162210779026732152">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869669" resolveInfo="getRe" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="162210779026732117">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="162210779026732118">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="162210779026732095" resolveInfo="res" />
          </node>
        </node>
      </node>
      <node role="operator" roleId="vgj4.2838654975957155510" type="vgj4.BinaryOperationReference" typeId="vgj4.2838654975957155508" id="509285016998751537">
        <link role="binaryOperation" roleId="vgj4.2838654975957155509" targetNodeId="tpee.1092119917967" resolveInfo="MulExpression" />
      </node>
    </node>
    <node role="operators" roleId="vgj4.483844232470139400" type="vgj4.OverloadedBinaryOperator" typeId="vgj4.483844232470132813" id="6517886960437940037">
      <node role="returnType" roleId="vgj4.6677452554237917709" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6517886960437940044">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6517886960437939909" resolveInfo="Complex2" />
      </node>
      <node role="leftType" roleId="vgj4.6677452554239170993" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6517886960437940042">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
      </node>
      <node role="rightType" roleId="vgj4.6677452554239170994" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6517886960437940043">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6517886960437939909" resolveInfo="Complex2" />
      </node>
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6517886960437940041">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6517886960437940046">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6517886960437940047">
            <property name="name" nameId="tpck.1169194664001" value="res" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6517886960437940071">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6517886960437939909" resolveInfo="Complex2" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6517886960437940049">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6517886960437940050">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6517886960437939911" resolveInfo="Complex2" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6517886960437940051">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437940052">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6517886960437940053">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6517886960437940047" resolveInfo="res" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940054">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869633" resolveInfo="set" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6517886960437940055">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437940056">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.RightOperand" typeId="vgj4.7789383629180756961" id="6517886960437940057" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940058">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869669" resolveInfo="getRe" />
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437940059">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.LeftOperand" typeId="vgj4.483844232470668960" id="6517886960437940060" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940061">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869669" resolveInfo="getRe" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6517886960437940062">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437940063">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.RightOperand" typeId="vgj4.7789383629180756961" id="6517886960437940064" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940065">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437940066">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.LeftOperand" typeId="vgj4.483844232470668960" id="6517886960437940067" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940068">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6517886960437940069">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6517886960437940070">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6517886960437940047" resolveInfo="res" />
          </node>
        </node>
      </node>
      <node role="operator" roleId="vgj4.2838654975957155510" type="vgj4.BinaryOperationReference" typeId="vgj4.2838654975957155508" id="4026654690899337443">
        <link role="binaryOperation" roleId="vgj4.2838654975957155509" targetNodeId="tpee.1068581242875" resolveInfo="PlusExpression" />
      </node>
    </node>
    <node role="operators" roleId="vgj4.483844232470139400" type="vgj4.OverloadedBinaryOperator" typeId="vgj4.483844232470132813" id="6517886960437940072">
      <node role="returnType" roleId="vgj4.6677452554237917709" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6517886960437940079">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6517886960437939909" resolveInfo="Complex2" />
      </node>
      <node role="leftType" roleId="vgj4.6677452554239170993" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6517886960437940077">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6517886960437939909" resolveInfo="Complex2" />
      </node>
      <node role="rightType" roleId="vgj4.6677452554239170994" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6517886960437941145">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6517886960437939909" resolveInfo="Complex2" />
      </node>
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6517886960437940076">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6517886960437940081">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6517886960437940082">
            <property name="name" nameId="tpck.1169194664001" value="res" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6517886960437940083">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6517886960437939909" resolveInfo="Complex2" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6517886960437940084">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6517886960437940085">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6517886960437939911" resolveInfo="Complex2" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6517886960437940086">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437940087">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6517886960437940088">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6517886960437940082" resolveInfo="res" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940089">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869633" resolveInfo="set" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6517886960437940090">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437940091">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.RightOperand" typeId="vgj4.7789383629180756961" id="6517886960437940092" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940093">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869669" resolveInfo="getRe" />
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437940094">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.LeftOperand" typeId="vgj4.483844232470668960" id="6517886960437940095" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940096">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869669" resolveInfo="getRe" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6517886960437940097">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437940098">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.RightOperand" typeId="vgj4.7789383629180756961" id="6517886960437940099" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940100">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437940101">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.LeftOperand" typeId="vgj4.483844232470668960" id="6517886960437940102" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940103">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6517886960437940104">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6517886960437940105">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6517886960437940082" resolveInfo="res" />
          </node>
        </node>
      </node>
      <node role="operator" roleId="vgj4.2838654975957155510" type="vgj4.BinaryOperationReference" typeId="vgj4.2838654975957155508" id="4026654690899337444">
        <link role="binaryOperation" roleId="vgj4.2838654975957155509" targetNodeId="tpee.1068581242875" resolveInfo="PlusExpression" />
      </node>
    </node>
    <node role="operators" roleId="vgj4.483844232470139400" type="vgj4.OverloadedBinaryOperator" typeId="vgj4.483844232470132813" id="2673276898228773414">
      <property name="commutative" nameId="vgj4.2673276898228709090" value="true" />
      <node role="returnType" roleId="vgj4.6677452554237917709" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2673276898228773423">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
      </node>
      <node role="leftType" roleId="vgj4.6677452554239170993" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2673276898228773421" />
      <node role="rightType" roleId="vgj4.6677452554239170994" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2673276898228773422">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
      </node>
      <node role="operator" roleId="vgj4.2838654975957155510" type="vgj4.BinaryOperationReference" typeId="vgj4.2838654975957155508" id="2673276898228773420">
        <link role="binaryOperation" roleId="vgj4.2838654975957155509" targetNodeId="tpee.1092119917967" resolveInfo="MulExpression" />
      </node>
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2673276898228773419">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2673276898228773427">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2673276898228773428">
            <property name="name" nameId="tpck.1169194664001" value="res" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2673276898228773458">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2673276898228773430">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2673276898228773431">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869610" resolveInfo="Complex" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2673276898228773433">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2673276898228773435">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2673276898228773434">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2673276898228773428" resolveInfo="res" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2673276898228773439">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869633" resolveInfo="set" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MulExpression" typeId="tpee.1092119917967" id="2673276898228773453">
                <node role="leftExpression" roleId="tpee.1081773367580" type="vgj4.LeftOperand" typeId="vgj4.483844232470668960" id="2673276898228773454" />
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2673276898228773455">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.RightOperand" typeId="vgj4.7789383629180756961" id="2673276898228773456" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2673276898228773457">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869669" resolveInfo="getRe" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MulExpression" typeId="tpee.1092119917967" id="2673276898228773444">
                <node role="leftExpression" roleId="tpee.1081773367580" type="vgj4.LeftOperand" typeId="vgj4.483844232470668960" id="2673276898228773443" />
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2673276898228773448">
                  <node role="operand" roleId="tpee.1197027771414" type="vgj4.RightOperand" typeId="vgj4.7789383629180756961" id="2673276898228773447" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2673276898228773452">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2673276898228773424">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2673276898228773432">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2673276898228773428" resolveInfo="res" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6517886960437939909">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6517886960437939916">
      <property name="name" nameId="tpck.1169194664001" value="print" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6517886960437939917" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6517886960437939918" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6517886960437939919">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6517886960437939964">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437939965">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="6517886960437939966">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437939967">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprint(double)%cvoid" resolveInfo="print" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437939976">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437939977">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869669" resolveInfo="getRe" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6517886960437939978" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6517886960437939952">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6517886960437939953">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6517886960437940022">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437940023">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="6517886960437940024">
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940025">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprint(java%dlang%dString)%cvoid" resolveInfo="print" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6517886960437940033">
                    <property name="value" nameId="tpee.1070475926801" value="+" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.GreaterThanExpression" typeId="tpee.1081506762703" id="6517886960437939959">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6517886960437939962">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437939956">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437939957">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6517886960437939958" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6517886960437939993">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6517886960437939994">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6517886960437940007">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437940008">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="6517886960437940009">
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940010">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln(java%dlang%dString)%cvoid" resolveInfo="println" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6517886960437940011">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6517886960437940012">
                      <property name="value" nameId="tpee.1070475926801" value="i" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437940019">
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940020">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
                      </node>
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6517886960437940021" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="6517886960437940003">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6517886960437940006">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6517886960437939998">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6517886960437939997" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6517886960437940002">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4226637275972869659" resolveInfo="getIm" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6517886960437939910" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6517886960437939911">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6517886960437939912" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6517886960437939913" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6517886960437939914" />
    </node>
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6517886960437939915">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4226637275972869608" resolveInfo="Complex" />
    </node>
  </root>
  <root id="4888428037514503250">
    <node role="operators" roleId="vgj4.483844232470139400" type="vgj4.OverloadedBinaryOperator" typeId="vgj4.483844232470132813" id="4888428037514503269">
      <node role="returnType" roleId="vgj4.6677452554237917709" type="tpee.BooleanType" typeId="tpee.1070534644030" id="4888428037514503277" />
      <node role="leftType" roleId="vgj4.6677452554239170993" type="tpee.StringType" typeId="tpee.1225271177708" id="4888428037514503275" />
      <node role="rightType" roleId="vgj4.6677452554239170994" type="tpee.StringType" typeId="tpee.1225271177708" id="4888428037514503276" />
      <node role="operator" roleId="vgj4.2838654975957155510" type="vgj4.CustomOperator" typeId="vgj4.2838654975957402167" id="4888428037514503287">
        <link role="declaration" roleId="vgj4.2838654975957402169" targetNodeId="4888428037514503252" resolveInfo="&gt;-" />
      </node>
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4888428037514503274">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4888428037514503278">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4888428037514503281">
            <node role="operand" roleId="tpee.1197027771414" type="vgj4.LeftOperand" typeId="vgj4.483844232470668960" id="4888428037514503280" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4888428037514503285">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dcontains(java%dlang%dCharSequence)%cboolean" resolveInfo="contains" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="vgj4.RightOperand" typeId="vgj4.7789383629180756961" id="4888428037514503286" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="customOperators" roleId="vgj4.2838654975956759196" type="vgj4.CustomOperatorDeclaration" typeId="vgj4.1569627462442419521" id="4888428037514503252">
      <property name="name" nameId="tpck.1169194664001" value="&gt;-" />
    </node>
  </root>
</model>

