<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:54cc1fc5-5f96-4560-9408-18b968230021(postingrules)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="fw8r" modelUID="r:3160b573-ccb2-45e9-9d2a-2b5104766730(mf)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="k7g3" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.util(JDK/java.util@java_stub)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299649861">
      <property name="name" nameId="tpck.1169194664001" value="AccountingException" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299649876">
      <property name="name" nameId="tpck.1169194664001" value="AccountingTransaction" />
    </node>
    <node type="tpee.Interface" typeId="tpee.1107796713796" id="6531435794299650125">
      <property name="name" nameId="tpck.1169194664001" value="Subject" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299650989">
      <property name="name" nameId="tpck.1169194664001" value="AgreementRegistry" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299651026">
      <property name="name" nameId="tpck.1169194664001" value="MonetaryEvent" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299651140">
      <property name="name" nameId="tpck.1169194664001" value="AccountingEvent" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299651566">
      <property name="name" nameId="tpck.1169194664001" value="MissingPostingRuleException" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299652198">
      <property name="name" nameId="tpck.1169194664001" value="TaxEvent" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299652730">
      <property name="name" nameId="tpck.1169194664001" value="Usage" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299653396">
      <property name="name" nameId="tpck.1169194664001" value="ServiceAgreement" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299653584">
      <property name="name" nameId="tpck.1169194664001" value="PoorCapPR" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299651139">
      <property name="name" nameId="tpck.1169194664001" value="Entry" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299653800">
      <property name="abstractClass" nameId="tpee.1075300953594" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="PostingRule" />
    </node>
    <node type="tpee.EnumClass" typeId="tpee.1083245097125" id="6531435794299654331">
      <property name="name" nameId="tpck.1169194664001" value="AccountType" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299654975">
      <property name="name" nameId="tpck.1169194664001" value="Customer" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299655211">
      <property name="abstractClass" nameId="tpee.1075300953594" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="Adjustment" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299655311">
      <property name="name" nameId="tpck.1169194664001" value="EventList" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299655543">
      <property name="name" nameId="tpck.1169194664001" value="EventType" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299656295">
      <property name="name" nameId="tpck.1169194664001" value="MultiplyByRatePR" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299656580">
      <property name="name" nameId="tpck.1169194664001" value="AmountFormulaPR" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6531435794299656641">
      <property name="name" nameId="tpck.1169194664001" value="Account" />
    </node>
  </roots>
  <root id="6531435794299649861">
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299649862">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~RuntimeException" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299649863">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299649864" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299649865" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299649866">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6531435794299649867">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~RuntimeException%d&lt;init&gt;()" />
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299649868">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299649869" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299649870" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299649871">
        <property name="name" nameId="tpck.1169194664001" value="s" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299649872">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299649873">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6531435794299649874">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~RuntimeException%d&lt;init&gt;(java%dlang%dString)" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299649875">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299649871" resolveInfo="s" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299649876">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299649877" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299649878">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299649879" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299649880" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299649881">
        <property name="name" nameId="tpck.1169194664001" value="amount" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299649882">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299649883">
        <property name="name" nameId="tpck.1169194664001" value="from" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299649884">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299656641" resolveInfo="Account" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299649885">
        <property name="name" nameId="tpck.1169194664001" value="to" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299649886">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299656641" resolveInfo="Account" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299649887">
        <property name="name" nameId="tpck.1169194664001" value="date" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299649888">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299649889">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299649890">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299649891">
            <property name="name" nameId="tpck.1169194664001" value="fromEntry" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299649892">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299649893">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299649894">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653680" resolveInfo="Entry" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299649895">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299649896">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299649881" resolveInfo="amount" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299649897">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650285" resolveInfo="negate" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299649898">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299649887" resolveInfo="date" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299649899">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299649900">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299649901">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299649883" resolveInfo="from" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299649902">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656685" resolveInfo="addEntry" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299649903">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299649891" resolveInfo="fromEntry" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299649904">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299649905">
            <property name="name" nameId="tpck.1169194664001" value="toEntry" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299649906">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299649907">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299649908">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653680" resolveInfo="Entry" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299649909">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299649881" resolveInfo="amount" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299649910">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299649887" resolveInfo="date" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299649911">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299649912">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299649913">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299649885" resolveInfo="to" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299649914">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656685" resolveInfo="addEntry" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299649915">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299649905" resolveInfo="toEntry" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299650125">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299650126" />
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299650127">
      <property name="isAbstract" nameId="tpee.1178608670077" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="addEntry" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299650128" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299650129" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299650130">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299650131">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299650132">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299650133">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299650134" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299650135">
      <property name="isAbstract" nameId="tpee.1178608670077" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="getAdjuster" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299650136" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299650137">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299650125" resolveInfo="Subject" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299650138" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299650139">
      <property name="isAbstract" nameId="tpee.1178608670077" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="reverseEntry" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299650140" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299650141" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299650142">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299650143">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299650144" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299650145">
      <property name="isAbstract" nameId="tpee.1178608670077" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="process" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299650146" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299650147" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299650148">
        <property name="name" nameId="tpck.1169194664001" value="e" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299650149">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299650150" />
    </node>
  </root>
  <root id="6531435794299650989">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299650990" />
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299650991">
      <property name="name" nameId="tpck.1169194664001" value="myAgreements" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299650992">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Map" />
      </node>
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299650993">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299650994">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~HashMap%d&lt;init&gt;()" />
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299650995">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299650996" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299650997" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299650998" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299650999">
      <property name="name" nameId="tpck.1169194664001" value="register" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651000" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651001" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651002">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651003">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651004">
        <property name="name" nameId="tpck.1169194664001" value="agreement" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651005">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299653396" resolveInfo="ServiceAgreement" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651006">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651007">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651008">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651009">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299650991" resolveInfo="myAgreements" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651010">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Map%dput(java%dlang%dObject,java%dlang%dObject)%cjava%dlang%dObject" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651011">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651002" resolveInfo="name" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651012">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651004" resolveInfo="agreement" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651013">
      <property name="name" nameId="tpck.1169194664001" value="getAgreement" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651014" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651015">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299653396" resolveInfo="ServiceAgreement" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651016">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651017">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651018">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299651019">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299651020">
            <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651021">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651022">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299650991" resolveInfo="myAgreements" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651023">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Map%dget(java%dlang%dObject)%cjava%dlang%dObject" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651024">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651016" resolveInfo="name" />
                </node>
              </node>
            </node>
            <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651025">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299653396" resolveInfo="ServiceAgreement" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299651026">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651027" />
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651028">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299651029">
      <property name="name" nameId="tpck.1169194664001" value="myAmount" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651030">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299651031" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299651032">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651033" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651034" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651035">
        <property name="name" nameId="tpck.1169194664001" value="amount" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651036">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651037">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651038">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299655543" resolveInfo="EventType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651039">
        <property name="name" nameId="tpck.1169194664001" value="whenOccurred" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651040">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651041">
        <property name="name" nameId="tpck.1169194664001" value="whenNoticed" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651042">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651043">
        <property name="name" nameId="tpck.1169194664001" value="customer" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651044">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299650125" resolveInfo="Subject" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651045">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6531435794299651046">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651176" resolveInfo="AccountingEvent" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651047">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651037" resolveInfo="type" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651048">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651039" resolveInfo="whenOccurred" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651049">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651041" resolveInfo="whenNoticed" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651050">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651043" resolveInfo="customer" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651051">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299651052">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651053">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299651054">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299651029" resolveInfo="myAmount" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299651055" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651056">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651035" resolveInfo="amount" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651057">
      <property name="name" nameId="tpck.1169194664001" value="getAmount" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651058" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651059">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651060">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299651061">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651062">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651029" resolveInfo="myAmount" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299651140">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651141" />
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299651142">
      <property name="name" nameId="tpck.1169194664001" value="myType" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651143">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299655543" resolveInfo="EventType" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299651144" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299651145">
      <property name="name" nameId="tpck.1169194664001" value="myWhenOccurred" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651146">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299651147" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299651148">
      <property name="name" nameId="tpck.1169194664001" value="myWhenNoticed" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651149">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299651150" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299651151">
      <property name="name" nameId="tpck.1169194664001" value="mySubject" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651152">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299650125" resolveInfo="Subject" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299651153" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299651154">
      <property name="name" nameId="tpck.1169194664001" value="mySecondaryEvents" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651155">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="6531435794299651156" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299651157">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299651158">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~ArrayList%d&lt;init&gt;()" />
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299651159">
      <property name="name" nameId="tpck.1169194664001" value="myResultingEntries" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651160">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Collection" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651161">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="6531435794299651162" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299651163">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299651164">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~HashSet%d&lt;init&gt;()" />
          <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651165">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299651166">
      <property name="name" nameId="tpck.1169194664001" value="myProcessed" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6531435794299651167" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="6531435794299651168" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="6531435794299651169" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299651170">
      <property name="name" nameId="tpck.1169194664001" value="myReplacementEvent" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651171">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299651172" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299651173">
      <property name="name" nameId="tpck.1169194664001" value="myAdjustedEvent" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651174">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299651175" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299651176">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651177" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651178" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651179">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651180">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299655543" resolveInfo="EventType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651181">
        <property name="name" nameId="tpck.1169194664001" value="whenOccurred" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651182">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651183">
        <property name="name" nameId="tpck.1169194664001" value="whenNoticed" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651184">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651185">
        <property name="name" nameId="tpck.1169194664001" value="subject" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651186">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299650125" resolveInfo="Subject" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651187">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651188">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299651189">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651190">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299651191">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299651142" resolveInfo="myType" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299651192" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651193">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651179" resolveInfo="type" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651194">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299651195">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651196">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299651197">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299651145" resolveInfo="myWhenOccurred" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299651198" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651199">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651181" resolveInfo="whenOccurred" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651200">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299651201">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651202">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299651203">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299651148" resolveInfo="myWhenNoticed" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299651204" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651205">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651183" resolveInfo="whenNoticed" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651206">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299651207">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651208">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299651209">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299651151" resolveInfo="mySubject" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299651210" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651211">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651185" resolveInfo="subject" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651212">
      <property name="name" nameId="tpck.1169194664001" value="addResultingEntry" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651213" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651214">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651215">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651216">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651217">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651218">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651219">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651159" resolveInfo="myResultingEntries" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651220">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Collection%dadd(java%dlang%dObject)%cboolean" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651221">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651214" resolveInfo="arg" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651222">
      <property name="name" nameId="tpck.1169194664001" value="friendAddSecondaryEvent" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651223" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651224">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651225">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651226">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651227">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651228">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651229">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651154" resolveInfo="mySecondaryEvents" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651230">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dadd(java%dlang%dObject)%cboolean" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651231">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651224" resolveInfo="arg" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651232">
      <property name="name" nameId="tpck.1169194664001" value="getAllResultingEntries" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651233" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651234">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Set" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651235">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651236">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299651237">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299651238">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651239">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Set" />
              <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651240">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299651241">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299651242">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~HashSet%d&lt;init&gt;()" />
                <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651243">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651244">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651245">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299651246">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651238" resolveInfo="result" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651247">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Set%daddAll(java%dutil%dCollection)%cboolean" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651248">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651159" resolveInfo="myResultingEntries" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6531435794299651249">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651250">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651154" resolveInfo="mySecondaryEvents" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299651251">
            <property name="name" nameId="tpck.1169194664001" value="secondaryEvent" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651252">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651253">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299651254">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299651255">
                <property name="name" nameId="tpck.1169194664001" value="each" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651256">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299651257">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299651258">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651251" resolveInfo="secondaryEvent" />
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651259">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651260">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651261">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299651262">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651238" resolveInfo="result" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651263">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Set%daddAll(java%dutil%dCollection)%cboolean" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651264">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299651265">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651255" resolveInfo="each" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651266">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651232" resolveInfo="getAllResultingEntries" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299651267">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299651268">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651238" resolveInfo="result" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651269">
      <property name="name" nameId="tpck.1169194664001" value="getEventType" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651270">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299655543" resolveInfo="EventType" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651271">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299651272">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651273">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651142" resolveInfo="myType" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651274">
      <property name="name" nameId="tpck.1169194664001" value="getReplacementEvent" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651275">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651276">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299651277">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651278">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651170" resolveInfo="myReplacementEvent" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651279">
      <property name="name" nameId="tpck.1169194664001" value="getResultingEntries" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651280" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651281">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Collection" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651282">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651283">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299651284">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6531435794299651285">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Collections" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Collections%dunmodifiableCollection(java%dutil%dCollection)%cjava%dutil%dCollection" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651286">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651159" resolveInfo="myResultingEntries" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651287">
      <property name="name" nameId="tpck.1169194664001" value="getSecondaryEvents" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651288">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651289">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299651290">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6531435794299651291">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Collections" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Collections%dunmodifiableList(java%dutil%dList)%cjava%dutil%dList" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651292">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651154" resolveInfo="mySecondaryEvents" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651293">
      <property name="name" nameId="tpck.1169194664001" value="getSubject" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651294" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651295">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299650125" resolveInfo="Subject" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651296">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299651297">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651298">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651151" resolveInfo="mySubject" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651299">
      <property name="name" nameId="tpck.1169194664001" value="getWhenNoticed" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651300" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651301">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651302">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299651303">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651304">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651148" resolveInfo="myWhenNoticed" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651305">
      <property name="name" nameId="tpck.1169194664001" value="getWhenOccurred" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651306" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651307">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651308">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299651309">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651310">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651145" resolveInfo="myWhenOccurred" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651311">
      <property name="name" nameId="tpck.1169194664001" value="hasBeenAdjusted" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651312" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6531435794299651313" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651314">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299651315">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6531435794299651316">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="6531435794299651317">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651318">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651170" resolveInfo="myReplacementEvent" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6531435794299651319" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651320">
      <property name="name" nameId="tpck.1169194664001" value="isProcessed" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651321" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6531435794299651322" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651323">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299651324">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651325">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651166" resolveInfo="myProcessed" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651326">
      <property name="name" nameId="tpck.1169194664001" value="markProcessed" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651327" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651328" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651329">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651330">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299651331">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651332">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651166" resolveInfo="myProcessed" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="6531435794299651333">
              <property name="value" nameId="tpee.1068580123138" value="true" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651334">
      <property name="name" nameId="tpck.1169194664001" value="process" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651335" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651336" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651337">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.AssertStatement" typeId="tpee.1160998861373" id="6531435794299651338">
          <node role="condition" roleId="tpee.1160998896846" type="tpee.NotExpression" typeId="tpee.1081516740877" id="6531435794299651339">
            <node role="expression" roleId="tpee.1081516765348" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651340">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651166" resolveInfo="myProcessed" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6531435794299651341">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="6531435794299651342">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651343">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651173" resolveInfo="myAdjustedEvent" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6531435794299651344" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651345">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651346">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651347">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651348">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651173" resolveInfo="myAdjustedEvent" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651349">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651357" resolveInfo="reverse" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651350">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651351">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651352">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651151" resolveInfo="mySubject" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651353">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299650145" resolveInfo="process" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299651354" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651355">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299651356">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651326" resolveInfo="markProcessed" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651357">
      <property name="name" nameId="tpck.1169194664001" value="reverse" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651358" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651359" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651360">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.AssertStatement" typeId="tpee.1160998861373" id="6531435794299651361">
          <node role="condition" roleId="tpee.1160998896846" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299651362">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651320" resolveInfo="isProcessed" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299651363">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299651364">
            <property name="name" nameId="tpck.1169194664001" value="entries" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="6531435794299651365">
              <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651366">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299651367">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651368">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299651369">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651279" resolveInfo="getResultingEntries" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651370">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Collection%dtoArray(java%dlang%dObject[])%cjava%dlang%dObject[]" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299651371">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreator" typeId="tpee.1184950988562" id="6531435794299651372">
                      <node role="dimensionExpression" roleId="tpee.1184952969026" type="tpee.DimensionExpression" typeId="tpee.1184952934362" id="6531435794299651373">
                        <node role="expression" roleId="tpee.1184953288404" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6531435794299651374">
                          <property name="value" nameId="tpee.1068580320021" value="0" />
                        </node>
                      </node>
                      <node role="componentType" roleId="tpee.1184951007469" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651375">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ArrayType" typeId="tpee.1070534760951" id="6531435794299651376">
                <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651377">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6531435794299651378">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299651379">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651364" resolveInfo="entries" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299651380">
            <property name="name" nameId="tpck.1169194664001" value="entry" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651381">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651382">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651383">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651384">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651385">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651151" resolveInfo="mySubject" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651386">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299650139" resolveInfo="reverseEntry" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299651387">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651380" resolveInfo="entry" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651388">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299651389">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651390" resolveInfo="reverseSecondaryEvents" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651390">
      <property name="name" nameId="tpck.1169194664001" value="reverseSecondaryEvents" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299651391" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651392" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651393">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6531435794299651394">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299651395">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651287" resolveInfo="getSecondaryEvents" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299651396">
            <property name="name" nameId="tpck.1169194664001" value="o" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651397">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651398">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299651399">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299651400">
                <property name="name" nameId="tpck.1169194664001" value="each" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651401">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299651402">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299651403">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651396" resolveInfo="o" />
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651404">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651405">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651406">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299651407">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651400" resolveInfo="each" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651408">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651357" resolveInfo="reverse" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651409">
      <property name="name" nameId="tpck.1169194664001" value="setIsProcessed" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651410" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651411">
        <property name="name" nameId="tpck.1169194664001" value="newIsProcessed" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6531435794299651412" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651413">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651414">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299651415">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651416">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651166" resolveInfo="myProcessed" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651417">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651411" resolveInfo="newIsProcessed" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651418">
      <property name="name" nameId="tpck.1169194664001" value="setReplacementEvent" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651419" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651420" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651421">
        <property name="name" nameId="tpck.1169194664001" value="newReplacementEvent" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651422">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651423">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651424">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299651425">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299651426">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651170" resolveInfo="myReplacementEvent" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651427">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651421" resolveInfo="newReplacementEvent" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299651428">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651429" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651430" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651431">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651432">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299655543" resolveInfo="EventType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651433">
        <property name="name" nameId="tpck.1169194664001" value="whenOccurred" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651434">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651435">
        <property name="name" nameId="tpck.1169194664001" value="whenNoticed" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651436">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651437">
        <property name="name" nameId="tpck.1169194664001" value="subject" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651438">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299650125" resolveInfo="Subject" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651439">
        <property name="name" nameId="tpck.1169194664001" value="adjustedEvent" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651440">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651441">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ThisConstructorInvocation" typeId="tpee.1178893518978" id="6531435794299651442">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651176" resolveInfo="AccountingEvent" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651443">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651431" resolveInfo="type" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651444">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651433" resolveInfo="whenOccurred" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651445">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651435" resolveInfo="whenNoticed" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651446">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651437" resolveInfo="subject" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651447">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299651448">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651449">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299651450">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299651173" resolveInfo="myAdjustedEvent" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299651451" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651452">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651439" resolveInfo="adjustedEvent" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299651453">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651454">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651455">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651439" resolveInfo="adjustedEvent" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651456">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651418" resolveInfo="setReplacementEvent" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299651457" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299651458">
      <property name="name" nameId="tpck.1169194664001" value="getAgreement" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651459" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651460">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299653396" resolveInfo="ServiceAgreement" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651461">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299651462">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299651463">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6531435794299651464">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299651465">
                <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299651466">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651293" resolveInfo="getSubject" />
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651467">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654975" resolveInfo="Customer" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299651468">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655081" resolveInfo="getServiceAgreement" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299651566">
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651567">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299649861" resolveInfo="AccountingException" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299651568">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651569" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651570" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651571">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6531435794299651572">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299649863" resolveInfo="AccountingException" />
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299651573">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299651574" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299651575" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299651576">
        <property name="name" nameId="tpck.1169194664001" value="s" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299651577">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299651578">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6531435794299651579">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299649868" resolveInfo="AccountingException" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299651580">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299651576" resolveInfo="s" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299652198">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299652199" />
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652200">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651026" resolveInfo="MonetaryEvent" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299652201">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299652202" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299652203" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299652204">
        <property name="name" nameId="tpck.1169194664001" value="base" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652205">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299652206">
        <property name="name" nameId="tpck.1169194664001" value="taxableAmount" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652207">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299652208">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6531435794299652209">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651032" resolveInfo="MonetaryEvent" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652210">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652206" resolveInfo="taxableAmount" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="6531435794299652211">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="6531435794299655543" resolveInfo="EventType" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655552" resolveInfo="TAX" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299652212">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652213">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652204" resolveInfo="base" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299652214">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651305" resolveInfo="getWhenOccurred" />
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299652215">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652216">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652204" resolveInfo="base" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299652217">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651299" resolveInfo="getWhenNoticed" />
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299652218">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652219">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652204" resolveInfo="base" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299652220">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651293" resolveInfo="getSubject" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299652221">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299652222">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652223">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652204" resolveInfo="base" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299652224">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651222" resolveInfo="friendAddSecondaryEvent" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299652225" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.AssertStatement" typeId="tpee.1160998861373" id="6531435794299652226">
          <node role="condition" roleId="tpee.1160998896846" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="6531435794299652227">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299652228">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652229">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652204" resolveInfo="base" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299652230">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651269" resolveInfo="getEventType" />
              </node>
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299652231">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651269" resolveInfo="getEventType" />
            </node>
          </node>
          <node role="message" roleId="tpee.1160998916832" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299652232">
            <property name="value" nameId="tpee.1070475926801" value="Probable endless recursion" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299652730">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299652731" />
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652732">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299652733">
      <property name="name" nameId="tpck.1169194664001" value="myAmount" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652734">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299652735" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299652736">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299652737" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299652738" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299652739">
        <property name="name" nameId="tpck.1169194664001" value="amount" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652740">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299652741">
        <property name="name" nameId="tpck.1169194664001" value="whenOccurred" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652742">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299652743">
        <property name="name" nameId="tpck.1169194664001" value="whenNoticed" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652744">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299652745">
        <property name="name" nameId="tpck.1169194664001" value="customer" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652746">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654975" resolveInfo="Customer" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299652747">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6531435794299652748">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651176" resolveInfo="AccountingEvent" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="6531435794299652749">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="6531435794299655543" resolveInfo="EventType" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655546" resolveInfo="USAGE" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652750">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652741" resolveInfo="whenOccurred" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652751">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652743" resolveInfo="whenNoticed" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652752">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652745" resolveInfo="customer" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299652753">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299652754">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299652755">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299652756">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299652733" resolveInfo="myAmount" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299652757" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652758">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652739" resolveInfo="amount" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299652759">
      <property name="name" nameId="tpck.1169194664001" value="getAmount" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299652760" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652761">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299652762">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299652763">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299652764">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652733" resolveInfo="myAmount" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299652765">
      <property name="name" nameId="tpck.1169194664001" value="toString" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299652766" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652767">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299652768">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299652769">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6531435794299652770">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299652771">
              <property name="value" nameId="tpee.1070475926801" value="Usage " />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299652772">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652733" resolveInfo="myAmount" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299652773">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299652774" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299652775" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299652776">
        <property name="name" nameId="tpck.1169194664001" value="amount" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652777">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299652778">
        <property name="name" nameId="tpck.1169194664001" value="whenOccurred" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652779">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299652780">
        <property name="name" nameId="tpck.1169194664001" value="whenNoticed" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652781">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299652782">
        <property name="name" nameId="tpck.1169194664001" value="subject" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652783">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299650125" resolveInfo="Subject" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299652784">
        <property name="name" nameId="tpck.1169194664001" value="adjustedEvent" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299652785">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299652786">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6531435794299652787">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651428" resolveInfo="AccountingEvent" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="6531435794299652788">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="6531435794299655543" resolveInfo="EventType" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655546" resolveInfo="USAGE" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652789">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652778" resolveInfo="whenOccurred" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652790">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652780" resolveInfo="whenNoticed" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652791">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652782" resolveInfo="subject" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652792">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652784" resolveInfo="adjustedEvent" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299652793">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299652794">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299652795">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299652796">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299652733" resolveInfo="myAmount" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299652797" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299652798">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299652776" resolveInfo="amount" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299653396">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653397" />
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299653398">
      <property name="name" nameId="tpck.1169194664001" value="myValues" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653399">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Map" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653400">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653401">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299653360" resolveInfo="TemporalCollection" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299653402" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299653403">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299653404">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~HashMap%d&lt;init&gt;()" />
          <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653405">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
          </node>
          <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653406">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299653360" resolveInfo="TemporalCollection" />
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299653407">
      <property name="name" nameId="tpck.1169194664001" value="myPostingRules" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653408">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Map" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299653409" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299653410">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299653411">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~HashMap%d&lt;init&gt;()" />
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299653412">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653413" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299653414" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653415" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653416">
      <property name="name" nameId="tpck.1169194664001" value="registerValue" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653417" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299653418" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653419">
        <property name="name" nameId="tpck.1169194664001" value="key" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653420">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653421">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653422">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653423">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653424">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653398" resolveInfo="myValues" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653425">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Map%dput(java%dlang%dObject,java%dlang%dObject)%cjava%dlang%dObject" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653426">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653419" resolveInfo="key" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299653427">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299653428">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299651652" resolveInfo="SingleTemporalCollection" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653429">
      <property name="name" nameId="tpck.1169194664001" value="addPostingRule" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653430" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299653431" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653432">
        <property name="name" nameId="tpck.1169194664001" value="eventType" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653433">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299655543" resolveInfo="EventType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653434">
        <property name="name" nameId="tpck.1169194664001" value="rule" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653435">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299653800" resolveInfo="PostingRule" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653436">
        <property name="name" nameId="tpck.1169194664001" value="date" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653437">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653438">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6531435794299653439">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="6531435794299653440">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653441">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653442">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653407" resolveInfo="myPostingRules" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653443">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Map%dget(java%dlang%dObject)%cjava%dlang%dObject" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653444">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653432" resolveInfo="eventType" />
                </node>
              </node>
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6531435794299653445" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653446">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653447">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653448">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653449">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653407" resolveInfo="myPostingRules" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653450">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Map%dput(java%dlang%dObject,java%dlang%dObject)%cjava%dlang%dObject" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653451">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653432" resolveInfo="eventType" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299653452">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299653453">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299651652" resolveInfo="SingleTemporalCollection" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653454">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653455">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299653456">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653461" resolveInfo="getRulesTemporalCollectionFor" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653457">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653432" resolveInfo="eventType" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653458">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299653368" resolveInfo="put" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653459">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653436" resolveInfo="date" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653460">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653434" resolveInfo="rule" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653461">
      <property name="name" nameId="tpck.1169194664001" value="getRulesTemporalCollectionFor" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299653462" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653463">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299653360" resolveInfo="TemporalCollection" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653464">
        <property name="name" nameId="tpck.1169194664001" value="eventType" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653465">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299655543" resolveInfo="EventType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653466">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299653467">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299653468">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653469">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299653360" resolveInfo="TemporalCollection" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299653470">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653471">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653472">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653407" resolveInfo="myPostingRules" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653473">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Map%dget(java%dlang%dObject)%cjava%dlang%dObject" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653474">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653464" resolveInfo="eventType" />
                  </node>
                </node>
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653475">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299653360" resolveInfo="TemporalCollection" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.AssertStatement" typeId="tpee.1160998861373" id="6531435794299653476">
          <node role="condition" roleId="tpee.1160998896846" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="6531435794299653477">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653478">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653468" resolveInfo="result" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6531435794299653479" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299653480">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653481">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653468" resolveInfo="result" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653482">
      <property name="name" nameId="tpck.1169194664001" value="getRate" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653483" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6531435794299653484" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653485">
        <property name="name" nameId="tpck.1169194664001" value="at" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653486">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653487">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299653488">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299653489">
            <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653490">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653491">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653492">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653398" resolveInfo="myValues" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653493">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Map%dget(java%dlang%dObject)%cjava%dlang%dObject" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299653494">
                    <property name="value" nameId="tpee.1070475926801" value="base_rate" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653495">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299653362" resolveInfo="get" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653496">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653485" resolveInfo="at" />
                </node>
              </node>
            </node>
            <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653497">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653498">
      <property name="name" nameId="tpck.1169194664001" value="process" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653499" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299653500" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653501">
        <property name="name" nameId="tpck.1169194664001" value="e" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653502">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653503">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653504">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653505">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299653506">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653510" resolveInfo="getPostingRule" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653507">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653501" resolveInfo="e" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653508">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653828" resolveInfo="process" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653509">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653501" resolveInfo="e" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653510">
      <property name="name" nameId="tpck.1169194664001" value="getPostingRule" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299653511" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653512">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299653800" resolveInfo="PostingRule" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653513">
        <property name="name" nameId="tpck.1169194664001" value="event" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653514">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653515">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299653516">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299653517">
            <property name="name" nameId="tpck.1169194664001" value="rules" />
            <property name="isFinal" nameId="tpee.1176718929932" value="true" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653518">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299653360" resolveInfo="TemporalCollection" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299653519">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653461" resolveInfo="getRulesTemporalCollectionFor" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653520">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653521">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653513" resolveInfo="event" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653522">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651269" resolveInfo="getEventType" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6531435794299653523">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="6531435794299653524">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653525">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653517" resolveInfo="rules" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6531435794299653526" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653527">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="6531435794299653528">
              <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299653529">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299653530">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651568" resolveInfo="MissingPostingRuleException" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.TryCatchStatement" typeId="tpee.1164879751025" id="6531435794299653531">
          <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="6531435794299653532">
            <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653533">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="6531435794299653534">
                <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299653535">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299653536">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651568" resolveInfo="MissingPostingRuleException" />
                  </node>
                </node>
              </node>
            </node>
            <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299653537">
              <property name="name" nameId="tpck.1169194664001" value="e" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653538">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~IllegalArgumentException" />
              </node>
            </node>
          </node>
          <node role="body" roleId="tpee.1164879758292" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653539">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299653540">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299653541">
                <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653542">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653543">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653517" resolveInfo="rules" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653544">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299653362" resolveInfo="get" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653545">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653546">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653513" resolveInfo="event" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653547">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651305" resolveInfo="getWhenOccurred" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653548">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299653800" resolveInfo="PostingRule" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653549">
      <property name="name" nameId="tpck.1169194664001" value="setValue" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653550" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299653551" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653552">
        <property name="name" nameId="tpck.1169194664001" value="key" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653553">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653554">
        <property name="name" nameId="tpck.1169194664001" value="value" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653555">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653556">
        <property name="name" nameId="tpck.1169194664001" value="effectiveDate" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653557">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653558">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653559">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653560">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653561">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653562">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653398" resolveInfo="myValues" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653563">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Map%dget(java%dlang%dObject)%cjava%dlang%dObject" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653564">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653552" resolveInfo="key" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653565">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299653368" resolveInfo="put" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653566">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653556" resolveInfo="effectiveDate" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653567">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653554" resolveInfo="value" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653568">
      <property name="name" nameId="tpck.1169194664001" value="getValue" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653569" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653570">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653571">
        <property name="name" nameId="tpck.1169194664001" value="key" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653572">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653573">
        <property name="name" nameId="tpck.1169194664001" value="at" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653574">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653575">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299653576">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653577">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653578">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653579">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653398" resolveInfo="myValues" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653580">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Map%dget(java%dlang%dObject)%cjava%dlang%dObject" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653581">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653571" resolveInfo="key" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653582">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299653362" resolveInfo="get" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653583">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653573" resolveInfo="at" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299653584">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653585" />
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653586">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299653800" resolveInfo="PostingRule" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299653587">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653588" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299653589" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653590">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653591">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653592">
        <property name="name" nameId="tpck.1169194664001" value="isTaxable" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6531435794299653593" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653594">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6531435794299653595">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653808" resolveInfo="PostingRule" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653596">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653590" resolveInfo="type" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653597">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653592" resolveInfo="isTaxable" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653598">
      <property name="name" nameId="tpck.1169194664001" value="calculateAmount" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="6531435794299653599" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653600">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653601">
        <property name="name" nameId="tpck.1169194664001" value="evt" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653602">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653603">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299653604">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299653605">
            <property name="name" nameId="tpck.1169194664001" value="amountUsed" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653606">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653607">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6531435794299653608">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299653609">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653610">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653601" resolveInfo="evt" />
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653611">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299652730" resolveInfo="Usage" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653612">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299652759" resolveInfo="getAmount" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299653613">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299653614">
            <property name="name" nameId="tpck.1169194664001" value="usageLimit" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653615">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299653616">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653617">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653618">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653619">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653601" resolveInfo="evt" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653620">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651458" resolveInfo="getAgreement" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653621">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653568" resolveInfo="getValue" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299653622">
                    <property name="value" nameId="tpee.1070475926801" value="CAP" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653623">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653624">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653601" resolveInfo="evt" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653625">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651305" resolveInfo="getWhenOccurred" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653626">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299655590" resolveInfo="Quantity" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299653627">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299653628">
            <property name="name" nameId="tpck.1169194664001" value="reducedRate" />
            <property name="isFinal" nameId="tpee.1176718929932" value="true" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6531435794299653629" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299653630">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653631">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653632">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653633">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653601" resolveInfo="evt" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653634">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651458" resolveInfo="getAgreement" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653635">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653568" resolveInfo="getValue" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299653636">
                    <property name="value" nameId="tpee.1070475926801" value="REDUCED_RATE" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653637">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653638">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653601" resolveInfo="evt" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653639">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651305" resolveInfo="getWhenOccurred" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653640">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299653641">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="6531435794299653642">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6531435794299653643">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653644">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653645">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653605" resolveInfo="amountUsed" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653646">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299655738" resolveInfo="isGreaterThan" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653647">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653614" resolveInfo="usageLimit" />
                  </node>
                </node>
              </node>
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6531435794299653648">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650337" resolveInfo="dollars" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MulExpression" typeId="tpee.1092119917967" id="6531435794299653649">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653650">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653651">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653605" resolveInfo="amountUsed" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653652">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299655732" resolveInfo="getAmount" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299653653">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653654">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653655">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653656">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653601" resolveInfo="evt" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653657">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651458" resolveInfo="getAgreement" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653658">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653568" resolveInfo="getValue" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299653659">
                        <property name="value" nameId="tpee.1070475926801" value="BASE_RATE" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653660">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653661">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653601" resolveInfo="evt" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653662">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651305" resolveInfo="getWhenOccurred" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653663">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
                  </node>
                </node>
              </node>
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6531435794299653664">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650337" resolveInfo="dollars" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MulExpression" typeId="tpee.1092119917967" id="6531435794299653665">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653666">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653667">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653605" resolveInfo="amountUsed" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653668">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299655732" resolveInfo="getAmount" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653669">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653628" resolveInfo="reducedRate" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299651139">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653670" />
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299653671">
      <property name="name" nameId="tpck.1169194664001" value="myDate" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653672">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299653673" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299653674">
      <property name="name" nameId="tpck.1169194664001" value="myAccount" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653675">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299656641" resolveInfo="Account" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299653676" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299653677">
      <property name="name" nameId="tpck.1169194664001" value="myAmount" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653678">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299653679" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299653680">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653681" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299653682" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653683">
        <property name="name" nameId="tpck.1169194664001" value="amount" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653684">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653685">
        <property name="name" nameId="tpck.1169194664001" value="date" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653686">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653687">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653688">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299653689">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653690">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299653691">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299653677" resolveInfo="myAmount" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299653692" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653693">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653683" resolveInfo="amount" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653694">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299653695">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653696">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299653697">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299653671" resolveInfo="myDate" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299653698" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653699">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653685" resolveInfo="date" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653700">
      <property name="name" nameId="tpck.1169194664001" value="copy" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653701">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653702">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299653703">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299653704">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299653705">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653680" resolveInfo="Entry" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653706">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653677" resolveInfo="myAmount" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653707">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653671" resolveInfo="myDate" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653708">
      <property name="name" nameId="tpck.1169194664001" value="getAccount" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653709" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653710">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299656641" resolveInfo="Account" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653711">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299653712">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653713">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653674" resolveInfo="myAccount" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653714">
      <property name="name" nameId="tpck.1169194664001" value="getAmount" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653715" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653716">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653717">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299653718">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653719">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653677" resolveInfo="myAmount" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653720">
      <property name="name" nameId="tpck.1169194664001" value="getDate" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653721" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653722">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653723">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299653724">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653725">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653671" resolveInfo="myDate" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653726">
      <property name="name" nameId="tpck.1169194664001" value="setAccount" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653727" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299653728" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653729">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653730">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299656641" resolveInfo="Account" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653731">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.AssertStatement" typeId="tpee.1160998861373" id="6531435794299653732">
          <node role="condition" roleId="tpee.1160998896846" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="6531435794299653733">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653734">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653674" resolveInfo="myAccount" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6531435794299653735" />
          </node>
          <node role="message" roleId="tpee.1160998916832" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299653736">
            <property name="value" nameId="tpee.1070475926801" value="account cannot be changed once set" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653737">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299653738">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653739">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653674" resolveInfo="myAccount" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653740">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653729" resolveInfo="arg" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653741">
      <property name="name" nameId="tpck.1169194664001" value="toString" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653742" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653743">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653744">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299653745">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6531435794299653746">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6531435794299653747">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653748">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653749">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653674" resolveInfo="myAccount" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653750">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656899" resolveInfo="toString" />
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299653751">
                <property name="value" nameId="tpee.1070475926801" value=": " />
              </node>
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653752">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653753">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653677" resolveInfo="myAmount" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653754">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650490" resolveInfo="toString" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="6531435794299653755">
      <property name="name" nameId="tpck.1169194664001" value="total" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653756" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653757">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653758">
        <property name="name" nameId="tpck.1169194664001" value="entries" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653759">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Collection" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653760">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
          </node>
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653761">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6531435794299653762">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653763">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653764">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653758" resolveInfo="entries" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653765">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Collection%disEmpty()%cboolean" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653766">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299653767">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6531435794299653768" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299653769">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299653770">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653771">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6531435794299653772" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6531435794299653773">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653774">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653758" resolveInfo="entries" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299653775">
            <property name="name" nameId="tpck.1169194664001" value="e" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653776">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653777">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6531435794299653778">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="6531435794299653779">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6531435794299653780" />
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653781">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653770" resolveInfo="result" />
                </node>
              </node>
              <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653782">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299653783">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653784">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653770" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653785">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653786">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653770" resolveInfo="result" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653787">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650207" resolveInfo="add" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653788">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653789">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653775" resolveInfo="e" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653790">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653714" resolveInfo="getAmount" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653791">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653792">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299653793">
                    <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653794">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653770" resolveInfo="result" />
                    </node>
                    <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653795">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653796">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653775" resolveInfo="e" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653797">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653714" resolveInfo="getAmount" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299653798">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653799">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653770" resolveInfo="result" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299653800">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653801" />
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299653802">
      <property name="name" nameId="tpck.1169194664001" value="myType" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653803">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299653804" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299653805">
      <property name="name" nameId="tpck.1169194664001" value="myTaxable" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6531435794299653806" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299653807" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299653808">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="6531435794299653809" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299653810" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653811">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653812">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653813">
        <property name="name" nameId="tpck.1169194664001" value="isTaxable" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6531435794299653814" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653815">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653816">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299653817">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653818">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299653819">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299653802" resolveInfo="myType" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299653820" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653821">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653811" resolveInfo="type" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653822">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299653823">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653824">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299653825">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299653805" resolveInfo="myTaxable" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299653826" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653827">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653813" resolveInfo="isTaxable" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653828">
      <property name="name" nameId="tpck.1169194664001" value="process" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299653829" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299653830" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653831">
        <property name="name" nameId="tpck.1169194664001" value="evt" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653832">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653833">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653834">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299653835">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653851" resolveInfo="makeEntry" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653836">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653831" resolveInfo="evt" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299653837">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653845" resolveInfo="calculateAmount" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653838">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653831" resolveInfo="evt" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6531435794299653839">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653840">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653805" resolveInfo="myTaxable" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653841">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653842">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299653843">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653881" resolveInfo="generateTax" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653844">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653831" resolveInfo="evt" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653845">
      <property name="isAbstract" nameId="tpee.1178608670077" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="calculateAmount" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="6531435794299653846" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653847">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653848">
        <property name="name" nameId="tpck.1169194664001" value="evt" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653849">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653850" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653851">
      <property name="name" nameId="tpck.1169194664001" value="makeEntry" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299653852" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299653853" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653854">
        <property name="name" nameId="tpck.1169194664001" value="evt" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653855">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653856">
        <property name="name" nameId="tpck.1169194664001" value="amount" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653857">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653858">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299653859">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299653860">
            <property name="name" nameId="tpck.1169194664001" value="newEntry" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653861">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299653862">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299653863">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653680" resolveInfo="Entry" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653864">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653856" resolveInfo="amount" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653865">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653866">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653854" resolveInfo="evt" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653867">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651299" resolveInfo="getWhenNoticed" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653868">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653869">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653870">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653871">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653854" resolveInfo="evt" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653872">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651293" resolveInfo="getSubject" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653873">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299650127" resolveInfo="addEntry" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653874">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653860" resolveInfo="newEntry" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299653875">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653802" resolveInfo="myType" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653876">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653877">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653878">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653854" resolveInfo="evt" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653879">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651212" resolveInfo="addResultingEntry" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299653880">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653860" resolveInfo="newEntry" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299653881">
      <property name="name" nameId="tpck.1169194664001" value="generateTax" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299653882" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299653883" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299653884">
        <property name="name" nameId="tpck.1169194664001" value="evt" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299653885">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299653886">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299653887">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299653888">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299653889">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299653890">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299652201" resolveInfo="TaxEvent" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653891">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653884" resolveInfo="evt" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299653892">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653845" resolveInfo="calculateAmount" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299653893">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299653884" resolveInfo="evt" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299653894">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651334" resolveInfo="process" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299654331">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299654332" />
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="6531435794299654333">
      <property name="name" nameId="tpck.1169194664001" value="BASE_USAGE" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299654336" resolveInfo="AccountType" />
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="6531435794299654334">
      <property name="name" nameId="tpck.1169194664001" value="SERVICE" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299654336" resolveInfo="AccountType" />
    </node>
    <node role="enumConstant" roleId="tpee.1083245396908" type="tpee.EnumConstantDeclaration" typeId="tpee.1083245299891" id="6531435794299654335">
      <property name="name" nameId="tpck.1169194664001" value="TAX" />
      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299654336" resolveInfo="AccountType" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299654336">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299654337" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299654338" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299654339" />
    </node>
  </root>
  <root id="6531435794299654975">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299654976" />
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299654977">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299649916" resolveInfo="NamedObject" />
    </node>
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299654978">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299650125" resolveInfo="Subject" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299654979">
      <property name="name" nameId="tpck.1169194664001" value="myServiceAgreement" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299654980">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299653396" resolveInfo="ServiceAgreement" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299654981" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299654982">
      <property name="name" nameId="tpck.1169194664001" value="myAccounts" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299654983">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Map" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299654984">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
        </node>
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299654985">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299656641" resolveInfo="Account" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299654986" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299654987">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299654988" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299654989" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299654990">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299654991">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299654992">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299654993">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299654994">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299654995">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="fw8r.6531435794299649918" resolveInfo="myName" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299654996">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299654990" resolveInfo="name" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299654997">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299654998">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299654999" resolveInfo="setUpAccounts" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299654999">
      <property name="name" nameId="tpck.1169194664001" value="setUpAccounts" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655000" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655001">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655002">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299655003">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655004">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299654982" resolveInfo="myAccounts" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655005">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655006">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~HashMap%d&lt;init&gt;()" />
                <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655007">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
                </node>
                <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655008">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299656641" resolveInfo="Account" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6531435794299655009">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.EnumValuesExpression" typeId="tpee.1224573963862" id="6531435794299700743">
            <link role="enumClass" roleId="tpee.1224573974191" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299655011">
            <property name="name" nameId="tpck.1169194664001" value="type" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655012">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655013">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655014">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655015">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655016">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299654982" resolveInfo="myAccounts" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655017">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Map%dput(java%dlang%dObject,java%dlang%dObject)%cjava%dlang%dObject" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655018">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655011" resolveInfo="type" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655019">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655020">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656665" resolveInfo="Account" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="6531435794299655021">
                        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="fw8r.6531435794299652623" resolveInfo="Currency" />
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="fw8r.6531435794299652626" resolveInfo="USD" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655022">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655011" resolveInfo="type" />
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
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655023">
      <property name="name" nameId="tpck.1169194664001" value="accountFor" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655024" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655025">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299656641" resolveInfo="Account" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655026">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655027">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655028">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.AssertStatement" typeId="tpee.1160998861373" id="6531435794299655029">
          <node role="condition" roleId="tpee.1160998896846" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655030">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655031">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299654982" resolveInfo="myAccounts" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655032">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Map%dcontainsKey(java%dlang%dObject)%cboolean" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655033">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655026" resolveInfo="type" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299655034">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655035">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655036">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299654982" resolveInfo="myAccounts" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655037">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Map%dget(java%dlang%dObject)%cjava%dlang%dObject" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655038">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655026" resolveInfo="type" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655039">
      <property name="name" nameId="tpck.1169194664001" value="addEntry" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655040" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655041" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655042">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655043">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655044">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655045">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655046">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655047">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655048">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299655049">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655023" resolveInfo="accountFor" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655050">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655044" resolveInfo="type" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655051">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656685" resolveInfo="addEntry" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655052">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655042" resolveInfo="arg" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655053">
      <property name="name" nameId="tpck.1169194664001" value="balanceFor" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655054" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655055">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655056">
        <property name="name" nameId="tpck.1169194664001" value="key" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655057">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655058">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299655059">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655060">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299655061">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655023" resolveInfo="accountFor" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655062">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655056" resolveInfo="key" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655063">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656742" resolveInfo="balance" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655064">
      <property name="name" nameId="tpck.1169194664001" value="clearEntries" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655065" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655066">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655067">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299655068">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299654999" resolveInfo="setUpAccounts" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655069">
      <property name="name" nameId="tpck.1169194664001" value="getAccounts" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655070" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655071">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Map" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655072">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299655073">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655074">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299654982" resolveInfo="myAccounts" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655075">
      <property name="name" nameId="tpck.1169194664001" value="getAdjuster" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655076" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655077">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299650125" resolveInfo="Subject" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655078">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299655079">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299655080" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655081">
      <property name="name" nameId="tpck.1169194664001" value="getServiceAgreement" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655082" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655083">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299653396" resolveInfo="ServiceAgreement" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655084">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299655085">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655086">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299654979" resolveInfo="myServiceAgreement" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655087">
      <property name="name" nameId="tpck.1169194664001" value="reverseEntry" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655088" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655089" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655090">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655091">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655092">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299655093">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299655094">
            <property name="name" nameId="tpck.1169194664001" value="reversingEntry" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655095">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655096">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655097">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653680" resolveInfo="Entry" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655098">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655099">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655100">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655090" resolveInfo="arg" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655101">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653714" resolveInfo="getAmount" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655102">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650285" resolveInfo="negate" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655103">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655104">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655090" resolveInfo="arg" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655105">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653720" resolveInfo="getDate" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655106">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655107">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299655108">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655023" resolveInfo="accountFor" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655109">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655110">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655111">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655090" resolveInfo="arg" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655112">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653708" resolveInfo="getAccount" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655113">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656907" resolveInfo="type" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655114">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656685" resolveInfo="addEntry" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655115">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655094" resolveInfo="reversingEntry" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655116">
      <property name="name" nameId="tpck.1169194664001" value="process" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655117" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655118" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655119">
        <property name="name" nameId="tpck.1169194664001" value="e" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655120">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655121">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655122">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655123">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655124">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299654979" resolveInfo="myServiceAgreement" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655125">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653498" resolveInfo="process" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655126">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655119" resolveInfo="e" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655127">
      <property name="name" nameId="tpck.1169194664001" value="setAccounts" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655128" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655129" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655130">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655131">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~Map" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655132">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655133">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299655134">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655135">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299654982" resolveInfo="myAccounts" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655136">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655130" resolveInfo="arg" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655137">
      <property name="name" nameId="tpck.1169194664001" value="setServiceAgreement" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655138" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655139" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655140">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655141">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299653396" resolveInfo="ServiceAgreement" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655142">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655143">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299655144">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655145">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299654979" resolveInfo="myServiceAgreement" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655146">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655140" resolveInfo="arg" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655147">
      <property name="name" nameId="tpck.1169194664001" value="toString" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655148" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655149">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655150">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299655151">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299655152">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655153">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~StringBuffer" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655154">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655155">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%d&lt;init&gt;()" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299655156">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299655157">
            <property name="name" nameId="tpck.1169194664001" value="types" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="6531435794299655158">
              <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655159">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299655160">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655193" resolveInfo="accountTypes" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6531435794299655161">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655162">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655157" resolveInfo="types" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299655163">
            <property name="name" nameId="tpck.1169194664001" value="type" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655164">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655165">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655166">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655167">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655168">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655152" resolveInfo="result" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655169">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%dappend(java%dlang%dObject)%cjava%dlang%dStringBuffer" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655170">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655163" resolveInfo="type" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655171">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655172">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655173">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655152" resolveInfo="result" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655174">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%dappend(java%dlang%dString)%cjava%dlang%dStringBuffer" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299655175">
                    <property name="value" nameId="tpee.1070475926801" value=": " />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655176">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655177">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655178">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655152" resolveInfo="result" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655179">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%dappend(java%dlang%dObject)%cjava%dlang%dStringBuffer" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655180">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299655181">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655023" resolveInfo="accountFor" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655182">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655163" resolveInfo="type" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655183">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656742" resolveInfo="balance" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655184">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655185">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655186">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655152" resolveInfo="result" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655187">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%dappend(java%dlang%dString)%cjava%dlang%dStringBuffer" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299655188">
                    <property name="value" nameId="tpee.1070475926801" value="&#10;" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299655189">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655190">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655191">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655152" resolveInfo="result" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655192">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%dtoString()%cjava%dlang%dString" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655193">
      <property name="name" nameId="tpck.1169194664001" value="accountTypes" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ArrayType" typeId="tpee.1070534760951" id="6531435794299655194">
        <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655195">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655196">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299655197">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299655198">
            <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655199">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655200">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655201">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299654982" resolveInfo="myAccounts" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655202">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Map%dkeySet()%cjava%dutil%dSet" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655203">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Set%dtoArray(java%dlang%dObject[])%cjava%dlang%dObject[]" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655204">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreator" typeId="tpee.1184950988562" id="6531435794299655205">
                    <node role="dimensionExpression" roleId="tpee.1184952969026" type="tpee.DimensionExpression" typeId="tpee.1184952934362" id="6531435794299655206">
                      <node role="expression" roleId="tpee.1184953288404" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6531435794299655207">
                        <property name="value" nameId="tpee.1068580320021" value="0" />
                      </node>
                    </node>
                    <node role="componentType" roleId="tpee.1184951007469" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655208">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="type" roleId="tpee.1070534934091" type="tpee.ArrayType" typeId="tpee.1070534760951" id="6531435794299655209">
              <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655210">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299655211">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655212" />
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655213">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299655214">
      <property name="name" nameId="tpck.1169194664001" value="myNewEvents" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655215">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655216">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="6531435794299655217" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655218">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655219">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~ArrayList%d&lt;init&gt;()" />
          <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655220">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299655221">
      <property name="name" nameId="tpck.1169194664001" value="myOldEvents" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655222">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655223">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="6531435794299655224" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655225">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655226">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~ArrayList%d&lt;init&gt;()" />
          <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655227">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
          </node>
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299655228">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655229" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655230" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655231">
        <property name="name" nameId="tpck.1169194664001" value="replacement" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655232">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655233">
        <property name="name" nameId="tpck.1169194664001" value="adjustedEvent" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655234">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655235">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ThisConstructorInvocation" typeId="tpee.1178893518978" id="6531435794299655236">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655252" resolveInfo="Adjustment" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655237">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655238">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655231" resolveInfo="replacement" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655239">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651299" resolveInfo="getWhenNoticed" />
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655240">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655241">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655231" resolveInfo="replacement" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655242">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651299" resolveInfo="getWhenNoticed" />
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655243">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655244">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655231" resolveInfo="replacement" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655245">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651293" resolveInfo="getSubject" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655246">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299655247">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655278" resolveInfo="addOld" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655248">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655233" resolveInfo="adjustedEvent" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655249">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299655250">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655267" resolveInfo="addNew" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655251">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655231" resolveInfo="replacement" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299655252">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655253" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655254" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655255">
        <property name="name" nameId="tpck.1169194664001" value="whenOccurred" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655256">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655257">
        <property name="name" nameId="tpck.1169194664001" value="whenNoticed" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655258">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655259">
        <property name="name" nameId="tpck.1169194664001" value="subject" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655260">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299650125" resolveInfo="Subject" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655261">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6531435794299655262">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651176" resolveInfo="AccountingEvent" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6531435794299655263" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655264">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655255" resolveInfo="whenOccurred" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655265">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655257" resolveInfo="whenNoticed" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655266">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655259" resolveInfo="subject" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655267">
      <property name="name" nameId="tpck.1169194664001" value="addNew" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655268" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655269" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655270">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655271">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655272">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655273">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655274">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655275">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655214" resolveInfo="myNewEvents" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655276">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dadd(java%dlang%dObject)%cboolean" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655277">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655270" resolveInfo="arg" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655278">
      <property name="name" nameId="tpck.1169194664001" value="addOld" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655279" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655280" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655281">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655282">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655283">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6531435794299655284">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655285">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655286">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655281" resolveInfo="arg" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655287">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651311" resolveInfo="hasBeenAdjusted" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655288">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="6531435794299655289">
              <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655290">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655291">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~IllegalArgumentException%d&lt;init&gt;(java%dlang%dString)" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6531435794299655292">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6531435794299655293">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6531435794299655294">
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6531435794299655295">
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299655296">
                            <property name="value" nameId="tpee.1070475926801" value="Cannot create " />
                          </node>
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299655297" />
                        </node>
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299655298">
                          <property name="value" nameId="tpee.1070475926801" value=". " />
                        </node>
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655299">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655281" resolveInfo="arg" />
                      </node>
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299655300">
                      <property name="value" nameId="tpee.1070475926801" value=" is already adjusted" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655301">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655302">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655303">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655221" resolveInfo="myOldEvents" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655304">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dadd(java%dlang%dObject)%cboolean" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655305">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655281" resolveInfo="arg" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655306">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655307">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655308">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655281" resolveInfo="arg" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655309">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651418" resolveInfo="setReplacementEvent" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299655310" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299655311">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655312" />
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299655313">
      <property name="name" nameId="tpck.1169194664001" value="myEvents" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655314">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655315">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299655316" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655317">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655318">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~ArrayList%d&lt;init&gt;()" />
          <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655319">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299655320">
      <property name="name" nameId="tpck.1169194664001" value="myProcessingErrors" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655321">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655322">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299655323" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655324">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655325">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~ArrayList%d&lt;init&gt;()" />
          <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655326">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
          </node>
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299655327">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655328" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655329" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655330" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655331">
      <property name="name" nameId="tpck.1169194664001" value="add" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655332" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655333" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655334">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655335">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655336">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655337">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655338">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655339">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655313" resolveInfo="myEvents" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655340">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dadd(java%dlang%dObject)%cboolean" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655341">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655334" resolveInfo="arg" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655342">
      <property name="name" nameId="tpck.1169194664001" value="unprocessedEvents" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299655343" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655344">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655345">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655346">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299655347">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299655348">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655349">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" />
              <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655350">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655351">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655352">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~ArrayList%d&lt;init&gt;()" />
                <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655353">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6531435794299655354">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655355">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655313" resolveInfo="myEvents" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299655356">
            <property name="name" nameId="tpck.1169194664001" value="e" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655357">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655358">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6531435794299655359">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotExpression" typeId="tpee.1081516740877" id="6531435794299655360">
                <node role="expression" roleId="tpee.1081516765348" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655361">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655362">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655356" resolveInfo="e" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655363">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651320" resolveInfo="isProcessed" />
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655364">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655365">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655366">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655367">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655348" resolveInfo="result" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655368">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dadd(java%dlang%dObject)%cboolean" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655369">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655356" resolveInfo="e" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299655370">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655371">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655348" resolveInfo="result" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655372">
      <property name="name" nameId="tpck.1169194664001" value="logProcessingError" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299655373" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655374" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655375">
        <property name="name" nameId="tpck.1169194664001" value="event" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655376">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655377">
        <property name="name" nameId="tpck.1169194664001" value="exception" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655378">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Exception" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655379">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655380">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655381">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655382">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655320" resolveInfo="myProcessingErrors" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655383">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dadd(java%dlang%dObject)%cboolean" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655384">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655375" resolveInfo="event" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="6531435794299655385">
          <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655386">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655387">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~RuntimeException%d&lt;init&gt;(java%dlang%dThrowable)" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655388">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655377" resolveInfo="exception" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655389">
      <property name="name" nameId="tpck.1169194664001" value="hasProcessingErrors" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6531435794299655390" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655391">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299655392">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.NotExpression" typeId="tpee.1081516740877" id="6531435794299655393">
            <node role="expression" roleId="tpee.1081516765348" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655394">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299655395">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655320" resolveInfo="myProcessingErrors" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655396">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%disEmpty()%cboolean" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655397">
      <property name="name" nameId="tpck.1169194664001" value="process" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655398" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655399" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655400">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6531435794299655401">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299655402">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655342" resolveInfo="unprocessedEvents" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299655403">
            <property name="name" nameId="tpck.1169194664001" value="event" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655404">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655405">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.TryCatchStatement" typeId="tpee.1164879751025" id="6531435794299655406">
              <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="6531435794299655407">
                <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655408">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655409">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299655410">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655372" resolveInfo="logProcessingError" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655411">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655403" resolveInfo="event" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655412">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655413" resolveInfo="e" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299655413">
                  <property name="name" nameId="tpck.1169194664001" value="e" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655414">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Exception" />
                  </node>
                </node>
              </node>
              <node role="body" roleId="tpee.1164879758292" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655415">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655416">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299655417">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299655418">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655403" resolveInfo="event" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299655419">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651334" resolveInfo="process" />
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
  <root id="6531435794299655543">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655544" />
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655545">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299649916" resolveInfo="NamedObject" />
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6531435794299655546">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="USAGE" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655547">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299655543" resolveInfo="EventType" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655548" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655549">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655550">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655564" resolveInfo="EventType" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299655551">
            <property name="value" nameId="tpee.1070475926801" value="usage" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6531435794299655552">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TAX" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655553">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299655543" resolveInfo="EventType" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655554" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655555">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655556">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655564" resolveInfo="EventType" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299655557">
            <property name="value" nameId="tpee.1070475926801" value="tax" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6531435794299655558">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="SERVICE_CALL" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655559">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299655543" resolveInfo="EventType" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655560" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299655561">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299655562">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299655564" resolveInfo="EventType" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299655563">
            <property name="value" nameId="tpee.1070475926801" value="service call" />
          </node>
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299655564">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299655565" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655566" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655567">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655568">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655569">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6531435794299655570">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299649926" resolveInfo="NamedObject" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655571">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655567" resolveInfo="name" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="6531435794299655572">
      <property name="name" nameId="tpck.1169194664001" value="get" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655573">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299655543" resolveInfo="EventType" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299655574">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655575">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655576">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299655577">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299655578">
            <node role="expression" roleId="tpee.1070534934092" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6531435794299655579">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="fw8r.6531435794299649979" resolveInfo="Registry" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650067" resolveInfo="get" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299655580">
                <property name="value" nameId="tpee.1070475926801" value="EventType" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299655581">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299655574" resolveInfo="name" />
              </node>
            </node>
            <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299655582">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299655543" resolveInfo="EventType" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299655583">
      <property name="name" nameId="tpck.1169194664001" value="register" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299655584" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299655585">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299655586">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6531435794299655587">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="fw8r.6531435794299649979" resolveInfo="Registry" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299649995" resolveInfo="add" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299655588">
              <property name="value" nameId="tpee.1070475926801" value="EventType" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299655589" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299656295">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299656296" />
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656297">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299653800" resolveInfo="PostingRule" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299656298">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299656299" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299656300" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656301">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656302">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656303">
        <property name="name" nameId="tpck.1169194664001" value="isTaxable" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6531435794299656304" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656305">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6531435794299656306">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653808" resolveInfo="PostingRule" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656307">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656301" resolveInfo="type" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656308">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656303" resolveInfo="isTaxable" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656309">
      <property name="name" nameId="tpck.1169194664001" value="calculateAmount" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="6531435794299656310" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656311">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656312">
        <property name="name" nameId="tpck.1169194664001" value="evt" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656313">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656314">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299656315">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299656316">
            <property name="name" nameId="tpck.1169194664001" value="usageEvent" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656317">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299652730" resolveInfo="Usage" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299656318">
              <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656319">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656312" resolveInfo="evt" />
              </node>
              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656320">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299652730" resolveInfo="Usage" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656321">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6531435794299656322">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650337" resolveInfo="dollars" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MulExpression" typeId="tpee.1092119917967" id="6531435794299656323">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656324">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656325">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656326">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656316" resolveInfo="usageEvent" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656327">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299652759" resolveInfo="getAmount" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656328">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299655732" resolveInfo="getAmount" />
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299656329">
                <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656330">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656331">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656332">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656316" resolveInfo="usageEvent" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656333">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651458" resolveInfo="getAgreement" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656334">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653568" resolveInfo="getValue" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299656335">
                      <property name="value" nameId="tpee.1070475926801" value="BASE_RATE" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656336">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656337">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656316" resolveInfo="usageEvent" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656338">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651305" resolveInfo="getWhenOccurred" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656339">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299656580">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299656581" />
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656582">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299653800" resolveInfo="PostingRule" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299656583">
      <property name="name" nameId="tpck.1169194664001" value="myMultiplier" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6531435794299656584" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299656585" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299656586">
      <property name="name" nameId="tpck.1169194664001" value="myFixedFee" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656587">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299656588" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299656589">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299656590" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299656591" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656592">
        <property name="name" nameId="tpck.1169194664001" value="multiplier" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="6531435794299656593" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656594">
        <property name="name" nameId="tpck.1169194664001" value="fixedFee" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656595">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656596">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656597">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656598">
        <property name="name" nameId="tpck.1169194664001" value="isTaxable" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6531435794299656599" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656600">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SuperConstructorInvocation" typeId="tpee.1070475587102" id="6531435794299656601">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653808" resolveInfo="PostingRule" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656602">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656596" resolveInfo="type" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656603">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656598" resolveInfo="isTaxable" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299656604">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299656605">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656606">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299656607">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299656583" resolveInfo="myMultiplier" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299656608" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656609">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656592" resolveInfo="multiplier" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299656610">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299656611">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656612">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299656613">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299656586" resolveInfo="myFixedFee" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299656614" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656615">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656594" resolveInfo="fixedFee" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656616">
      <property name="name" nameId="tpck.1169194664001" value="calculateAmount" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="6531435794299656617" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656618">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656619">
        <property name="name" nameId="tpck.1169194664001" value="evt" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656620">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651140" resolveInfo="AccountingEvent" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656621">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299656622">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299656623">
            <property name="name" nameId="tpck.1169194664001" value="eventAmount" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656624">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656625">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6531435794299656626">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299656627">
                  <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656628">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656619" resolveInfo="evt" />
                  </node>
                  <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656629">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651026" resolveInfo="MonetaryEvent" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656630">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299651057" resolveInfo="getAmount" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656631">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.CastExpression" typeId="tpee.1070534934090" id="6531435794299656632">
            <node role="expression" roleId="tpee.1070534934092" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656633">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656634">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656635">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656623" resolveInfo="eventAmount" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656636">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650477" resolveInfo="multiply" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656637">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656583" resolveInfo="myMultiplier" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656638">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650207" resolveInfo="add" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656639">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656586" resolveInfo="myFixedFee" />
                </node>
              </node>
            </node>
            <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656640">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6531435794299656641">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299656642" />
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299656643">
      <property name="name" nameId="tpck.1169194664001" value="myEntries" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656644">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656645">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299656646" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299656647">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299656648">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~ArrayList%d&lt;init&gt;()" />
          <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656649">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299656650">
      <property name="name" nameId="tpck.1169194664001" value="myCurrency" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656651">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652623" resolveInfo="Currency" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299656652" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6531435794299656653">
      <property name="name" nameId="tpck.1169194664001" value="myType" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656654">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299656655" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299656656">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299656657" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299656658" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656659">
        <property name="name" nameId="tpck.1169194664001" value="currency" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656660">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652623" resolveInfo="Currency" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656661">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ThisConstructorInvocation" typeId="tpee.1178893518978" id="6531435794299656662">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656665" resolveInfo="Account" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656663">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656659" resolveInfo="currency" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6531435794299656664" />
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6531435794299656665">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299656666" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299656667" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656668">
        <property name="name" nameId="tpck.1169194664001" value="currency" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656669">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652623" resolveInfo="Currency" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656670">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656671">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656672">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299656673">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299656674">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656675">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299656676">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299656650" resolveInfo="myCurrency" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299656677" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656678">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656668" resolveInfo="currency" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299656679">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299656680">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656681">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6531435794299656682">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6531435794299656653" resolveInfo="myType" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299656683" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656684">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656670" resolveInfo="type" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656685">
      <property name="name" nameId="tpck.1169194664001" value="addEntry" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299656686" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299656687" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656688">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656689">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656690">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299656691">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299656692">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656723" resolveInfo="ensureSameCurrency" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656693">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656694">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656688" resolveInfo="arg" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656695">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653714" resolveInfo="getAmount" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299656696">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656697">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656698">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656643" resolveInfo="myEntries" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656699">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dadd(java%dlang%dObject)%cboolean" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656700">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656688" resolveInfo="arg" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299656701">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656702">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656703">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656688" resolveInfo="arg" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656704">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653726" resolveInfo="setAccount" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299656705" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656706">
      <property name="name" nameId="tpck.1169194664001" value="addEntry" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299656707" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656708">
        <property name="name" nameId="tpck.1169194664001" value="amount" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656709">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656710">
        <property name="name" nameId="tpck.1169194664001" value="date" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656711">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656712">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299656713">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299656714">
            <property name="name" nameId="tpck.1169194664001" value="e" />
            <property name="isFinal" nameId="tpee.1176718929932" value="true" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656715">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299656716">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299656717">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653680" resolveInfo="Entry" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656718">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656708" resolveInfo="amount" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656719">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656710" resolveInfo="date" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299656720">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299656721">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656685" resolveInfo="addEntry" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656722">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656714" resolveInfo="e" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656723">
      <property name="name" nameId="tpck.1169194664001" value="ensureSameCurrency" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6531435794299656724" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299656725" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656726">
        <property name="name" nameId="tpck.1169194664001" value="arg" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656727">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656728">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6531435794299656729">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotExpression" typeId="tpee.1081516740877" id="6531435794299656730">
            <node role="expression" roleId="tpee.1081516765348" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656731">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656732">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656733">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656726" resolveInfo="arg" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656734">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650305" resolveInfo="currency" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656735">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299651609" resolveInfo="equals" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656736">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656650" resolveInfo="myCurrency" />
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656737">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="6531435794299656738">
              <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299656739">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299656740">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~IllegalArgumentException%d&lt;init&gt;(java%dlang%dString)" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299656741">
                    <property name="value" nameId="tpee.1070475926801" value="New item has incompatable currency" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656742">
      <property name="name" nameId="tpck.1169194664001" value="balance" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299656743" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656744">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656745">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656746">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299656747">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656785" resolveInfo="balance" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6531435794299656748">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299652604" resolveInfo="today" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656749">
      <property name="name" nameId="tpck.1169194664001" value="balance" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656750">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656751">
        <property name="name" nameId="tpck.1169194664001" value="period" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656752">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299653895" resolveInfo="DateRange" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656753">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299656754">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299656755">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656756">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299656757">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299656758">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650184" resolveInfo="Money" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6531435794299656759">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656760">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656650" resolveInfo="myCurrency" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6531435794299656761">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656762">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656643" resolveInfo="myEntries" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299656763">
            <property name="name" nameId="tpck.1169194664001" value="e" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656764">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656765">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6531435794299656766">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656767">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656768">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656751" resolveInfo="period" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656769">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299654016" resolveInfo="includes" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656770">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656771">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656763" resolveInfo="e" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656772">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653720" resolveInfo="getDate" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656773">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299656774">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299656775">
                    <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656776">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656755" resolveInfo="result" />
                    </node>
                    <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656777">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656778">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656755" resolveInfo="result" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656779">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650207" resolveInfo="add" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656780">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656781">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656763" resolveInfo="e" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656782">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653714" resolveInfo="getAmount" />
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
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656783">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656784">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656755" resolveInfo="result" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656785">
      <property name="name" nameId="tpck.1169194664001" value="balance" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656786">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656787">
        <property name="name" nameId="tpck.1169194664001" value="date" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656788">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656789">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656790">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299656791">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656749" resolveInfo="balance" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6531435794299656792">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="fw8r.6531435794299653895" resolveInfo="DateRange" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299653954" resolveInfo="upTo" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656793">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656787" resolveInfo="date" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656794">
      <property name="name" nameId="tpck.1169194664001" value="copy" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299656795" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656796">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299656641" resolveInfo="Account" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656797">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299656798">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299656799">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656800">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299656641" resolveInfo="Account" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299656801">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299656802">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656665" resolveInfo="Account" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656803">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656650" resolveInfo="myCurrency" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656804">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656653" resolveInfo="myType" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6531435794299656805">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656806">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656643" resolveInfo="myEntries" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299656807">
            <property name="name" nameId="tpck.1169194664001" value="e" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656808">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656809">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299656810">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656811">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656812">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656799" resolveInfo="result" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656813">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656685" resolveInfo="addEntry" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656814">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656815">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656807" resolveInfo="e" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656816">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653700" resolveInfo="copy" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656817">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656818">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656799" resolveInfo="result" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656819">
      <property name="name" nameId="tpck.1169194664001" value="deposits" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656820">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656821">
        <property name="name" nameId="tpck.1169194664001" value="period" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656822">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299653895" resolveInfo="DateRange" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656823">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299656824">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299656825">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656826">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299656827">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299656828">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650184" resolveInfo="Money" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6531435794299656829">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656830">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656650" resolveInfo="myCurrency" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6531435794299656831">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656832">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656643" resolveInfo="myEntries" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299656833">
            <property name="name" nameId="tpck.1169194664001" value="each" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656834">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656835">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6531435794299656836">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="6531435794299656837">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656838">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656839">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656821" resolveInfo="period" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656840">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299654016" resolveInfo="includes" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656841">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656842">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656833" resolveInfo="each" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656843">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653720" resolveInfo="getDate" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656844">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656845">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656846">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656833" resolveInfo="each" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656847">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653714" resolveInfo="getAmount" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656848">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650444" resolveInfo="isPositive" />
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656849">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299656850">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299656851">
                    <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656852">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656825" resolveInfo="result" />
                    </node>
                    <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656853">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656854">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656825" resolveInfo="result" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656855">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650207" resolveInfo="add" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656856">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656857">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656833" resolveInfo="each" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656858">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653714" resolveInfo="getAmount" />
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
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656859">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656860">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656825" resolveInfo="result" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656861">
      <property name="name" nameId="tpck.1169194664001" value="entries" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299656862" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ArrayType" typeId="tpee.1070534760951" id="6531435794299656863">
        <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656864">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656865">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656866">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656867">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656868">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656643" resolveInfo="myEntries" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656869">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dtoArray(java%dlang%dObject[])%cjava%dlang%dObject[]" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299656870">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreator" typeId="tpee.1184950988562" id="6531435794299656871">
                  <node role="dimensionExpression" roleId="tpee.1184952969026" type="tpee.DimensionExpression" typeId="tpee.1184952934362" id="6531435794299656872">
                    <node role="expression" roleId="tpee.1184953288404" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6531435794299656873">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                  </node>
                  <node role="componentType" roleId="tpee.1184951007469" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656874">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656875">
      <property name="name" nameId="tpck.1169194664001" value="isValid" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6531435794299656876" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656877">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656878">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6531435794299656879">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299656880" resolveInfo="allMyEntriesReferToMe" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656880">
      <property name="name" nameId="tpck.1169194664001" value="allMyEntriesReferToMe" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6531435794299656881" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656882">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6531435794299656883">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656884">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656643" resolveInfo="myEntries" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299656885">
            <property name="name" nameId="tpck.1169194664001" value="e" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656886">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656887">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6531435794299656888">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="6531435794299656889">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656890">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656891">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656885" resolveInfo="e" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656892">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653708" resolveInfo="getAccount" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299656893" />
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656894">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656895">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="6531435794299656896" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656897">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="6531435794299656898">
            <property name="value" nameId="tpee.1068580123138" value="true" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656899">
      <property name="name" nameId="tpck.1169194664001" value="toString" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6531435794299656900" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656901">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656902">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656903">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6531435794299656904">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6531435794299656905">
              <property name="value" nameId="tpee.1070475926801" value="Acc: " />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656906">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656653" resolveInfo="myType" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656907">
      <property name="name" nameId="tpck.1169194664001" value="type" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656908">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299654331" resolveInfo="AccountType" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656909">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656910">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656911">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656653" resolveInfo="myType" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656912">
      <property name="name" nameId="tpck.1169194664001" value="withdraw" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6531435794299656913" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656914">
        <property name="name" nameId="tpck.1169194664001" value="amount" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656915">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656916">
        <property name="name" nameId="tpck.1169194664001" value="target" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656917">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299656641" resolveInfo="Account" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656918">
        <property name="name" nameId="tpck.1169194664001" value="date" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656919">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299652233" resolveInfo="MfDate" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656920">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299656921">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299656922">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299656923">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299649878" resolveInfo="AccountingTransaction" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656924">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656914" resolveInfo="amount" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6531435794299656925" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656926">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656916" resolveInfo="target" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656927">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656918" resolveInfo="date" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6531435794299656928">
      <property name="name" nameId="tpck.1169194664001" value="withdrawels" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656929">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6531435794299656930">
        <property name="name" nameId="tpck.1169194664001" value="period" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656931">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299653895" resolveInfo="DateRange" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656932">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6531435794299656933">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299656934">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656935">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fw8r.6531435794299650151" resolveInfo="Money" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6531435794299656936">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6531435794299656937">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650184" resolveInfo="Money" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6531435794299656938">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656939">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656650" resolveInfo="myCurrency" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6531435794299656940">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6531435794299656941">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656643" resolveInfo="myEntries" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6531435794299656942">
            <property name="name" nameId="tpck.1169194664001" value="each" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6531435794299656943">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6531435794299651139" resolveInfo="Entry" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656944">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6531435794299656945">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="6531435794299656946">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656947">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6531435794299656948">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656930" resolveInfo="period" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656949">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299654016" resolveInfo="includes" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656950">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656951">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656942" resolveInfo="each" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656952">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653720" resolveInfo="getDate" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656953">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656954">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656955">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656942" resolveInfo="each" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656956">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653714" resolveInfo="getAmount" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656957">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650431" resolveInfo="isNegative" />
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6531435794299656958">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6531435794299656959">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6531435794299656960">
                    <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656961">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656934" resolveInfo="result" />
                    </node>
                    <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656962">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656963">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656934" resolveInfo="result" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656964">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fw8r.6531435794299650207" resolveInfo="add" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6531435794299656965">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656966">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656942" resolveInfo="each" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6531435794299656967">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6531435794299653714" resolveInfo="getAmount" />
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
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6531435794299656968">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6531435794299656969">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6531435794299656934" resolveInfo="result" />
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

