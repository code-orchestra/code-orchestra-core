<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:5498b4d6-623f-4d7c-a07f-396c96e14007(jetbrains.mps.graphLayout.intGeom2D)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="f2801650-65d5-424e-bb1b-463a8781b786(jetbrains.mps.baseLanguage.javadoc)" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="m373" modelUID="r:4095af4f-a097-4799-aaa9-03df087ddfa6(jetbrains.mps.baseLanguage.javadoc.structure)" version="5" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="2301768597858221425">
      <property name="name" nameId="tpck.1169194664001" value="Point" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="2301768597858221518">
      <property name="name" nameId="tpck.1169194664001" value="Rectangle" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="2301768597858221544">
      <property name="name" nameId="tpck.1169194664001" value="Dimension" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="2301768597858223105">
      <property name="name" nameId="tpck.1169194664001" value="GeomUtil" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="util" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="1966465523159400126">
      <property name="name" nameId="tpck.1169194664001" value="OrthogonalUtil" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="util" />
    </node>
    <node type="tpee.EnumClass" typeId="tpee.1083245097125" id="2135502080755099705">
      <property name="name" nameId="tpck.1169194664001" value="Direction2D" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="2135502080755099904">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="util" />
      <property name="name" nameId="tpck.1169194664001" value="Util1D" />
    </node>
  </roots>
  <root id="2301768597858221425">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="5639108013728043136">
      <property name="name" nameId="tpck.1169194664001" value="translate" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5639108013728043137" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5639108013728043138" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5639108013728043139">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5639108013728043145">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusAssignmentExpression" typeId="tpee.1215695189714" id="5639108013728043147">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728043150">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728043140" resolveInfo="shiftX" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728043146">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221431" resolveInfo="x" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5639108013728043152">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusAssignmentExpression" typeId="tpee.1215695189714" id="5639108013728043154">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728043157">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728043142" resolveInfo="shiftY" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728043153">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221436" resolveInfo="y" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728043140">
        <property name="name" nameId="tpck.1169194664001" value="shiftX" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5639108013728043141" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728043142">
        <property name="name" nameId="tpck.1169194664001" value="shiftY" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5639108013728043144" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="2301768597858221431">
      <property name="name" nameId="tpck.1169194664001" value="x" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221434" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221435" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="2301768597858221436">
      <property name="name" nameId="tpck.1169194664001" value="y" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221439" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221440" />
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221426" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="2301768597858221427">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2301768597858221428" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221429" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858221430">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858221441">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858221443">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2301768597858221446">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2301768597858221442">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221431" resolveInfo="x" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858221448">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858221450">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2301768597858221453">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2301768597858221449">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221436" resolveInfo="y" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="2301768597858221454">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2301768597858221455" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221456" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858221457">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858221460">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858221462">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858221466">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858221465">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221458" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858221470">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2301768597858221461">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221431" resolveInfo="x" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858221472">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858221474">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858221478">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858221477">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221458" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858221482">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2301768597858221473">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221436" resolveInfo="y" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858221458">
        <property name="name" nameId="tpck.1169194664001" value="p" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858221459">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="2301768597858221483">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2301768597858221484" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221485" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858221486">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858221492">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858221499">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858221502">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221487" resolveInfo="x" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858221494">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2301768597858221493" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858221498">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858221504">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858221514">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858221517">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221489" resolveInfo="y" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858221506">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2301768597858221505" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858221510">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858221487">
        <property name="name" nameId="tpck.1169194664001" value="x" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221488" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858221489">
        <property name="name" nameId="tpck.1169194664001" value="y" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221491" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="592792776163377960">
      <property name="name" nameId="tpck.1169194664001" value="toString" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="592792776163377961" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="592792776163377962">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="592792776163377963">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="592792776163377968">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="592792776163377982">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="592792776163377985">
              <property name="value" nameId="tpee.1070475926801" value="]" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="592792776163377978">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="592792776163377974">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="592792776163377970">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="592792776163377969">
                    <property name="value" nameId="tpee.1070475926801" value="[" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="592792776163377973">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="592792776163377977">
                  <property name="value" nameId="tpee.1070475926801" value=", " />
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="592792776163377981">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221436" resolveInfo="y" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="592792776163377964">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1097352957737593660">
      <property name="name" nameId="tpck.1169194664001" value="equals" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1097352957737593661" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1097352957737593662" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1097352957737593663">
        <property name="name" nameId="tpck.1169194664001" value="object" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1097352957737593664">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1097352957737593665">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1097352957737593671">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1097352957737593672">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1097352957737593683">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1097352957737593684">
                <property name="name" nameId="tpck.1169194664001" value="p" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1097352957737593685">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1097352957737593688">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1097352957737593689">
                    <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1097352957737593690">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1097352957737593663" resolveInfo="object" />
                    </node>
                    <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1097352957737593691">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1097352957737593693">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1097352957737593706">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1097352957737593715">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="1097352957737593718">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1097352957737593710">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1097352957737593709">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1097352957737593684" resolveInfo="p" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1097352957737593714">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                    </node>
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1097352957737593701">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1097352957737593696">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1097352957737593695">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1097352957737593684" resolveInfo="p" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1097352957737593700">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="1097352957737593705">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.InstanceOfExpression" typeId="tpee.1081256982272" id="1097352957737593676">
            <node role="classType" roleId="tpee.1081256993305" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1097352957737593680">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
            </node>
            <node role="leftExpression" roleId="tpee.1081256993304" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1097352957737593675">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1097352957737593663" resolveInfo="object" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1097352957737593667">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.SuperMethodCall" typeId="tpee.1073063089578" id="1097352957737593668">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Object%dequals(java%dlang%dObject)%cboolean" resolveInfo="equals" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1097352957737593669">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1097352957737593663" resolveInfo="object" />
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="1097352957737593666">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1097352957737593925">
      <property name="name" nameId="tpck.1169194664001" value="distance" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.DoubleType" typeId="tpee.1070534513062" id="1097352957737593988" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1097352957737593927" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1097352957737593928">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1097352957737593933">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1097352957737593948">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dsqrt(double)%cdouble" resolveInfo="sqrt" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" resolveInfo="Math" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1097352957737593970">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MulExpression" typeId="tpee.1092119917967" id="1097352957737593956">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MulExpression" typeId="tpee.1092119917967" id="1097352957737593965">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1097352957737593989">
                    <property name="value" nameId="tpee.1113006610751" value="1.0" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1097352957737593954">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="1097352957737593949">
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="1097352957737593950">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221431" resolveInfo="x" />
                      </node>
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1097352957737593951">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1097352957737593952">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1097352957737593931" resolveInfo="p" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1097352957737593953">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1097352957737593959">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="1097352957737593960">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="1097352957737593961">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221431" resolveInfo="x" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1097352957737593962">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1097352957737593963">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1097352957737593931" resolveInfo="p" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1097352957737593964">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.MulExpression" typeId="tpee.1092119917967" id="1097352957737593973">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MulExpression" typeId="tpee.1092119917967" id="1097352957737593974">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1097352957737593990">
                    <property name="value" nameId="tpee.1113006610751" value="1.0" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1097352957737593976">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="1097352957737593977">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1097352957737593979">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1097352957737593980">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1097352957737593931" resolveInfo="p" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1097352957737593991">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                        </node>
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="1097352957737593992">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221436" resolveInfo="y" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1097352957737593982">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="1097352957737593983">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1097352957737593985">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1097352957737593986">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1097352957737593931" resolveInfo="p" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1097352957737593993">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                      </node>
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="1097352957737593994">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221436" resolveInfo="y" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1097352957737593931">
        <property name="name" nameId="tpck.1169194664001" value="p" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1097352957737593932">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1097352957737593995">
      <property name="name" nameId="tpck.1169194664001" value="manhattanDist" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1097352957737593997" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1097352957737593998">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1097352957737594002">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1097352957737594016">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1097352957737594020">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" resolveInfo="Math" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dabs(int)%cint" resolveInfo="abs" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="1097352957737594027">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="1097352957737594030">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221436" resolveInfo="y" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1097352957737594022">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1097352957737594021">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1097352957737594000" resolveInfo="p" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1097352957737594026">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1097352957737594005">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" resolveInfo="Math" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dabs(int)%cint" resolveInfo="abs" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="1097352957737594012">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="1097352957737594015">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1097352957737594007">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1097352957737594006">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1097352957737594000" resolveInfo="p" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1097352957737594011">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1097352957737593999" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1097352957737594000">
        <property name="name" nameId="tpck.1169194664001" value="p" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1097352957737594001">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
    </node>
  </root>
  <root id="2301768597858221518">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2301768597858221978">
      <property name="name" nameId="tpck.1169194664001" value="intersectsSegment" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2301768597858221982" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221980" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858221981">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2135502080755099213">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099214">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099224">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="2135502080755099226">
                <property name="value" nameId="tpee.1068580123138" value="true" />
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="2135502080755099219">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="2135502080755099222">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5639108013728080236" resolveInfo="contains" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099223">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223657" resolveInfo="p2" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="2135502080755099217">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5639108013728080236" resolveInfo="contains" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099218">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223655" resolveInfo="p1" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2301768597858223586">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2301768597858223587">
            <property name="name" nameId="tpck.1169194664001" value="points" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="2301768597858223588">
              <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223589">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="2301768597858223591">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223458" resolveInfo="getCornerPoints" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2301768597858223593">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2301768597858223594">
            <property name="name" nameId="tpck.1169194664001" value="intersects" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2301768597858223595" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="2301768597858223597">
              <property name="value" nameId="tpee.1068580123138" value="false" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="2301768597858223599">
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858223600">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2301768597858223619">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2301768597858223620">
                <property name="name" nameId="tpck.1169194664001" value="next" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858223621" />
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="2301768597858223624">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2301768597858223627">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223623">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223602" resolveInfo="i" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2301768597858223629">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858223630">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858223643">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858223645">
                    <node role="rValue" roleId="tpee.1068498886297" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2301768597858223648">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                    <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223644">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223620" resolveInfo="next" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="2301768597858223634">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223638">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223637">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223587" resolveInfo="points" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.ArrayLengthOperation" typeId="tpee.1208890769693" id="2301768597858223642" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223633">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223620" resolveInfo="next" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858223650">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.OrAssignmentExpression" typeId="tpee.7024111702304501416" id="2301768597858223652">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2301768597858223661">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223111" resolveInfo="intersects" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2301768597858223105" resolveInfo="GeomUtil" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="2301768597858223663">
                    <node role="index" roleId="tpee.1173175577737" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223666">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223602" resolveInfo="i" />
                    </node>
                    <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223662">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223587" resolveInfo="points" />
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="2301768597858223669">
                    <node role="index" roleId="tpee.1173175577737" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223672">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223620" resolveInfo="next" />
                    </node>
                    <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223668">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223587" resolveInfo="points" />
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223674">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223655" resolveInfo="p1" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223676">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223657" resolveInfo="p2" />
                  </node>
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223651">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223594" resolveInfo="intersects" />
                </node>
              </node>
            </node>
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2301768597858223602">
            <property name="name" nameId="tpck.1169194664001" value="i" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858223603" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2301768597858223605">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
          </node>
          <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="2301768597858223607">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223611">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223610">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223587" resolveInfo="points" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.ArrayLengthOperation" typeId="tpee.1208890769693" id="2301768597858223615" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223606">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223602" resolveInfo="i" />
            </node>
          </node>
          <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="2301768597858223617">
            <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223618">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223602" resolveInfo="i" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2301768597858223678">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223681">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223594" resolveInfo="intersects" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223655">
        <property name="name" nameId="tpck.1169194664001" value="p1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223656">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223657">
        <property name="name" nameId="tpck.1169194664001" value="p2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223659">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="5639108013728043107">
      <property name="name" nameId="tpck.1169194664001" value="translate" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5639108013728043108" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5639108013728043109" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5639108013728043110">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5639108013728043116">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusAssignmentExpression" typeId="tpee.1215695189714" id="5639108013728043118">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728043121">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728043111" resolveInfo="shiftX" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728043117">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221524" resolveInfo="x" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5639108013728043123">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusAssignmentExpression" typeId="tpee.1215695189714" id="5639108013728043127">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728043130">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728043113" resolveInfo="shiftY" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728043126">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221529" resolveInfo="y" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728043111">
        <property name="name" nameId="tpck.1169194664001" value="shiftX" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5639108013728043112" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728043113">
        <property name="name" nameId="tpck.1169194664001" value="shiftY" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5639108013728043115" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="5639108013728075331">
      <property name="name" nameId="tpck.1169194664001" value="setLocation" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5639108013728075332" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5639108013728075333" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5639108013728075334">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5639108013728075340">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5639108013728075342">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728075345">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728075335" resolveInfo="newX" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728075341">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221524" resolveInfo="x" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5639108013728075347">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5639108013728075349">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728075352">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728075337" resolveInfo="newY" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728075348">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221529" resolveInfo="y" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728075335">
        <property name="name" nameId="tpck.1169194664001" value="newX" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5639108013728075336" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728075337">
        <property name="name" nameId="tpck.1169194664001" value="newY" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5639108013728075339" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2301768597858223458">
      <property name="name" nameId="tpck.1169194664001" value="getCornerPoints" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ArrayType" typeId="tpee.1070534760951" id="2301768597858223463">
        <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223462">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858223460" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858223461">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2301768597858223466">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2301768597858223467">
            <property name="name" nameId="tpck.1169194664001" value="points" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="2301768597858223468">
              <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223469">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2301768597858223470">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreator" typeId="tpee.1184950988562" id="2301768597858223471">
                <node role="dimensionExpression" roleId="tpee.1184952969026" type="tpee.DimensionExpression" typeId="tpee.1184952934362" id="2301768597858223472">
                  <node role="expression" roleId="tpee.1184953288404" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2301768597858223473">
                    <property name="value" nameId="tpee.1068580320021" value="4" />
                  </node>
                </node>
                <node role="componentType" roleId="tpee.1184951007469" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223474">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858223475">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858223476">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2301768597858223477">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2301768597858223478">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2301768597858223546">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221524" resolveInfo="x" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2301768597858223548">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221529" resolveInfo="y" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="2301768597858223485">
              <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2301768597858223486">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223487">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223467" resolveInfo="points" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858223488">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858223489">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2301768597858223490">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2301768597858223491">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2301768597858223550">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221524" resolveInfo="x" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="2301768597858223575">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223562" resolveInfo="maxY" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="2301768597858223502">
              <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223503">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223467" resolveInfo="points" />
              </node>
              <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2301768597858223504">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858223505">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858223506">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2301768597858223507">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2301768597858223508">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="2301768597858223577">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223551" resolveInfo="maxX" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="2301768597858223579">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223562" resolveInfo="maxY" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="2301768597858223523">
              <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223524">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223467" resolveInfo="points" />
              </node>
              <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2301768597858223525">
                <property name="value" nameId="tpee.1068580320021" value="2" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858223526">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858223527">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2301768597858223528">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2301768597858223529">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="2301768597858223581">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223551" resolveInfo="maxX" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2301768597858223583">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221529" resolveInfo="y" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="2301768597858223540">
              <node role="array" roleId="tpee.1173175590490" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223541">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223467" resolveInfo="points" />
              </node>
              <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2301768597858223542">
                <property name="value" nameId="tpee.1068580320021" value="3" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2301768597858223543">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223544">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223467" resolveInfo="points" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="5639108013728080236">
      <property name="name" nameId="tpck.1169194664001" value="contains" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="5639108013728080240" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5639108013728080238" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5639108013728080239">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5639108013728080246">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.AndExpression" typeId="tpee.1080120340718" id="5639108013728080288">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LessThanOrEqualsExpression" typeId="tpee.1153422305557" id="5639108013728080297">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="5639108013728080300">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223562" resolveInfo="maxY" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728080292">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080291">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080241" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5639108013728080296">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.AndExpression" typeId="tpee.1080120340718" id="5639108013728080275">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.AndExpression" typeId="tpee.1080120340718" id="5639108013728080262">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.GreaterThanOrEqualsExpression" typeId="tpee.1153417849900" id="5639108013728080258">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728080249">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080248">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080241" resolveInfo="p" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5639108013728080257">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728080261">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221524" resolveInfo="x" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LessThanOrEqualsExpression" typeId="tpee.1153422305557" id="5639108013728080271">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728080266">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080265">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080241" resolveInfo="p" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5639108013728080270">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="5639108013728080274">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223551" resolveInfo="maxX" />
                  </node>
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.GreaterThanOrEqualsExpression" typeId="tpee.1153417849900" id="5639108013728080284">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728080279">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080278">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080241" resolveInfo="p" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5639108013728080283">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728080287">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221529" resolveInfo="y" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728080241">
        <property name="name" nameId="tpck.1169194664001" value="p" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5639108013728080242">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="5639108013728080348">
      <property name="name" nameId="tpck.1169194664001" value="intersects" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="5639108013728080352" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5639108013728080350" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5639108013728080351">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5639108013728080379">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.AndExpression" typeId="tpee.1080120340718" id="5639108013728080401">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5639108013728080382">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5639108013728080359" resolveInfo="intersects" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2301768597858223105" resolveInfo="GeomUtil" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728080383">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221524" resolveInfo="x" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="5639108013728080385">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223551" resolveInfo="maxX" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728080388">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080387">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080353" resolveInfo="rect" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5639108013728080392">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728080396">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080395">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080353" resolveInfo="rect" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5639108013728080400">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223551" resolveInfo="maxX" />
                </node>
              </node>
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5639108013728080404">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2301768597858223105" resolveInfo="GeomUtil" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5639108013728080359" resolveInfo="intersects" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728080415">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221529" resolveInfo="y" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="5639108013728080417">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223562" resolveInfo="maxY" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728080407">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080408">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080353" resolveInfo="rect" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5639108013728080418">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728080410">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080411">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080353" resolveInfo="rect" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5639108013728080412">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223562" resolveInfo="maxY" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728080353">
        <property name="name" nameId="tpck.1169194664001" value="rect" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5639108013728080354">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221518" resolveInfo="Rectangle" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2301768597858223551">
      <property name="name" nameId="tpck.1169194664001" value="maxX" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858223555" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858223553" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858223554">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858223556">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="2301768597858223558">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2301768597858223573">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221533" resolveInfo="width" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2301768597858223557">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221524" resolveInfo="x" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2301768597858223562">
      <property name="name" nameId="tpck.1169194664001" value="maxY" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858223566" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858223564" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858223565">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858223567">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="2301768597858223569">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2301768597858223572">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221539" resolveInfo="height" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2301768597858223568">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221529" resolveInfo="y" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1705599667576531684">
      <property name="name" nameId="tpck.1169194664001" value="size" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1705599667576531688" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1705599667576531686" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531687">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576531691">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531692">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531693">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531689" resolveInfo="dir" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1705599667576531694">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099805" resolveInfo="isHorizontal" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531695">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531696">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="1705599667576531707">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221533" resolveInfo="width" />
              </node>
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="1705599667576531700">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531701">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531702">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="1705599667576531709">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221539" resolveInfo="height" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531689">
        <property name="name" nameId="tpck.1169194664001" value="dir" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531690">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2135502080755099705" resolveInfo="Direction2D" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="592792776163377986">
      <property name="name" nameId="tpck.1169194664001" value="toString" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="592792776163377987" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="592792776163377988">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="592792776163377989">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="592792776163377997">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="592792776163383021">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="592792776163383024">
              <property name="value" nameId="tpee.1070475926801" value="]" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="592792776163378021">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="592792776163378017">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="592792776163378004">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="592792776163378003">
                    <property name="value" nameId="tpee.1070475926801" value="[min: " />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="592792776163378007">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="592792776163378009">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="592792776163378010">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221524" resolveInfo="x" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="592792776163378012">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221529" resolveInfo="y" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="592792776163378020">
                  <property name="value" nameId="tpee.1070475926801" value=" max: " />
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="592792776163378024">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="592792776163378026">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="592792776163383018">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223551" resolveInfo="maxX" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="592792776163383020">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223562" resolveInfo="maxY" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="592792776163377990">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="2301768597858221524">
      <property name="name" nameId="tpck.1169194664001" value="x" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221527" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221528" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="2301768597858221529">
      <property name="name" nameId="tpck.1169194664001" value="y" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221536" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221532" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="2301768597858221533">
      <property name="name" nameId="tpck.1169194664001" value="width" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221537" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221538" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="2301768597858221539">
      <property name="name" nameId="tpck.1169194664001" value="height" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221543" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221542" />
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221519" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="2301768597858221520">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2301768597858221521" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221522" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858221523">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858221761">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858221769">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858221772">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221748" resolveInfo="x" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858221764">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2301768597858221763" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858221768">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858221774">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858221781">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858221784">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221750" resolveInfo="y" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858221776">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2301768597858221775" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858221780">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858221786">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858221793">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858221796">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221755" resolveInfo="width" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858221788">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2301768597858221787" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858221792">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221533" resolveInfo="width" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301768597858221799">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2301768597858221806">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858221809">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221758" resolveInfo="height" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858221801">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2301768597858221800" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858221805">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221539" resolveInfo="height" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858221748">
        <property name="name" nameId="tpck.1169194664001" value="x" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221749" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858221750">
        <property name="name" nameId="tpck.1169194664001" value="y" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221752" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858221755">
        <property name="name" nameId="tpck.1169194664001" value="width" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221757" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858221758">
        <property name="name" nameId="tpck.1169194664001" value="height" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221760" />
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="5639108013728080615">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5639108013728080616" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5639108013728080617" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5639108013728080618">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5639108013728080621">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5639108013728080623">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728080622">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221524" resolveInfo="x" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728080627">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080626">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080619" resolveInfo="rect" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5639108013728080631">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5639108013728080633">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5639108013728080635">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728080639">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080638">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080619" resolveInfo="rect" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5639108013728080643">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728080634">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221529" resolveInfo="y" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5639108013728080645">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5639108013728080647">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728080651">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080650">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080619" resolveInfo="rect" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5639108013728080655">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221533" resolveInfo="width" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728080646">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221533" resolveInfo="width" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5639108013728080657">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5639108013728080659">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728080663">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080662">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080619" resolveInfo="rect" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5639108013728080667">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221539" resolveInfo="height" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5639108013728080658">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221539" resolveInfo="height" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728080619">
        <property name="name" nameId="tpck.1169194664001" value="rect" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5639108013728080620">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221518" resolveInfo="Rectangle" />
        </node>
      </node>
    </node>
  </root>
  <root id="2301768597858221544">
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="2301768597858221550">
      <property name="name" nameId="tpck.1169194664001" value="width" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221553" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221554" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="2301768597858221555">
      <property name="name" nameId="tpck.1169194664001" value="height" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221559" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858221558" />
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221545" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="2301768597858221546">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2301768597858221547" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858221548" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858221549">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5639108013728043169">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5639108013728043176">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728043179">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728043164" resolveInfo="width" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728043171">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="5639108013728043170" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5639108013728043175">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221550" resolveInfo="width" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5639108013728043182">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5639108013728043189">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728043192">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728043166" resolveInfo="height" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5639108013728043184">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="5639108013728043183" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="5639108013728043188">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221555" resolveInfo="height" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728043164">
        <property name="name" nameId="tpck.1169194664001" value="width" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5639108013728043165" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728043166">
        <property name="name" nameId="tpck.1169194664001" value="height" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5639108013728043168" />
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="1714301205550511827">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1714301205550511828" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1714301205550511829" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1714301205550511830">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1714301205550511841">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1714301205550511843">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1714301205550511847">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1714301205550511846">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1714301205550511831" resolveInfo="dimension" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1714301205550511851">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221550" resolveInfo="width" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="1714301205550511842">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221550" resolveInfo="width" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1714301205550511853">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1714301205550511855">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1714301205550511859">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1714301205550511858">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1714301205550511831" resolveInfo="dimension" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1714301205550511863">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221555" resolveInfo="height" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="1714301205550511854">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221555" resolveInfo="height" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1714301205550511831">
        <property name="name" nameId="tpck.1169194664001" value="dimension" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1714301205550511832">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221544" resolveInfo="Dimension" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="592792776163377932">
      <property name="name" nameId="tpck.1169194664001" value="toString" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="592792776163377933" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="592792776163377934">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="592792776163377935">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="592792776163377942">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="592792776163377956">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="592792776163377959">
              <property name="value" nameId="tpee.1070475926801" value=")" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="592792776163377952">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="592792776163377948">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="592792776163377944">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="592792776163377943">
                    <property name="value" nameId="tpee.1070475926801" value="(" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="592792776163377947">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221550" resolveInfo="width" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="592792776163377951">
                  <property name="value" nameId="tpee.1070475926801" value=", " />
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="592792776163377955">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858221555" resolveInfo="height" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="592792776163377936">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" />
      </node>
    </node>
  </root>
  <root id="2301768597858223105">
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2301768597858223111">
      <property name="name" nameId="tpck.1169194664001" value="intersects" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2301768597858223115" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858223113" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858223114">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7490214903453704274">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7490214903453704275">
            <property name="name" nameId="tpck.1169194664001" value="interInEnd" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7490214903453704276" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="7490214903453704278">
              <property name="value" nameId="tpee.1068580123138" value="false" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7490214903453704280">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.OrAssignmentExpression" typeId="tpee.7024111702304501416" id="7490214903453704282">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="7490214903453704285">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7490214903453704107" resolveInfo="inside" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704286">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223116" resolveInfo="p1" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704288">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223118" resolveInfo="p2" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704290">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223121" resolveInfo="q1" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7490214903453704281">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704275" resolveInfo="interInEnd" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7490214903453704291">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.OrAssignmentExpression" typeId="tpee.7024111702304501416" id="7490214903453704292">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="7490214903453704293">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7490214903453704107" resolveInfo="inside" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704294">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223116" resolveInfo="p1" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704295">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223118" resolveInfo="p2" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704319">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223124" resolveInfo="q2" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7490214903453704297">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704275" resolveInfo="interInEnd" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7490214903453704298">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.OrAssignmentExpression" typeId="tpee.7024111702304501416" id="7490214903453704299">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="7490214903453704300">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7490214903453704107" resolveInfo="inside" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704321">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223121" resolveInfo="q1" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704322">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223124" resolveInfo="q2" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704326">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223116" resolveInfo="p1" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7490214903453704304">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704275" resolveInfo="interInEnd" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7490214903453704305">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.OrAssignmentExpression" typeId="tpee.7024111702304501416" id="7490214903453704306">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="7490214903453704307">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7490214903453704107" resolveInfo="inside" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704324">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223121" resolveInfo="q1" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704323">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223124" resolveInfo="q2" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704328">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223118" resolveInfo="p2" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7490214903453704311">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704275" resolveInfo="interInEnd" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="7490214903453704330">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="7490214903453704331">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7490214903453704335">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="7490214903453704337">
                <property name="value" nameId="tpee.1068580123138" value="true" />
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7490214903453704334">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704275" resolveInfo="interInEnd" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2301768597858223225">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2301768597858223226">
            <property name="name" nameId="tpck.1169194664001" value="diffQ" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2301768597858223227" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2301768597858223426">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2301768597858223105" resolveInfo="GeomUtil" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223341" resolveInfo="isOnSameSide" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223443">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223116" resolveInfo="p1" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223444">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223118" resolveInfo="p2" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223429">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223121" resolveInfo="q1" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223430">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223124" resolveInfo="q2" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2301768597858223433">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2301768597858223434">
            <property name="name" nameId="tpck.1169194664001" value="diffP" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2301768597858223435" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2301768597858223436">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2301768597858223105" resolveInfo="GeomUtil" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223341" resolveInfo="isOnSameSide" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223445">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223121" resolveInfo="q1" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223446">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223124" resolveInfo="q2" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223447">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223116" resolveInfo="p1" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223448">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223118" resolveInfo="p2" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7490214903453704346">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.AndExpression" typeId="tpee.1080120340718" id="7490214903453704349">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7490214903453704352">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223226" resolveInfo="diffQ" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7490214903453704348">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223434" resolveInfo="diffP" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223116">
        <property name="name" nameId="tpck.1169194664001" value="p1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223117">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223118">
        <property name="name" nameId="tpck.1169194664001" value="p2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223120">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223121">
        <property name="name" nameId="tpck.1169194664001" value="q1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223123">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223124">
        <property name="name" nameId="tpck.1169194664001" value="q2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223126">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="5639108013728080359">
      <property name="name" nameId="tpck.1169194664001" value="intersects" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="5639108013728080360" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5639108013728080361" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5639108013728080362">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5639108013728080363">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.GreaterThanOrEqualsExpression" typeId="tpee.1153417849900" id="5639108013728080364">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5639108013728080365">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" resolveInfo="Math" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmin(int,int)%cint" resolveInfo="min" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080366">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080373" resolveInfo="maxX" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080367">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080377" resolveInfo="maxY" />
              </node>
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5639108013728080368">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" resolveInfo="Math" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmax(int,int)%cint" resolveInfo="max" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080369">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080371" resolveInfo="minX" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5639108013728080370">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5639108013728080375" resolveInfo="minY" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728080371">
        <property name="name" nameId="tpck.1169194664001" value="minX" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5639108013728080372" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728080373">
        <property name="name" nameId="tpck.1169194664001" value="maxX" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5639108013728080374" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728080375">
        <property name="name" nameId="tpck.1169194664001" value="minY" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5639108013728080376" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5639108013728080377">
        <property name="name" nameId="tpck.1169194664001" value="maxY" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5639108013728080378" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2301768597858223341">
      <property name="name" nameId="tpck.1169194664001" value="isOnDiffSide" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="2301768597858223342" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2301768597858223343" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223338">
        <property name="name" nameId="tpck.1169194664001" value="p1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223344">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223337">
        <property name="name" nameId="tpck.1169194664001" value="p2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223345">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223339">
        <property name="name" nameId="tpck.1169194664001" value="q1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223346">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223340">
        <property name="name" nameId="tpck.1169194664001" value="q2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301768597858223347">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858223348">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2301768597858223349">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2301768597858223332">
            <property name="name" nameId="tpck.1169194664001" value="x" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858223350" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="2301768597858223351">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223352">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223353">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223337" resolveInfo="p1" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858223354">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223355">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223356">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223338" resolveInfo="p2" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858223357">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2301768597858223358">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2301768597858223333">
            <property name="name" nameId="tpck.1169194664001" value="y" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858223359" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="2301768597858223360">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223361">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223362">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223337" resolveInfo="p1" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858223363">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223364">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223365">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223338" resolveInfo="p2" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858223366">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2301768597858223367">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2301768597858223335">
            <property name="name" nameId="tpck.1169194664001" value="c1" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858223368" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2301768597858223369">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223147" resolveInfo="intCrossproduct" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223370">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223332" resolveInfo="x" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223371">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223333" resolveInfo="y" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="2301768597858223372">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223373">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223374">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223337" resolveInfo="p1" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858223375">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223376">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223377">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223339" resolveInfo="q1" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858223378">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="2301768597858223379">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223380">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223381">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223337" resolveInfo="p1" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858223382">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223383">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223384">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223339" resolveInfo="q1" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858223385">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2301768597858223386">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2301768597858223334">
            <property name="name" nameId="tpck.1169194664001" value="c2" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858223387" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2301768597858223388">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223147" resolveInfo="intCrossproduct" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223389">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223332" resolveInfo="x" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223390">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223333" resolveInfo="y" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="2301768597858223391">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223392">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223393">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223337" resolveInfo="p1" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858223394">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223395">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223396">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223340" resolveInfo="q2" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858223397">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="2301768597858223398">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223399">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="592792776163343760">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223337" resolveInfo="p2" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858223401">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301768597858223402">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223403">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223340" resolveInfo="q2" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2301768597858223404">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2301768597858223424">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.OrExpression" typeId="tpee.1080223426719" id="2301768597858223407">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2301768597858223408">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.AndExpression" typeId="tpee.1080120340718" id="2301768597858223409">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="7490214903453704339">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7490214903453704340">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223334" resolveInfo="c2" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7490214903453704341">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.GreaterThanExpression" typeId="tpee.1081506762703" id="2301768597858223413">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223414">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223335" resolveInfo="c1" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2301768597858223415">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                </node>
              </node>
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2301768597858223416">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.AndExpression" typeId="tpee.1080120340718" id="2301768597858223417">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.GreaterThanExpression" typeId="tpee.1081506762703" id="7490214903453704342">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7490214903453704343">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223334" resolveInfo="c2" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7490214903453704344">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="2301768597858223421">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2301768597858223422">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223335" resolveInfo="c1" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2301768597858223423">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="7490214903453704107">
      <property name="name" nameId="tpck.1169194664001" value="inside" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7490214903453704108" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7490214903453704150" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7490214903453704110">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7490214903453704153">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7490214903453704154">
            <property name="name" nameId="tpck.1169194664001" value="onLine" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7490214903453704155" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="7490214903453704224">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7490214903453704227">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="7490214903453704157">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223147" resolveInfo="crossproduct2D" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="7490214903453704164">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704168">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704167">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704143" resolveInfo="e1" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704172">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704159">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704158">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704147" resolveInfo="p" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704163">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                    </node>
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="7490214903453704180">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704184">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704183">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704143" resolveInfo="e1" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704188">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704175">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704174">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704147" resolveInfo="p" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704179">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                    </node>
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="7490214903453704197">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704192">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704191">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704145" resolveInfo="e2" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704223">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704202">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704201">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704143" resolveInfo="e1" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704222">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                    </node>
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="7490214903453704213">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704217">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704216">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704143" resolveInfo="e1" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704221">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704208">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704207">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704145" resolveInfo="e2" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704212">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="7490214903453704229">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="7490214903453704230">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7490214903453704234">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.LessThanOrEqualsExpression" typeId="tpee.1153422305557" id="7490214903453704235">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7490214903453704236">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="7490214903453704237">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="592792776163389470" resolveInfo="scalar" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="7490214903453704238">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704239">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704240">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704143" resolveInfo="e1" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704241">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704242">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704243">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704147" resolveInfo="p" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704244">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="7490214903453704245">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704246">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704247">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704143" resolveInfo="e1" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704248">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704249">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704250">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704147" resolveInfo="p" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704251">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="7490214903453704252">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704253">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704254">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704145" resolveInfo="e2" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704255">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704256">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704257">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704147" resolveInfo="p" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704258">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="7490214903453704259">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704260">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704261">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704145" resolveInfo="e2" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704262">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7490214903453704263">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7490214903453704264">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704147" resolveInfo="p" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7490214903453704265">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7490214903453704233">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7490214903453704154" resolveInfo="onLine" />
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="7490214903453704268">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="7490214903453704269">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7490214903453704270">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="7490214903453704272">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7490214903453704143">
        <property name="name" nameId="tpck.1169194664001" value="e1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7490214903453704144">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7490214903453704145">
        <property name="name" nameId="tpck.1169194664001" value="e2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7490214903453704146">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7490214903453704147">
        <property name="name" nameId="tpck.1169194664001" value="p" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7490214903453704148">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2301768597858223147">
      <property name="name" nameId="tpck.1169194664001" value="crossproduct2D" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858223151" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7490214903453704149" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301768597858223150">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2301768597858223167">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="2301768597858223175">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.MulExpression" typeId="tpee.1092119917967" id="2301768597858223180">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223183">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223157" resolveInfo="y1" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223179">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223161" resolveInfo="x2" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MulExpression" typeId="tpee.1092119917967" id="2301768597858223171">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223170">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223152" resolveInfo="x1" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2301768597858223174">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2301768597858223164" resolveInfo="y2" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223152">
        <property name="name" nameId="tpck.1169194664001" value="x1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858223154" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223157">
        <property name="name" nameId="tpck.1169194664001" value="y1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858223159" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223161">
        <property name="name" nameId="tpck.1169194664001" value="x2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858223163" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2301768597858223164">
        <property name="name" nameId="tpck.1169194664001" value="y2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2301768597858223166" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="592792776163389470">
      <property name="name" nameId="tpck.1169194664001" value="scalar" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="592792776163389474" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="592792776163389472" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="592792776163389473">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4723758683606896279">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4723758683606896287">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.MulExpression" typeId="tpee.1092119917967" id="4723758683606896292">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4723758683606896295">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4723758683606896276" resolveInfo="y2" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4723758683606896291">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4723758683606896270" resolveInfo="y1" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MulExpression" typeId="tpee.1092119917967" id="4723758683606896283">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4723758683606896282">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4723758683606896268" resolveInfo="x1" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4723758683606896286">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4723758683606896273" resolveInfo="x2" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4723758683606896268">
        <property name="name" nameId="tpck.1169194664001" value="x1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4723758683606896269" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4723758683606896270">
        <property name="name" nameId="tpck.1169194664001" value="y1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4723758683606896272" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4723758683606896273">
        <property name="name" nameId="tpck.1169194664001" value="x2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4723758683606896275" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4723758683606896276">
        <property name="name" nameId="tpck.1169194664001" value="y2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4723758683606896278" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="3805314409601861054">
      <property name="name" nameId="tpck.1169194664001" value="shiftPolyline" />
      <node role="returnType" roleId="tpee.1068580123133" type="tp2q.ListType" typeId="tp2q.1151688443754" id="3805314409601861058">
        <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3805314409601861060">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3805314409601861056" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3805314409601861057">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3805314409601861071">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3805314409601861072">
            <property name="name" nameId="tpck.1169194664001" value="shiftedPolyline" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="3805314409601861073">
              <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3805314409601861075">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3805314409601861077">
              <node role="creator" roleId="tpee.1145553007750" type="tp2q.LinkedListCreator" typeId="tp2q.1227008614712" id="3805314409601861078">
                <node role="elementType" roleId="tp2q.1237721435807" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3805314409601861079">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="3805314409601861081">
          <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="3805314409601861082">
            <property name="name" nameId="tpck.1169194664001" value="p" />
          </node>
          <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3805314409601861085">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3805314409601861061" resolveInfo="polyline" />
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="3805314409601861084">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3805314409601861086">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3805314409601861088">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3805314409601861087">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3805314409601861072" resolveInfo="shiftedPolyline" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddLastElementOperation" typeId="tp2q.1227022179634" id="3805314409601861094">
                  <node role="argument" roleId="tp2q.1227022698412" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3805314409601861096">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3805314409601861098">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="3805314409601861105">
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3805314409601861108">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3805314409601861065" resolveInfo="xShift" />
                        </node>
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3805314409601861100">
                          <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="3805314409601861099">
                            <link role="variable" roleId="tp2q.1153944258490" targetNodeId="3805314409601861082" resolveInfo="p" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="3805314409601861104">
                            <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                          </node>
                        </node>
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="3805314409601861116">
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3805314409601861119">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3805314409601861068" resolveInfo="yShift" />
                        </node>
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3805314409601861111">
                          <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="3805314409601861110">
                            <link role="variable" roleId="tp2q.1153944258490" targetNodeId="3805314409601861082" resolveInfo="p" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="3805314409601861115">
                            <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
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
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="3805314409601861121">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3805314409601861123">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3805314409601861072" resolveInfo="shiftedPolyline" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="3805314409601861061">
        <property name="name" nameId="tpck.1169194664001" value="polyline" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="3805314409601861062">
          <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3805314409601861064">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="3805314409601861065">
        <property name="name" nameId="tpck.1169194664001" value="xShift" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="3805314409601861067" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="3805314409601861068">
        <property name="name" nameId="tpck.1169194664001" value="yShift" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="3805314409601861070" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2301768597858223106" />
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2135502080755100045">
      <property name="name" nameId="tpck.1169194664001" value="getRectangle" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2135502080755100046">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221518" resolveInfo="Rectangle" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755100047" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755100048">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755100089">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="1705599667576621728">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755100109" resolveInfo="getContainingRectangle" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1705599667576621729">
              <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="1705599667576629690">
                <node role="elementType" roleId="tp2q.1237721435807" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576629692">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
                </node>
                <node role="initValue" roleId="tp2q.1237721435808" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576629694">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100100" resolveInfo="p1" />
                </node>
                <node role="initValue" roleId="tp2q.1237721435808" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576629696">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100102" resolveInfo="p2" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755100100">
        <property name="name" nameId="tpck.1169194664001" value="p1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2135502080755100101">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755100102">
        <property name="name" nameId="tpck.1169194664001" value="p2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2135502080755100103">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2135502080755100109">
      <property name="name" nameId="tpck.1169194664001" value="getContainingRectangle" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2135502080755100110">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221518" resolveInfo="Rectangle" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755100111" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755100112">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2135502080755100113">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2135502080755100114">
            <property name="name" nameId="tpck.1169194664001" value="minX" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755100115" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2135502080755100116">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~Integer%dMAX_VALUE" resolveInfo="MAX_VALUE" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2135502080755100117">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2135502080755100118">
            <property name="name" nameId="tpck.1169194664001" value="minY" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755100119" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2135502080755100120">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~Integer%dMAX_VALUE" resolveInfo="MAX_VALUE" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2135502080755100121">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2135502080755100122">
            <property name="name" nameId="tpck.1169194664001" value="maxX" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755100123" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2135502080755100124">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~Integer%dMIN_VALUE" resolveInfo="MIN_VALUE" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2135502080755100125">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2135502080755100126">
            <property name="name" nameId="tpck.1169194664001" value="maxY" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755100127" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2135502080755100128">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~Integer%dMIN_VALUE" resolveInfo="MIN_VALUE" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="2135502080755100129">
          <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="2135502080755100130">
            <property name="name" nameId="tpck.1169194664001" value="point" />
          </node>
          <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755100131">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100176" resolveInfo="points" />
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755100132">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2135502080755100133">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2135502080755100134">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2135502080755100135">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmin(int,int)%cint" resolveInfo="min" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" resolveInfo="Math" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100136">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100114" resolveInfo="minX" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2135502080755100137">
                    <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="2135502080755100138">
                      <link role="variable" roleId="tp2q.1153944258490" targetNodeId="2135502080755100130" resolveInfo="point" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2135502080755100139">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                    </node>
                  </node>
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100140">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100114" resolveInfo="minX" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2135502080755100141">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2135502080755100142">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2135502080755100143">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmin(int,int)%cint" resolveInfo="min" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" resolveInfo="Math" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100144">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100118" resolveInfo="minY" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2135502080755100145">
                    <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="2135502080755100146">
                      <link role="variable" roleId="tp2q.1153944258490" targetNodeId="2135502080755100130" resolveInfo="point" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2135502080755100147">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                    </node>
                  </node>
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100148">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100118" resolveInfo="minY" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2135502080755100149">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2135502080755100150">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2135502080755100151">
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" resolveInfo="Math" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmax(int,int)%cint" resolveInfo="max" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100152">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100122" resolveInfo="maxX" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2135502080755100153">
                    <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="2135502080755100154">
                      <link role="variable" roleId="tp2q.1153944258490" targetNodeId="2135502080755100130" resolveInfo="point" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2135502080755100155">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                    </node>
                  </node>
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100156">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100122" resolveInfo="maxX" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2135502080755100157">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2135502080755100158">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2135502080755100159">
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" resolveInfo="Math" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmax(int,int)%cint" resolveInfo="max" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100160">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100126" resolveInfo="maxY" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2135502080755100161">
                    <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="2135502080755100162">
                      <link role="variable" roleId="tp2q.1153944258490" targetNodeId="2135502080755100130" resolveInfo="point" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="2135502080755100163">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                    </node>
                  </node>
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100164">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100126" resolveInfo="maxY" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755100165">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2135502080755100166">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2135502080755100167">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221520" resolveInfo="Rectangle" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100168">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100114" resolveInfo="minX" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100169">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100118" resolveInfo="minY" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="2135502080755100170">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100171">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100114" resolveInfo="minX" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100172">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100122" resolveInfo="maxX" />
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="2135502080755100173">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100174">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100118" resolveInfo="minY" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755100175">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755100126" resolveInfo="maxY" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755100176">
        <property name="name" nameId="tpck.1169194664001" value="points" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="2135502080755100177">
          <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2135502080755100178">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1705599667576531104">
      <property name="name" nameId="tpck.1169194664001" value="onBorder" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1705599667576531105" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1705599667576531106" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531107">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1705599667576531108">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1705599667576531109">
            <property name="name" nameId="tpck.1169194664001" value="res" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1705599667576531110" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1705599667576531111">
              <property name="value" nameId="tpee.1068580123138" value="false" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576531112">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.OrAssignmentExpression" typeId="tpee.7024111702304501416" id="1705599667576531113">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1705599667576531114">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576531115">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099937" resolveInfo="insideClosedSegment" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2135502080755099904" resolveInfo="Util1D" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531116">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531117">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531118">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1705599667576531119">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531120">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531121">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531122">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221539" resolveInfo="height" />
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531123">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531124">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531125">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
                    </node>
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531126">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531127">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531222" resolveInfo="p" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531128">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576531129">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531130">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531131">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531222" resolveInfo="p" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531132">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531133">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531134">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531135">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
                  </node>
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531136">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531109" resolveInfo="res" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576531137">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.OrAssignmentExpression" typeId="tpee.7024111702304501416" id="1705599667576531138">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1705599667576531139">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576531140">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099937" resolveInfo="insideClosedSegment" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2135502080755099904" resolveInfo="Util1D" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531141">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531142">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531143">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1705599667576531144">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531145">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531146">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531147">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221539" resolveInfo="height" />
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531148">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531149">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531150">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
                    </node>
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531151">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531152">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531222" resolveInfo="p" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531153">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576531154">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531155">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531156">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531222" resolveInfo="p" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531157">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1705599667576531158">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531159">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531160">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531161">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221533" resolveInfo="width" />
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531162">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531163">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531164">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531165">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531109" resolveInfo="res" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576531166">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.OrAssignmentExpression" typeId="tpee.7024111702304501416" id="1705599667576531167">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1705599667576531168">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576531169">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099937" resolveInfo="insideClosedSegment" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2135502080755099904" resolveInfo="Util1D" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531170">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531171">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531172">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1705599667576531173">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531174">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531175">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531176">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221533" resolveInfo="width" />
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531177">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531178">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531179">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
                    </node>
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531180">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531181">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531222" resolveInfo="p" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531182">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576531183">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531184">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531185">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531222" resolveInfo="p" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531186">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531187">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531188">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531189">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
                  </node>
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531190">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531109" resolveInfo="res" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576531191">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.OrAssignmentExpression" typeId="tpee.7024111702304501416" id="1705599667576531192">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1705599667576531193">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576531194">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099937" resolveInfo="insideClosedSegment" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2135502080755099904" resolveInfo="Util1D" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531195">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531196">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531197">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1705599667576531198">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531199">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531200">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531201">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221533" resolveInfo="width" />
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531202">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531203">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531204">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
                    </node>
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531205">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531206">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531222" resolveInfo="p" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531207">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576531208">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531209">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531210">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531222" resolveInfo="p" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531211">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1705599667576531212">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531213">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531214">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531215">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221539" resolveInfo="height" />
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531216">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531217">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531224" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531218">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531219">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531109" resolveInfo="res" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531220">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531221">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531109" resolveInfo="res" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531222">
        <property name="name" nameId="tpck.1169194664001" value="p" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531223">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531224">
        <property name="name" nameId="tpck.1169194664001" value="rect" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531225">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221518" resolveInfo="Rectangle" />
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1705599667576531645">
      <property name="name" nameId="tpck.1169194664001" value="intersects" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1705599667576531646" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1705599667576531647" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531648">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1705599667576531649">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1705599667576531650">
            <property name="name" nameId="tpck.1169194664001" value="prev" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531651">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1705599667576531652" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="1705599667576531653">
          <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="1705599667576531654">
            <property name="name" nameId="tpck.1169194664001" value="cur" />
          </node>
          <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531655">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531678" resolveInfo="polyline" />
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531656">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576531657">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531658">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531659">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1705599667576531660">
                    <property name="value" nameId="tpee.1068580123138" value="true" />
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1705599667576531661">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531662">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531663">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531676" resolveInfo="rect" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1705599667576531664">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221978" resolveInfo="intersectsSegment" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531665">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531650" resolveInfo="prev" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1705599667576531666">
                      <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1705599667576531654" resolveInfo="cur" />
                    </node>
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="1705599667576531667">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531668">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531650" resolveInfo="prev" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1705599667576531669" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576531670">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1705599667576531671">
                <node role="rValue" roleId="tpee.1068498886297" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1705599667576531672">
                  <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1705599667576531654" resolveInfo="cur" />
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531673">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531650" resolveInfo="prev" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531674">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1705599667576531675">
            <property name="value" nameId="tpee.1068580123138" value="false" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531676">
        <property name="name" nameId="tpck.1169194664001" value="rect" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531677">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221518" resolveInfo="Rectangle" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531678">
        <property name="name" nameId="tpck.1169194664001" value="polyline" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="1705599667576531679">
          <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531680">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
          </node>
        </node>
      </node>
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="m373.ClassifierDocComment" typeId="m373.2068944020170241612" id="1705599667576612229">
      <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="1705599667576612230">
        <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="1705599667576612231">
          <property name="text" nameId="m373.8970989240999019144" value="Contains utility methods for integer two-dimensional geometry." />
        </node>
      </node>
    </node>
  </root>
  <root id="1966465523159400126">
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1966465523159400132">
      <property name="name" nameId="tpck.1169194664001" value="refinePolyline" />
      <node role="returnType" roleId="tpee.1068580123133" type="tp2q.ListType" typeId="tp2q.1151688443754" id="1966465523159400136">
        <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1966465523159400138">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1966465523159400134" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1966465523159400135">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1966465523159400143">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1966465523159400144">
            <property name="name" nameId="tpck.1169194664001" value="refined" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="1966465523159400145">
              <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1966465523159400147">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1966465523159400149">
              <node role="creator" roleId="tpee.1145553007750" type="tp2q.LinkedListCreator" typeId="tp2q.1227008614712" id="1966465523159400150">
                <node role="elementType" roleId="tp2q.1237721435807" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1966465523159400151">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1966465523159400159">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1966465523159400160">
            <property name="name" nameId="tpck.1169194664001" value="prev" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1966465523159400161">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1966465523159400185">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1966465523159400184">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400139" resolveInfo="polyline" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetFirstOperation" typeId="tp2q.1165525191778" id="1966465523159400189" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1966465523159400165">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1966465523159400166">
            <property name="name" nameId="tpck.1169194664001" value="prevVer" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1966465523159400167" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1966465523159400169">
              <property name="value" nameId="tpee.1068580123138" value="false" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1966465523159400241">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1966465523159400242">
            <property name="name" nameId="tpck.1169194664001" value="firstSeg" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1966465523159400243" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1966465523159400245">
              <property name="value" nameId="tpee.1068580123138" value="true" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1966465523159400219">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1966465523159400221">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400220">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400144" resolveInfo="refined" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddLastElementOperation" typeId="tp2q.1227022179634" id="1966465523159400324">
              <node role="argument" roleId="tp2q.1227022698412" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400325">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400160" resolveInfo="prev" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="1966465523159400171">
          <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="1966465523159400172">
            <property name="name" nameId="tpck.1169194664001" value="next" />
          </node>
          <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1966465523159400175">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400139" resolveInfo="polyline" />
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1966465523159400174">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1966465523159400190">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1966465523159400192">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ContinueStatement" typeId="tpee.1082113931046" id="1966465523159400203" />
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1966465523159400229">
                <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1966465523159400228">
                  <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1966465523159400172" resolveInfo="next" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1966465523159400233">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1097352957737593660" resolveInfo="equals" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400234">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400160" resolveInfo="prev" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1966465523159400276">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1966465523159400277">
                <property name="name" nameId="tpck.1169194664001" value="nextVer" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1966465523159400278" />
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1966465523159400286">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1966465523159400290">
                    <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1966465523159400289">
                      <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1966465523159400172" resolveInfo="next" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1966465523159400294">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1966465523159400281">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400280">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400160" resolveInfo="prev" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1966465523159400285">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1966465523159400235">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1966465523159400236">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1966465523159400307">
                  <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1966465523159400308">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1966465523159400316">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1966465523159400318">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400317">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400144" resolveInfo="refined" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddLastElementOperation" typeId="tp2q.1227022179634" id="1966465523159400322">
                          <node role="argument" roleId="tp2q.1227022698412" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400326">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400160" resolveInfo="prev" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="1966465523159400312">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400315">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400166" resolveInfo="prevVer" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400311">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400277" resolveInfo="nextVer" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotExpression" typeId="tpee.1081516740877" id="1966465523159400305">
                <node role="expression" roleId="tpee.1081516765348" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400306">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400242" resolveInfo="firstSeg" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1966465523159400254">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1966465523159400256">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1966465523159400259">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400255">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400242" resolveInfo="firstSeg" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1966465523159400248">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1966465523159400250">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400249">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400166" resolveInfo="prevVer" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400295">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400277" resolveInfo="nextVer" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1966465523159400297">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1966465523159400299">
                <node role="rValue" roleId="tpee.1068498886297" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1966465523159400304">
                  <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1966465523159400172" resolveInfo="next" />
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400303">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400160" resolveInfo="prev" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1966465523159400328">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1966465523159400330">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400329">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400144" resolveInfo="refined" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddLastElementOperation" typeId="tp2q.1227022179634" id="1966465523159400334">
              <node role="argument" roleId="tp2q.1227022698412" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400336">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400160" resolveInfo="prev" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1966465523159400153">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1966465523159400155">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1966465523159400144" resolveInfo="refined" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1966465523159400139">
        <property name="name" nameId="tpck.1169194664001" value="polyline" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="1966465523159400140">
          <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1966465523159400142">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
          </node>
        </node>
      </node>
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="m373.MethodDocComment" typeId="m373.5349172909345532724" id="1705599667576612248">
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="1705599667576612249">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="1705599667576612254">
            <property name="text" nameId="m373.8970989240999019144" value="Removes some points from sequence in such a way that segments formed from successive" />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="1705599667576612255">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="1705599667576612256">
            <property name="text" nameId="m373.8970989240999019144" value="points of refined sequence alternate horisontal and vertical direction." />
          </node>
        </node>
        <node role="param" roleId="m373.8465538089690917625" type="m373.ParameterBlockDocTag" typeId="m373.8465538089690881930" id="1705599667576612251">
          <property name="text" nameId="m373.8465538089690881934" value="sequence of points" />
          <node role="parameter" roleId="m373.6832197706140518123" type="m373.DocMethodParameterReference" typeId="m373.6832197706140518104" id="1705599667576612252">
            <link role="param" roleId="m373.6832197706140518108" targetNodeId="1966465523159400139" resolveInfo="polyline" />
          </node>
        </node>
        <node role="return" roleId="m373.5858074156537516440" type="m373.ReturnBlockDocTag" typeId="m373.5858074156537516430" id="1705599667576612253">
          <property name="text" nameId="m373.5858074156537516431" value="refined sequence of points" />
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1966465523159400127" />
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1705599667576531228">
      <property name="name" nameId="tpck.1169194664001" value="findOnBorder" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531229">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1705599667576531230" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531231">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576531232">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576531233">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531234">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531235">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531356" resolveInfo="p2" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531236">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531237">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531238">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531354" resolveInfo="p1" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531239">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531240">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576531241">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576531242">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099937" resolveInfo="insideClosedSegment" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2135502080755099904" resolveInfo="Util1D" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531243">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531244">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531354" resolveInfo="p1" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531245">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531246">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531247">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531356" resolveInfo="p2" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531248">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531249">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531250">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531352" resolveInfo="rect" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531251">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531252">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531253">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1705599667576531254">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1705599667576531255">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531256">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531257">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531354" resolveInfo="p1" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531258">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                        </node>
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531259">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531260">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531352" resolveInfo="rect" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531261">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576531262">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531263">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531264">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1705599667576531265">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1705599667576531266">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531267">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531268">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531354" resolveInfo="p1" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531269">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                        </node>
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531274">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531275">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531352" resolveInfo="rect" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1705599667576612271">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223562" resolveInfo="maxY" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576531277">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099937" resolveInfo="insideClosedSegment" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2135502080755099904" resolveInfo="Util1D" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531278">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531279">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531354" resolveInfo="p1" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531280">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531281">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531282">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531356" resolveInfo="p2" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531283">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576612266">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576612258">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531352" resolveInfo="rect" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1705599667576612270">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223562" resolveInfo="maxY" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576531291">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531292">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576531293">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576531294">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099937" resolveInfo="insideClosedSegment" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2135502080755099904" resolveInfo="Util1D" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531295">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531296">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531354" resolveInfo="p1" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531297">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531298">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531299">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531356" resolveInfo="p2" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531300">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531301">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531302">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531352" resolveInfo="rect" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531303">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531304">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531305">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1705599667576531306">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1705599667576531307">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531308">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531309">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531352" resolveInfo="rect" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531310">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
                        </node>
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531311">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531312">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531354" resolveInfo="p1" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531313">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576531314">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531315">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531316">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1705599667576531317">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1705599667576531318">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576612281">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576612280">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531352" resolveInfo="rect" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1705599667576612285">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223551" resolveInfo="maxX" />
                        </node>
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531326">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531327">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531354" resolveInfo="p1" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531328">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576531329">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099937" resolveInfo="insideClosedSegment" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2135502080755099904" resolveInfo="Util1D" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531330">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531331">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531354" resolveInfo="p1" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531332">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531333">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531334">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531356" resolveInfo="p2" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531335">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576612276">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576612277">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531352" resolveInfo="rect" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1705599667576612278">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858223551" resolveInfo="maxX" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576531343">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531344">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531345">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531356" resolveInfo="p2" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531346">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531347">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531348">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531354" resolveInfo="p1" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531349">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531350">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1705599667576531351" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531352">
        <property name="name" nameId="tpck.1169194664001" value="rect" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531353">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221518" resolveInfo="Rectangle" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531354">
        <property name="name" nameId="tpck.1169194664001" value="p1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531355">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531356">
        <property name="name" nameId="tpck.1169194664001" value="p2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531357">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1705599667576531360">
      <property name="name" nameId="tpck.1169194664001" value="moveToBorder" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531361">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1705599667576531362" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531363">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1705599667576531364">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1705599667576531365">
            <property name="name" nameId="tpck.1169194664001" value="rectPoints" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="1705599667576531366">
              <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531367">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1705599667576531368">
              <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="1705599667576531369">
                <node role="elementType" roleId="tp2q.1237721435807" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531370">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1705599667576531371">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1705599667576531372">
            <property name="name" nameId="tpck.1169194664001" value="ver" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1705599667576531373" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576531374">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531375">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531376">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531522" resolveInfo="e" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531377">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531378">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531379">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531520" resolveInfo="b" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531380">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576531381">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531382">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531383">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531365" resolveInfo="rectPoints" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="1705599667576531384">
              <node role="argument" roleId="tp2q.1160612519549" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1705599667576531385">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1705599667576531386">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531387">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531388">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531518" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531389">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531390">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531391">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531518" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531392">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576531393">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531394">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531395">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531365" resolveInfo="rectPoints" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="1705599667576531396">
              <node role="argument" roleId="tp2q.1160612519549" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1705599667576531397">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1705599667576531398">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531399">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531400">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531518" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531401">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1705599667576531402">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531403">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531404">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531518" resolveInfo="rect" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531405">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221539" resolveInfo="height" />
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531406">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531407">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531518" resolveInfo="rect" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531408">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576531409">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531410">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531411">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531365" resolveInfo="rectPoints" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="1705599667576531412">
              <node role="argument" roleId="tp2q.1160612519549" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1705599667576531413">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1705599667576531414">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1705599667576531415">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531416">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531417">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531518" resolveInfo="rect" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531418">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221533" resolveInfo="width" />
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531419">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531420">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531518" resolveInfo="rect" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531421">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531422">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531423">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531518" resolveInfo="rect" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531424">
                      <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576531425">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531426">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531427">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531365" resolveInfo="rectPoints" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="1705599667576531428">
              <node role="argument" roleId="tp2q.1160612519549" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1705599667576531429">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1705599667576531430">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221483" resolveInfo="Point" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1705599667576531431">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531432">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531433">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531518" resolveInfo="rect" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531434">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221533" resolveInfo="width" />
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531435">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531436">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531518" resolveInfo="rect" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531437">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221524" resolveInfo="x" />
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1705599667576531438">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531439">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531440">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531518" resolveInfo="rect" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531441">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221539" resolveInfo="height" />
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531442">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531443">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531518" resolveInfo="rect" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531444">
                        <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221529" resolveInfo="y" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="1705599667576531445">
          <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="1705599667576531446">
            <property name="name" nameId="tpck.1169194664001" value="p" />
          </node>
          <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531447">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531365" resolveInfo="rectPoints" />
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531448">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576531449">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531450">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531372" resolveInfo="ver" />
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531451">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576531452">
                  <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1705599667576531453">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="1705599667576531454">
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1705599667576531455">
                        <property name="value" nameId="tpee.1068580320021" value="0" />
                      </node>
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MulExpression" typeId="tpee.1092119917967" id="1705599667576531456">
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1705599667576531457">
                          <node role="expression" roleId="tpee.1079359253376" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="1705599667576531458">
                            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531459">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531460">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531520" resolveInfo="b" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531461">
                                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                              </node>
                            </node>
                            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531462">
                              <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1705599667576531463">
                                <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1705599667576531446" resolveInfo="p" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531464">
                                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1705599667576531465">
                          <node role="expression" roleId="tpee.1079359253376" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="1705599667576531466">
                            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531467">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531468">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531522" resolveInfo="e" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531469">
                                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                              </node>
                            </node>
                            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531470">
                              <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1705599667576531471">
                                <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1705599667576531446" resolveInfo="p" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531472">
                                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576531473">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531474">
                        <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1705599667576531475">
                          <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1705599667576531446" resolveInfo="p" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531476">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                        </node>
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531477">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531478">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531520" resolveInfo="b" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531479">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531480">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531481">
                      <node role="expression" roleId="tpee.1068581517676" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1705599667576531482">
                        <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1705599667576531446" resolveInfo="p" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="1705599667576531483">
                <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531484">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576531485">
                    <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1705599667576531486">
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="1705599667576531487">
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1705599667576531488">
                          <property name="value" nameId="tpee.1068580320021" value="0" />
                        </node>
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MulExpression" typeId="tpee.1092119917967" id="1705599667576531489">
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1705599667576531490">
                            <node role="expression" roleId="tpee.1079359253376" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="1705599667576531491">
                              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531492">
                                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531493">
                                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531520" resolveInfo="b" />
                                </node>
                                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531494">
                                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                                </node>
                              </node>
                              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531495">
                                <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1705599667576531496">
                                  <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1705599667576531446" resolveInfo="p" />
                                </node>
                                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531497">
                                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1705599667576531498">
                            <node role="expression" roleId="tpee.1079359253376" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="1705599667576531499">
                              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531500">
                                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531501">
                                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531522" resolveInfo="e" />
                                </node>
                                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531502">
                                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                                </node>
                              </node>
                              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531503">
                                <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1705599667576531504">
                                  <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1705599667576531446" resolveInfo="p" />
                                </node>
                                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531505">
                                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576531506">
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531507">
                          <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1705599667576531508">
                            <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1705599667576531446" resolveInfo="p" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531509">
                            <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                          </node>
                        </node>
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531510">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531511">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531520" resolveInfo="b" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531512">
                            <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531513">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531514">
                        <node role="expression" roleId="tpee.1068581517676" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1705599667576531515">
                          <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1705599667576531446" resolveInfo="p" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531516">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1705599667576531517" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531518">
        <property name="name" nameId="tpck.1169194664001" value="rect" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531519">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221518" resolveInfo="Rectangle" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531520">
        <property name="name" nameId="tpck.1169194664001" value="b" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531521">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531522">
        <property name="name" nameId="tpck.1169194664001" value="e" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531523">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1705599667576531588">
      <property name="name" nameId="tpck.1169194664001" value="getDirection" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1705599667576531589" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531590">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1705599667576531591">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1705599667576531592">
            <property name="name" nameId="tpck.1169194664001" value="dx" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1705599667576531593" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576531594">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1705599667576531548" resolveInfo="getDirection" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2135502080755099904" resolveInfo="Util1D" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531595">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531596">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531615" resolveInfo="begin" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531597">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531598">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531599">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531617" resolveInfo="end" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531600">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1705599667576531601">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1705599667576531602">
            <property name="name" nameId="tpck.1169194664001" value="dy" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1705599667576531603" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576531604">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1705599667576531548" resolveInfo="getDirection" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2135502080755099904" resolveInfo="Util1D" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531605">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531606">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531615" resolveInfo="begin" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531607">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576531608">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531609">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531617" resolveInfo="end" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576531610">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531611">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576531612">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099843" resolveInfo="getByShifts" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2135502080755099705" resolveInfo="Direction2D" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531613">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531592" resolveInfo="dx" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531614">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531602" resolveInfo="dy" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531615">
        <property name="name" nameId="tpck.1169194664001" value="begin" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531616">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531617">
        <property name="name" nameId="tpck.1169194664001" value="end" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531618">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576531619">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2135502080755099705" resolveInfo="Direction2D" />
      </node>
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="m373.ClassifierDocComment" typeId="m373.2068944020170241612" id="1705599667576612232">
      <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="1705599667576612233">
        <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="1705599667576612235">
          <property name="text" nameId="m373.8970989240999019144" value="Contains utility methods for integer two-dimensional geometry in assumption " />
        </node>
      </node>
      <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="1705599667576612242">
        <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="1705599667576612243">
          <property name="text" nameId="m373.8970989240999019144" value="that segments can be horizontal or vertical only." />
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1705599667576621618">
      <property name="name" nameId="tpck.1169194664001" value="intersects" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576621619">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1705599667576621620" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576621621">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="1705599667576621622">
          <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="1705599667576621623">
            <property name="text" nameId="tpee.6329021646629104958" value="intersects vertical and horizontal segments" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1705599667576621624">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1705599667576621625">
            <property name="name" nameId="tpck.1169194664001" value="ver1" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1705599667576621626" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576621627">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576621628">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576621629">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576621630">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621720" resolveInfo="q1" />
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576621631">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576621632">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621718" resolveInfo="p1" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576621633">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1705599667576621634">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1705599667576621635">
            <property name="name" nameId="tpck.1169194664001" value="ver2" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1705599667576621636" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576621637">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576621638">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576621639">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621724" resolveInfo="q2" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576621640">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576621641">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576621642">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621722" resolveInfo="p2" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576621643">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576621644">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576621645">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576630782">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630783">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576630792">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630843">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621722" resolveInfo="p2" />
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="1705599667576630786">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1705599667576630604" resolveInfo="inside" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630787">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621718" resolveInfo="p1" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630833">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621720" resolveInfo="q1" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630835">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621722" resolveInfo="p2" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576630795">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630796">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576630797">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630844">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621724" resolveInfo="q2" />
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="1705599667576630799">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1705599667576630604" resolveInfo="inside" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630836">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621718" resolveInfo="p1" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630837">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621720" resolveInfo="q1" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630802">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621724" resolveInfo="q2" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576630803">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630804">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576630805">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630806">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621718" resolveInfo="p1" />
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="1705599667576630807">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1705599667576630604" resolveInfo="inside" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630822">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621722" resolveInfo="p2" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630838">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621724" resolveInfo="q2" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630841">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621718" resolveInfo="p1" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576630811">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630812">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576630813">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630845">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621720" resolveInfo="q1" />
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="1705599667576630815">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1705599667576630604" resolveInfo="inside" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630839">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621722" resolveInfo="p2" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630840">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621724" resolveInfo="q2" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630842">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621720" resolveInfo="q1" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576621646">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1705599667576621647" />
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576621648">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576621649">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621635" resolveInfo="ver2" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576621650">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621625" resolveInfo="ver1" />
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="1705599667576630534">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630535">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1705599667576630537">
                <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1705599667576630538">
                  <property name="name" nameId="tpck.1169194664001" value="res" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576630539">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
                  </node>
                  <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1705599667576630540">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1705599667576630541">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2301768597858221427" resolveInfo="Point" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576630542">
                <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630543">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576630544">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1705599667576630545">
                      <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630546">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630547">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621718" resolveInfo="p1" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630548">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                        </node>
                      </node>
                      <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630549">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576630550">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630538" resolveInfo="res" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630551">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="condition" roleId="tpee.1068580123160" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576630552">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621625" resolveInfo="ver1" />
                </node>
                <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="1705599667576630553">
                  <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630554">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576630555">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1705599667576630556">
                        <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630557">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630558">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621722" resolveInfo="p2" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630559">
                            <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                          </node>
                        </node>
                        <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630560">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576630561">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630538" resolveInfo="res" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630562">
                            <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576630563">
                <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630564">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576630565">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1705599667576630566">
                      <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630567">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630568">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621718" resolveInfo="p1" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630569">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                        </node>
                      </node>
                      <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630570">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576630571">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630538" resolveInfo="res" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630572">
                          <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="condition" roleId="tpee.1068580123160" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576630573">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621635" resolveInfo="ver2" />
                </node>
                <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="1705599667576630574">
                  <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630575">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576630576">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1705599667576630577">
                        <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630578">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630579">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621722" resolveInfo="p2" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630580">
                            <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                          </node>
                        </node>
                        <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630581">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576630582">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630538" resolveInfo="res" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630583">
                            <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576630584">
                <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630585">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576630586">
                    <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1705599667576630587" />
                  </node>
                </node>
                <node role="condition" roleId="tpee.1068580123160" type="tpee.NotExpression" typeId="tpee.1081516740877" id="1705599667576630588">
                  <node role="expression" roleId="tpee.1081516765348" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="1705599667576630654">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1705599667576630604" resolveInfo="insideGrid" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630591">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621718" resolveInfo="p1" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630592">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621720" resolveInfo="q1" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576656750">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630538" resolveInfo="res" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576630593">
                <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630594">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576630595">
                    <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1705599667576630596" />
                  </node>
                </node>
                <node role="condition" roleId="tpee.1068580123160" type="tpee.NotExpression" typeId="tpee.1081516740877" id="1705599667576630597">
                  <node role="expression" roleId="tpee.1081516765348" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="1705599667576630655">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1705599667576630604" resolveInfo="insideGrid" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630600">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621722" resolveInfo="p2" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630601">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576621724" resolveInfo="q2" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576656748">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630538" resolveInfo="res" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576630602">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576630603">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630538" resolveInfo="res" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576621718">
        <property name="name" nameId="tpck.1169194664001" value="p1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576621719">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576621720">
        <property name="name" nameId="tpck.1169194664001" value="q1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576621721">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576621722">
        <property name="name" nameId="tpck.1169194664001" value="p2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576621723">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576621724">
        <property name="name" nameId="tpck.1169194664001" value="q2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576621725">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="m373.MethodDocComment" typeId="m373.5349172909345532724" id="1705599667576630518">
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="1705599667576630519">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="1705599667576630520">
            <property name="text" nameId="m373.8970989240999019144" value="Intersects two segments. If they have no intersection, returns null." />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="1705599667576630530">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="1705599667576630531">
            <property name="text" nameId="m373.8970989240999019144" value="If they shares a subsegment, returns one of the segment's ends, lying " />
          </node>
        </node>
        <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="1705599667576630532">
          <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="1705599667576630533">
            <property name="text" nameId="m373.8970989240999019144" value="on that subsegment." />
          </node>
        </node>
        <node role="param" roleId="m373.8465538089690917625" type="m373.ParameterBlockDocTag" typeId="m373.8465538089690881930" id="1705599667576630521">
          <property name="text" nameId="m373.8465538089690881934" value="one end of first segment" />
          <node role="parameter" roleId="m373.6832197706140518123" type="m373.DocMethodParameterReference" typeId="m373.6832197706140518104" id="1705599667576630522">
            <link role="param" roleId="m373.6832197706140518108" targetNodeId="1705599667576621718" resolveInfo="p1" />
          </node>
        </node>
        <node role="param" roleId="m373.8465538089690917625" type="m373.ParameterBlockDocTag" typeId="m373.8465538089690881930" id="1705599667576630523">
          <property name="text" nameId="m373.8465538089690881934" value="another end of first segment" />
          <node role="parameter" roleId="m373.6832197706140518123" type="m373.DocMethodParameterReference" typeId="m373.6832197706140518104" id="1705599667576630524">
            <link role="param" roleId="m373.6832197706140518108" targetNodeId="1705599667576621720" resolveInfo="q1" />
          </node>
        </node>
        <node role="param" roleId="m373.8465538089690917625" type="m373.ParameterBlockDocTag" typeId="m373.8465538089690881930" id="1705599667576630525">
          <property name="text" nameId="m373.8465538089690881934" value="one end of second segment" />
          <node role="parameter" roleId="m373.6832197706140518123" type="m373.DocMethodParameterReference" typeId="m373.6832197706140518104" id="1705599667576630526">
            <link role="param" roleId="m373.6832197706140518108" targetNodeId="1705599667576621722" resolveInfo="p2" />
          </node>
        </node>
        <node role="param" roleId="m373.8465538089690917625" type="m373.ParameterBlockDocTag" typeId="m373.8465538089690881930" id="1705599667576630527">
          <property name="text" nameId="m373.8465538089690881934" value="another end of second segment" />
          <node role="parameter" roleId="m373.6832197706140518123" type="m373.DocMethodParameterReference" typeId="m373.6832197706140518104" id="1705599667576630528">
            <link role="param" roleId="m373.6832197706140518108" targetNodeId="1705599667576621724" resolveInfo="q2" />
          </node>
        </node>
        <node role="return" roleId="m373.5858074156537516440" type="m373.ReturnBlockDocTag" typeId="m373.5858074156537516430" id="1705599667576630529">
          <property name="text" nameId="m373.5858074156537516431" value="intersection of segments" />
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1705599667576630604">
      <property name="name" nameId="tpck.1169194664001" value="inside" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1705599667576630605" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1705599667576630606" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576630609">
        <property name="name" nameId="tpck.1169194664001" value="b" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576630610">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576630611">
        <property name="name" nameId="tpck.1169194664001" value="e" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576630612">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576630825">
        <property name="name" nameId="tpck.1169194664001" value="mid" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1705599667576630827">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2301768597858221425" resolveInfo="Point" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630613">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576630657">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630658">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576630676">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576630681">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099937" resolveInfo="insideClosedSegment" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2135502080755099904" resolveInfo="Util1D" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630683">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630682">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630609" resolveInfo="p" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630687">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630690">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630689">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630611" resolveInfo="q" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630694">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630701">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630830">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630825" resolveInfo="mid" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630705">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1705599667576630745">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576630754">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630758">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630757">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630611" resolveInfo="q" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630762">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630749">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630828">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630825" resolveInfo="mid" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630753">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576630667">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630662">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630661">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630609" resolveInfo="p1" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630666">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630671">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630670">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630611" resolveInfo="q" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630675">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576630707">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576630708">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576630727">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576630728">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2135502080755099904" resolveInfo="Util1D" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099937" resolveInfo="insideClosedSegment" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630729">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630730">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630609" resolveInfo="p" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630742">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630732">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630733">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630611" resolveInfo="q" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630743">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630735">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630831">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630825" resolveInfo="mid" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630744">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221431" resolveInfo="x" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1705599667576630763">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576630772">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630776">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630775">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630611" resolveInfo="q" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630780">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630767">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630829">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630825" resolveInfo="mid" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630771">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1705599667576630718">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630712">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630711">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630609" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630717">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1705599667576630722">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576630721">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576630611" resolveInfo="q" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1705599667576630726">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="2301768597858221436" resolveInfo="y" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576630739">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1705599667576630741">
            <property name="value" nameId="tpee.1068580123138" value="false" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="2135502080755099705">
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="2135502080755099706">
      <property name="name" nameId="tpck.1169194664001" value="myDx" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="2135502080755099707" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099708" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="2135502080755099709">
      <property name="name" nameId="tpck.1169194664001" value="myDy" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="2135502080755099710" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099711" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2135502080755099712">
      <property name="name" nameId="tpck.1169194664001" value="turnClockwise" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2135502080755099713">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2135502080755099705" resolveInfo="Direction2D" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099714" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099715">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2135502080755099716">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2135502080755099717">
            <property name="name" nameId="tpck.1169194664001" value="dir" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099718" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="2135502080755099719">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099720">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099734" resolveInfo="angle" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="2135502080755099721">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Enum%dordinal()%cint" resolveInfo="ordinal" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2135502080755099722">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099723">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2135502080755099724">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.MinusAssignmentExpression" typeId="tpee.1215695201514" id="2135502080755099725">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099726">
                  <property name="value" nameId="tpee.1068580320021" value="4" />
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755099727">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099717" resolveInfo="dir" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.GreaterThanExpression" typeId="tpee.1081506762703" id="2135502080755099728">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099729">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755099730">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099717" resolveInfo="dir" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099731">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2135502080755099732">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099833" resolveInfo="get" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755099733">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099717" resolveInfo="dir" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099734">
        <property name="name" nameId="tpck.1169194664001" value="angle" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099735" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2135502080755099736">
      <property name="name" nameId="tpck.1169194664001" value="opposite" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2135502080755099737">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2135502080755099705" resolveInfo="Direction2D" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099738" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099739">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099740">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="2135502080755099741">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099712" resolveInfo="turnClockwise" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099742">
              <property name="value" nameId="tpee.1068580320021" value="2" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2135502080755099743">
      <property name="name" nameId="tpck.1169194664001" value="getTurn" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099744" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099745" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099746">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2135502080755099747">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2135502080755099748">
            <property name="name" nameId="tpck.1169194664001" value="turn" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099749" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="2135502080755099750">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2135502080755099751">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099752">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099778" resolveInfo="dir" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2135502080755099753">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Enum%dordinal()%cint" resolveInfo="ordinal" />
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="2135502080755099754">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Enum%dordinal()%cint" resolveInfo="ordinal" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2135502080755099755">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099756">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099757">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099758">
                <property name="value" nameId="tpee.1068580320021" value="-2" />
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="2135502080755099759">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099760">
              <property name="value" nameId="tpee.1068580320021" value="2" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755099761">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099748" resolveInfo="turn" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2135502080755099762">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099763">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099764">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099765">
                <property name="value" nameId="tpee.1068580320021" value="-1" />
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="2135502080755099766">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755099767">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099748" resolveInfo="turn" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099768">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2135502080755099769">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099770">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099771">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099772">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="2135502080755099773">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755099774">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099748" resolveInfo="turn" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099775">
              <property name="value" nameId="tpee.1068580320021" value="-3" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099776">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755099777">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099748" resolveInfo="turn" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099778">
        <property name="name" nameId="tpck.1169194664001" value="dir" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2135502080755099779">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2135502080755099705" resolveInfo="Direction2D" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2135502080755099780">
      <property name="name" nameId="tpck.1169194664001" value="getClockwiseTurn" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099781" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099782" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099783">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2135502080755099784">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2135502080755099785">
            <property name="name" nameId="tpck.1169194664001" value="turn" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099786" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="2135502080755099787">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="2135502080755099788">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Enum%dordinal()%cint" resolveInfo="ordinal" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2135502080755099789">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099790">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099803" resolveInfo="dir" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2135502080755099791">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Enum%dordinal()%cint" resolveInfo="ordinal" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2135502080755099792">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099793">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2135502080755099794">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusAssignmentExpression" typeId="tpee.1215695189714" id="2135502080755099795">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099796">
                  <property name="value" nameId="tpee.1068580320021" value="4" />
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755099797">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099785" resolveInfo="turn" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="2135502080755099798">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099799">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755099800">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099785" resolveInfo="turn" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099801">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755099802">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099785" resolveInfo="turn" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099803">
        <property name="name" nameId="tpck.1169194664001" value="dir" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2135502080755099804">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2135502080755099705" resolveInfo="Direction2D" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2135502080755099805">
      <property name="name" nameId="tpck.1169194664001" value="isHorizontal" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2135502080755099806" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099807" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099808">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099809">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="2135502080755099810">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099811">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2135502080755099812">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099706" resolveInfo="myDx" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2135502080755099813">
      <property name="name" nameId="tpck.1169194664001" value="isVertical" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2135502080755099814" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099815" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099816">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099817">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="2135502080755099818">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2135502080755099819">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099709" resolveInfo="myDy" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099820">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2135502080755099821">
      <property name="name" nameId="tpck.1169194664001" value="dx" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099822" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099823" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099824">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099825">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2135502080755099826">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099706" resolveInfo="myDx" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2135502080755099827">
      <property name="name" nameId="tpck.1169194664001" value="dy" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099828" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099829" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099830">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099831">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2135502080755099832">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099709" resolveInfo="myDy" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2135502080755099833">
      <property name="name" nameId="tpck.1169194664001" value="get" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2135502080755099834">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2135502080755099705" resolveInfo="Direction2D" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099835" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099836">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099837">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="2135502080755099838">
            <node role="index" roleId="tpee.1173175577737" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099839">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099841" resolveInfo="intDirection" />
            </node>
            <node role="array" roleId="tpee.1173175590490" type="tpee.EnumValuesExpression" typeId="tpee.1224573963862" id="2135502080755099840">
              <link role="enumClass" roleId="tpee.1224573974191" targetNodeId="2135502080755099705" resolveInfo="Direction2D" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099841">
        <property name="name" nameId="tpck.1169194664001" value="intDirection" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099842" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2135502080755099843">
      <property name="name" nameId="tpck.1169194664001" value="getByShifts" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2135502080755099844">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2135502080755099705" resolveInfo="Direction2D" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099845" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099846">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="2135502080755099847">
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2135502080755099848">
            <property name="name" nameId="tpck.1169194664001" value="dir" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2135502080755099849">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2135502080755099705" resolveInfo="Direction2D" />
            </node>
          </node>
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.EnumValuesExpression" typeId="tpee.1224573963862" id="2135502080755099850">
            <link role="enumClass" roleId="tpee.1224573974191" targetNodeId="2135502080755099705" resolveInfo="Direction2D" />
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099851">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2135502080755099852">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="2135502080755099853">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="2135502080755099854">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099855">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099871" resolveInfo="dy" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2135502080755099856">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755099857">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099848" resolveInfo="dir" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2135502080755099858">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099827" resolveInfo="dy" />
                    </node>
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="2135502080755099859">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2135502080755099860">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755099861">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099848" resolveInfo="dir" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2135502080755099862">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099821" resolveInfo="dx" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099863">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099869" resolveInfo="dx" />
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099864">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099865">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2135502080755099866">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099848" resolveInfo="dir" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099867">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="2135502080755099868" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099869">
        <property name="name" nameId="tpck.1169194664001" value="dx" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099870" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099871">
        <property name="name" nameId="tpck.1169194664001" value="dy" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099872" />
      </node>
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="2135502080755099873">
      <property name="name" nameId="tpck.1169194664001" value="RIGHT" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099886" resolveInfo="Direction2D" />
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099874">
        <property name="value" nameId="tpee.1068580320021" value="1" />
      </node>
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099875">
        <property name="value" nameId="tpee.1068580320021" value="0" />
      </node>
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="2135502080755099876">
      <property name="name" nameId="tpck.1169194664001" value="DOWN" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099886" resolveInfo="Direction2D" />
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099877">
        <property name="value" nameId="tpee.1068580320021" value="0" />
      </node>
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099878">
        <property name="value" nameId="tpee.1068580320021" value="-1" />
      </node>
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="2135502080755099879">
      <property name="name" nameId="tpck.1169194664001" value="LEFT" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099886" resolveInfo="Direction2D" />
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099880">
        <property name="value" nameId="tpee.1068580320021" value="-1" />
      </node>
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099881">
        <property name="value" nameId="tpee.1068580320021" value="0" />
      </node>
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="2135502080755099882">
      <property name="name" nameId="tpck.1169194664001" value="UP" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099886" resolveInfo="Direction2D" />
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099883">
        <property name="value" nameId="tpee.1068580320021" value="0" />
      </node>
      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2135502080755099884">
        <property name="value" nameId="tpee.1068580320021" value="1" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099885" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="2135502080755099886">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2135502080755099887" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099888" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099889">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2135502080755099890">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2135502080755099891">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099892">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099898" resolveInfo="dx" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2135502080755099893">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099706" resolveInfo="myDx" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2135502080755099894">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2135502080755099895">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099896">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099900" resolveInfo="dy" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="2135502080755099897">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099709" resolveInfo="myDy" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099898">
        <property name="name" nameId="tpck.1169194664001" value="dx" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099899" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099900">
        <property name="name" nameId="tpck.1169194664001" value="dy" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099901" />
      </node>
    </node>
    <node role="classInitializer" roleId="tpee.1221737886778" type="tpee.StaticInitializer" typeId="tpee.1221737317277" id="2135502080755099902">
      <node role="statementList" roleId="tpee.1221737317278" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099903" />
    </node>
  </root>
  <root id="2135502080755099904">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099905" />
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="m373.ClassifierDocComment" typeId="m373.2068944020170241612" id="2135502080755099910">
      <node role="body" roleId="m373.8465538089690331502" type="m373.CommentLine" typeId="m373.8465538089690331500" id="2135502080755099911">
        <node role="part" roleId="m373.8970989240999019149" type="m373.TextCommentLinePart" typeId="m373.8970989240999019143" id="2135502080755099912">
          <property name="text" nameId="m373.8970989240999019144" value="Contains utility methods for integer one-dimensional geometry." />
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2135502080755099913">
      <property name="name" nameId="tpck.1169194664001" value="insideOpenSegment" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2135502080755099914" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099915" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099916">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2135502080755099976">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099977">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755099985">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.AndExpression" typeId="tpee.1080120340718" id="2135502080755099992">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="2135502080755099988">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099987">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099929" resolveInfo="end1" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099991">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099933" resolveInfo="mid" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="2135502080755099996">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099999">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099931" resolveInfo="end2" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099995">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099933" resolveInfo="mid" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="2135502080755099981">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099984">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099931" resolveInfo="end2" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755099980">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099929" resolveInfo="end1" />
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="2135502080755100000">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755100001">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755100002">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.AndExpression" typeId="tpee.1080120340718" id="2135502080755100009">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="2135502080755100013">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755100017">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099929" resolveInfo="end1" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755100012">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099933" resolveInfo="mid" />
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="2135502080755100005">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755100004">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099931" resolveInfo="end2" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755100008">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099933" resolveInfo="mid" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099929">
        <property name="name" nameId="tpck.1169194664001" value="end1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099930" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099931">
        <property name="name" nameId="tpck.1169194664001" value="end2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099932" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099933">
        <property name="name" nameId="tpck.1169194664001" value="mid" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099934" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2135502080755099937">
      <property name="name" nameId="tpck.1169194664001" value="insideClosedSegment" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2135502080755099938" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2135502080755099939" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2135502080755099940">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2135502080755100018">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.OrExpression" typeId="tpee.1080223426719" id="2135502080755100037">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="2135502080755100041">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755100044">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099957" resolveInfo="mid" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755100040">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099955" resolveInfo="end2" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.OrExpression" typeId="tpee.1080223426719" id="2135502080755100029">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2135502080755100020">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2135502080755099913" resolveInfo="insideOpenSegment" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755100021">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099953" resolveInfo="end1" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755100023">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099955" resolveInfo="end2" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755100025">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099957" resolveInfo="mid" />
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="2135502080755100033">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755100032">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099953" resolveInfo="end1" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2135502080755100036">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2135502080755099957" resolveInfo="mid" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099953">
        <property name="name" nameId="tpck.1169194664001" value="end1" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099954" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099955">
        <property name="name" nameId="tpck.1169194664001" value="end2" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099956" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2135502080755099957">
        <property name="name" nameId="tpck.1169194664001" value="mid" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2135502080755099958" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1705599667576531526">
      <property name="name" nameId="tpck.1169194664001" value="intersects" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1705599667576531527" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1705599667576531528" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531529">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531530">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.GreaterThanOrEqualsExpression" typeId="tpee.1153417849900" id="1705599667576531531">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576531532">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" resolveInfo="Math" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmin(int,int)%cint" resolveInfo="min" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531533">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531540" resolveInfo="maxX" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531534">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531544" resolveInfo="maxY" />
              </node>
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1705599667576531535">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" resolveInfo="Math" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmax(int,int)%cint" resolveInfo="max" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531536">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531538" resolveInfo="minX" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531537">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531542" resolveInfo="minY" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531538">
        <property name="name" nameId="tpck.1169194664001" value="minA" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1705599667576531539" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531540">
        <property name="name" nameId="tpck.1169194664001" value="maxA" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1705599667576531541" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531542">
        <property name="name" nameId="tpck.1169194664001" value="minB" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1705599667576531543" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531544">
        <property name="name" nameId="tpck.1169194664001" value="maxB" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1705599667576531545" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1705599667576531548">
      <property name="name" nameId="tpck.1169194664001" value="getDirection" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1705599667576531549" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1705599667576531550" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531551">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1705599667576531552">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1705599667576531553">
            <property name="name" nameId="tpck.1169194664001" value="direction" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1705599667576531554" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1705599667576531555">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576531556">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531557">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576531558">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1705599667576531559">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1705599667576531560">
                  <property name="value" nameId="tpee.1068580320021" value="-1" />
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531561">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531553" resolveInfo="direction" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.GreaterThanExpression" typeId="tpee.1081506762703" id="1705599667576531562">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531563">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531578" resolveInfo="end" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531564">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531576" resolveInfo="begin" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1705599667576531565">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1705599667576531566">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1705599667576531567">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1705599667576531568">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531569">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531553" resolveInfo="direction" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1705599667576531570">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="1705599667576531571">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531572">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531576" resolveInfo="begin" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1705599667576531573">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531578" resolveInfo="end" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1705599667576531574">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1705599667576531575">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1705599667576531553" resolveInfo="direction" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531576">
        <property name="name" nameId="tpck.1169194664001" value="begin" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1705599667576531577" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1705599667576531578">
        <property name="name" nameId="tpck.1169194664001" value="end" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1705599667576531579" />
      </node>
    </node>
  </root>
</model>

