<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:35ef73a5-9726-4c66-9d79-f51c95cc08d6(jetbrains.mps.baseLanguage.builders.typesystem)">
  <persistence version="7" />
  <language namespace="7a5dda62-9140-4668-ab76-d5ed1746f2b2(jetbrains.mps.lang.typesystem)" />
  <language namespace="132aa4d8-a3f7-441c-a7eb-3fce23492c6a(jetbrains.mps.baseLanguage.builders)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="pmg0" modelUID="r:77052501-5144-48a7-be50-7535fc6d1073(jetbrains.mps.baseLanguage.builders.structure)" version="0" />
  <import index="j8l" modelUID="r:3783215c-b297-48a0-a2ee-a2b26d55402b(jetbrains.mps.baseLanguage.builders.behavior)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tpd4" modelUID="r:00000000-0000-4000-0000-011c895902b4(jetbrains.mps.lang.typesystem.structure)" version="3" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <roots>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="7288041816792292070">
      <property name="name" nameId="tpck.1169194664001" value="typeof_ResultExpression" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="7288041816792802795">
      <property name="name" nameId="tpck.1169194664001" value="typeof_SimpleBuilderParentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="simple.childParams" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="7288041816792806076">
      <property name="name" nameId="tpck.1169194664001" value="typeof_SimpleBuilderChildExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="simple.childParams" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="4315270135340734341">
      <property name="name" nameId="tpck.1169194664001" value="typeof_SimpleBuilder" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="simple" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="3816167865390948030">
      <property name="name" nameId="tpck.1169194664001" value="typeof_SimpleBuilderDeclaration" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="simple" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="7802271442981733175">
      <property name="name" nameId="tpck.1169194664001" value="typeof_AsBuilderStatement" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="2679357232284098429">
      <property name="name" nameId="tpck.1169194664001" value="typeof_BeanPropertyBuilder" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="bean" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="5389689214217248374">
      <property name="name" nameId="tpck.1169194664001" value="typeof_SimpleBuilderPropertyParent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="simple.propertyParams" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="5389689214217248396">
      <property name="name" nameId="tpck.1169194664001" value="typeof_SimpleBuilderPropertyValue" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="simple.propertyParams" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="8000882773529084491">
      <property name="name" nameId="tpck.1169194664001" value="typeof_SimpleBuilderPropertyBuilder" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="simple" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="7576379307094721681">
      <property name="name" nameId="tpck.1169194664001" value="typeof_BuilderCreator" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="901357770590752896">
      <property name="name" nameId="tpck.1169194664001" value="typeof_SimpleBuilderParameterReference" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="901357770590755902">
      <property name="name" nameId="tpck.1169194664001" value="typeof_SimpleBuilderParameter" />
    </node>
  </roots>
  <root id="7288041816792292070">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="7288041816792292071">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7288041816792309033">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7288041816792309034">
          <property name="name" nameId="tpck.1169194664001" value="contextBuilder" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="7288041816792309035">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="pmg0.7057666463730155275" resolveInfo="Builder" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="7288041816792309037">
            <link role="concept" roleId="tp25.1206019820684" targetNodeId="pmg0.7057666463730155275" resolveInfo="Builder" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="j8l.7057666463730366732" resolveInfo="getContextBuilder" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7288041816792309038">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7288041816792292072" resolveInfo="expression" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="7288041816792309028">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7288041816792309039">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7288041816792309041">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7288041816792309040">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7288041816792309034" resolveInfo="contextBuilder" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="7288041816792309045">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="j8l.7057666463730718251" resolveInfo="getResultType" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7288041816792309031">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="7288041816792294089">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7288041816792294091">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7288041816792292072" resolveInfo="expression" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="7288041816792292072">
      <property name="name" nameId="tpck.1169194664001" value="expression" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="pmg0.7288041816792292064" resolveInfo="ResultExpression" />
    </node>
  </root>
  <root id="7288041816792802795">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="7288041816792802796">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7288041816792804813">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7288041816792804814">
          <property name="name" nameId="tpck.1169194664001" value="builder" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="7288041816792804815">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="pmg0.7288041816792374840" resolveInfo="SimpleBuilderDeclaration" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6254726786820574456">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7288041816792804819">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7288041816792804818">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7288041816792802797" resolveInfo="expression" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="7288041816792806048">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="7288041816792806049">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="6254726786820574455">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="pmg0.6254726786820421041" resolveInfo="BaseSimpleBuilderDeclaration" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="6254726786820574460">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="j8l.6254726786820551255" resolveInfo="getContextDeclaration" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="7288041816792806060">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7288041816792806063">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="7288041816792806057">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7288041816792806059">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7288041816792802797" resolveInfo="expression" />
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3816167865390575586">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3816167865390575588">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3816167865390575587">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7288041816792804814" resolveInfo="builder" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3816167865390575592">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.3816167865390455307" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="7288041816792802797">
      <property name="name" nameId="tpck.1169194664001" value="expression" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="pmg0.7288041816792577340" resolveInfo="SimpleBuilderParentExpression" />
    </node>
  </root>
  <root id="7288041816792806076">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="7288041816792806077">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7288041816792806081">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7288041816792806082">
          <property name="name" nameId="tpck.1169194664001" value="child" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="7288041816792806083">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="pmg0.7288041816792577338" resolveInfo="SimpleBuilderChild" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7288041816792806086">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7288041816792806085">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7288041816792806078" resolveInfo="expression" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="7288041816792806090">
              <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="7288041816792806091">
                <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="7288041816792806094">
                  <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="pmg0.7288041816792577338" resolveInfo="SimpleBuilderChild" />
                </node>
              </node>
              <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Inclusion" typeId="tp25.1144100932627" id="7288041816792806096" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="7288041816792806102">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7288041816792806105">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="7288041816792806099">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7288041816792806101">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7288041816792806078" resolveInfo="expression" />
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3816167865390575593">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3816167865390575600">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3816167865390575595">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3816167865390575594">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7288041816792806082" resolveInfo="child" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3816167865390575599">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.7288041816792577339" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3816167865390575604">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.3816167865390455307" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="7288041816792806078">
      <property name="name" nameId="tpck.1169194664001" value="expression" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="pmg0.7288041816792577342" resolveInfo="SimpleBuilderChildExpression" />
    </node>
  </root>
  <root id="4315270135340734341">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="4315270135340734342">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4315270135340736359">
        <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="4315270135340741342">
          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4315270135340741362">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4315270135340741354">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4315270135340741347">
                <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4315270135340741346">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4315270135340734343" resolveInfo="builder" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4315270135340741352">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.7288041816793071803" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="4315270135340741360">
                <link role="link" roleId="tp25.1138056546658" targetNodeId="pmg0.5425713840853683089" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="4315270135340741367" />
          </node>
          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4315270135340736368">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4315270135340736363">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4315270135340736362">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4315270135340734343" resolveInfo="builder" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="4315270135340736367">
                <link role="link" roleId="tp25.1138056546658" targetNodeId="pmg0.4315270135340629600" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="4315270135340736372" />
          </node>
        </node>
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4315270135340736361">
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.ReportErrorStatement" typeId="tpd4.1175517767210" id="4315270135340741370">
            <node role="errorString" roleId="tpd4.1175517851849" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4315270135340741373">
              <property name="value" nameId="tpee.1070475926801" value="Wrong number of parameters" />
            </node>
            <node role="nodeToReport" roleId="tpd4.1227096802790" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4315270135340745005">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4315270135340734343" resolveInfo="builder" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4315270135340745007" />
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="4315270135340745008" />
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="4315270135340745010">
        <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="4315270135340745011">
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="4315270135340745084">
            <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
            <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4315270135340745097">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4315270135340745130">
                <node role="operand" roleId="tpee.1197027771414" type="tp2q.ListElementAccessExpression" typeId="tp2q.1225711141656" id="4315270135340745122">
                  <node role="index" roleId="tp2q.1225711191269" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4315270135340745126">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4315270135340745013" resolveInfo="i" />
                  </node>
                  <node role="list" roleId="tp2q.1225711182005" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4315270135340745108">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4315270135340745099">
                      <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4315270135340745098">
                        <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4315270135340734343" resolveInfo="builder" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4315270135340745107">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.7288041816793071803" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="4315270135340745112">
                      <link role="link" roleId="tp25.1138056546658" targetNodeId="pmg0.5425713840853683089" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4315270135340745136">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.5425713840853682521" />
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4315270135340745088">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="4315270135340745046">
                <node role="term" roleId="tpd4.1174657509053" type="tp2q.ListElementAccessExpression" typeId="tp2q.1225711141656" id="4315270135340745060">
                  <node role="index" roleId="tp2q.1225711191269" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4315270135340745067">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4315270135340745013" resolveInfo="i" />
                  </node>
                  <node role="list" roleId="tp2q.1225711182005" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4315270135340745049">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4315270135340745048">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4315270135340734343" resolveInfo="builder" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="4315270135340745056">
                      <link role="link" roleId="tp25.1138056546658" targetNodeId="pmg0.4315270135340629600" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4315270135340745013">
          <property name="name" nameId="tpck.1169194664001" value="i" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4315270135340745015" />
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4315270135340745017">
            <property name="value" nameId="tpee.1068580320021" value="0" />
          </node>
        </node>
        <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="4315270135340745019">
          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4315270135340745032">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4315270135340745023">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4315270135340745022">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4315270135340734343" resolveInfo="builder" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="4315270135340745029">
                <link role="link" roleId="tp25.1138056546658" targetNodeId="pmg0.4315270135340629600" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="4315270135340745038" />
          </node>
          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4315270135340745018">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4315270135340745013" resolveInfo="i" />
          </node>
        </node>
        <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="4315270135340745043">
          <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4315270135340745044">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4315270135340745013" resolveInfo="i" />
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="4315270135340734343">
      <property name="name" nameId="tpck.1169194664001" value="builder" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="pmg0.7288041816793071802" resolveInfo="SimpleBuilder" />
    </node>
  </root>
  <root id="3816167865390948030">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="3816167865390948031">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="3816167865390950048">
        <node role="condition" roleId="tpee.1068580123160" type="tpee.NotExpression" typeId="tpee.1081516740877" id="3816167865390950051">
          <node role="expression" roleId="tpee.1081516765348" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3816167865390950054">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="3816167865390950053">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3816167865390948032" resolveInfo="declaration" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="3816167865390950058">
              <link role="property" roleId="tp25.1138056395725" targetNodeId="pmg0.3816167865390639747" resolveInfo="isAbstract" />
            </node>
          </node>
        </node>
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="3816167865390950050">
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="3816167865390950068">
            <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
            <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3816167865390950073">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3816167865390950075">
                <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="3816167865390950074">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3816167865390948032" resolveInfo="declaration" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3816167865390950079">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.3816167865390455307" />
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3816167865390950072">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="3816167865390950060">
                <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3816167865390950063">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="3816167865390950062">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3816167865390948032" resolveInfo="declaration" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3816167865390950067">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.7288041816793525038" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="8969040284892462945">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="8969040284892462946">
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="8969040284892462967">
            <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
            <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8969040284892462972">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8969040284892462979">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8969040284892462974">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8969040284892462973">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3816167865390948032" resolveInfo="declaration" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8969040284892462978">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.3816167865390363701" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8969040284892462983">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.3816167865390455307" />
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8969040284892462971">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8969040284892462962">
                <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8969040284892462961">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3816167865390948032" resolveInfo="declaration" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8969040284892462966">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.3816167865390455307" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8969040284892462955">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8969040284892462950">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8969040284892462949">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3816167865390948032" resolveInfo="declaration" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8969040284892462954">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.3816167865390363701" />
            </node>
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="8969040284892462959" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="3816167865390948032">
      <property name="name" nameId="tpck.1169194664001" value="declaration" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="pmg0.7288041816792374840" resolveInfo="SimpleBuilderDeclaration" />
    </node>
  </root>
  <root id="7802271442981733175">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="7802271442981733176">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="8009360033695211212">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="8009360033695211213">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="8009360033695211239" />
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8009360033695211230">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8009360033695211222">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8009360033695211217">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8009360033695211216">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7802271442981733177" resolveInfo="statement" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4797501453850567420">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.4797501453850567416" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetConceptOperation" typeId="tp25.1172323065820" id="8009360033695211226" />
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.SConceptPropertyAccess" typeId="tp25.1145994841052" id="8009360033695211237">
            <link role="conceptProperty" roleId="tp25.1145994841055" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="7802271442981756582">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7802271442981756587">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7802271442981756594">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7802271442981756589">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7802271442981756588">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7802271442981733177" resolveInfo="statement" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4797501453850567422">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.4797501453850567416" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="7802271442981756598">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="j8l.7057666463730718251" resolveInfo="getResultType" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7802271442981756586">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="7802271442981741637">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7802271442981756577">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7802271442981756576">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7802271442981733177" resolveInfo="statement" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="7802271442981756581">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.7802271442981707295" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="7802271442981733177">
      <property name="name" nameId="tpck.1169194664001" value="statement" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="pmg0.7802271442981707292" resolveInfo="AsBuilderStatement" />
    </node>
  </root>
  <root id="2679357232284098429">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="2679357232284098430">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="2679357232284100456">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2679357232284100461">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2679357232284102701">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2679357232284102693">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2679357232284100468">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2679357232284100463">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2679357232284100462">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2679357232284098431" resolveInfo="builder" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2679357232284100467">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.2679357232283750088" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="2679357232284102692">
                  <link role="link" roleId="tp25.1138056546658" targetNodeId="tpee.1068580123134" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetFirstOperation" typeId="tp2q.1165525191778" id="2679357232284102697" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2679357232284102707">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.5680397130376446158" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2679357232284100460">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2679357232284100448">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2679357232284100451">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2679357232284100450">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2679357232284098431" resolveInfo="builder" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2679357232284100455">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.2679357232283750106" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2679357232284098431">
      <property name="name" nameId="tpck.1169194664001" value="builder" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="pmg0.2679357232283750087" resolveInfo="BeanPropertyBuilder" />
    </node>
  </root>
  <root id="5389689214217248374">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="5389689214217248375">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5389689214217248378">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5389689214217248379">
          <property name="name" nameId="tpck.1169194664001" value="builder" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="5389689214217248380">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="pmg0.7288041816792374840" resolveInfo="SimpleBuilderDeclaration" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6254726786820574462">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5389689214217248381">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5389689214217248382">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5389689214217248376" resolveInfo="expression" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="5389689214217248383">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="5389689214217248384">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="6254726786820574461">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="pmg0.6254726786820421041" resolveInfo="BaseSimpleBuilderDeclaration" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="6254726786820574467">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="j8l.6254726786820551255" resolveInfo="getContextDeclaration" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="5389689214217248386">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5389689214217248387">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5389689214217248388">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5389689214217248389">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5389689214217248376" resolveInfo="expression" />
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5389689214217248390">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5389689214217248391">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5389689214217248392">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5389689214217248379" resolveInfo="builder" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5389689214217248393">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.3816167865390455307" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5389689214217248376">
      <property name="name" nameId="tpck.1169194664001" value="simpleBuilderPropertyParent" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="pmg0.5389689214217248368" resolveInfo="SimpleBuilderPropertyParent" />
    </node>
  </root>
  <root id="5389689214217248396">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="5389689214217248397">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5389689214217300166">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5389689214217300167">
          <property name="name" nameId="tpck.1169194664001" value="prop" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="5389689214217300168">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="pmg0.5389689214216990954" resolveInfo="SimpleBuilderProperty" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5389689214217315101">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5389689214217300170">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5389689214217248398" resolveInfo="value" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="5389689214217316334">
              <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="5389689214217316335">
                <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="5389689214217316338">
                  <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="pmg0.5389689214216990954" resolveInfo="SimpleBuilderProperty" />
                </node>
              </node>
              <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Inclusion" typeId="tp25.1144100932627" id="5389689214217316340" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="5389689214217316347">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5389689214217316351">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5389689214217316353">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5389689214217316352">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5389689214217300167" resolveInfo="prop" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5389689214217316357">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.5389689214216997399" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5389689214217316350">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5389689214217316344">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5389689214217316346">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5389689214217248398" resolveInfo="value" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5389689214217248398">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="pmg0.5389689214217248394" resolveInfo="SimpleBuilderPropertyValue" />
    </node>
  </root>
  <root id="8000882773529084491">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="8000882773529084492">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="8000882773529084503">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8000882773529084508">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8000882773529084515">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8000882773529084510">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8000882773529084509">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8000882773529084493" resolveInfo="builder" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8000882773529084514">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.5389689214217404513" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8000882773529084519">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.5389689214216997399" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8000882773529084507">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="8000882773529084495">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8000882773529084498">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8000882773529084497">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8000882773529084493" resolveInfo="builder" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8000882773529084502">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.5389689214217404512" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="8000882773529084493">
      <property name="name" nameId="tpck.1169194664001" value="builder" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="pmg0.5389689214217404511" resolveInfo="SimpleBuilderPropertyBuilder" />
    </node>
  </root>
  <root id="7576379307094721681">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="7576379307094721682">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="7576379307094727262">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7576379307094727266">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7576379307094727273">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7576379307094727268">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7576379307094727267">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7576379307094721683" resolveInfo="builderCreator" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="7576379307094727272">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.4797501453850567416" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="7576379307094727277">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="j8l.7057666463730718251" resolveInfo="getResultType" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7576379307094727265">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="7576379307094727259">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7576379307094727261">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7576379307094721683" resolveInfo="builderCreator" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="7576379307094721683">
      <property name="name" nameId="tpck.1169194664001" value="builderCreator" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="pmg0.7057666463730155278" resolveInfo="BuilderCreator" />
    </node>
  </root>
  <root id="901357770590752896">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="901357770590752897">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="901357770590752903">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="901357770590752907">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="901357770590752908">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="901357770590752911">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="901357770590752910">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="901357770590752898" resolveInfo="reference" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="901357770590752915">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.5425713840853785829" />
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="901357770590752906">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="901357770590752900">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="901357770590752902">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="901357770590752898" resolveInfo="reference" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="901357770590752898">
      <property name="name" nameId="tpck.1169194664001" value="reference" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="pmg0.5425713840853785828" resolveInfo="SimpleBuilderParameterReference" />
    </node>
  </root>
  <root id="901357770590755902">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="901357770590755903">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="901357770590755909">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="901357770590755913">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="901357770590755915">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="901357770590755914">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="901357770590755904" resolveInfo="parameter" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="901357770590755919">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="pmg0.5425713840853682521" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="901357770590755912">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="901357770590755906">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="901357770590755908">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="901357770590755904" resolveInfo="parameter" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="901357770590755904">
      <property name="name" nameId="tpck.1169194664001" value="parameter" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="pmg0.5425713840853682520" resolveInfo="SimpleBuilderParameter" />
    </node>
  </root>
</model>

