<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:f2d87002-eac7-4f98-addf-b2caa99c13a5(jetbrains.mps.ui.typesystem)">
  <persistence version="7" />
  <language namespace="7a5dda62-9140-4668-ab76-d5ed1746f2b2(jetbrains.mps.lang.typesystem)" />
  <language namespace="fb26dccf-fa54-4e9a-8ddb-b66311a34393(jetbrains.mps.ui)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="af65afd8-f0dd-4942-87d9-63a55f2a9db1(jetbrains.mps.lang.behavior)" />
  <language namespace="3a13115c-633c-4c5c-bbcc-75c4219e9555(jetbrains.mps.lang.quotation)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="fb0y" modelUID="r:4bcef4e7-5bde-4076-8e02-73a0681ac6a3(jetbrains.mps.ui.structure)" version="0" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="tpek" modelUID="r:00000000-0000-4000-0000-011c895902c0(jetbrains.mps.baseLanguage.behavior)" version="-1" />
  <import index="t8yi" modelUID="r:c33653ee-1be0-4ff5-9822-83365da4e9b7(jetbrains.mps.ui.modeling.behavior)" version="-1" />
  <import index="czqe" modelUID="r:7d08fc9f-17a7-4f88-97be-c15c3f806bad(jetbrains.mps.ui.behavior)" version="-1" />
  <import index="sqp9" modelUID="r:ba1d89ed-800e-4d0a-ad09-221b1011fbd1(jetbrains.mps.ui.modeling.structure)" version="2" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" />
  <import index="tpd4" modelUID="r:00000000-0000-4000-0000-011c895902b4(jetbrains.mps.lang.typesystem.structure)" version="3" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp3r" modelUID="r:00000000-0000-4000-0000-011c8959034b(jetbrains.mps.lang.quotation.structure)" version="0" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <roots>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="8381258131358797390">
      <property name="name" nameId="tpck.1169194664001" value="typeof_BeanPropertyView" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="views" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="9014158157446942637">
      <property name="name" nameId="tpck.1169194664001" value="typeof_ExpressionView" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="views" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="9014158157447146010">
      <property name="name" nameId="tpck.1169194664001" value="checkEditable_BeanPropertyView" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="views" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="4643695836678775477">
      <property name="name" nameId="tpck.1169194664001" value="typeof_ValidatingView" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="views" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="5224413709453668151">
      <property name="name" nameId="tpck.1169194664001" value="typeof_FunctionParameterDeclaration" />
      <property name="overrides" nameId="tpd4.1195213689297" value="true" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="5224413709453691561">
      <property name="name" nameId="tpck.1169194664001" value="typeof_Validator" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="views" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="5224413709454845843">
      <property name="name" nameId="tpck.1169194664001" value="typeof_EventPropertyAccessOp" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="1642651187740411837">
      <property name="name" nameId="tpck.1169194664001" value="typeof_UIObjectStatement" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6424935405034937381">
      <property name="name" nameId="tpck.1169194664001" value="typeof_ChildAspect" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="7109250785405034423">
      <property name="name" nameId="tpck.1169194664001" value="supertypesOf_UIObjectType" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="5776545240964029380">
      <property name="name" nameId="tpck.1169194664001" value="typeof_EnclosingContextCompartmentExpression" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="5776545240964919739">
      <property name="name" nameId="tpck.1169194664001" value="typeof_CompartmentReferenceExpression" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="5776545240965111025">
      <property name="name" nameId="tpck.1169194664001" value="supertypesOf_ContainerType" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="8923564134257084385">
      <property name="name" nameId="tpck.1169194664001" value="typeof_CompartmentProviderStatement" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="2459884175397578622">
      <property name="name" nameId="tpck.1169194664001" value="typeof_IterateContentsVariable" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="2459884175397939346">
      <property name="name" nameId="tpck.1169194664001" value="typeof_IterateContentsVariableReference" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="3546006303814984651">
      <property name="name" nameId="tpck.1169194664001" value="typeof_UIObjectProviderStatement" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6261739386030572988">
      <property name="name" nameId="tpck.1169194664001" value="typeof_CallUIActionOperation" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="1870423755832759891">
      <property name="name" nameId="tpck.1169194664001" value="typeof_AccessUIPropertyOperation" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6410919744913609590">
      <property name="name" nameId="tpck.1169194664001" value="typeof_UIObjectReference" />
    </node>
  </roots>
  <root id="8381258131358797390">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="8381258131358797391">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="8381258131358797402">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8381258131358797406">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="8381258131358797407">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.WildCardType" typeId="tpee.1171903607971" id="8381258131358902607" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8381258131358797405">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="8381258131358797394">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8381258131358797397">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8381258131358797396">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8381258131358797392" resolveInfo="view" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8381258131358797401">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.8381258131358796371" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="9014158157446908488">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="9014158157446908491">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9014158157446906313">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9014158157446906308">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="9014158157446906307">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8381258131358797392" resolveInfo="bv" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="9014158157446906312">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.8381258131358762488" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="9014158157446908487">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1068580123133" />
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="9014158157446925825">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="9014158157446925826">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9014158157446937207">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="9014158157446925828">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8381258131358797392" resolveInfo="bv" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="9014158157446937211">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.9014158157446906285" resolveInfo="getProperty" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="9014158157446942678">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="9014158157446942682">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9014158157446942689">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9014158157446942684">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="9014158157446942683">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8381258131358797392" resolveInfo="bv" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="9014158157446942688">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.8381258131358762488" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="9014158157446944863">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1068580123133" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="9014158157446942681">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="9014158157446942670">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9014158157446942673">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="9014158157446942672">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8381258131358797392" resolveInfo="bv" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="9014158157446942677">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.9014158157446906285" resolveInfo="getProperty" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="8381258131358797392">
      <property name="name" nameId="tpck.1169194664001" value="bv" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.8381258131358737422" resolveInfo="BeanPropertyView" />
    </node>
  </root>
  <root id="9014158157446942637">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="9014158157446942638">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="9014158157446942649">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="9014158157446942652">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="9014158157446942641">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9014158157446942644">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="9014158157446942643">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="9014158157446942639" resolveInfo="view" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="9014158157446942648">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.9014158157446815225" />
              </node>
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="9014158157446942659">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="9014158157446942660">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9014158157446942663">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="9014158157446942662">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="9014158157446942639" resolveInfo="view" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="9014158157446942667">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.9014158157446906285" resolveInfo="getProperty" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="9014158157446942639">
      <property name="name" nameId="tpck.1169194664001" value="ev" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.9014158157446815224" resolveInfo="ExpressionView" />
    </node>
  </root>
  <root id="9014158157447146010">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="9014158157447146011">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="9014158157447151154">
        <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9014158157447151164">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9014158157447151159">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="9014158157447151158">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="9014158157447146012" resolveInfo="bv" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="9014158157447151163">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.9014158157446906285" resolveInfo="getProperty" />
            </node>
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="9014158157447151168">
            <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="9014158157447151170">
              <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="sqp9.9014158157447011054" resolveInfo="EditableProperty" />
            </node>
          </node>
        </node>
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="9014158157447151175">
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.AssertStatement" typeId="tpd4.1175517400280" id="9014158157447151176">
            <node role="condition" roleId="tpd4.1175517761460" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9014158157447151181">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="9014158157447151180">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="9014158157447146012" resolveInfo="bv" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="9014158157447151185">
                <link role="property" roleId="tp25.1138056395725" targetNodeId="fb0y.8381258131358759657" resolveInfo="canWrite" />
              </node>
            </node>
            <node role="nodeToReport" roleId="tpd4.1227096802790" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="9014158157447151187">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="9014158157447146012" resolveInfo="bv" />
            </node>
            <node role="errorString" roleId="tpd4.1175517851849" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="9014158157447151186">
              <property name="value" nameId="tpee.1070475926801" value="cannot write to readonly property" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="9014158157447146012">
      <property name="name" nameId="tpck.1169194664001" value="bv" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.8381258131358737422" resolveInfo="BeanPropertyView" />
    </node>
  </root>
  <root id="4643695836678775477">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="4643695836678775478">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.TypeVarDeclaration" typeId="tpd4.1174665551739" id="4643695836678775513">
        <property name="name" nameId="tpck.1169194664001" value="PROPERTY_TYPE" />
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="4643695836678775529">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4643695836678775533">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="4643695836678775534">
            <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="4643695836678775513" resolveInfo="PROPERTY_TYPE" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4643695836678775532">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="4643695836678775516">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4643695836678775524">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4643695836678775519">
                <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4643695836678775518">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4643695836678775479" resolveInfo="vv" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4643695836678775523">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.8381258131358771380" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="4643695836678775528">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.9014158157446906285" resolveInfo="getProperty" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="4643695836678775501">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4643695836678775505">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="4643695836678775506">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="4643695836678775508">
              <node role="parameterType" roleId="tp2c.1199542501692" type="tpee.Type" typeId="tpee.1068431790189" id="4643695836678775535">
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="4643695836678775536">
                  <node role="expression" roleId="tp3r.1196350785111" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="4643695836678775538">
                    <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="4643695836678775513" resolveInfo="PROPERTY_TYPE" />
                  </node>
                </node>
              </node>
              <node role="resultType" roleId="tp2c.1199542457201" type="tpee.BooleanType" typeId="tpee.1070534644030" id="4643695836678775511" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4643695836678775504">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="4643695836678775481">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4643695836678775489">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4643695836678775484">
                <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4643695836678775483">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4643695836678775479" resolveInfo="vv" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4643695836678775488">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.8381258131358771379" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4643695836678775493">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.8381258131358771377" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="4643695836678775479">
      <property name="name" nameId="tpck.1169194664001" value="vv" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.8381258131358771378" resolveInfo="ValidatingView" />
    </node>
  </root>
  <root id="5224413709453668151">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="5224413709453668152">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5224413709453691411">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5224413709453691412">
          <property name="name" nameId="tpck.1169194664001" value="parms" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="5224413709453691413">
            <link role="elementConcept" roleId="tp25.1145383142433" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5224413709453691414">
            <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="5224413709453691415">
              <property name="asCast" nameId="tp25.1238684351431" value="true" />
              <link role="concept" roleId="tp25.1140138128738" targetNodeId="tp2c.1199542442495" resolveInfo="FunctionType" />
              <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5224413709453691416">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5224413709453691417">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5224413709453691418">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5224413709453668153" resolveInfo="fpd" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="5224413709453691419">
                    <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="5224413709453691420">
                      <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="5224413709453691421">
                        <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tpee.1201183863028" resolveInfo="TypeDerivable" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="5224413709453691422">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpek.1213877435747" resolveInfo="deriveType" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="5224413709453691423">
                    <property name="asCast" nameId="tp25.1238684351431" value="true" />
                    <link role="concept" roleId="tp25.1140138128738" targetNodeId="tp2c.1199569711397" resolveInfo="ClosureLiteral" />
                    <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5224413709453691424">
                      <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5224413709453691425">
                        <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5224413709453668153" resolveInfo="fpd" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="5224413709453691426" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="5224413709453691427">
              <link role="link" roleId="tp25.1138056546658" targetNodeId="tp2c.1199542501692" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="5224413709453691456">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5224413709453691461">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5224413709453691463">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5224413709453691462">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5224413709453691412" resolveInfo="parms" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetElementOperation" typeId="tp2q.1162934736510" id="5224413709453691467">
              <node role="argument" roleId="tp2q.1162934736511" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5224413709453691472">
                <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5224413709453691471">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5224413709453668153" resolveInfo="fpd" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetIndexInParentOperation" typeId="tp25.1179168000618" id="5224413709453691481" />
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5224413709453691459">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5224413709453691453">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5224413709453691455">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5224413709453668153" resolveInfo="fpd" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5224413709453668153">
      <property name="name" nameId="tpck.1169194664001" value="fpd" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.5224413709453581668" resolveInfo="FunctionParameterDeclaration" />
    </node>
  </root>
  <root id="5224413709453691561">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="5224413709453691562">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.TypeVarDeclaration" typeId="tpd4.1174665551739" id="5224413709453691586">
        <property name="name" nameId="tpck.1169194664001" value="PARAM_TYPE" />
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="5224413709453691573">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5224413709453691576">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5224413709453691565">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5224413709453691568">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5224413709453691567">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5224413709453691563" resolveInfo="validator" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5224413709453691572">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.8381258131358771377" />
              </node>
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5224413709453691587">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5224413709453691588">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="5224413709453691590">
              <node role="parameterType" roleId="tp2c.1199542501692" type="tpee.Type" typeId="tpee.1068431790189" id="5224413709453691592">
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="5224413709453691593">
                  <node role="expression" roleId="tp3r.1196350785111" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="5224413709453691595">
                    <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="5224413709453691586" resolveInfo="PARAM_TYPE" />
                  </node>
                </node>
              </node>
              <node role="resultType" roleId="tp2c.1199542457201" type="tpee.BooleanType" typeId="tpee.1070534644030" id="5224413709453691596" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="5224413709453691617">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5224413709453691621">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="5224413709453691622">
            <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="5224413709453691586" resolveInfo="PARAM_TYPE" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5224413709453691620">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5224413709453691607">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5224413709453691608">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5224413709453691609">
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="5224413709453691611">
                  <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="5224413709453691612">
                    <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="5224413709453691613">
                      <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="fb0y.9014158157446579719" resolveInfo="ViewBinding" />
                    </node>
                  </node>
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5224413709453691616">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5224413709453691563" resolveInfo="validator" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5224413709453691614">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.9014158157446579720" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5224413709453691615">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.9014158157446451474" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5224413709453691563">
      <property name="name" nameId="tpck.1169194664001" value="validator" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.8381258131358737419" resolveInfo="Validator" />
    </node>
  </root>
  <root id="5224413709454845843">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="5224413709454845844">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="5224413709454845850">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5224413709454845854">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5224413709454845861">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5224413709454845856">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5224413709454845855">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5224413709454845845" resolveInfo="op" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5224413709454845860">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.5224413709454841979" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5224413709454845865">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.9014158157446451474" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5224413709454845853">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5224413709454845847">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5224413709454845849">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5224413709454845845" resolveInfo="op" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5224413709454845845">
      <property name="name" nameId="tpck.1169194664001" value="op" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.5224413709454835433" resolveInfo="EventPropertyAccessOp" />
    </node>
  </root>
  <root id="1642651187740411837">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="1642651187740411838">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7936848552255083864">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7936848552255083865">
          <property name="name" nameId="tpck.1169194664001" value="abt" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="7936848552255083866">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="sqp9.8381258131358158044" resolveInfo="UIObject" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7936848552255083867">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7936848552255083868">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7936848552255083869">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1642651187740411839" resolveInfo="uios" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="7936848552255083870">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.8381258131358446226" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="7936848552255083871">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t8yi.1719339442171687163" resolveInfo="actuallyBelongsTo" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="8923564134259416728">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134259416729">
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.AssertStatement" typeId="tpd4.1175517400280" id="8923564134259416738">
            <node role="condition" roleId="tpd4.1175517761460" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134259416762">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134259416757">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134259416752">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134259416743">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8923564134259416742">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1642651187740411839" resolveInfo="uios" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="8923564134259416747">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.8923564134258876765" resolveInfo="getOwner" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8923564134259416756">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.8381258131358446226" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="8923564134259416761">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t8yi.8115675450774407592" resolveInfo="allExtends" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.ContainsOperation" typeId="tp2q.1172254888721" id="8923564134259416766">
                <node role="argument" roleId="tp2q.1172256416782" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8923564134259416769">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7936848552255083865" resolveInfo="abt" />
                </node>
              </node>
            </node>
            <node role="errorString" roleId="tpd4.1175517851849" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8923564134259416771">
              <property name="value" nameId="tpee.1070475926801" value="Wrong context" />
            </node>
            <node role="nodeToReport" roleId="tpd4.1227096802790" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8923564134259416773">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1642651187740411839" resolveInfo="uios" />
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134259416733">
          <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8923564134259416732">
            <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1642651187740411839" resolveInfo="uios" />
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="8923564134259416737">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.8923564134258699721" resolveInfo="hasOwner" />
          </node>
        </node>
        <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="8923564134259416775">
          <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134259416776">
            <node role="statement" roleId="tpee.1068581517665" type="tpd4.AssertStatement" typeId="tpd4.1175517400280" id="8923564134259658269">
              <node role="errorString" roleId="tpd4.1175517851849" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8923564134259658284">
                <property name="value" nameId="tpee.1070475926801" value="No context" />
              </node>
              <node role="nodeToReport" roleId="tpd4.1227096802790" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8923564134259658285">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1642651187740411839" resolveInfo="uios" />
              </node>
              <node role="condition" roleId="tpd4.1175517761460" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134259658279">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134259658274">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134259658275">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8923564134259658276">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1642651187740411839" resolveInfo="uios" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="8923564134259658277">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.8923564134258524082" resolveInfo="getCompartmentProvider" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="8923564134259658278">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.8923564134258345446" resolveInfo="getOwnerExpression" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="8923564134259658283" />
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="1642651187740413336">
              <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1642651187740413339">
                <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1642651187740413328">
                  <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134259416801">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134259416802">
                      <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8923564134259416803">
                        <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1642651187740411839" resolveInfo="uios" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="8923564134259416804">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.8923564134258524082" resolveInfo="getCompartmentProvider" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="8923564134259416805">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.8923564134258345446" resolveInfo="getOwnerExpression" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5197527271413889634">
                <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5197527271413889637">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5197527271413889636">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1642651187740411839" resolveInfo="uios" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="5197527271413889641">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.5197527271413889619" resolveInfo="expectedContextType" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5197527271413889642">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7936848552255083865" resolveInfo="abt" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1642651187740411839">
      <property name="name" nameId="tpck.1169194664001" value="uios" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.8381258131358446225" resolveInfo="UIObjectStatement" />
    </node>
  </root>
  <root id="6424935405034937381">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6424935405034937382">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="6424935405034937393">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6424935405034937397">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6424935405034937404">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6424935405034937399">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6424935405034937398">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6424935405034937383" resolveInfo="ca" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6424935405034937403">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.6424935405034937366" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6424935405034937408">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.6424935405034408144" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6424935405034937396">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6424935405034937385">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6424935405034937388">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6424935405034937387">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6424935405034937383" resolveInfo="ca" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6424935405034937392">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.6424935405034937365" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6424935405034937383">
      <property name="name" nameId="tpck.1169194664001" value="ca" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.6424935405034937364" resolveInfo="ChildAspect" />
    </node>
  </root>
  <root id="7109250785405034423">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="7109250785405034424">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5776545240965590523">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5776545240965590524">
          <property name="name" nameId="tpck.1169194664001" value="res" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="5776545240965590525" />
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5776545240965590526">
            <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeListCreator" typeId="tp25.1145567426890" id="5776545240965590527">
              <node role="createdType" roleId="tp25.1145567471833" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="5776545240965590528" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="8923564134257650182">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134257650183">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5776545240965611910">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965611912">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5776545240965611911">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5776545240965590524" resolveInfo="res" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="5776545240965611916">
                <node role="argument" roleId="tp2q.1160612519549" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5776545240965611922">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="5776545240965611926">
                    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="5776545240965611929">
                      <property name="linkRole" nameId="tpck.1757699476691236116" value="uiObject" />
                      <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965611933">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965611934">
                          <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240965611935">
                            <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7109250785405034426" resolveInfo="uiot" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240965611936">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.2144302022143885809" />
                          </node>
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240965611937">
                          <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.8381258131358158057" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134257650192">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134257650187">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8923564134257650186">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7109250785405034426" resolveInfo="uiot" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8923564134257650191">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.2144302022143885809" />
            </node>
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="8923564134257650196" />
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7109250785405055920">
        <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5776545240965611938">
          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5776545240965590524" resolveInfo="res" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="7109250785405034426">
      <property name="name" nameId="tpck.1169194664001" value="uiot" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.2144302022143885807" resolveInfo="UIObjectType" />
    </node>
  </root>
  <root id="5776545240964029380">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="5776545240964029381">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5776545240964029383">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5776545240964029384">
          <property name="name" nameId="tpck.1169194664001" value="anchor" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="5776545240964029385" />
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="5776545240964029386">
            <node role="expression" roleId="tpee.1079359253376" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="5776545240964029387">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240964029388">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240964029389">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240964029390">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240964029382" resolveInfo="enclosing" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="5776545240964029391" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="5776545240964029392">
                  <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="5776545240964029393">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="fb0y.8381258131358446225" resolveInfo="UIObjectStatement" />
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240964029394">
                <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240964029395">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240964029382" resolveInfo="enclosing" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="5776545240964029396" />
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240964029397">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240964029382" resolveInfo="enclosing" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5776545240964029398">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5776545240964029399">
          <property name="name" nameId="tpck.1169194664001" value="ctx" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="5776545240964029400">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240964029401">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5776545240964029402">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5776545240964029384" resolveInfo="anchor" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="5776545240964029403">
              <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_ConceptList" typeId="tp25.1154546920561" id="5776545240964029404">
                <node role="concept" roleId="tp25.1154546920563" type="tp25.ConceptReference" typeId="tp25.1154546950173" id="5776545240964029426">
                  <link role="concept" roleId="tp25.1154546997487" targetNodeId="fb0y.4391079257750083005" resolveInfo="ContainerCompartment" />
                </node>
                <node role="concept" roleId="tp25.1154546920563" type="tp25.ConceptReference" typeId="tp25.1154546950173" id="5776545240964029406">
                  <link role="concept" roleId="tp25.1154546997487" targetNodeId="tpee.1199653749349" resolveInfo="IStatementListContainer" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.AssertStatement" typeId="tpd4.1175517400280" id="5776545240964029407">
        <node role="condition" roleId="tpd4.1175517761460" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240964029408">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5776545240964029409">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5776545240964029399" resolveInfo="ctx" />
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="5776545240964029410">
            <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="5776545240964029427">
              <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="fb0y.4391079257750083005" resolveInfo="ContainerCompartment" />
            </node>
          </node>
        </node>
        <node role="nodeToReport" roleId="tpd4.1227096802790" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240964029412">
          <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240964029382" resolveInfo="enclosing" />
        </node>
        <node role="errorString" roleId="tpd4.1175517851849" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5776545240964029413">
          <property name="value" nameId="tpee.1070475926801" value="Not expected here" />
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="5776545240964029414">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5776545240964029415">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5776545240964029416">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240964029417">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240964029382" resolveInfo="enclosing" />
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5776545240964029418">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5776545240964029419">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="5776545240964029428">
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="5776545240964029430">
                <property name="linkRole" nameId="tpck.1757699476691236116" value="container" />
                <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240964029435">
                  <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="5776545240964029433">
                    <property name="asCast" nameId="tp25.1238684351431" value="true" />
                    <link role="concept" roleId="tp25.1140138128738" targetNodeId="fb0y.4391079257750083005" resolveInfo="ContainerCompartment" />
                    <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5776545240964029432">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5776545240964029399" resolveInfo="ctx" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240964050799">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.4391079257750083006" />
                  </node>
                </node>
              </node>
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="5776545240965656255">
                <property name="linkRole" nameId="tpck.1757699476691236116" value="uiObject" />
                <node role="expression" roleId="tp3r.1196350785111" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="5776545240965745848">
                  <property name="asCast" nameId="tp25.1238684351431" value="true" />
                  <link role="concept" roleId="tp25.1140138128738" targetNodeId="sqp9.8381258131358158044" resolveInfo="UIObject" />
                  <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965745843">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965724479">
                      <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="5776545240965724480">
                        <property name="asCast" nameId="tp25.1238684351431" value="true" />
                        <link role="concept" roleId="tp25.1140138128738" targetNodeId="fb0y.4391079257750083005" resolveInfo="ContainerCompartment" />
                        <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5776545240965724481">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5776545240964029399" resolveInfo="ctx" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240965724482">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.4391079257750083006" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="5776545240965745847" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5776545240964029382">
      <property name="name" nameId="tpck.1169194664001" value="enclosingCtx" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.5776545240964029369" resolveInfo="EnclosingContextCompartmentExpression" />
    </node>
  </root>
  <root id="5776545240964919739">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="5776545240964919740">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.TypeVarDeclaration" typeId="tpd4.1174665551739" id="5776545240964942406">
        <property name="name" nameId="tpck.1169194664001" value="UIOBJECT" />
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="5776545240964942393">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5776545240964942398">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5776545240964942399">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="5776545240964942401">
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="5776545240964942403">
                <property name="linkRole" nameId="tpck.1757699476691236116" value="uiObject" />
                <node role="expression" roleId="tp3r.1196350785111" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="5776545240964942407">
                  <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="5776545240964942406" resolveInfo="UIOBJECT" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5776545240964942397">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5776545240964942385">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240964942388">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240964942387">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240964919741" resolveInfo="cre" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240964942392">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.5776545240964919718" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="5776545240964961890">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5776545240964961894">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5776545240964961895">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="5776545240964961897">
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="5776545240964961903">
                <property name="linkRole" nameId="tpck.1757699476691236116" value="container" />
                <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965825741">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240965825740">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240964919741" resolveInfo="cre" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240965847105">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.5776545240964919734" />
                  </node>
                </node>
              </node>
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="5776545240965824479">
                <property name="linkRole" nameId="tpck.1757699476691236116" value="uiObject" />
                <node role="expression" roleId="tp3r.1196350785111" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="5776545240965825739">
                  <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="5776545240964942406" resolveInfo="UIOBJECT" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5776545240964961893">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5776545240964942409">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240964961889">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240964919741" resolveInfo="cre" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5776545240964919741">
      <property name="name" nameId="tpck.1169194664001" value="cre" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.5776545240964919716" resolveInfo="CompartmentReferenceExpression" />
    </node>
  </root>
  <root id="5776545240965111025">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="5776545240965111026">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5776545240965158221">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5776545240965158222">
          <property name="name" nameId="tpck.1169194664001" value="res" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="5776545240965158223" />
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5776545240965158224">
            <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeListCreator" typeId="tp25.1145567426890" id="5776545240965158225">
              <node role="createdType" roleId="tp25.1145567471833" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="5776545240965158226" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="5776545240965158206">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="5776545240965158207">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="5776545240965343577">
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="5776545240965343578">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5776545240965158227">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965158229">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5776545240965158228">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5776545240965158222" resolveInfo="res" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="5776545240965158233">
                    <node role="argument" roleId="tp2q.1160612519549" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5776545240965158239">
                      <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="5776545240965158240">
                        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="5776545240965158241">
                          <property name="linkRole" nameId="tpck.1757699476691236116" value="container" />
                          <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965158242">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965158243">
                              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240965158244">
                                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240965111028" resolveInfo="ct" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240965158245">
                                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.5776545240963923439" />
                              </node>
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240965158246">
                              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.6424935405035112768" />
                            </node>
                          </node>
                        </node>
                        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="5776545240965276810">
                          <property name="linkRole" nameId="tpck.1757699476691236116" value="uiObject" />
                          <node role="expression" roleId="tp3r.1196350785111" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="5776545240965364951">
                            <property name="asCast" nameId="tp25.1238684351431" value="true" />
                            <link role="concept" roleId="tp25.1140138128738" targetNodeId="sqp9.8381258131358158044" resolveInfo="UIObject" />
                            <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965364952">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965364953">
                                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965364954">
                                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240965364955">
                                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240965111028" resolveInfo="ct" />
                                  </node>
                                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240965364956">
                                    <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.5776545240963923439" />
                                  </node>
                                </node>
                                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240965364957">
                                  <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.6424935405035112768" />
                                </node>
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="5776545240965364958" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965364946">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965343581">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965343582">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240965343583">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240965111028" resolveInfo="ct" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240965343584">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.5776545240963923439" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240965343585">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.6424935405035112768" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="5776545240965364950" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5776545240965364961">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965364962">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5776545240965364963">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5776545240965158222" resolveInfo="res" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="5776545240965364964">
                <node role="argument" roleId="tp2q.1160612519549" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5776545240965364965">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="5776545240965364994">
                    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="5776545240965364997">
                      <property name="linkRole" nameId="tpck.1757699476691236116" value="uiObject" />
                      <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965365006">
                        <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240965365001">
                          <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240965111028" resolveInfo="ct" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240965365010">
                          <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.5776545240964961906" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965158216">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965158211">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240965158210">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240965111028" resolveInfo="ct" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240965158215">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.5776545240963923439" />
            </node>
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="5776545240965158220" />
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="8923564134257650164">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134257650165">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5745619648518859327">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5745619648518859328">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5745619648518859329">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5776545240965158222" resolveInfo="res" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="5745619648518859330">
                <node role="argument" roleId="tp2q.1160612519549" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5745619648518859331">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="5745619648518859332">
                    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="5745619648518859333">
                      <property name="linkRole" nameId="tpck.1757699476691236116" value="uiObject" />
                      <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5745619648518880699">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5745619648518859334">
                          <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5745619648518859335">
                            <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240965111028" resolveInfo="ct" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5745619648518859336">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.5776545240964961906" />
                          </node>
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5745619648518880703">
                          <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.8381258131358158057" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134257650174">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134257650169">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8923564134257650168">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240965111028" resolveInfo="ct" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8923564134257650173">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.5776545240964961906" />
            </node>
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="8923564134257650178" />
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5776545240965158250">
        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965158252">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5776545240965158251">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5776545240965158222" resolveInfo="res" />
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="5776545240965158256">
            <node role="argument" roleId="tp2q.1160612519549" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5776545240965158262">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="5776545240965158263">
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="5776545240965158264">
                  <property name="linkRole" nameId="tpck.1757699476691236116" value="uiObject" />
                  <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5776545240965158265">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5776545240965158266">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5776545240965111028" resolveInfo="ct" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5776545240965158267">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.5776545240964961906" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5776545240965158271">
        <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5776545240965158273">
          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5776545240965158222" resolveInfo="res" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5776545240965111028">
      <property name="name" nameId="tpck.1169194664001" value="ct" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.5776545240963923425" resolveInfo="ContainerType" />
    </node>
  </root>
  <root id="8923564134257084385">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="8923564134257084386">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.TypeVarDeclaration" typeId="tpd4.1174665551739" id="8923564134257288447">
        <property name="name" nameId="tpck.1169194664001" value="UIOBJECT" />
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="8923564134257084397">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8923564134257084402">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="8923564134257084403">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="8923564134257084405" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8923564134257084401">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="8923564134257084389">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8923564134257084392">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8923564134257084391">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8923564134257084387" resolveInfo="cps" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8923564134257084396">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.8923564134257084384" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="8923564134257084387">
      <property name="name" nameId="tpck.1169194664001" value="cps" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.8923564134257084377" resolveInfo="CompartmentProviderStatement" />
    </node>
  </root>
  <root id="2459884175397578622">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="2459884175397578623">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2459884175397753176">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2459884175397753177">
          <property name="name" nameId="tpck.1169194664001" value="oexp" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="2459884175397753178">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2459884175397753179">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2459884175397753180">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2459884175397753181">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2459884175397578624" resolveInfo="icvar" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="2459884175397753182">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="2459884175397753183">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2459884175397753184">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="fb0y.8923564134258173965" resolveInfo="ICompartmentProvider" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="2459884175397753185">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.8923564134258345446" resolveInfo="getOwnerExpression" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2459884175397753187">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2459884175397753188">
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.TypeVarDeclaration" typeId="tpd4.1174665551739" id="2459884175397753215">
            <property name="name" nameId="tpck.1169194664001" value="UIOT" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="2459884175397753205">
            <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
            <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2459884175397753210">
              <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2459884175397753211">
                <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.ContainerType" typeId="fb0y.5776545240963923425" id="2459884175397753213">
                  <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="2459884175397753216">
                    <property name="linkRole" nameId="tpck.1757699476691236116" value="uiObject" />
                    <node role="expression" roleId="tp3r.1196350785111" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="2459884175397753218">
                      <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="2459884175397753215" resolveInfo="UIOT" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2459884175397753209">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2459884175397753198">
                <node role="term" roleId="tpd4.1174657509053" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2459884175397753204">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2459884175397753177" resolveInfo="oexp" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="2459884175397753220">
            <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2459884175397753221">
              <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2459884175397753222">
                <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="2459884175397753223">
                  <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="2459884175397753224">
                    <property name="linkRole" nameId="tpck.1757699476691236116" value="uiObject" />
                    <node role="expression" roleId="tp3r.1196350785111" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="2459884175397753229">
                      <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="2459884175397753215" resolveInfo="UIOT" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2459884175397753226">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2459884175397753227">
                <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2459884175397753228">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2459884175397578624" resolveInfo="icvar" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2459884175397753192">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2459884175397753191">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2459884175397753177" resolveInfo="oexp" />
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="2459884175397753196" />
        </node>
        <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="2459884175397753230">
          <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="2459884175397753231">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2459884175397578657">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2459884175397578658">
                <property name="name" nameId="tpck.1169194664001" value="uio" />
                <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="2459884175397578659">
                  <link role="concept" roleId="tp25.1138405853777" targetNodeId="sqp9.8381258131358158044" resolveInfo="UIObject" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2459884175397753237">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2459884175397753232">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2459884175397578662">
                      <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2459884175397578663">
                        <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2459884175397578624" resolveInfo="icvar" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="2459884175397578664">
                        <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="2459884175397578665">
                          <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2459884175397578666">
                            <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="fb0y.8923564134258173965" resolveInfo="ICompartmentProvider" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="2459884175397753236">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.8923564134258257521" resolveInfo="getContainer" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2459884175397753241">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.2459884175395462415" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="2459884175397578629">
              <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2459884175397578669">
                <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2459884175397578670">
                  <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="2459884175397578672">
                    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="2459884175397578676">
                      <property name="linkRole" nameId="tpck.1757699476691236116" value="uiObject" />
                      <node role="expression" roleId="tp3r.1196350785111" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2459884175397578678">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2459884175397578658" resolveInfo="uio" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2459884175397578632">
                <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2459884175397578626">
                  <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2459884175397578628">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2459884175397578624" resolveInfo="icvar" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2459884175397578624">
      <property name="name" nameId="tpck.1169194664001" value="icvar" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.4981225789808358212" resolveInfo="IterateContentsVariable" />
    </node>
  </root>
  <root id="2459884175397939346">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="2459884175397939347">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="2459884175397939353">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2459884175397939357">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2459884175397939358">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2459884175397939361">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2459884175397939360">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2459884175397939348" resolveInfo="icvarref" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2459884175397939365">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.4981225789808819316" />
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2459884175397939356">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2459884175397939350">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2459884175397939352">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2459884175397939348" resolveInfo="icvarref" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2459884175397939348">
      <property name="name" nameId="tpck.1169194664001" value="icvarref" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.4981225789808819315" resolveInfo="IterateContentsVariableReference" />
    </node>
  </root>
  <root id="3546006303814984651">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="3546006303814984652">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="3546006303814984658">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3546006303814984663">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="3546006303814984664">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="3546006303814984666" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3546006303814984662">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="3546006303814984655">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="3546006303814984657">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3546006303814984653" resolveInfo="uiops" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="3546006303814984653">
      <property name="name" nameId="tpck.1169194664001" value="uiops" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.3546006303814984631" resolveInfo="UIObjectProviderStatement" />
    </node>
  </root>
  <root id="6261739386030572988">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6261739386030572989">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="6261739386030573000">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6261739386030573005">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6261739386030573006">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="6261739386030573008" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6261739386030573004">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6261739386030572992">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6261739386030572995">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6261739386030572994">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6261739386030572990" resolveInfo="cao" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="6261739386030572999">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpek.1213877410070" resolveInfo="getOperand" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="6261739386030573014">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6261739386030573018">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6261739386030573019">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.VoidType" typeId="tpee.1068581517677" id="6261739386030573021" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6261739386030573017">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6261739386030573011">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6261739386030573013">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6261739386030572990" resolveInfo="cao" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6261739386030572990">
      <property name="name" nameId="tpck.1169194664001" value="cao" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.6261739386030553808" resolveInfo="CallUIActionOperation" />
    </node>
  </root>
  <root id="1870423755832759891">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="1870423755832759892">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="1870423755832759894">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1870423755832759896">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1870423755832759897">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="fb0y.UIObjectType" typeId="fb0y.2144302022143885807" id="1870423755832759898" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1870423755832759899">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1870423755832759900">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1870423755832759901">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1870423755832759912">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1870423755832759893" resolveInfo="apo" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="1870423755832759903">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpek.1213877410070" resolveInfo="getOperand" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="1870423755832759904">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1870423755832759908">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1870423755832759909">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1870423755832759913">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1870423755832759893" resolveInfo="apo" />
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1870423755832759920">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1870423755832759927">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1870423755832759922">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1870423755832759921">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1870423755832759893" resolveInfo="apo" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1870423755832759926">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.1870423755832759838" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1870423755832759931">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.9014158157446451474" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1870423755832759893">
      <property name="name" nameId="tpck.1169194664001" value="apo" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.1870423755832759837" resolveInfo="AccessUIPropertyOperation" />
    </node>
  </root>
  <root id="6410919744913609590">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6410919744913609591">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="6410919744913609605">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6410919744913609609">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6410919744913609616">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6410919744913609611">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6410919744913609610">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6410919744913609592" resolveInfo="ref" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6410919744913609615">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb0y.6410919744913609580" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="6410919744913609620">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="czqe.6410919744913609596" resolveInfo="getType" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6410919744913609608">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6410919744913609602">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6410919744913609604">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6410919744913609592" resolveInfo="ref" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6410919744913609592">
      <property name="name" nameId="tpck.1169194664001" value="ref" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb0y.6410919744913609127" resolveInfo="UIObjectReference" />
    </node>
  </root>
</model>

