<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:450af4ca-ba22-4f57-89bb-35faca681f10(formulaAdapter)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="bbjx" modelUID="r:ba35e19a-8f05-4cae-a99b-d51695da551f(jetbrains.mps.samples.formulaLanguage.api)" version="-1" />
  <import index="iqt9" modelUID="r:54cc1fc5-5f96-4560-9408-18b968230021(postingrules)" version="-1" />
  <import index="fw8r" modelUID="r:3160b573-ccb2-45e9-9d2a-2b5104766730(mf)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6374450524837363737">
      <property name="name" nameId="tpck.1169194664001" value="ValueDouble" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6374450524837363794">
      <property name="name" nameId="tpck.1169194664001" value="ValueQuantity" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6374450524837363835">
      <property name="name" nameId="tpck.1169194664001" value="PostingRule_Formula" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6374450524837363871">
      <property name="name" nameId="tpck.1169194664001" value="MoneyAdapter" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6374450524837363917">
      <property name="name" nameId="tpck.1169194664001" value="MoneyAddOperation" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6374450524837363964">
      <property name="name" nameId="tpck.1169194664001" value="UsageDouble" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6374450524837363990">
      <property name="name" nameId="tpck.1169194664001" value="MoneyConstant" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6374450524837364020">
      <property name="name" nameId="tpck.1169194664001" value="MoneyMultiplyOperation" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6374450524837364067">
      <property name="name" nameId="tpck.1169194664001" value="UsageQuantity" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6374450524837364091">
      <property name="name" nameId="tpck.1169194664001" value="QuantityConstant" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6374450524837364131">
      <property name="name" nameId="tpck.1169194664001" value="QuantityGreaterThanOperation" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6374450524837364180">
      <property name="name" nameId="tpck.1169194664001" value="FeeMoney" />
    </node>
  </roots>
  <root id="6374450524837363737">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363738" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363739">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363740">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6374450524837363741">
      <property name="name" nameId="tpck.1169194664001" value="myValueName" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363742">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6374450524837363743" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6374450524837363744">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363745" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6374450524837363746" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363747">
        <property name="name" nameId="tpck.1169194664001" value="valueName" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363748">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837363749">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837363750">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837363751">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363752">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363741" resolveInfo="myValueName" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363753">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363747" resolveInfo="valueName" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6374450524837363754">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363755" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363756">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363757">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363758">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837363759">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6374450524837363760">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6374450524837363761">
            <property name="name" nameId="tpck.1169194664001" value="event" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363762">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="iqt9.6531435794299651140" resolveInfo="AccountingEvent" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6374450524837363763">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363764">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363757" resolveInfo="parm" />
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363765">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="iqt9.6531435794299651140" resolveInfo="AccountingEvent" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6374450524837363766">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6374450524837363767">
            <property name="name" nameId="tpck.1169194664001" value="value" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363768">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363769">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363770">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6374450524837363771">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363761" resolveInfo="event" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363772">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="iqt9.6531435794299651458" resolveInfo="getAgreement" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363773">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="iqt9.6531435794299653568" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363774">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363741" resolveInfo="myValueName" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363775">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6374450524837363776">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363761" resolveInfo="event" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363777">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="iqt9.6531435794299651305" resolveInfo="getWhenOccurred" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6374450524837363778">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.InstanceOfExpression" typeId="tpee.1081256982272" id="6374450524837363779">
            <node role="leftExpression" roleId="tpee.1081256993304" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6374450524837363780">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363767" resolveInfo="value" />
            </node>
            <node role="classType" roleId="tpee.1081256993305" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363781">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837363782">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6374450524837363783">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363784">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6374450524837363785">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6374450524837363786">
                    <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6374450524837363787">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363767" resolveInfo="value" />
                    </node>
                    <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363788">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363789">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299655732" resolveInfo="getAmount" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6374450524837363790">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6374450524837363791">
            <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6374450524837363792">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363767" resolveInfo="value" />
            </node>
            <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363793">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6374450524837363794">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363795" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363796">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363797">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6374450524837363798">
      <property name="name" nameId="tpck.1169194664001" value="myValueName" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363799">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6374450524837363800" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6374450524837363801">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363802" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6374450524837363803" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363804">
        <property name="name" nameId="tpck.1169194664001" value="valueName" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363805">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837363806">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837363807">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837363808">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363809">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363798" resolveInfo="myValueName" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363810">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363804" resolveInfo="valueName" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6374450524837363811">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363812" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363813">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363814">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363815">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837363816">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6374450524837363817">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6374450524837363818">
            <property name="name" nameId="tpck.1169194664001" value="event" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363819">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="iqt9.6531435794299651140" resolveInfo="AccountingEvent" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6374450524837363820">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363821">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363814" resolveInfo="parm" />
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363822">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="iqt9.6531435794299651140" resolveInfo="AccountingEvent" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6374450524837363823">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6374450524837363824">
            <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363825">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363826">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6374450524837363827">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363818" resolveInfo="event" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363828">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="iqt9.6531435794299651458" resolveInfo="getAgreement" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363829">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="iqt9.6531435794299653568" resolveInfo="getValue" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363830">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363798" resolveInfo="myValueName" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363831">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6374450524837363832">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363818" resolveInfo="event" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363833">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="iqt9.6531435794299651305" resolveInfo="getWhenOccurred" />
                  </node>
                </node>
              </node>
            </node>
            <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363834">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6374450524837363835">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363836" />
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363837">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="iqt9.6531435794299653800" resolveInfo="PostingRule" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6374450524837363838">
      <property name="name" nameId="tpck.1169194664001" value="myFunction" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363839">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363840">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6374450524837363841" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6374450524837363842">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363843" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6374450524837363844" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363845">
        <property name="name" nameId="tpck.1169194664001" value="accountType" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363846">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="iqt9.6531435794299654331" resolveInfo="AccountType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363847">
        <property name="name" nameId="tpck.1169194664001" value="isTaxable" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6374450524837363848" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363849">
        <property name="name" nameId="tpck.1169194664001" value="function" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363850">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363851">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
          </node>
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837363852">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6374450524837363853">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="iqt9.6531435794299653808" resolveInfo="PostingRule" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363854">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363845" resolveInfo="accountType" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363855">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363847" resolveInfo="isTaxable" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837363856">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837363857">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363858">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363838" resolveInfo="myFunction" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363859">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363849" resolveInfo="function" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6374450524837363860">
      <property name="name" nameId="tpck.1169194664001" value="calculateAmount" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="6374450524837363861" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363862">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363863">
        <property name="name" nameId="tpck.1169194664001" value="evt" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363864">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="iqt9.6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837363865">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6374450524837363866">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363867">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363868">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363838" resolveInfo="myFunction" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363869">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="bbjx.8307544070813664861" resolveInfo="compute" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363870">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363863" resolveInfo="evt" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6374450524837363871">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363872" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363873">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363874">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6374450524837363875">
      <property name="name" nameId="tpck.1169194664001" value="myAmount" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363876">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363877">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6374450524837363878" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6374450524837363879">
      <property name="name" nameId="tpck.1169194664001" value="myCurrency" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363880">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652623" resolveInfo="Currency" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6374450524837363881" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6374450524837363882">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363883" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6374450524837363884" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363885">
        <property name="name" nameId="tpck.1169194664001" value="amount" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363886">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363887">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363888">
        <property name="name" nameId="tpck.1169194664001" value="currency" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363889">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652623" resolveInfo="Currency" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837363890">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837363891">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837363892">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363893">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363875" resolveInfo="myAmount" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363894">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363885" resolveInfo="amount" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837363895">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837363896">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363897">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363879" resolveInfo="myCurrency" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363898">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363888" resolveInfo="currency" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6374450524837363899">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363900" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363901">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363902">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363903">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837363904">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6374450524837363905">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6374450524837363906">
            <property name="name" nameId="tpck.1169194664001" value="amount" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363907">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363908">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363909">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363875" resolveInfo="myAmount" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363910">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="bbjx.8307544070813664861" resolveInfo="compute" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363911">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363902" resolveInfo="parm" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6374450524837363912">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6374450524837363913">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6374450524837363914">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650160" resolveInfo="Money" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6374450524837363915">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363906" resolveInfo="amount" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363916">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363879" resolveInfo="myCurrency" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6374450524837363917">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363918" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363919">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363920">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6374450524837363921">
      <property name="name" nameId="tpck.1169194664001" value="myLeftOperand" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363922">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363923">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6374450524837363924" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6374450524837363925">
      <property name="name" nameId="tpck.1169194664001" value="myRightOperand" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363926">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363927">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6374450524837363928" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6374450524837363929">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363930" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6374450524837363931" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363932">
        <property name="name" nameId="tpck.1169194664001" value="leftOperand" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363933">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363934">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363935">
        <property name="name" nameId="tpck.1169194664001" value="rightOperand" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363936">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363937">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
          </node>
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837363938">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837363939">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837363940">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363941">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363921" resolveInfo="myLeftOperand" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363942">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363932" resolveInfo="leftOperand" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837363943">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837363944">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363945">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363925" resolveInfo="myRightOperand" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363946">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363935" resolveInfo="rightOperand" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6374450524837363947">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363948" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363949">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363950">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363951">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837363952">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6374450524837363953">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363954">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363955">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363956">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363921" resolveInfo="myLeftOperand" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363957">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="bbjx.8307544070813664861" resolveInfo="compute" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363958">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363950" resolveInfo="parm" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363959">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650207" resolveInfo="add" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363960">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837363961">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363925" resolveInfo="myRightOperand" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363962">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="bbjx.8307544070813664861" resolveInfo="compute" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363963">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363950" resolveInfo="parm" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6374450524837363964">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363965" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363966">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363967">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6374450524837363968">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363969" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6374450524837363970" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837363971" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6374450524837363972">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363973" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363974">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837363975">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363976">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837363977">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6374450524837363978">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6374450524837363979">
            <property name="name" nameId="tpck.1169194664001" value="usageEvent" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363980">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="iqt9.6531435794299652730" resolveInfo="Usage" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6374450524837363981">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837363982">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363975" resolveInfo="parm" />
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363983">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="iqt9.6531435794299652730" resolveInfo="Usage" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6374450524837363984">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363985">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837363986">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6374450524837363987">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363979" resolveInfo="usageEvent" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363988">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="iqt9.6531435794299652759" resolveInfo="getAmount" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837363989">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299655732" resolveInfo="getAmount" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6374450524837363990">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363991" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363992">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363993">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6374450524837363994">
      <property name="name" nameId="tpck.1169194664001" value="myMoney" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837363995">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6374450524837363996" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6374450524837363997">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837363998" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6374450524837363999" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364000">
        <property name="name" nameId="tpck.1169194664001" value="amount" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6374450524837364001" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364002">
        <property name="name" nameId="tpck.1169194664001" value="currency" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364003">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652623" resolveInfo="Currency" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837364004">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837364005">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837364006">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837364007">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363994" resolveInfo="myMoney" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6374450524837364008">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6374450524837364009">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650160" resolveInfo="Money" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364010">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364000" resolveInfo="amount" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364011">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364002" resolveInfo="currency" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6374450524837364012">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364013" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364014">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364015">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364016">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837364017">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6374450524837364018">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837364019">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837363994" resolveInfo="myMoney" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6374450524837364020">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364021" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364022">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364023">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6374450524837364024">
      <property name="name" nameId="tpck.1169194664001" value="myLeftOperand" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364025">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364026">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6374450524837364027" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6374450524837364028">
      <property name="name" nameId="tpck.1169194664001" value="myRightOperand" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364029">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364030">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6374450524837364031" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6374450524837364032">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364033" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6374450524837364034" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364035">
        <property name="name" nameId="tpck.1169194664001" value="leftOperand" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364036">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364037">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364038">
        <property name="name" nameId="tpck.1169194664001" value="rightOperand" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364039">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364040">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
          </node>
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837364041">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837364042">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837364043">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837364044">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364024" resolveInfo="myLeftOperand" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364045">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364035" resolveInfo="leftOperand" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837364046">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837364047">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837364048">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364028" resolveInfo="myRightOperand" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364049">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364038" resolveInfo="rightOperand" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6374450524837364050">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364051" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364052">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364053">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364054">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837364055">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6374450524837364056">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837364057">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837364058">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837364059">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364024" resolveInfo="myLeftOperand" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837364060">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="bbjx.8307544070813664861" resolveInfo="compute" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364061">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364053" resolveInfo="parm" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837364062">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650477" resolveInfo="multiply" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837364063">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837364064">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364028" resolveInfo="myRightOperand" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837364065">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="bbjx.8307544070813664861" resolveInfo="compute" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364066">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364053" resolveInfo="parm" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6374450524837364067">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364068" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364069">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364070">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6374450524837364071">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364072" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6374450524837364073" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837364074" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6374450524837364075">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364076" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364077">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364078">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364079">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837364080">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6374450524837364081">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6374450524837364082">
            <property name="name" nameId="tpck.1169194664001" value="usageEvent" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364083">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="iqt9.6531435794299652730" resolveInfo="Usage" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6374450524837364084">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364085">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364078" resolveInfo="parm" />
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364086">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="iqt9.6531435794299652730" resolveInfo="Usage" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6374450524837364087">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837364088">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6374450524837364089">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364082" resolveInfo="usageEvent" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837364090">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="iqt9.6531435794299652759" resolveInfo="getAmount" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6374450524837364091">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364092" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364093">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364094">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6374450524837364095">
      <property name="name" nameId="tpck.1169194664001" value="myQuantity" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364096">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6374450524837364097" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6374450524837364098">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364099" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6374450524837364100" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364101">
        <property name="name" nameId="tpck.1169194664001" value="amount" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6374450524837364102" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364103">
        <property name="name" nameId="tpck.1169194664001" value="unit" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364104">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299651581" resolveInfo="Unit" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837364105">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837364106">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837364107">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837364108">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364095" resolveInfo="myQuantity" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6374450524837364109">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6374450524837364110">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299655602" resolveInfo="Quantity" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364111">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364101" resolveInfo="amount" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364112">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364103" resolveInfo="unit" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6374450524837364113">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364114" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6374450524837364115" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364116">
        <property name="name" nameId="tpck.1169194664001" value="quantity" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364117">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837364118">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837364119">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837364120">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837364121">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364095" resolveInfo="myQuantity" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364122">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364116" resolveInfo="quantity" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6374450524837364123">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364124" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364125">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364126">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364127">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837364128">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6374450524837364129">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837364130">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364095" resolveInfo="myQuantity" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6374450524837364131">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364132" />
    <node role="typeVariableDeclaration" roleId="tpee.1109279881614" type="tpee.TypeVariableDeclaration" typeId="tpee.1109279763828" id="6374450524837364133">
      <property name="name" nameId="tpck.1169194664001" value="T" />
      <property name="extends" nameId="tpee.1214996933829" value="true" />
      <node role="bound" roleId="tpee.1214996921760" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364134">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
      </node>
    </node>
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364135">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364136">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6374450524837364137">
      <property name="name" nameId="tpck.1169194664001" value="myLeftOperand" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364138">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="6374450524837364139">
          <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="6374450524837364133" resolveInfo="T" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6374450524837364140" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6374450524837364141">
      <property name="name" nameId="tpck.1169194664001" value="myRightOperand" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364142">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="6374450524837364143">
          <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="6374450524837364133" resolveInfo="T" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6374450524837364144" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6374450524837364145">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364146" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6374450524837364147" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364148">
        <property name="name" nameId="tpck.1169194664001" value="leftOperand" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364149">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="6374450524837364150">
            <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="6374450524837364133" resolveInfo="T" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364151">
        <property name="name" nameId="tpck.1169194664001" value="rightOperand" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364152">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="6374450524837364153">
            <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="6374450524837364133" resolveInfo="T" />
          </node>
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837364154">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837364155">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837364156">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837364157">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364137" resolveInfo="myLeftOperand" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364158">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364148" resolveInfo="leftOperand" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6374450524837364159">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6374450524837364160">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837364161">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364141" resolveInfo="myRightOperand" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364162">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364151" resolveInfo="rightOperand" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6374450524837364163">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364164" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364165">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364166">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364167">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837364168">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6374450524837364169">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837364170">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837364171">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837364172">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364137" resolveInfo="myLeftOperand" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837364173">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="bbjx.8307544070813664861" resolveInfo="compute" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364174">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364166" resolveInfo="parm" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837364175">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299655738" resolveInfo="isGreaterThan" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837364176">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6374450524837364177">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364141" resolveInfo="myRightOperand" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837364178">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="bbjx.8307544070813664861" resolveInfo="compute" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364179">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364166" resolveInfo="parm" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6374450524837364180">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364181" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364182">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="bbjx.8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364183">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6374450524837364184">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364185" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6374450524837364186" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837364187" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6374450524837364188">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6374450524837364189" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364190">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6374450524837364191">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364192">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6374450524837364193">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6374450524837364194">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6374450524837364195">
            <property name="name" nameId="tpck.1169194664001" value="monetaryEvent" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364196">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="iqt9.6531435794299651026" resolveInfo="MonetaryEvent" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6374450524837364197">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6374450524837364198">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364191" resolveInfo="parm" />
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6374450524837364199">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="iqt9.6531435794299651026" resolveInfo="MonetaryEvent" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6374450524837364200">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6374450524837364201">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6374450524837364202">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6374450524837364195" resolveInfo="monetaryEvent" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6374450524837364203">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="iqt9.6531435794299651057" resolveInfo="getAmount" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

