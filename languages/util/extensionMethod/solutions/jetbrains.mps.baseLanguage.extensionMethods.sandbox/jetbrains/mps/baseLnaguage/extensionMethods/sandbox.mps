<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:983279f4-89a9-45ad-aeeb-5621fd5cbb63(jetbrains.mps.baseLnaguage.extensionMethods.sandbox)">
  <persistence version="7" />
  <language namespace="5dc5fc0d-37ef-4782-8192-8b5ce1f69f80(jetbrains.mps.baseLanguage.extensionMethods)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="7a5dda62-9140-4668-ab76-d5ed1746f2b2(jetbrains.mps.lang.typesystem)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="k7g3" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.util(JDK/java.util@java_stub)" version="-1" />
  <import index="uigu" modelUID="r:4f6f8ed5-c3d7-49f4-b0dd-d70029feffdf(jetbrains.mps.baseLanguage.extensionMethods.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="uigu.TypeExtension" typeId="uigu.1894531970723270160" id="6791353716095480383">
      <property name="name" nameId="tpck.1169194664001" value="StringExtensionMethods" />
    </node>
    <node type="uigu.SimpleExtensionMethodsContainer" typeId="uigu.8022092943109322131" id="6791353716095480385">
      <property name="name" nameId="tpck.1169194664001" value="Abc" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="3097384118511823189">
      <property name="name" nameId="tpck.1169194664001" value="Test" />
    </node>
  </roots>
  <root id="6791353716095480383">
    <node role="methods" roleId="uigu.8022092943110829339" type="uigu.ExtensionMethodDeclaration" typeId="uigu.1550313277222152185" id="6791353716095480390">
      <property name="name" nameId="tpck.1169194664001" value="foo" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="6791353716095480403" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6791353716095480392">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7685333756920163917">
          <node role="expression" roleId="tpee.1068580123156" type="uigu.LocalExtendedMethodCall" typeId="uigu.7685333756920172912" id="7517860079983492246">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dcharAt(int)%cchar" resolveInfo="charAt" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7685333756920163924">
              <property name="value" nameId="tpee.1068580320021" value="2" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7685333756920172843">
          <node role="expression" roleId="tpee.1068580123156" type="uigu.LocalExtendedMethodCall" typeId="uigu.7685333756920172912" id="7517860079983492181">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dcharAt(int)%cchar" resolveInfo="charAt" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7685333756920172847">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7685333756920232198">
          <node role="expression" roleId="tpee.1068580123156" type="uigu.LocalExtendedMethodCall" typeId="uigu.7685333756920172912" id="7685333756920232199">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dcharAt(int)%cchar" resolveInfo="charAt" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7685333756920232200">
              <property name="value" nameId="tpee.1068580320021" value="4" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7685333756920232202">
          <node role="expression" roleId="tpee.1068580123156" type="uigu.LocalExtendedMethodCall" typeId="uigu.7685333756920172912" id="7517860079983492180">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dcontains(java%dlang%dCharSequence)%cboolean" resolveInfo="contains" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7685333756920232209">
              <property name="value" nameId="tpee.1070475926801" value="" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7685333756920232211">
          <node role="expression" roleId="tpee.1068580123156" type="uigu.LocalExtendedMethodCall" typeId="uigu.7685333756920172912" id="7517860079983492179">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dcontains(java%dlang%dCharSequence)%cboolean" resolveInfo="contains" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7685333756920232215">
              <property name="value" nameId="tpee.1070475926801" value="" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7685333756920232217">
          <node role="expression" roleId="tpee.1068580123156" type="uigu.LocalExtendedMethodCall" typeId="uigu.7685333756920172912" id="7685333756920232218">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dcontains(java%dlang%dCharSequence)%cboolean" resolveInfo="contains" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7685333756920232219">
              <property name="value" nameId="tpee.1070475926801" value="df" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7517860079983474761">
          <node role="expression" roleId="tpee.1068580123156" type="uigu.LocalExtendedMethodCall" typeId="uigu.7685333756920172912" id="7517860079983474762">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dcharAt(int)%cchar" resolveInfo="charAt" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7517860079983474763">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="688031995686448475">
          <node role="expression" roleId="tpee.1068580123156" type="uigu.LocalExtendedMethodCall" typeId="uigu.7685333756920172912" id="688031995686448483">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dcharAt(int)%cchar" resolveInfo="charAt" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="688031995686448482">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6791353716095480405">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6791353716095485596">
            <node role="rightExpression" roleId="tpee.1081773367579" type="uigu.ExtensionStaticFieldReference" typeId="uigu.1973189701690850247" id="6791353716095485599">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6791353716095480388" resolveInfo="str" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="uigu.ThisExtensionExpression" typeId="uigu.3316739663067157299" id="6791353716095480407" />
          </node>
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6791353716095480402" />
    </node>
    <node role="methods" roleId="uigu.8022092943110829339" type="uigu.ExtensionMethodDeclaration" typeId="uigu.1550313277222152185" id="7685333756920172848">
      <property name="name" nameId="tpck.1169194664001" value="foo2" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7685333756920172849" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="7685333756920172852" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7685333756920172851">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7685333756920172853">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7685333756920172854">
            <node role="operation" roleId="tpee.1197027833540" type="uigu.ExtensionMethodCall" typeId="uigu.1550313277221324859" id="7685333756920172855">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6791353716095480390" resolveInfo="foo" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="uigu.ThisExtensionExpression" typeId="uigu.3316739663067157299" id="7685333756920172856" />
          </node>
        </node>
      </node>
      <node role="typeVariableDeclaration" roleId="tpee.1109279881614" type="tpee.TypeVariableDeclaration" typeId="tpee.1109279763828" id="7517860079983490665">
        <property name="name" nameId="tpck.1169194664001" value="T" />
      </node>
    </node>
    <node role="staticFields" roleId="uigu.1973189701690661983" type="uigu.ExtensionStaticFieldDeclaration" typeId="uigu.1973189701691027447" id="6791353716095480388">
      <property name="name" nameId="tpck.1169194664001" value="str" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="6791353716095480395" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6791353716095480400">
        <property name="value" nameId="tpee.1070475926801" value="str" />
      </node>
    </node>
    <node role="staticFields" roleId="uigu.1973189701690661983" type="uigu.ExtensionStaticFieldDeclaration" typeId="uigu.1973189701691027447" id="6791353716095480393">
      <property name="name" nameId="tpck.1169194664001" value="a" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6791353716095480396" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6791353716095480398">
        <property name="value" nameId="tpee.1068580320021" value="0" />
      </node>
    </node>
    <node role="type" roleId="uigu.1894531970723323134" type="tpee.StringType" typeId="tpee.1225271177708" id="6791353716095480387" />
  </root>
  <root id="6791353716095480385">
    <node role="methods" roleId="uigu.8022092943110829339" type="uigu.ExtensionMethodDeclaration" typeId="uigu.1550313277222152185" id="3097384118512197973">
      <property name="name" nameId="tpck.1169194664001" value="foo" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3097384118512197976" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3097384118512197975">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3097384118512197977">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3097384118512197978">
            <property name="name" nameId="tpck.1169194664001" value="a" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="3097384118512197979" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.MulExpression" typeId="tpee.1092119917967" id="3097384118512197983">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3097384118512197986">
                <property name="value" nameId="tpee.1068580320021" value="2" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="uigu.ExtensionStaticFieldReference" typeId="uigu.1973189701690850247" id="3097384118512197982">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6791353716095485630" resolveInfo="b" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="extendedType" roleId="uigu.8022092943109605394" type="tpee.IntegerType" typeId="tpee.1070534370425" id="3097384118512198031" />
    </node>
    <node role="methods" roleId="uigu.8022092943110829339" type="uigu.ExtensionMethodDeclaration" typeId="uigu.1550313277222152185" id="7517860079983491567">
      <property name="name" nameId="tpck.1169194664001" value="sum" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7517860079983491568" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="7517860079983491598" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7517860079983491570">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7517860079983491575">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7517860079983491576">
            <property name="name" nameId="tpck.1169194664001" value="res" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="7517860079983491577" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7517860079983491579">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="7517860079983491581">
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7517860079983491582">
            <property name="name" nameId="tpck.1169194664001" value="a" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="7517860079983491586" />
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="7517860079983491583">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7517860079983491588">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusAssignmentExpression" typeId="tpee.1215695189714" id="7517860079983491590">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7517860079983491593">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7517860079983491582" resolveInfo="a" />
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7517860079983491589">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7517860079983491576" resolveInfo="res" />
                </node>
              </node>
            </node>
          </node>
          <node role="iterable" roleId="tpee.1144226360166" type="uigu.ThisExtensionExpression" typeId="uigu.3316739663067157299" id="7517860079983491587" />
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="7517860079983492017" />
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7517860079983491595">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7517860079983491597">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7517860079983491576" resolveInfo="res" />
          </node>
        </node>
      </node>
      <node role="extendedType" roleId="uigu.8022092943109605394" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7517860079983491635">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~LinkedList" resolveInfo="LinkedList" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7517860079983491637">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
        </node>
      </node>
    </node>
    <node role="staticFields" roleId="uigu.1973189701690661983" type="uigu.ExtensionStaticFieldDeclaration" typeId="uigu.1973189701691027447" id="6791353716095485630">
      <property name="name" nameId="tpck.1169194664001" value="b" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6791353716095485632" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6791353716095485634">
        <property name="value" nameId="tpee.1068580320021" value="2" />
      </node>
    </node>
  </root>
  <root id="3097384118511823189">
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="3097384118511826155">
      <property name="name" nameId="tpck.1169194664001" value="d" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="3097384118511826156" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="3097384118511826158" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3097384118511826160">
        <property name="value" nameId="tpee.1068580320021" value="3" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="3097384118511823195">
      <property name="name" nameId="tpck.1169194664001" value="foo" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3097384118511823196" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3097384118511823197" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3097384118511823198">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7517860079983491600">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7517860079983491601">
            <property name="name" nameId="tpck.1169194664001" value="fl" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7517860079983491629">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7517860079983491631">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~LinkedList%d&lt;init&gt;()" resolveInfo="LinkedList" />
                <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7517860079983491633">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                </node>
              </node>
            </node>
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7517860079983491625">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~LinkedList" resolveInfo="LinkedList" />
              <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7517860079983491627">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7517860079983491638">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7517860079983491640">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7517860079983491639">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7517860079983491601" resolveInfo="fl" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="uigu.ExtensionMethodCall" typeId="uigu.1550313277221324859" id="7517860079983491644">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7517860079983491567" resolveInfo="sum" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3097384118511826162">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="3097384118511826164">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="3097384118511826167">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="3097384118511826163">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3097384118511826155" resolveInfo="d" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3097384118511823190" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="3097384118511823191">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3097384118511823192" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3097384118511823193" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3097384118511823194" />
    </node>
  </root>
</model>

