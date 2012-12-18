<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:feb4a112-d0b1-417f-b9b7-9058aab93ce6(jetbrains.mps.baseLanguage.math.behavior)">
  <persistence version="7" />
  <language namespace="3f4bc5f5-c6c1-4a28-8b10-c83066ffa4a1(jetbrains.mps.lang.constraints)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="af65afd8-f0dd-4942-87d9-63a55f2a9db1(jetbrains.mps.lang.behavior)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="7a5dda62-9140-4668-ab76-d5ed1746f2b2(jetbrains.mps.lang.typesystem)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="3304fc6e-7c6b-401e-a016-b944934bb21f(jetbrains.mps.baseLanguage.math)" />
  <language namespace="b401a680-8325-4110-8fd3-84331ff25bef(jetbrains.mps.lang.generator)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="3a13115c-633c-4c5c-bbcc-75c4219e9555(jetbrains.mps.lang.quotation)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="39kg" modelUID="r:cb1a36c8-1ffb-415a-aba8-afb9dc042d1b(jetbrains.mps.baseLanguage.math.structure)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="tpek" modelUID="r:00000000-0000-4000-0000-011c895902c0(jetbrains.mps.baseLanguage.behavior)" version="-1" />
  <import index="tpcu" modelUID="r:00000000-0000-4000-0000-011c89590282(jetbrains.mps.lang.core.behavior)" version="-1" />
  <import index="k2b1" modelUID="r:b79696e4-f917-4b28-af17-40e382bc7b82(jetbrains.mps.baseLanguage.math.runtime)" version="-1" />
  <import index="epq1" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.math(JDK/java.math@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tpd4" modelUID="r:00000000-0000-4000-0000-011c895902b4(jetbrains.mps.lang.typesystem.structure)" version="3" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="tp3r" modelUID="r:00000000-0000-4000-0000-011c8959034b(jetbrains.mps.lang.quotation.structure)" version="0" implicit="yes" />
  <import index="1i04" modelUID="r:3270011d-8b2d-4938-8dff-d256a759e017(jetbrains.mps.lang.behavior.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="1i04.ConceptBehavior" typeId="1i04.1225194240794" id="1236440389435">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="bigSymbols" />
      <link role="concept" roleId="1i04.1225194240799" targetNodeId="39kg.1236426954905" resolveInfo="MathSymbol" />
    </node>
    <node type="1i04.ConceptBehavior" typeId="1i04.1225194240794" id="1238405584079">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="highPrecisionArithmetic" />
      <link role="concept" roleId="1i04.1225194240799" targetNodeId="39kg.1238402702427" resolveInfo="DecimalBinaryOperation" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="1238406290274">
      <property name="name" nameId="tpck.1169194664001" value="MathUtil" />
    </node>
    <node type="1i04.ConceptBehavior" typeId="1i04.1225194240794" id="3498370411873438939">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="matrix" />
      <link role="concept" roleId="1i04.1225194240799" targetNodeId="39kg.4815887568697232005" resolveInfo="MatrixConstructor" />
    </node>
    <node type="1i04.ConceptBehavior" typeId="1i04.1225194240794" id="5217243589491051780">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="matrix" />
      <link role="concept" roleId="1i04.1225194240799" targetNodeId="39kg.4815887568697030518" resolveInfo="MatrixType" />
    </node>
    <node type="1i04.ConceptBehavior" typeId="1i04.1225194240794" id="1904947163751563871">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="highPrecisionArithmetic" />
      <link role="concept" roleId="1i04.1225194240799" targetNodeId="39kg.1904947163751448715" resolveInfo="MathContext" />
    </node>
  </roots>
  <root id="1236440389435">
    <node role="method" roleId="1i04.1225194240805" type="1i04.ConceptMethodDeclaration" typeId="1i04.1225194472830" id="1236440390782">
      <property name="name" nameId="tpck.1169194664001" value="getVisibleIndices" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1236440416647">
        <property name="name" nameId="tpck.1169194664001" value="sender" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1236440418758" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1236440623606">
        <property name="name" nameId="tpck.1169194664001" value="indices" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="1236440624530">
          <link role="elementConcept" roleId="tp25.1145383142433" targetNodeId="39kg.1236426976680" resolveInfo="MathSymbolIndex" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1236440390784">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1236440451754">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1236440451755">
            <property name="name" nameId="tpck.1169194664001" value="sI" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1236440451756">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="39kg.1236589266912" resolveInfo="AbstractIndex" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1236440460962">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1236440460695">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1236440416647" resolveInfo="sender" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="1236440465059">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="1236440465060">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1236589462689">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="39kg.1236589266912" resolveInfo="AbstractIndex" />
                  </node>
                </node>
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Inclusion" typeId="tp25.1144100932627" id="1236440603182" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1238334881762">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1238334881763">
            <property name="name" nameId="tpck.1169194664001" value="i" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1238334881764" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1236440595176">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1236440595177">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1236440632562">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1236440633783">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1236440632563">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1236440623606" resolveInfo="indices" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="1236440635037">
                  <node role="argument" roleId="tp2q.1160612519549" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1236440637151">
                    <node role="operand" roleId="tpee.1197027771414" type="1i04.ThisNodeExpression" typeId="1i04.1225194691553" id="1236440636853" />
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1236440638031">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="39kg.1236427007990" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="1236440618210">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1236440618211">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1236440451755" resolveInfo="sI" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1236440618212">
              <node role="operand" roleId="tpee.1197027771414" type="1i04.ThisNodeExpression" typeId="1i04.1225194691553" id="1236440618213" />
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1236440618214">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="39kg.1236427007990" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1236440647503">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1236440647504">
            <property name="name" nameId="tpck.1169194664001" value="ms" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1236440647505">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="39kg.1236426954905" resolveInfo="MathSymbol" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1236440656446">
              <node role="operand" roleId="tpee.1197027771414" type="1i04.ThisNodeExpression" typeId="1i04.1225194691553" id="1236440655929" />
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="1236440658872">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="1236440658873">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1236440663766">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="39kg.1236426954905" resolveInfo="MathSymbol" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1236440677385">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1236440677386">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1236440685960">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1236440686494">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1236440685961">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1236440647504" resolveInfo="ms" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="1236440689420">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1236440390782" resolveInfo="getVisibleIndices" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="1i04.ThisNodeExpression" typeId="1i04.1225194691553" id="1236440692967" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1236440711485">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1236440623606" resolveInfo="indices" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="1236440681847">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1236440684756" />
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1236440679170">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1236440647504" resolveInfo="ms" />
            </node>
          </node>
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1236440392957" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1236440400099" />
    </node>
    <node role="method" roleId="1i04.1225194240805" type="1i04.ConceptMethodDeclaration" typeId="1i04.1225194472830" id="1237828382992">
      <property name="name" nameId="tpck.1169194664001" value="getEmptyIndexList" />
      <node role="returnType" roleId="tpee.1068580123133" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="1237828388106">
        <link role="elementConcept" roleId="tp25.1145383142433" targetNodeId="39kg.1236426976680" resolveInfo="MathSymbolIndex" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1237828382994">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1237828408196">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1237828409260">
            <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeListCreator" typeId="tp25.1145567426890" id="1237828410543">
              <node role="createdType" roleId="tp25.1145567471833" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="1237828410544">
                <link role="elementConcept" roleId="tp25.1145383142433" targetNodeId="39kg.1236426976680" resolveInfo="MathSymbolIndex" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1237828385855" />
    </node>
    <node role="constructor" roleId="1i04.1225194240801" type="1i04.ConceptConstructorDeclaration" typeId="1i04.1225194413805" id="1236440389436">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1236440389437" />
    </node>
  </root>
  <root id="1238405584079">
    <node role="constructor" roleId="1i04.1225194240801" type="1i04.ConceptConstructorDeclaration" typeId="1i04.1225194413805" id="1238405584080">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238405584081" />
    </node>
  </root>
  <root id="1238406290274">
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="2705856473428695571">
      <property name="name" nameId="tpck.1169194664001" value="operations" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="2705856473428695572" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="2705856473428695573">
        <node role="componentType" roleId="tpee.1070534760952" type="tp25.SNodeType" typeId="tp25.1138055754698" id="2705856473428695574">
          <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
        </node>
      </node>
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.ArrayLiteral" typeId="tpee.1188220165133" id="2705856473428695575">
        <node role="item" roleId="tpee.1188220173759" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428695576">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="2705856473428695577" />
        </node>
        <node role="item" roleId="tpee.1188220173759" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428695578">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2705856473428695579">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="k2b1.877422884702861367" resolveInfo="Matrix" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="k2b1.877422884702861416" resolveInfo="soShort" />
          </node>
        </node>
        <node role="item" roleId="tpee.1188220173759" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428695580">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2705856473428695581">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="k2b1.877422884702861367" resolveInfo="Matrix" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="k2b1.877422884702861463" resolveInfo="soInt" />
          </node>
        </node>
        <node role="item" roleId="tpee.1188220173759" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428695582">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2705856473428695583">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="k2b1.877422884702861367" resolveInfo="Matrix" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="k2b1.877422884702861510" resolveInfo="soLong" />
          </node>
        </node>
        <node role="item" roleId="tpee.1188220173759" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428695584">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2705856473428695585">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="k2b1.877422884702861367" resolveInfo="Matrix" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="k2b1.877422884702861557" resolveInfo="soFloat" />
          </node>
        </node>
        <node role="item" roleId="tpee.1188220173759" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428695586">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2705856473428695587">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="k2b1.877422884702861367" resolveInfo="Matrix" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="k2b1.877422884702861604" resolveInfo="soDouble" />
          </node>
        </node>
        <node role="item" roleId="tpee.1188220173759" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428695588">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2705856473428695589">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="k2b1.877422884702861367" resolveInfo="Matrix" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="k2b1.877422884702861651" resolveInfo="soBigInteger" />
          </node>
        </node>
        <node role="item" roleId="tpee.1188220173759" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428695590">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2705856473428695591">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="k2b1.877422884702861367" resolveInfo="Matrix" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="k2b1.877422884702861698" resolveInfo="soBigDecimal" />
          </node>
        </node>
        <node role="item" roleId="tpee.1188220173759" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428695592">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2705856473428695593">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="k2b1.877422884702861367" resolveInfo="Matrix" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="k2b1.877422884702861745" resolveInfo="soComplex" />
          </node>
        </node>
        <node role="item" roleId="tpee.1188220173759" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428695594">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2705856473428695595">
            <link role="classifier" roleId="tpee.1144433057691" targetNodeId="k2b1.877422884702861367" resolveInfo="Matrix" />
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="k2b1.877422884702861792" resolveInfo="soBigComplex" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1238406301498">
      <property name="name" nameId="tpck.1169194664001" value="applicable" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1238406315361">
        <property name="name" nameId="tpck.1169194664001" value="contextParent" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1238406317801" />
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1238406304564" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1238406301500" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238406301501">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1238406776198">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1238406776199">
            <property name="name" nameId="tpck.1169194664001" value="operation_ok" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1238406776200" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.OrExpression" typeId="tpee.1080223426719" id="1238406794431">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.OrExpression" typeId="tpee.1080223426719" id="1238406794426">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.OrExpression" typeId="tpee.1080223426719" id="1238406794421">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238406794422">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238406794423">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238406315361" resolveInfo="contextParent" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="1238406794424">
                      <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1238406794425">
                        <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tpee.1068581242875" resolveInfo="PlusExpression" />
                      </node>
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238406794427">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238406794428">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238406315361" resolveInfo="contextParent" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="1238406794429">
                      <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1238406794430">
                        <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tpee.1095950406618" resolveInfo="DivExpression" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238406794432">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238406794433">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238406315361" resolveInfo="contextParent" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="1238406794434">
                    <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1238406794435">
                      <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tpee.1092119917967" resolveInfo="MulExpression" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238406794436">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238406794437">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238406315361" resolveInfo="contextParent" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="1238406794438">
                  <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1238406794439">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tpee.1068581242869" resolveInfo="MinusExpression" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1238406803974">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1238406803975">
            <property name="name" nameId="tpck.1169194664001" value="types_ok" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1238406803976" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.OrExpression" typeId="tpee.1080223426719" id="1238425133423">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238406811603">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238406811604">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238406811605">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238406315361" resolveInfo="contextParent" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpd4.Node_TypeOperation" typeId="tpd4.1176544042499" id="1238406811622" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="1238406811623">
                  <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1238406811624">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="39kg.1237106070629" resolveInfo="BigDecimalType" />
                  </node>
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238425136286">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238425136287">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238425136288">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238406315361" resolveInfo="contextParent" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpd4.Node_TypeOperation" typeId="tpd4.1176544042499" id="1238425136289" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="1238425136290">
                  <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1238425140057">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="39kg.1237108887116" resolveInfo="BigComplexType" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1238406330222">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1238406415158">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238406801285">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238406776199" resolveInfo="operation_ok" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238406815219">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238406803975" resolveInfo="types_ok" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1238942002669">
      <property name="name" nameId="tpck.1169194664001" value="convert1" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1238942033965">
        <property name="name" nameId="tpck.1169194664001" value="bmc" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1238942035826">
          <link role="concept" roleId="tp25.1138405853777" targetNodeId="39kg.1238402702427" resolveInfo="DecimalBinaryOperation" />
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1238942017380">
        <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1081773326031" resolveInfo="BinaryOperation" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1238942002671" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238942002672">
        <node role="statement" roleId="tpee.1068581517665" type="tpd4.MatchStatement" typeId="tpd4.1177514343197" id="1238942028288">
          <node role="expression" roleId="tpd4.1177514369598" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238942048968">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238942033965" resolveInfo="bmc" />
          </node>
          <node role="item" roleId="tpd4.1177514347409" type="tpd4.MatchStatementItem" typeId="tpd4.1177514840044" id="1238942028290">
            <node role="condition" roleId="tpd4.1177514849858" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1238942028291">
              <property name="name" nameId="tpck.1169194664001" value="p" />
              <link role="concept" roleId="tpd4.1174642800329" targetNodeId="39kg.1238940230440" resolveInfo="DecimalPlusExpression" />
            </node>
            <node role="ifTrue" roleId="tpd4.1177514864202" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238942028292">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1238942028293">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1238942028294">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1238942028295">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942028296">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942028297">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942028298">
                          <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1238942028299">
                            <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1238942028291" resolveInfo="p" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942028300">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367579" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942028301">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942028302">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942028303">
                          <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1238942028304">
                            <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1238942028291" resolveInfo="p" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942028305">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367580" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="item" roleId="tpd4.1177514347409" type="tpd4.MatchStatementItem" typeId="tpd4.1177514840044" id="1238942028306">
            <node role="condition" roleId="tpd4.1177514849858" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1238942028307">
              <property name="name" nameId="tpck.1169194664001" value="m" />
              <link role="concept" roleId="tpd4.1174642800329" targetNodeId="39kg.1238940287286" resolveInfo="DecimalMinusExpression" />
            </node>
            <node role="ifTrue" roleId="tpd4.1177514864202" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238942028308">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1238942028309">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1238942028310">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="1238942028311">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942028312">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942028313">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942028314">
                          <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1238942028315">
                            <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1238942028307" resolveInfo="m" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942028316">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367579" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942028317">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942028318">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942028319">
                          <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1238942028320">
                            <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1238942028307" resolveInfo="m" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942028321">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367580" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="item" roleId="tpd4.1177514347409" type="tpd4.MatchStatementItem" typeId="tpd4.1177514840044" id="1238942028322">
            <node role="condition" roleId="tpd4.1177514849858" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1238942028323">
              <property name="name" nameId="tpck.1169194664001" value="m" />
              <link role="concept" roleId="tpd4.1174642800329" targetNodeId="39kg.1238940210376" resolveInfo="DecimalMulExpression" />
            </node>
            <node role="ifTrue" roleId="tpd4.1177514864202" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238942028324">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1238942028325">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1238942028326">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.MulExpression" typeId="tpee.1092119917967" id="1238942028327">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942028328">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942028329">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942028330">
                          <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1238942028331">
                            <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1238942028323" resolveInfo="m" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942028332">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367579" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942028333">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942028334">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942028335">
                          <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1238942028336">
                            <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1238942028323" resolveInfo="m" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942028337">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367580" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="item" roleId="tpd4.1177514347409" type="tpd4.MatchStatementItem" typeId="tpd4.1177514840044" id="1238942028338">
            <node role="condition" roleId="tpd4.1177514849858" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1238942028339">
              <property name="name" nameId="tpck.1169194664001" value="d" />
              <link role="concept" roleId="tpd4.1174642800329" targetNodeId="39kg.1238940192891" resolveInfo="DecimalDivExpression" />
            </node>
            <node role="ifTrue" roleId="tpd4.1177514864202" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238942028340">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1238942028341">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1238942028342">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.DivExpression" typeId="tpee.1095950406618" id="1238942028343">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942028344">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942028345">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942028346">
                          <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1238942028347">
                            <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1238942028339" resolveInfo="d" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942028348">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367579" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942028349">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942028350">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942028351">
                          <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1238942028352">
                            <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1238942028339" resolveInfo="d" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942028353">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367580" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpd4.1177514345236" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1238942028354">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1238942028355" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1238942053978">
      <property name="name" nameId="tpck.1169194664001" value="convert2" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1238942053979">
        <property name="name" nameId="tpck.1169194664001" value="bmc" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1238942053980">
          <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1081773326031" resolveInfo="BinaryOperation" />
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1238942053981">
        <link role="concept" roleId="tp25.1138405853777" targetNodeId="39kg.1238402702427" resolveInfo="DecimalBinaryOperation" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1238942053982" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238942053983">
        <node role="statement" roleId="tpee.1068581517665" type="tpd4.MatchStatement" typeId="tpd4.1177514343197" id="1238942053984">
          <node role="expression" roleId="tpd4.1177514369598" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238942053985">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238942053979" resolveInfo="bmc" />
          </node>
          <node role="item" roleId="tpd4.1177514347409" type="tpd4.MatchStatementItem" typeId="tpd4.1177514840044" id="1238942053986">
            <node role="condition" roleId="tpd4.1177514849858" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1238942053987">
              <property name="name" nameId="tpck.1169194664001" value="plusExpression" />
              <link role="concept" roleId="tpd4.1174642800329" targetNodeId="tpee.1068581242875" resolveInfo="PlusExpression" />
            </node>
            <node role="ifTrue" roleId="tpd4.1177514864202" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238942053988">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1238942706480">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1238942707841">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="39kg.DecimalPlusExpression" typeId="39kg.1238940230440" id="1238942711437">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942711438">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942714520">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942740414">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238942739304">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238942053979" resolveInfo="bmc" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942744121">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367579" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942711439">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942713534">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942732148">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238942731554">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238942053979" resolveInfo="bmc" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942735787">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367580" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="item" roleId="tpd4.1177514347409" type="tpd4.MatchStatementItem" typeId="tpd4.1177514840044" id="1238942054002">
            <node role="condition" roleId="tpd4.1177514849858" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1238942054003">
              <property name="name" nameId="tpck.1169194664001" value="minusExpression" />
              <link role="concept" roleId="tpd4.1174642800329" targetNodeId="tpee.1068581242869" resolveInfo="MinusExpression" />
            </node>
            <node role="ifTrue" roleId="tpd4.1177514864202" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238942054004">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1238942054005">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1238942754077">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="39kg.DecimalMinusExpression" typeId="39kg.1238940287286" id="1238942776383">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942776384">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942831420">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942836328">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238942836329">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238942053979" resolveInfo="bmc" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942836330">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367579" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942776385">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942828348">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942843587">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238942843588">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238942053979" resolveInfo="bmc" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942843589">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367580" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="item" roleId="tpd4.1177514347409" type="tpd4.MatchStatementItem" typeId="tpd4.1177514840044" id="1238942054018">
            <node role="condition" roleId="tpd4.1177514849858" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1238942054019">
              <property name="name" nameId="tpck.1169194664001" value="mulExpression" />
              <link role="concept" roleId="tpd4.1174642800329" targetNodeId="tpee.1092119917967" resolveInfo="MulExpression" />
            </node>
            <node role="ifTrue" roleId="tpd4.1177514864202" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238942054020">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1238942054021">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1238942756449">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="39kg.DecimalMulExpression" typeId="39kg.1238940210376" id="1238942800703">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942800704">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942830809">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942837612">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238942837613">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238942053979" resolveInfo="bmc" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942837614">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367579" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942800705">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942829053">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942844996">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238942844997">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238942053979" resolveInfo="bmc" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942844998">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367580" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="item" roleId="tpd4.1177514347409" type="tpd4.MatchStatementItem" typeId="tpd4.1177514840044" id="1238942054034">
            <node role="condition" roleId="tpd4.1177514849858" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1238942054035">
              <property name="name" nameId="tpck.1169194664001" value="divExpression" />
              <link role="concept" roleId="tpd4.1174642800329" targetNodeId="tpee.1095950406618" resolveInfo="DivExpression" />
            </node>
            <node role="ifTrue" roleId="tpd4.1177514864202" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238942054036">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1238942054037">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1238942758900">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="39kg.DecimalDivExpression" typeId="39kg.1238940192891" id="1238942806065">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942806066">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942830276">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942838850">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238942838851">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238942053979" resolveInfo="bmc" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942838852">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367579" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.Expression" typeId="tpee.1068431790191" id="1238942806067">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1238942829617">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238942846264">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1238942846265">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1238942053979" resolveInfo="bmc" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1238942846266">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1081773367580" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpd4.1177514345236" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1238942054050">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1238942054051" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1300076822026746759">
      <property name="name" nameId="tpck.1169194664001" value="getMathContext" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1300076822026746819">
        <property name="name" nameId="tpck.1169194664001" value="node" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1300076822026746821" />
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1300076822026746823">
        <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1300076822026746761" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026746762">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1904947163751464629">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1904947163751464630">
            <property name="name" nameId="tpck.1169194664001" value="mc" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1904947163751464631">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="39kg.1904947163751448715" resolveInfo="MathContext" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpd4.MatchStatement" typeId="tpd4.1177514343197" id="1300076822026748097">
          <node role="expression" roleId="tpd4.1177514369598" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1300076822026748102">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1300076822026746819" resolveInfo="node" />
          </node>
          <node role="item" roleId="tpd4.1177514347409" type="tpd4.MatchStatementItem" typeId="tpd4.1177514840044" id="1300076822026748099">
            <node role="condition" roleId="tpd4.1177514849858" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1300076822026748103">
              <property name="name" nameId="tpck.1169194664001" value="op" />
              <link role="concept" roleId="tpd4.1174642800329" targetNodeId="39kg.1238402702427" resolveInfo="DecimalBinaryOperation" />
            </node>
            <node role="ifTrue" roleId="tpd4.1177514864202" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026748101">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1904947163751464633">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1904947163751464635">
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1904947163751464639">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1904947163751464638">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1300076822026748103" resolveInfo="op" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1904947163751464643">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="39kg.1904947163751462528" />
                    </node>
                  </node>
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1904947163751464634">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1904947163751464630" resolveInfo="mc" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="item" roleId="tpd4.1177514347409" type="tpd4.MatchStatementItem" typeId="tpd4.1177514840044" id="1904947163751468050">
            <node role="condition" roleId="tpd4.1177514849858" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1904947163751468053">
              <property name="name" nameId="tpck.1169194664001" value="sol" />
              <link role="concept" roleId="tpd4.1174642800329" targetNodeId="39kg.1418611629042457277" resolveInfo="LinearSolveOperation" />
            </node>
            <node role="ifTrue" roleId="tpd4.1177514864202" type="tpee.StatementList" typeId="tpee.1068580123136" id="1904947163751468052">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1904947163751468058">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1904947163751468060">
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1904947163751468064">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1904947163751468063">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1904947163751468053" resolveInfo="sol" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1904947163751468068">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="39kg.1904947163751468044" />
                    </node>
                  </node>
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1904947163751468059">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1904947163751464630" resolveInfo="mc" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="item" roleId="tpd4.1177514347409" type="tpd4.MatchStatementItem" typeId="tpd4.1177514840044" id="1904947163751468054">
            <node role="condition" roleId="tpd4.1177514849858" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1904947163751468057">
              <property name="name" nameId="tpck.1169194664001" value="inv" />
              <link role="concept" roleId="tpd4.1174642800329" targetNodeId="39kg.1418611629042457276" resolveInfo="MatrixInverseOperation" />
            </node>
            <node role="ifTrue" roleId="tpd4.1177514864202" type="tpee.StatementList" typeId="tpee.1068580123136" id="1904947163751468056">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1904947163751468069">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1904947163751468071">
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1904947163751468075">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1904947163751468074">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1904947163751468057" resolveInfo="inv" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1904947163751468079">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="39kg.1904947163751464663" />
                    </node>
                  </node>
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1904947163751468070">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1904947163751464630" resolveInfo="mc" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpd4.1177514345236" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026748166">
            <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026748168">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1300076822026748170" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SwitchStatement" typeId="tpee.1163670490218" id="1300076822026746764">
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1300076822026746765">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1300076822026746766">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026746767">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026746768">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026746769">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1300076822026746770">
                    <link role="classifier" roleId="tpee.1144433057691" targetNodeId="epq1.~MathContext" resolveInfo="MathContext" />
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="epq1.~MathContext%dDECIMAL32" resolveInfo="DECIMAL32" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1300076822026746771">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1300076822026746772">
              <property name="value" nameId="tpee.1068580320021" value="2" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026746773">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026746774">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026746775">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1300076822026746776">
                    <link role="classifier" roleId="tpee.1144433057691" targetNodeId="epq1.~MathContext" resolveInfo="MathContext" />
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="epq1.~MathContext%dDECIMAL64" resolveInfo="DECIMAL64" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1300076822026746777">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1300076822026746778">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026746779">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026746780">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026746781">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1300076822026746782">
                    <link role="classifier" roleId="tpee.1144433057691" targetNodeId="epq1.~MathContext" resolveInfo="MathContext" />
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="epq1.~MathContext%dDECIMAL128" resolveInfo="DECIMAL128" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1300076822026746783">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1300076822026746784">
              <property name="value" nameId="tpee.1068580320021" value="4" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026746785">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026746786">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026746787">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1300076822026746788">
                    <link role="classifier" roleId="tpee.1144433057691" targetNodeId="epq1.~MathContext" resolveInfo="MathContext" />
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="epq1.~MathContext%dUNLIMITED" resolveInfo="UNLIMITED" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="defaultBlock" roleId="tpee.1163670592366" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026746792">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1300076822026746793">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1300076822026746794">
                <property name="name" nameId="tpck.1169194664001" value="c" />
                <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1300076822026746795">
                  <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1068580320020" resolveInfo="IntegerConstant" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1300076822026746796">
                  <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeCreator" typeId="tp25.1180636770613" id="1300076822026746797">
                    <node role="createdType" roleId="tp25.1180636770616" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1300076822026746798">
                      <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1068580320020" resolveInfo="IntegerConstant" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1300076822026746799">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1300076822026746800">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1300076822026746804">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1300076822026746805">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1300076822026746794" resolveInfo="c" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1300076822026746806">
                    <link role="property" roleId="tp25.1138056395725" targetNodeId="tpee.1068580320021" resolveInfo="value" />
                  </node>
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1904947163751464652">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1904947163751464651">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1904947163751464630" resolveInfo="mc" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1904947163751464656">
                    <link role="property" roleId="tp25.1138056395725" targetNodeId="39kg.1904947163751462196" resolveInfo="precision" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026746807">
              <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026746808">
                <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1300076822026746809">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1300076822026746810">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="epq1.~MathContext%d&lt;init&gt;(int,java%dmath%dRoundingMode)" resolveInfo="MathContext" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.Expression" typeId="tpee.1068431790191" id="1300076822026746811">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1300076822026746812">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1300076822026746813">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1300076822026746794" resolveInfo="c" />
                        </node>
                      </node>
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.Expression" typeId="tpee.1068431790191" id="1300076822026746814">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1300076822026746815">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1300076822026748066">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1300076822026747996" resolveInfo="getRoundingMode" />
                          <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1238406290274" resolveInfo="MathUtil" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1904947163751464658">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1904947163751464657">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1904947163751464630" resolveInfo="mc" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1904947163751464662">
                              <link role="property" roleId="tp25.1138056395725" targetNodeId="39kg.1904947163751462195" resolveInfo="roundingMode" />
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
          <node role="expression" roleId="tpee.1163670766145" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1904947163751464646">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1904947163751464645">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1904947163751464630" resolveInfo="mc" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1904947163751464650">
              <link role="property" roleId="tp25.1138056395725" targetNodeId="39kg.1904947163751462197" resolveInfo="precisionSetting" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1300076822026747996">
      <property name="name" nameId="tpck.1169194664001" value="getRoundingMode" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1300076822026748055">
        <property name="name" nameId="tpck.1169194664001" value="roundingMode" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1300076822026748057" />
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1300076822026748058">
        <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1300076822026747998" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026747999">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SwitchStatement" typeId="tpee.1163670490218" id="1300076822026748000">
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1300076822026748001">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1300076822026748002">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026748003">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026748004">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026748005">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="1300076822026748006">
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="epq1.~RoundingMode" resolveInfo="RoundingMode" />
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="epq1.~RoundingMode%dCEILING" resolveInfo="CEILING" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1300076822026748007">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1300076822026748008">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026748009">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026748010">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026748011">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="1300076822026748012">
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="epq1.~RoundingMode" resolveInfo="RoundingMode" />
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="epq1.~RoundingMode%dDOWN" resolveInfo="DOWN" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1300076822026748013">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1300076822026748014">
              <property name="value" nameId="tpee.1068580320021" value="2" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026748015">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026748016">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026748017">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="1300076822026748018">
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="epq1.~RoundingMode" resolveInfo="RoundingMode" />
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="epq1.~RoundingMode%dFLOOR" resolveInfo="FLOOR" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1300076822026748019">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1300076822026748020">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026748021">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026748022">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026748023">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="1300076822026748024">
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="epq1.~RoundingMode" resolveInfo="RoundingMode" />
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="epq1.~RoundingMode%dHALF_DOWN" resolveInfo="HALF_DOWN" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1300076822026748025">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1300076822026748026">
              <property name="value" nameId="tpee.1068580320021" value="4" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026748027">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026748028">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026748029">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="1300076822026748030">
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="epq1.~RoundingMode" resolveInfo="RoundingMode" />
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="epq1.~RoundingMode%dHALF_EVEN" resolveInfo="HALF_EVEN" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1300076822026748031">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1300076822026748032">
              <property name="value" nameId="tpee.1068580320021" value="5" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026748033">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026748034">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026748035">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="1300076822026748036">
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="epq1.~RoundingMode" resolveInfo="RoundingMode" />
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="epq1.~RoundingMode%dHALF_UP" resolveInfo="HALF_UP" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1300076822026748037">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1300076822026748038">
              <property name="value" nameId="tpee.1068580320021" value="6" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026748039">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026748040">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026748041">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="1300076822026748042">
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="epq1.~RoundingMode" resolveInfo="RoundingMode" />
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="epq1.~RoundingMode%dUNNECESSARY" resolveInfo="UNNECESSARY" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1300076822026748043">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1300076822026748044">
              <property name="value" nameId="tpee.1068580320021" value="7" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026748045">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026748046">
                <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1300076822026748047">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="1300076822026748048">
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="epq1.~RoundingMode" resolveInfo="RoundingMode" />
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="epq1.~RoundingMode%dUP" resolveInfo="UP" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="defaultBlock" roleId="tpee.1163670592366" type="tpee.StatementList" typeId="tpee.1068580123136" id="1300076822026748052">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1300076822026748053">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1300076822026748054" />
            </node>
          </node>
          <node role="expression" roleId="tpee.1163670766145" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1300076822026748059">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1300076822026748055" resolveInfo="roundingMode" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2705856473428697721">
      <property name="name" nameId="tpck.1169194664001" value="getUnboxedElementType" />
      <node role="returnType" roleId="tpee.1068580123133" type="tp25.SNodeType" typeId="tp25.1138055754698" id="2705856473428697722">
        <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2705856473428697723" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697724">
        <node role="statement" roleId="tpee.1068581517665" type="tpd4.MatchStatement" typeId="tpd4.1177514343197" id="2705856473428697725">
          <node role="expression" roleId="tpd4.1177514369598" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697726">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697747" resolveInfo="t" />
          </node>
          <node role="item" roleId="tpd4.1177514347409" type="tpd4.MatchStatementItem" typeId="tpd4.1177514840044" id="2705856473428697727">
            <node role="condition" roleId="tpd4.1177514849858" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2705856473428697728">
              <property name="name" nameId="tpck.1169194664001" value="matrixType" />
              <link role="concept" roleId="tpd4.1174642800329" targetNodeId="39kg.4815887568697030518" resolveInfo="MatrixType" />
            </node>
            <node role="ifTrue" roleId="tpd4.1177514864202" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697729">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697730">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697731">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697732">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2705856473428697733">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2705856473428697728" resolveInfo="matrixType" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2705856473428697734">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="39kg.4815887568697050707" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="2705856473428697735">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpek.1213877337320" resolveInfo="getUnboxedType" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="item" roleId="tpd4.1177514347409" type="tpd4.MatchStatementItem" typeId="tpd4.1177514840044" id="2705856473428697736">
            <node role="condition" roleId="tpd4.1177514849858" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2705856473428697737">
              <property name="name" nameId="tpck.1169194664001" value="vectorType" />
              <link role="concept" roleId="tpd4.1174642800329" targetNodeId="39kg.4815887568697030517" resolveInfo="VectorType" />
            </node>
            <node role="ifTrue" roleId="tpd4.1177514864202" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697738">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697739">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697740">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697741">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2705856473428697742">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2705856473428697737" resolveInfo="vectorType" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2705856473428697743">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="39kg.4815887568697050735" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="2705856473428697744">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpek.1213877337320" resolveInfo="getUnboxedType" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpd4.1177514345236" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697745">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="2705856473428697746" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2705856473428697747">
        <property name="name" nameId="tpck.1169194664001" value="t" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="2705856473428697748" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2705856473428697749">
      <property name="name" nameId="tpck.1169194664001" value="getIndex" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2705856473428697750">
        <property name="name" nameId="tpck.1169194664001" value="node" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="2705856473428697751" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2705856473428697752" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697753">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2705856473428697754">
          <node role="condition" roleId="tpee.1068580123160" type="tp25.EqualsStructurallyExpression" typeId="tp25.1227264722563" id="2705856473428697755">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428697756">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2705856473428697757">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Short" resolveInfo="Short" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2705856473428697758">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2705856473428697721" resolveInfo="getUnboxedElementType" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697759">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697760">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697750" resolveInfo="node" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpd4.Node_TypeOperation" typeId="tpd4.1176544042499" id="2705856473428697761" />
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697762">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697763">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2705856473428697764">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2705856473428697765">
          <node role="condition" roleId="tpee.1068580123160" type="tp25.EqualsStructurallyExpression" typeId="tp25.1227264722563" id="2705856473428697766">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428697767">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2705856473428697768">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2705856473428697769">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2705856473428697721" resolveInfo="getUnboxedElementType" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697770">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697771">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697750" resolveInfo="node" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpd4.Node_TypeOperation" typeId="tpd4.1176544042499" id="2705856473428697772" />
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697773">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697774">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2705856473428697775">
                <property name="value" nameId="tpee.1068580320021" value="2" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2705856473428697776">
          <node role="condition" roleId="tpee.1068580123160" type="tp25.EqualsStructurallyExpression" typeId="tp25.1227264722563" id="2705856473428697777">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428697778">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2705856473428697779">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Long" resolveInfo="Long" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2705856473428697780">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2705856473428697721" resolveInfo="getUnboxedElementType" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697781">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697782">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697750" resolveInfo="node" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpd4.Node_TypeOperation" typeId="tpd4.1176544042499" id="2705856473428697783" />
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697784">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697785">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2705856473428697786">
                <property name="value" nameId="tpee.1068580320021" value="3" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2705856473428697787">
          <node role="condition" roleId="tpee.1068580123160" type="tp25.EqualsStructurallyExpression" typeId="tp25.1227264722563" id="2705856473428697788">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428697789">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2705856473428697790">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Float" resolveInfo="Float" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2705856473428697791">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2705856473428697721" resolveInfo="getUnboxedElementType" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697792">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697793">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697750" resolveInfo="node" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpd4.Node_TypeOperation" typeId="tpd4.1176544042499" id="2705856473428697794" />
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697795">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697796">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2705856473428697797">
                <property name="value" nameId="tpee.1068580320021" value="4" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2705856473428697798">
          <node role="condition" roleId="tpee.1068580123160" type="tp25.EqualsStructurallyExpression" typeId="tp25.1227264722563" id="2705856473428697799">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428697800">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2705856473428697801">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" resolveInfo="Double" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2705856473428697802">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2705856473428697721" resolveInfo="getUnboxedElementType" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697803">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697804">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697750" resolveInfo="node" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpd4.Node_TypeOperation" typeId="tpd4.1176544042499" id="2705856473428697805" />
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697806">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697807">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2705856473428697808">
                <property name="value" nameId="tpee.1068580320021" value="5" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2705856473428697809">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697810">
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="2705856473428697811">
              <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2705856473428697812">
                <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="39kg.1237106079927" resolveInfo="BigIntegerType" />
              </node>
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2705856473428697813">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2705856473428697721" resolveInfo="getUnboxedElementType" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697814">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697815">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697750" resolveInfo="node" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpd4.Node_TypeOperation" typeId="tpd4.1176544042499" id="2705856473428697816" />
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697817">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697818">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2705856473428697819">
                <property name="value" nameId="tpee.1068580320021" value="6" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2705856473428697820">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697821">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2705856473428697822">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2705856473428697721" resolveInfo="getUnboxedElementType" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697823">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697824">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697750" resolveInfo="node" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpd4.Node_TypeOperation" typeId="tpd4.1176544042499" id="2705856473428697825" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="2705856473428697826">
              <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2705856473428697827">
                <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="39kg.1237106070629" resolveInfo="BigDecimalType" />
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697828">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697829">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2705856473428697830">
                <property name="value" nameId="tpee.1068580320021" value="7" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2705856473428697831">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697832">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2705856473428697833">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2705856473428697721" resolveInfo="getUnboxedElementType" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697834">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697835">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697750" resolveInfo="node" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpd4.Node_TypeOperation" typeId="tpd4.1176544042499" id="2705856473428697836" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="2705856473428697837">
              <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2705856473428697838">
                <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="39kg.1237107700024" resolveInfo="ComplexType" />
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697839">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697840">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2705856473428697841">
                <property name="value" nameId="tpee.1068580320021" value="8" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2705856473428697842">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697843">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2705856473428697844">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2705856473428697721" resolveInfo="getUnboxedElementType" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697845">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697846">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697750" resolveInfo="node" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpd4.Node_TypeOperation" typeId="tpd4.1176544042499" id="2705856473428697847" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="2705856473428697848">
              <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2705856473428697849">
                <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="39kg.1237108887116" resolveInfo="BigComplexType" />
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697850">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697851">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2705856473428697852">
                <property name="value" nameId="tpee.1068580320021" value="9" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697853">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2705856473428697854">
            <property name="value" nameId="tpee.1068580320021" value="0" />
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2705856473428697855" />
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2705856473428697856">
      <property name="name" nameId="tpck.1169194664001" value="operConstant" />
      <node role="returnType" roleId="tpee.1068580123133" type="tp25.SNodeType" typeId="tp25.1138055754698" id="2705856473428697857">
        <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2705856473428697858" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697859">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2705856473428697860">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2705856473428697861">
            <property name="name" nameId="tpck.1169194664001" value="b1" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2705856473428697862" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697863">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2705856473428697864">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2705856473428697721" resolveInfo="getUnboxedElementType" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697865">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697866">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697973" resolveInfo="node" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpd4.Node_TypeOperation" typeId="tpd4.1176544042499" id="2705856473428697867" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="2705856473428697868">
                <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2705856473428697869">
                  <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="39kg.1237106070629" resolveInfo="BigDecimalType" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2705856473428697870">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2705856473428697871">
            <property name="name" nameId="tpck.1169194664001" value="b2" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2705856473428697872" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697873">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2705856473428697874">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2705856473428697721" resolveInfo="getUnboxedElementType" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697875">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697876">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697973" resolveInfo="node" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpd4.Node_TypeOperation" typeId="tpd4.1176544042499" id="2705856473428697877" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="2705856473428697878">
                <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2705856473428697879">
                  <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="39kg.1237108887116" resolveInfo="BigComplexType" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2705856473428697880">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2705856473428697881">
            <property name="name" nameId="tpck.1169194664001" value="operation" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="2705856473428697882">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428697883">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="2705856473428697884" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2705856473428697885">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697886">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2705856473428697887">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2705856473428697888">
                <node role="rValue" roleId="tpee.1068498886297" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428697889">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2705856473428697890">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2705856473428697891">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k2b1.877422884702867448" resolveInfo="BigDecimalScalarOperations" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.Expression" typeId="tpee.1068431790191" id="2705856473428697892">
                        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="2705856473428697893">
                          <node role="expression" roleId="tp3r.1196350785111" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2705856473428697894">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1300076822026746759" resolveInfo="getMathContext" />
                            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1238406290274" resolveInfo="MathUtil" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697895">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697973" resolveInfo="node" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2705856473428697896">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697881" resolveInfo="operation" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2705856473428697897">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697861" resolveInfo="b1" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2705856473428697898">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697899">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2705856473428697900">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2705856473428697901">
                <node role="rValue" roleId="tpee.1068498886297" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2705856473428697902">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2705856473428697903">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2705856473428697904">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k2b1.877422884702866036" resolveInfo="BigComplexScalarOperations" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.Expression" typeId="tpee.1068431790191" id="2705856473428697905">
                        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="2705856473428697906">
                          <node role="expression" roleId="tp3r.1196350785111" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2705856473428697907">
                            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1238406290274" resolveInfo="MathUtil" />
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1300076822026746759" resolveInfo="getMathContext" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697908">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697973" resolveInfo="node" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2705856473428697909">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697881" resolveInfo="operation" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2705856473428697910">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697871" resolveInfo="b2" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2705856473428697911">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697912">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697913">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2705856473428697914">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697881" resolveInfo="operation" />
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="2705856473428697915">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2705856473428697916">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.OrExpression" typeId="tpee.1080223426719" id="2705856473428697917">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2705856473428697918">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697861" resolveInfo="b1" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2705856473428697919">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697871" resolveInfo="b2" />
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697920">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697921">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697973" resolveInfo="node" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="2705856473428697922">
                <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2705856473428697923">
                  <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="39kg.1238402702427" resolveInfo="DecimalBinaryOperation" />
                </node>
              </node>
            </node>
          </node>
          <node role="elsifClauses" roleId="tpee.1206060520071" type="tpee.ElsifClause" typeId="tpee.1206060495898" id="2705856473428697924">
            <node role="condition" roleId="tpee.1206060619838" type="tpee.AndExpression" typeId="tpee.1080120340718" id="2705856473428697925">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2705856473428697926">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.OrExpression" typeId="tpee.1080223426719" id="2705856473428697927">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2705856473428697928">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697861" resolveInfo="b1" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2705856473428697929">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697871" resolveInfo="b2" />
                  </node>
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2705856473428697930">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.AndExpression" typeId="tpee.1080120340718" id="2705856473428697931">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="2705856473428697932">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="2705856473428697933" />
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697934">
                      <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="2705856473428697935">
                        <link role="concept" roleId="tp25.1140138128738" targetNodeId="39kg.1418611629042457276" resolveInfo="MatrixInverseOperation" />
                        <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697936">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697973" resolveInfo="node" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2705856473428697937">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="39kg.1904947163751464663" />
                      </node>
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697938">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697939">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697973" resolveInfo="node" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="2705856473428697940">
                      <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2705856473428697941">
                        <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="39kg.1418611629042457276" resolveInfo="MatrixInverseOperation" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statementList" roleId="tpee.1206060644605" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697942">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697943">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2705856473428697944">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697881" resolveInfo="operation" />
                </node>
              </node>
            </node>
          </node>
          <node role="elsifClauses" roleId="tpee.1206060520071" type="tpee.ElsifClause" typeId="tpee.1206060495898" id="2705856473428697945">
            <node role="condition" roleId="tpee.1206060619838" type="tpee.AndExpression" typeId="tpee.1080120340718" id="2705856473428697946">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2705856473428697947">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.OrExpression" typeId="tpee.1080223426719" id="2705856473428697948">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2705856473428697949">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697861" resolveInfo="b1" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2705856473428697950">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697871" resolveInfo="b2" />
                  </node>
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2705856473428697951">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.AndExpression" typeId="tpee.1080120340718" id="2705856473428697952">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="2705856473428697953">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="2705856473428697954" />
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697955">
                      <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="2705856473428697956">
                        <link role="concept" roleId="tp25.1140138128738" targetNodeId="39kg.1418611629042457277" resolveInfo="LinearSolveOperation" />
                        <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697957">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697973" resolveInfo="node" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2705856473428697958">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="39kg.1904947163751468044" />
                      </node>
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2705856473428697959">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697960">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697973" resolveInfo="node" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="2705856473428697961">
                      <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2705856473428697962">
                        <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="39kg.1418611629042457277" resolveInfo="LinearSolveOperation" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statementList" roleId="tpee.1206060644605" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697963">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697964">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2705856473428697965">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697881" resolveInfo="operation" />
                </node>
              </node>
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="2705856473428697966">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="2705856473428697967">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2705856473428697968">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="2705856473428697969">
                  <node role="index" roleId="tpee.1173175577737" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="2705856473428697970">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2705856473428697749" resolveInfo="getIndex" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2705856473428697971">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428697973" resolveInfo="node" />
                    </node>
                  </node>
                  <node role="array" roleId="tpee.1173175590490" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="2705856473428697972">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2705856473428695571" resolveInfo="operations" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2705856473428697973">
        <property name="name" nameId="tpck.1169194664001" value="node" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="2705856473428697974" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1238406290275" />
  </root>
  <root id="3498370411873438939">
    <node role="constructor" roleId="1i04.1225194240801" type="1i04.ConceptConstructorDeclaration" typeId="1i04.1225194413805" id="3498370411873438940">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3498370411873438941">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3498370411873438942">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="3498370411873438949">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="3498370411873438952">
              <property name="value" nameId="tpee.1068580123138" value="false" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3498370411873438944">
              <node role="operand" roleId="tpee.1197027771414" type="1i04.ThisNodeExpression" typeId="1i04.1225194691553" id="3498370411873438943" />
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="3498370411873438948">
                <link role="property" roleId="tp25.1138056395725" targetNodeId="39kg.3498370411873418560" resolveInfo="column" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="5217243589491051780">
    <node role="method" roleId="1i04.1225194240805" type="1i04.ConceptMethodDeclaration" typeId="1i04.1225194472830" id="5217243589491051783">
      <property name="name" nameId="tpck.1169194664001" value="getPresentation" />
      <link role="overriddenMethod" roleId="1i04.1225194472831" targetNodeId="tpcu.1213877396640" resolveInfo="getPresentation" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5217243589491051786">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5217243589491052895">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="5217243589491052912">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5217243589491052915">
              <property name="value" nameId="tpee.1070475926801" value="&gt;" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="5217243589491052898">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5217243589491052897">
                <property name="value" nameId="tpee.1070475926801" value="matrix &lt;" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5217243589491052907">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5217243589491052902">
                  <node role="operand" roleId="tpee.1197027771414" type="1i04.ThisNodeExpression" typeId="1i04.1225194691553" id="5217243589491052901" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5217243589491052906">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="39kg.4815887568697050707" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="5217243589491052911">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpcu.1213877396640" resolveInfo="getPresentation" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="3288512235108331972" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5217243589491051788" />
    </node>
    <node role="constructor" roleId="1i04.1225194240801" type="1i04.ConceptConstructorDeclaration" typeId="1i04.1225194413805" id="5217243589491051781">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5217243589491051782" />
    </node>
  </root>
  <root id="1904947163751563871">
    <node role="constructor" roleId="1i04.1225194240801" type="1i04.ConceptConstructorDeclaration" typeId="1i04.1225194413805" id="1904947163751563872">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1904947163751563873">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1904947163751563874">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1904947163751563875">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1904947163751563876">
              <property name="value" nameId="tpee.1068580320021" value="7" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1904947163751563877">
              <node role="operand" roleId="tpee.1197027771414" type="1i04.ThisNodeExpression" typeId="1i04.1225194691553" id="1904947163751563879" />
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1904947163751563881">
                <link role="property" roleId="tp25.1138056395725" targetNodeId="39kg.1904947163751462196" resolveInfo="precision" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

