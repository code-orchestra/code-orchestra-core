<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:c493b9a9-0f39-4efb-93f7-8ac7c0a1036c(jetbrains.mps.baseLanguage.overloadedOperators.typesystem)">
  <persistence version="7" />
  <language namespace="7a5dda62-9140-4668-ab76-d5ed1746f2b2(jetbrains.mps.lang.typesystem)" />
  <language namespace="fc8d557e-5de6-4dd8-b749-aab2fb23aefc(jetbrains.mps.baseLanguage.overloadedOperators)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="ed6d7656-532c-4bc2-81d1-af945aeb8280(jetbrains.mps.baseLanguage.blTypes)" />
  <language namespace="d7706f63-9be2-479c-a3da-ae92af1e64d5(jetbrains.mps.lang.generator.generationContext)" />
  <language namespace="b401a680-8325-4110-8fd3-84331ff25bef(jetbrains.mps.lang.generator)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="3a13115c-633c-4c5c-bbcc-75c4219e9555(jetbrains.mps.lang.quotation)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="vgj4" modelUID="r:a258f9a5-18d3-4bea-a833-20735290774c(jetbrains.mps.baseLanguage.overloadedOperators.structure)" version="-1" />
  <import index="tpdt" modelUID="r:00000000-0000-4000-0000-011c895902dd(jetbrains.mps.baseLanguage.blTypes.structure)" version="-1" />
  <import index="mqx6" modelUID="r:288434b8-c7e0-41e8-9f8d-1323c8a122b9(jetbrains.mps.baseLanguage.overloadedOperators.generator.template.util)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="afxk" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.project(MPS.Classpath/jetbrains.mps.project@java_stub)" version="-1" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpd4" modelUID="r:00000000-0000-4000-0000-011c895902b4(jetbrains.mps.lang.typesystem.structure)" version="3" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="tp3r" modelUID="r:00000000-0000-4000-0000-011c8959034b(jetbrains.mps.lang.quotation.structure)" version="0" implicit="yes" />
  <import index="tpdu" modelUID="r:00000000-0000-4000-0000-011c895902de(jetbrains.mps.baseLanguage.blTypes.primitiveDescriptors)" version="-1" implicit="yes" />
  <roots>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6677452554239169670">
      <property name="name" nameId="tpck.1169194664001" value="typeof_LeftOperand" />
      <property name="overrides" nameId="tpd4.1195213689297" value="true" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6677452554239170996">
      <property name="name" nameId="tpck.1169194664001" value="typeof_RightOperand" />
      <property name="overrides" nameId="tpd4.1195213689297" value="true" />
    </node>
    <node type="tpd4.OverloadedOpRulesContainer" typeId="tpd4.1236165709895" id="6136676636350205595">
      <property name="name" nameId="tpck.1169194664001" value="typeof_OverloadedOperatorUsage" />
    </node>
  </roots>
  <root id="6677452554239169670">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6677452554239169671">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="6677452554239169677">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3100399657864346000">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3100399657864368637">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3100399657864346002">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="3100399657864346001">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6677452554239169672" resolveInfo="leftOperand" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="3100399657864368632">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="3100399657864368633">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="3100399657864368636">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="vgj4.483844232470132813" resolveInfo="OverloadedBinaryOperator" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3100399657864368641">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="vgj4.6677452554239170993" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6677452554239169680">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6677452554239169674">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6677452554239169676">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6677452554239169672" resolveInfo="leftOperand" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6677452554239169672">
      <property name="name" nameId="tpck.1169194664001" value="leftOperand" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="vgj4.483844232470668960" resolveInfo="LeftOperand" />
    </node>
  </root>
  <root id="6677452554239170996">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6677452554239170997">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="6677452554239173961">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3100399657864368642">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3100399657864368653">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3100399657864368644">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="3100399657864368643">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6677452554239170998" resolveInfo="rightOperand" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="3100399657864368648">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="3100399657864368649">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="3100399657864368652">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="vgj4.483844232470132813" resolveInfo="OverloadedBinaryOperator" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3100399657864368657">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="vgj4.6677452554239170994" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6677452554239173964">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6677452554239173956">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6677452554239173958">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6677452554239170998" resolveInfo="rightOperand" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6677452554239170998">
      <property name="name" nameId="tpck.1169194664001" value="rightOperand" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="vgj4.7789383629180756961" resolveInfo="RightOperand" />
    </node>
  </root>
  <root id="6136676636350205595">
    <node role="rule" roleId="tpd4.1236165725858" type="tpd4.OverloadedOperatorTypeRule" typeId="tpd4.1236083041311" id="6136676636350205596">
      <node role="operationConcept" roleId="tpd4.8124453027370845341" type="tp25.ConceptReference" typeId="tp25.1154546950173" id="6136676636350307647">
        <link role="concept" roleId="tp25.1154546997487" targetNodeId="tpee.1081773326031" resolveInfo="BinaryOperation" />
      </node>
      <node role="function" roleId="tpd4.8124453027370845343" type="tpd4.OverloadedOperatorTypeFunction" typeId="tpd4.1236083146670" id="6136676636350205600">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6136676636350205601">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8861433211215307899">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8861433211215307900">
              <property name="name" nameId="tpck.1169194664001" value="operators" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SequenceType" typeId="tp2q.1151689724996" id="8861433211215307901">
                <node role="elementType" roleId="tp2q.1151689745422" type="tp25.SNodeType" typeId="tp25.1138055754698" id="8861433211215307902">
                  <link role="concept" roleId="tp25.1138405853777" targetNodeId="vgj4.483844232470132813" resolveInfo="OverloadedBinaryOperator" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8861433211215307903">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8861433211215307904">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8861433211215307905">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.Operation_parameter" typeId="tpd4.1236083245720" id="8861433211215309468" />
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetModelOperation" typeId="tp25.1143234257716" id="8861433211215307907" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Model_RootsIncludingImportedOperation" typeId="tp25.1176109685393" id="8861433211215307908">
                    <link role="concept" roleId="tp25.1176109685394" targetNodeId="vgj4.483844232470139399" resolveInfo="OverloadedOperatorContainer" />
                    <node role="scope" roleId="tp25.1176109762787" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5277715307557177053">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="afxk.~GlobalScope%dgetInstance()%cjetbrains%dmps%dproject%dGlobalScope" resolveInfo="getInstance" />
                      <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="afxk.~GlobalScope" resolveInfo="GlobalScope" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkImplicitSelect" typeId="tp25.3562215692195599741" id="8861433211215309469">
                  <link role="link" roleId="tp25.3562215692195600259" targetNodeId="vgj4.483844232470139400" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8861433211215286533">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8861433211215286548">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="8861433211215286535">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="mqx6.2511109317222758460" resolveInfo="getNearestOverloaded" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="mqx6.8177032930858798991" resolveInfo="BinaryOperationUtil" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpd4.Operation_parameter" typeId="tpd4.1236083245720" id="5277715307557636649" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpd4.LeftOperandType_parameter" typeId="tpd4.1236083209648" id="1387988544209571050" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpd4.RightOperandType_parameter" typeId="tpd4.1236083248858" id="1387988544209571054" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5277715307557177131">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5277715307557177057">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8861433211215307900" resolveInfo="operators" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.ToListOperation" typeId="tp2q.1151702311717" id="5277715307557177135" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3855395826139270908">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="vgj4.6677452554237917709" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="leftOperandType" roleId="tpd4.1236083115043" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6136676636350301557">
        <node role="operand" roleId="tpee.1197027771414" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6136676636350301558">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpdt.PrimitiveTypeRef" typeId="tpdt.1159268661480" id="6136676636350301559">
            <link role="descriptor" roleId="tpdt.1159268661479" targetNodeId="tpdu.1196683729865" resolveInfo="Numeric" />
          </node>
        </node>
        <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6136676636350301560">
          <link role="link" roleId="tp25.1138056516764" targetNodeId="tpdt.1159268661479" />
        </node>
      </node>
      <node role="rightOperandType" roleId="tpd4.1236083115200" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6136676636350307643">
        <node role="operand" roleId="tpee.1197027771414" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6136676636350307644">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpdt.PrimitiveTypeRef" typeId="tpdt.1159268661480" id="6136676636350307645">
            <link role="descriptor" roleId="tpdt.1159268661479" targetNodeId="tpdu.1196683729865" resolveInfo="Numeric" />
          </node>
        </node>
        <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6136676636350307646">
          <link role="link" roleId="tp25.1138056516764" targetNodeId="tpdt.1159268661479" />
        </node>
      </node>
      <node role="isApplicable" roleId="tpd4.6136676636349909553" type="tpd4.OverloadedOpIsApplicableFunction" typeId="tpd4.6136676636349908958" id="6136676636350307648">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6136676636350307649">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5277715307557177107">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5277715307557177108">
              <property name="name" nameId="tpck.1169194664001" value="operators" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SequenceType" typeId="tp2q.1151689724996" id="5277715307557177109">
                <node role="elementType" roleId="tp2q.1151689745422" type="tp25.SNodeType" typeId="tp25.1138055754698" id="5277715307557177110">
                  <link role="concept" roleId="tp25.1138405853777" targetNodeId="vgj4.483844232470132813" resolveInfo="OverloadedBinaryOperator" />
                </node>
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5277715307557177111">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5277715307557177112">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5277715307557177113">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.Operation_parameter" typeId="tpd4.1236083245720" id="5277715307557177114" />
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetModelOperation" typeId="tp25.1143234257716" id="5277715307557177115" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Model_RootsIncludingImportedOperation" typeId="tp25.1176109685393" id="5277715307557177116">
                    <link role="concept" roleId="tp25.1176109685394" targetNodeId="vgj4.483844232470139399" resolveInfo="OverloadedOperatorContainer" />
                    <node role="scope" roleId="tp25.1176109762787" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5277715307557177117">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="afxk.~GlobalScope%dgetInstance()%cjetbrains%dmps%dproject%dGlobalScope" resolveInfo="getInstance" />
                      <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="afxk.~GlobalScope" resolveInfo="GlobalScope" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkImplicitSelect" typeId="tp25.3562215692195599741" id="5277715307557177118">
                  <link role="link" roleId="tp25.3562215692195600259" targetNodeId="vgj4.483844232470139400" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5277715307557177087">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4598061146291976031">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="mqx6.4598061146291975012" resolveInfo="hasOverloadedOperators" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="mqx6.8177032930858798991" resolveInfo="BinaryOperationUtil" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpd4.Operation_parameter" typeId="tpd4.1236083245720" id="4598061146291976032" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpd4.LeftOperandType_parameter" typeId="tpd4.1236083209648" id="4598061146291976033" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpd4.RightOperandType_parameter" typeId="tpd4.1236083248858" id="4598061146291976034" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4598061146291976035">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4598061146291976036">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5277715307557177108" resolveInfo="operators" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.ToListOperation" typeId="tp2q.1151702311717" id="4598061146291976037" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

