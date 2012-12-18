<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:ba35e19a-8f05-4cae-a99b-d51695da551f(jetbrains.mps.samples.formulaLanguage.api)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(java.lang@java_stub)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="8307544070813664740">
      <property name="name" nameId="tpck.1169194664001" value="MultiplyOperation" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="8307544070813664794">
      <property name="name" nameId="tpck.1169194664001" value="IfFunction" />
    </node>
    <node type="tpee.Interface" typeId="tpee.1107796713796" id="8307544070813664858">
      <property name="name" nameId="tpck.1169194664001" value="Function" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="8307544070813664867">
      <property name="name" nameId="tpck.1169194664001" value="DoubleConstant" />
    </node>
  </roots>
  <root id="8307544070813664740">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8307544070813664741" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664742">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664743">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="8307544070813664744">
      <property name="name" nameId="tpck.1169194664001" value="myLeftOperand" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664745">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8307544070813664858" resolveInfo="Function" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664746">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="8307544070813664747" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="8307544070813664748">
      <property name="name" nameId="tpck.1169194664001" value="myRightOperand" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664749">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8307544070813664858" resolveInfo="Function" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664750">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="8307544070813664751" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="8307544070813664752">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8307544070813664753" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8307544070813664754" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8307544070813664755">
        <property name="name" nameId="tpck.1169194664001" value="leftOperand" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664756">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8307544070813664858" resolveInfo="Function" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664757">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8307544070813664758">
        <property name="name" nameId="tpck.1169194664001" value="rightOperand" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664759">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8307544070813664858" resolveInfo="Function" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664760">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
          </node>
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8307544070813664761">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8307544070813664762">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="8307544070813664763">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8307544070813664764">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664744" resolveInfo="myLeftOperand" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8307544070813664765">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664755" resolveInfo="leftOperand" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8307544070813664766">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="8307544070813664767">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8307544070813664768">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664748" resolveInfo="myRightOperand" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8307544070813664769">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664758" resolveInfo="rightOperand" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8307544070813664770">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8307544070813664771" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664772">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8307544070813664773">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664774">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8307544070813664775">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8307544070813664776">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8307544070813664777">
            <property name="name" nameId="tpck.1169194664001" value="num1" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664778">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8307544070813664779">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8307544070813664780">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664744" resolveInfo="myLeftOperand" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8307544070813664781">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8307544070813664861" resolveInfo="compute" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8307544070813664782">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664773" resolveInfo="parm" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8307544070813664783">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8307544070813664784">
            <property name="name" nameId="tpck.1169194664001" value="num2" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664785">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8307544070813664786">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8307544070813664787">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664748" resolveInfo="myRightOperand" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8307544070813664788">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8307544070813664861" resolveInfo="compute" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8307544070813664789">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664773" resolveInfo="parm" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="8307544070813664790">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.MulExpression" typeId="tpee.1092119917967" id="8307544070813664791">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8307544070813664792">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664777" resolveInfo="num1" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8307544070813664793">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664784" resolveInfo="num2" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="8307544070813664794">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8307544070813664795" />
    <node role="typeVariableDeclaration" roleId="tpee.1109279881614" type="tpee.TypeVariableDeclaration" typeId="tpee.1109279763828" id="8307544070813664796">
      <property name="name" nameId="tpck.1169194664001" value="T" />
    </node>
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664797">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="8307544070813664798">
        <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="8307544070813664796" resolveInfo="T" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="8307544070813664799">
      <property name="name" nameId="tpck.1169194664001" value="myLogicalTest" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664800">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8307544070813664858" resolveInfo="Function" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664801">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="8307544070813664802" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="8307544070813664803">
      <property name="name" nameId="tpck.1169194664001" value="myValueIfTrue" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664804">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8307544070813664858" resolveInfo="Function" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="8307544070813664805">
          <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="8307544070813664796" resolveInfo="T" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="8307544070813664806" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="8307544070813664807">
      <property name="name" nameId="tpck.1169194664001" value="myValueIfFalse" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664808">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8307544070813664858" resolveInfo="Function" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="8307544070813664809">
          <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="8307544070813664796" resolveInfo="T" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="8307544070813664810" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="8307544070813664811">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8307544070813664812" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8307544070813664813" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8307544070813664814">
        <property name="name" nameId="tpck.1169194664001" value="logicalTest" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664815">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8307544070813664858" resolveInfo="Function" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664816">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8307544070813664817">
        <property name="name" nameId="tpck.1169194664001" value="valueIfTrue" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664818">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8307544070813664858" resolveInfo="Function" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="8307544070813664819">
            <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="8307544070813664796" resolveInfo="T" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8307544070813664820">
        <property name="name" nameId="tpck.1169194664001" value="valueIfFalse" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664821">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8307544070813664858" resolveInfo="Function" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="8307544070813664822">
            <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="8307544070813664796" resolveInfo="T" />
          </node>
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8307544070813664823">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8307544070813664824">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="8307544070813664825">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8307544070813664826">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664799" resolveInfo="myLogicalTest" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8307544070813664827">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664814" resolveInfo="logicalTest" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8307544070813664828">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="8307544070813664829">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8307544070813664830">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664803" resolveInfo="myValueIfTrue" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8307544070813664831">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664817" resolveInfo="valueIfTrue" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8307544070813664832">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="8307544070813664833">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8307544070813664834">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664807" resolveInfo="myValueIfFalse" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8307544070813664835">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664820" resolveInfo="valueIfFalse" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8307544070813664836">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8307544070813664837" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="8307544070813664838">
        <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="8307544070813664796" resolveInfo="T" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8307544070813664839">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664840">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8307544070813664841">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="8307544070813664842">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8307544070813664843">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8307544070813664844">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664799" resolveInfo="myLogicalTest" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8307544070813664845">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8307544070813664861" resolveInfo="compute" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8307544070813664846">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664839" resolveInfo="parm" />
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="8307544070813664847">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="8307544070813664848">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8307544070813664849">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8307544070813664850">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664803" resolveInfo="myValueIfTrue" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8307544070813664851">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8307544070813664861" resolveInfo="compute" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8307544070813664852">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664839" resolveInfo="parm" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="8307544070813664853">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8307544070813664854">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8307544070813664855">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664807" resolveInfo="myValueIfFalse" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8307544070813664856">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8307544070813664861" resolveInfo="compute" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8307544070813664857">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664839" resolveInfo="parm" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="8307544070813664858">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8307544070813664859" />
    <node role="typeVariableDeclaration" roleId="tpee.1109279881614" type="tpee.TypeVariableDeclaration" typeId="tpee.1109279763828" id="8307544070813664860">
      <property name="name" nameId="tpck.1169194664001" value="T" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8307544070813664861">
      <property name="isAbstract" nameId="tpee.1178608670077" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8307544070813664862" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="8307544070813664863">
        <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="8307544070813664860" resolveInfo="T" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8307544070813664864">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664865">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8307544070813664866" />
    </node>
  </root>
  <root id="8307544070813664867">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8307544070813664868" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664869">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8307544070813664858" resolveInfo="Function" />
      <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664870">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="8307544070813664871">
      <property name="name" nameId="tpck.1169194664001" value="myDouble" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664872">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="8307544070813664873" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="8307544070813664874">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8307544070813664875" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8307544070813664876" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8307544070813664877">
        <property name="name" nameId="tpck.1169194664001" value="d" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="8307544070813664878" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8307544070813664879">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8307544070813664880">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="8307544070813664881">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8307544070813664882">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664871" resolveInfo="myDouble" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8307544070813664883">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664877" resolveInfo="d" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8307544070813664884">
      <property name="name" nameId="tpck.1169194664001" value="compute" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8307544070813664885" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664886">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8307544070813664887">
        <property name="name" nameId="tpck.1169194664001" value="parm" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8307544070813664888">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8307544070813664889">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="8307544070813664890">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8307544070813664891">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8307544070813664871" resolveInfo="myDouble" />
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

