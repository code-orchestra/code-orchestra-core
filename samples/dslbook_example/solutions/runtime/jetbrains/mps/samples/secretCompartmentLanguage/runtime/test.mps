<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:43e3e907-f65e-4358-a377-baa3670feacf(jetbrains.mps.samples.secretCompartmentLanguage.runtime.test)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="gf2w" modelUID="r:84968794-d306-4a7a-9857-08605b2b07d6(jetbrains.mps.samples.secretCompartmentLanguage.runtime)" version="-1" />
  <import index="pqw3" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#junit.framework(MPS.Classpath/junit.framework@java_stub)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6877931680625740364">
      <property name="isFinal" nameId="tpee.1221565133444" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="Test" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6877931680625741277">
      <property name="isFinal" nameId="tpee.1221565133444" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="HStateMachineFactory" />
    </node>
  </roots>
  <root id="6877931680625740364">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6877931680625740365" />
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625740366">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625741150" resolveInfo="StateMachineTest" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6877931680625740367">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6877931680625740368" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6877931680625740369" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6877931680625740370" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6877931680625740371">
      <property name="name" nameId="tpck.1169194664001" value="test" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6877931680625740372" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6877931680625740373" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6877931680625740374">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6877931680625740375">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6877931680625740376">
            <property name="name" nameId="tpck.1169194664001" value="stateMachineFactory" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625740377">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625741402" resolveInfo="StateMachineFactory" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6877931680625740378">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6877931680625740379">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6877931680625741280" resolveInfo="HStateMachineFactory" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6877931680625740380">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6877931680625740381">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625741160" resolveInfo="init" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625740382">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625740376" resolveInfo="stateMachineFactory" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6877931680625740383">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6877931680625740384">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6877931680625740385">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625741180" resolveInfo="getController" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6877931680625740386">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740165" resolveInfo="handle" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625740387">
                <property name="value" nameId="tpee.1070475926801" value="D1CL" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6877931680625740388">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6877931680625740389">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6877931680625740390">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625741180" resolveInfo="getController" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6877931680625740391">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740165" resolveInfo="handle" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625740392">
                <property name="value" nameId="tpee.1070475926801" value="D2OP" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6877931680625740393">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6877931680625740394">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6877931680625740395">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625741180" resolveInfo="getController" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6877931680625740396">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740165" resolveInfo="handle" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625740397">
                <property name="value" nameId="tpee.1070475926801" value="L1ON" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6877931680625740398">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6877931680625740399">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="pqw3.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="pqw3.~Assert%dassertEquals(java%dlang%dString,java%dlang%dString)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625740400">
              <property name="value" nameId="tpee.1070475926801" value="unlockedPanel" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6877931680625740401">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6877931680625740402">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6877931680625740403">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625741180" resolveInfo="getController" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6877931680625740404">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740159" resolveInfo="getCurrentState" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6877931680625740405">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740597" resolveInfo="getName" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6877931680625741277">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6877931680625741278" />
    <node role="superclass" roleId="tpee.1165602531693" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625741279">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625741402" resolveInfo="StateMachineFactory" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6877931680625741280">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6877931680625741281" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6877931680625741282" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6877931680625741283" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6877931680625741284">
      <property name="name" nameId="tpck.1169194664001" value="getStateMachine" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6877931680625741285" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625741286">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625740838" resolveInfo="StateMachine" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6877931680625741287">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6877931680625741288">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6877931680625741289">
            <property name="name" nameId="tpck.1169194664001" value="doorClosed" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625741290">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625740350" resolveInfo="Event" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6877931680625741291">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6877931680625741292">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740353" resolveInfo="Event" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741293">
                  <property name="value" nameId="tpee.1070475926801" value="doorClosed" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741294">
                  <property name="value" nameId="tpee.1070475926801" value="D1CL" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6877931680625741295">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6877931680625741296">
            <property name="name" nameId="tpck.1169194664001" value="drawOpened" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625741297">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625740350" resolveInfo="Event" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6877931680625741298">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6877931680625741299">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740353" resolveInfo="Event" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741300">
                  <property name="value" nameId="tpee.1070475926801" value="drawOpened" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741301">
                  <property name="value" nameId="tpee.1070475926801" value="D2OP" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6877931680625741302">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6877931680625741303">
            <property name="name" nameId="tpck.1169194664001" value="lightOn" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625741304">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625740350" resolveInfo="Event" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6877931680625741305">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6877931680625741306">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740353" resolveInfo="Event" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741307">
                  <property name="value" nameId="tpee.1070475926801" value="lightOn" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741308">
                  <property name="value" nameId="tpee.1070475926801" value="L1ON" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6877931680625741309">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6877931680625741310">
            <property name="name" nameId="tpck.1169194664001" value="doorOpened" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625741311">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625740350" resolveInfo="Event" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6877931680625741312">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6877931680625741313">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740353" resolveInfo="Event" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741314">
                  <property name="value" nameId="tpee.1070475926801" value="doorOpened" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741315">
                  <property name="value" nameId="tpee.1070475926801" value="D1OP" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6877931680625741316">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6877931680625741317">
            <property name="name" nameId="tpck.1169194664001" value="panelClosed" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625741318">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625740350" resolveInfo="Event" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6877931680625741319">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6877931680625741320">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740353" resolveInfo="Event" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741321">
                  <property name="value" nameId="tpee.1070475926801" value="panelClosed" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741322">
                  <property name="value" nameId="tpee.1070475926801" value="PNCL" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6877931680625741323">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6877931680625741324">
            <property name="name" nameId="tpck.1169194664001" value="idle" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625741325">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625740406" resolveInfo="State" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6877931680625741326">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6877931680625741327">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740458" resolveInfo="State" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741328">
                  <property name="value" nameId="tpee.1070475926801" value="idle" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6877931680625741329">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6877931680625741330">
            <property name="name" nameId="tpck.1169194664001" value="activeState" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625741331">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625740406" resolveInfo="State" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6877931680625741332">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6877931680625741333">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740458" resolveInfo="State" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741334">
                  <property name="value" nameId="tpee.1070475926801" value="active" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6877931680625741335">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6877931680625741336">
            <property name="name" nameId="tpck.1169194664001" value="waitingForLightState" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625741337">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625740406" resolveInfo="State" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6877931680625741338">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6877931680625741339">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740458" resolveInfo="State" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741340">
                  <property name="value" nameId="tpee.1070475926801" value="waitingForLight" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6877931680625741341">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6877931680625741342">
            <property name="name" nameId="tpck.1169194664001" value="waitingForDrawState" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625741343">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625740406" resolveInfo="State" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6877931680625741344">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6877931680625741345">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740458" resolveInfo="State" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741346">
                  <property name="value" nameId="tpee.1070475926801" value="waitingForDraw" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6877931680625741347">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6877931680625741348">
            <property name="name" nameId="tpck.1169194664001" value="unlockedPanelState" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625741349">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625740406" resolveInfo="State" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6877931680625741350">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6877931680625741351">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740458" resolveInfo="State" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6877931680625741352">
                  <property name="value" nameId="tpee.1070475926801" value="unlockedPanel" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6877931680625741353">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6877931680625741354">
            <property name="name" nameId="tpck.1169194664001" value="machine" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6877931680625741355">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="gf2w.6877931680625740838" resolveInfo="StateMachine" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6877931680625741356">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6877931680625741357">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740843" resolveInfo="StateMachine" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741358">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741324" resolveInfo="idle" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6877931680625741359">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6877931680625741360">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741361">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741324" resolveInfo="idle" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6877931680625741362">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740436" resolveInfo="addTransition" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741363">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741289" resolveInfo="doorClosed" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741364">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741330" resolveInfo="activeState" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6877931680625741365">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6877931680625741366">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741367">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741330" resolveInfo="activeState" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6877931680625741368">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740436" resolveInfo="addTransition" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741369">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741296" resolveInfo="drawOpened" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741370">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741336" resolveInfo="waitingForLightState" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6877931680625741371">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6877931680625741372">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741373">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741330" resolveInfo="activeState" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6877931680625741374">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740436" resolveInfo="addTransition" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741375">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741303" resolveInfo="lightOn" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741376">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741342" resolveInfo="waitingForDrawState" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6877931680625741377">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6877931680625741378">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741379">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741336" resolveInfo="waitingForLightState" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6877931680625741380">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740436" resolveInfo="addTransition" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741381">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741303" resolveInfo="lightOn" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741382">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741348" resolveInfo="unlockedPanelState" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6877931680625741383">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6877931680625741384">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741385">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741342" resolveInfo="waitingForDrawState" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6877931680625741386">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740436" resolveInfo="addTransition" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741387">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741296" resolveInfo="drawOpened" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741388">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741348" resolveInfo="unlockedPanelState" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6877931680625741389">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6877931680625741390">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741391">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741348" resolveInfo="unlockedPanelState" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6877931680625741392">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740436" resolveInfo="addTransition" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741393">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741317" resolveInfo="panelClosed" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741394">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741324" resolveInfo="idle" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6877931680625741395">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6877931680625741396">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741397">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741354" resolveInfo="machine" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6877931680625741398">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="gf2w.6877931680625740912" resolveInfo="addResetEvents" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741399">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741310" resolveInfo="doorOpened" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6877931680625741400">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6877931680625741401">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6877931680625741354" resolveInfo="machine" />
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

