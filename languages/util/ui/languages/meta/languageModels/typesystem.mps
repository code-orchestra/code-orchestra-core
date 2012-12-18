<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:a301270c-6f4f-43ab-84f3-d9145aa32bc7(jetbrains.mps.ui.modeling.typesystem)">
  <persistence version="7" />
  <language namespace="7a5dda62-9140-4668-ab76-d5ed1746f2b2(jetbrains.mps.lang.typesystem)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="18bc6592-03a6-4e29-a83a-7ff23bde13ba(jetbrains.mps.lang.editor)" />
  <language namespace="8a448bd0-1380-4c01-9820-0f051d33888c(jetbrains.mps.ui.modeling)" />
  <language namespace="af65afd8-f0dd-4942-87d9-63a55f2a9db1(jetbrains.mps.lang.behavior)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="3a13115c-633c-4c5c-bbcc-75c4219e9555(jetbrains.mps.lang.quotation)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="sqp9" modelUID="r:ba1d89ed-800e-4d0a-ad09-221b1011fbd1(jetbrains.mps.ui.modeling.structure)" version="2" />
  <import index="t8yi" modelUID="r:c33653ee-1be0-4ff5-9822-83365da4e9b7(jetbrains.mps.ui.modeling.behavior)" version="-1" />
  <import index="afxk" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.project(jetbrains.mps.project@java_stub)" version="-1" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" implicit="yes" />
  <import index="tpd4" modelUID="r:00000000-0000-4000-0000-011c895902b4(jetbrains.mps.lang.typesystem.structure)" version="3" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp3r" modelUID="r:00000000-0000-4000-0000-011c8959034b(jetbrains.mps.lang.quotation.structure)" version="0" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <roots>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="9014158157446908499">
      <property name="name" nameId="tpck.1169194664001" value="typeof_Property" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="4643695836679547629">
      <property name="name" nameId="tpck.1169194664001" value="typeof_ThisUIObject" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="code.uiObjects" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="4643695836679547670">
      <property name="name" nameId="tpck.1169194664001" value="typeof_PropertyValue" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="code.uiObjects.properties" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="8115675450774807740">
      <property name="name" nameId="tpck.1169194664001" value="typeof_EventHandlerParam" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="code.events" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="12091369612608217">
      <property name="name" nameId="tpck.1169194664001" value="typeof_EventParam" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="code.events" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="5703963167136660808">
      <property name="name" nameId="tpck.1169194664001" value="typeof_EventProducerParam" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="code.events" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="8938819815716721057">
      <property name="name" nameId="tpck.1169194664001" value="typeof_PropertyChangeHandlerParam" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="code.uiObjects.properties" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="4391079257750550378">
      <property name="name" nameId="tpck.1169194664001" value="typeof_ThatUIObjectParameter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="code.uiObjects" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="7655275107718250847">
      <property name="name" nameId="tpck.1169194664001" value="typeof_ContextUIObjectParam" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="code.uiObjects" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="1412244996131808499">
      <property name="name" nameId="tpck.1169194664001" value="typeof_AuxObjectAccessOp" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="code.uiObjects" />
    </node>
    <node type="tpd4.NonTypesystemRule" typeId="tpd4.1195214364922" id="1719339442171052931">
      <property name="name" nameId="tpck.1169194664001" value="check_UIObject_consistent_belongsTo" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="2459884175399838932">
      <property name="name" nameId="tpck.1169194664001" value="typeof_BeforeUIObjectParam" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="code.uiObjects" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="2663453265345757182">
      <property name="name" nameId="tpck.1169194664001" value="typeof_LayoutConstraintExpression" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="2663453265348159936">
      <property name="name" nameId="tpck.1169194664001" value="typeof_ExpressionWithUnit" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="5572604531249544061">
      <property name="name" nameId="tpck.1169194664001" value="typeof_AspectParameterRef" />
    </node>
    <node type="tpd4.TypesystemQuickFix" typeId="tpd4.1216383170661" id="5572604531249544171">
      <property name="name" nameId="tpck.1169194664001" value="fix_IAspectParameterHolder" />
    </node>
    <node type="tpd4.NonTypesystemRule" typeId="tpd4.1195214364922" id="5572604531249544180">
      <property name="name" nameId="tpck.1169194664001" value="check_IAspectParameterHolder" />
    </node>
  </roots>
  <root id="9014158157446908499">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="9014158157446908500">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="9014158157446910428">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="9014158157446910432">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9014158157446910434">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="9014158157446910433">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="9014158157446908501" resolveInfo="property" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="9014158157446910438">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.9014158157446451474" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="9014158157446910431">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="9014158157446910425">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="9014158157446910427">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="9014158157446908501" resolveInfo="property" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="9014158157446908501">
      <property name="name" nameId="tpck.1169194664001" value="property" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.8381258131358158045" resolveInfo="Property" />
    </node>
  </root>
  <root id="4643695836679547629">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="4643695836679547630">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="4643695836679547636">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4643695836679547640">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4643695836679547651">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4643695836679547642">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4643695836679547641">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4643695836679547631" resolveInfo="tuio" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="4643695836679547646">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="4643695836679547647">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="4643695836679547650">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="sqp9.4643695836678898389" resolveInfo="Template" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4643695836679547655">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.4643695836678898436" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4643695836679547639">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="4643695836679547633">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4643695836679547635">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4643695836679547631" resolveInfo="tuio" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="4643695836679547631">
      <property name="name" nameId="tpck.1169194664001" value="tuiop" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.4643695836679547627" resolveInfo="ThisUIObject" />
    </node>
  </root>
  <root id="4643695836679547670">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="4643695836679547671">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="4643695836679547677">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4643695836679547681">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4643695836679547697">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4643695836679547692">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4643695836679547683">
                <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4643695836679547682">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4643695836679547672" resolveInfo="pv" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="4643695836679547687">
                  <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="4643695836679547688">
                    <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="4643695836679547691">
                      <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="sqp9.4643695836678934010" resolveInfo="PropertyAccessor" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4643695836679547696">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.4643695836678934012" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4643695836679547701">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.9014158157446451474" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4643695836679547680">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="4643695836679547674">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4643695836679547676">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4643695836679547672" resolveInfo="pv" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="4643695836679547672">
      <property name="name" nameId="tpck.1169194664001" value="pv" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.4643695836679547628" resolveInfo="PropertyValue" />
    </node>
  </root>
  <root id="8115675450774807740">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="8115675450774807741">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.TypeVarDeclaration" typeId="tpd4.1174665551739" id="8115675450774809684">
        <property name="name" nameId="tpck.1169194664001" value="EVENT_TYPE" />
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="8115675450774809688">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8115675450774809708">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8115675450774809719">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8115675450774809710">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8115675450774809709">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8115675450774807742" resolveInfo="ehp" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="8115675450774809714">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="8115675450774809715">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="8115675450774809718">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="sqp9.8115675450774717215" resolveInfo="EventHandlingCode" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8115675450774809723">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.8115675450774806489" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8115675450774809691">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="8115675450774809687">
            <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="8115675450774809684" resolveInfo="EVENT_TYPE" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="8115675450774809726">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8115675450774809730">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="8115675450774809731">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="8115675450774809733">
              <node role="parameterType" roleId="tp2c.1199542501692" type="tpee.Type" typeId="tpee.1068431790189" id="8115675450774809736">
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="8115675450774809737">
                  <node role="expression" roleId="tp3r.1196350785111" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="8115675450774809739">
                    <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="8115675450774809684" resolveInfo="EVENT_TYPE" />
                  </node>
                </node>
              </node>
              <node role="resultType" roleId="tp2c.1199542457201" type="tpee.VoidType" typeId="tpee.1068581517677" id="8115675450774809735" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="12091369613268996">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="12091369613268997">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="12091369613268999">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8115675450774807742" resolveInfo="ehp" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="8115675450774807742">
      <property name="name" nameId="tpck.1169194664001" value="ehp" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.8115675450774807738" resolveInfo="EventHandlerParam" />
    </node>
  </root>
  <root id="12091369612608217">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="12091369612608218">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="12091369612932414">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="12091369612932418">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="12091369612933624">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="12091369612932420">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="12091369612932419">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="12091369612608219" resolveInfo="ep" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="12091369612933619">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="12091369612933620">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="12091369612933623">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="sqp9.8115675450774717215" resolveInfo="EventHandlerTemplate" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="12091369612933628">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.8115675450774806489" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="12091369612932417">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="12091369612917632">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="12091369612917634">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="12091369612608219" resolveInfo="ep" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="12091369612608219">
      <property name="name" nameId="tpck.1169194664001" value="ep" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.8115675450774717217" resolveInfo="EventParam" />
    </node>
  </root>
  <root id="5703963167136660808">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="5703963167136660809">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="5703963167136662737">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5703963167136662741">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5703963167136663947">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5703963167136662743">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5703963167136662742">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5703963167136660810" resolveInfo="epp" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="5703963167136663942">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="5703963167136663943">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="5703963167136663946">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="sqp9.8115675450774717215" resolveInfo="EventHandlerTemplate" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5703963167136663951">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.5703963167136336336" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5703963167136662740">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5703963167136662734">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5703963167136662736">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5703963167136660810" resolveInfo="epp" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5703963167136660810">
      <property name="name" nameId="tpck.1169194664001" value="epp" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.5703963167136660800" resolveInfo="EventProducerParam" />
    </node>
  </root>
  <root id="8938819815716721057">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="8938819815716721058">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="8938819815716728733">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8938819815716728739">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="8938819815716728740">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tp2c.FunctionType" typeId="tp2c.1199542442495" id="8938819815716728742">
              <node role="parameterType" roleId="tp2c.1199542501692" type="tpee.Type" typeId="tpee.1068431790189" id="8938819815716728744">
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="8938819815716728745">
                  <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8938819815716728748">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8938819815716728749">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8938819815716728750">
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="8938819815716728752">
                          <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="8938819815716728753">
                            <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="8938819815716728754">
                              <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="sqp9.8938819815716373279" resolveInfo="EditableUIPropertyAccessCode" />
                            </node>
                          </node>
                        </node>
                        <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8938819815716728757">
                          <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8938819815716721059" resolveInfo="handler" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8938819815716728755">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.8938819815716373280" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8938819815716728756">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.9014158157446451474" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="resultType" roleId="tp2c.1199542457201" type="tpee.VoidType" typeId="tpee.1068581517677" id="8938819815716728747" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8938819815716728736">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="8938819815716722983">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8938819815716722985">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8938819815716721059" resolveInfo="handler" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="8938819815716721059">
      <property name="name" nameId="tpck.1169194664001" value="handler" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.8938819815716721054" resolveInfo="PropertyChangeHandlerParam" />
    </node>
  </root>
  <root id="4391079257750550378">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="4391079257750550379">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="4391079257750740791">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4391079257750740795">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4391079257750740806">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4391079257750740797">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4391079257750740796">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4391079257750550380" resolveInfo="param" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="4391079257750740801">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="4391079257750740802">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="4391079257750740805">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="sqp9.4391079257750389358" resolveInfo="ContainerTemplate" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4391079257750740810">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.4391079257750550448" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4391079257750740794">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="4391079257750740788">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4391079257750740790">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4391079257750550380" resolveInfo="param" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="4391079257750550380">
      <property name="name" nameId="tpck.1169194664001" value="param" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.4391079257750550368" resolveInfo="ThatUIObjectParameter" />
    </node>
  </root>
  <root id="7655275107718250847">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="7655275107718250848">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1642651187739191107">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1642651187739191108">
          <property name="name" nameId="tpck.1169194664001" value="ctx" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1642651187739191109">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="sqp9.1642651187739181626" resolveInfo="Context" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1642651187739191110">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1642651187739191111">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1642651187739191112">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7655275107718250849" resolveInfo="param" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="1642651187739191113">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="1642651187739191114">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1642651187739191115">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="sqp9.7655275107718250838" resolveInfo="UIObjectFactory" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1642651187739191116">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.1642651187739182158" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1642651187739191119">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1642651187739191120">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1642651187739191412">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1642651187739191413">
              <property name="name" nameId="tpck.1169194664001" value="ctpl" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1642651187739191414" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1642651187739191415">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1642651187739191416">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1642651187739191417">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1642651187739191108" resolveInfo="ctx" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1642651187739191418">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.1642651187739181627" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="1642651187739191419">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t8yi.3939571372331676060" resolveInfo="findTemplate" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1642651187739191420">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1642651187739191421">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1642651187739191108" resolveInfo="ctx" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetModelOperation" typeId="tp25.1143234257716" id="1642651187739191422" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1642651187739191423">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="afxk.~GlobalScope%dgetInstance()%cjetbrains%dmps%dproject%dGlobalScope" resolveInfo="getInstance" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="afxk.~GlobalScope" resolveInfo="GlobalScope" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="1642651187739191439">
            <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1642651187739191443">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1642651187739191447">
                <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="1642651187739191445">
                  <property name="asCast" nameId="tp25.1238684351431" value="true" />
                  <link role="concept" roleId="tp25.1140138128738" targetNodeId="sqp9.4643695836678898389" resolveInfo="UIObjectTemplate" />
                  <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1642651187739191444">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1642651187739191413" resolveInfo="tpl" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1642651187739191451">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.4643695836678898436" />
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1642651187739191442">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1642651187739191436">
                <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1642651187739191438">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7655275107718250849" resolveInfo="param" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1642651187739191425">
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1642651187739191426">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1642651187739321113" />
            </node>
            <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1642651187739191430">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1642651187739191429">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1642651187739191413" resolveInfo="tpl" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="1642651187739191434" />
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1642651187739191124">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1642651187739191144">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1642651187739191123">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1642651187739191108" resolveInfo="ctx" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1642651187739191148">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.1642651187739181627" />
            </node>
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="1642651187739191128" />
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.ReportErrorStatement" typeId="tpd4.1175517767210" id="1642651187739321115">
        <node role="errorString" roleId="tpd4.1175517851849" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1642651187739321118">
          <property name="value" nameId="tpee.1070475926801" value="No context available" />
        </node>
        <node role="nodeToReport" roleId="tpd4.1227096802790" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1642651187739321119">
          <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7655275107718250849" resolveInfo="param" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="7655275107718250849">
      <property name="name" nameId="tpck.1169194664001" value="param" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.7655275107718250839" resolveInfo="ContextUIObjectParam" />
    </node>
  </root>
  <root id="1412244996131808499">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="1412244996131808500">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="1412244996131810428">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1412244996131810494">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1412244996131810501">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1412244996131810496">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1412244996131810495">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1412244996131808501" resolveInfo="op" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1412244996131810500">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.1412244996131808157" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1412244996131810505">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.1412244996130857075" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1412244996131810431">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1412244996131810425">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1412244996131810427">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1412244996131808501" resolveInfo="op" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1412244996131808501">
      <property name="name" nameId="tpck.1169194664001" value="op" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.1412244996131807615" resolveInfo="AuxObjectAccessOp" />
    </node>
  </root>
  <root id="1719339442171052931">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="1719339442171052932">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1719339442171055341">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1719339442171055342">
          <property name="name" nameId="tpck.1169194664001" value="mbt" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1719339442171055343">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="sqp9.8381258131358158044" resolveInfo="UIObject" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1719339442171055344">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1719339442171055345">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1719339442171052934" resolveInfo="uio" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="1719339442171055346">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t8yi.1719339442171055203" resolveInfo="mustBelongTo" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1719339442171054977">
        <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1719339442171055321">
          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1719339442171055334">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1719339442171055347">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1719339442171055342" resolveInfo="mbt" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="1719339442171055339" />
          </node>
          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1719339442171054986">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1719339442171054981">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1719339442171054980">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1719339442171052934" resolveInfo="uio" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1719339442171054985">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.1719339442170193729" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="1719339442171054990" />
          </node>
        </node>
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1719339442171054979">
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.AssertStatement" typeId="tpd4.1175517400280" id="1719339442171055290">
            <node role="condition" roleId="tpd4.1175517761460" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1719339442171055305">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1719339442171055300">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1719339442171055295">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1719339442171055294">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1719339442171052934" resolveInfo="uio" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1719339442171055299">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.1719339442170193729" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="1719339442171055304">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t8yi.8115675450774407592" resolveInfo="allExtends" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.ContainsOperation" typeId="tp2q.1172254888721" id="1719339442171055309">
                <node role="argument" roleId="tp2q.1172256416782" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1719339442171055350">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1719339442171055342" resolveInfo="mbt" />
                </node>
              </node>
            </node>
            <node role="errorString" roleId="tpd4.1175517851849" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1719339442171055352">
              <property name="value" nameId="tpee.1070475926801" value="Inconsistent enclosure" />
            </node>
            <node role="nodeToReport" roleId="tpd4.1227096802790" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1719339442171398918">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1719339442171052934" resolveInfo="uio" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1719339442171052934">
      <property name="name" nameId="tpck.1169194664001" value="uio" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.8381258131358158044" resolveInfo="UIObject" />
    </node>
  </root>
  <root id="2459884175399838932">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="2459884175399838933">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="2459884175399840218">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2459884175399840219">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2459884175399840220">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2459884175399840221">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2459884175399840222">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2459884175399838934" resolveInfo="param" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="2459884175399840223">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="2459884175399840224">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2459884175399840225">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="sqp9.4391079257750389358" resolveInfo="ContainerTemplate" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2459884175399840226">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.4391079257750550448" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2459884175399840227">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2459884175399840228">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2459884175399840229">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2459884175399838934" resolveInfo="param" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2459884175399838934">
      <property name="name" nameId="tpck.1169194664001" value="param" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.2459884175399838883" resolveInfo="BeforeUIObjectParam" />
    </node>
  </root>
  <root id="2663453265345757182">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="2663453265345757183">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="2663453265345937597">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2663453265345937601">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2663453265345937602">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="sqp9.LayoutConstraintType" typeId="sqp9.2663453265345756661" id="2663453265345937604">
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="2663453265345937605">
                <property name="linkRole" nameId="tpck.1757699476691236116" value="constraintConcept" />
                <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2663453265345958952">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2663453265345958953">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2663453265345958954">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2663453265345757184" resolveInfo="lce" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2663453265345958955">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.2663453265345757087" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetConceptOperation" typeId="tp25.1172323065820" id="2663453265345958956" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2663453265345937600">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2663453265345937594">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2663453265345937596">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2663453265345757184" resolveInfo="lce" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2663453265345757184">
      <property name="name" nameId="tpck.1169194664001" value="lce" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.2663453265345757053" resolveInfo="LayoutConstraintExpression" />
    </node>
  </root>
  <root id="2663453265348159936">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="2663453265348159937">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2663453265348162548">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2663453265348162549">
          <property name="name" nameId="tpck.1169194664001" value="ut" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="2663453265348162550">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="sqp9.2663453265347399550" resolveInfo="UnitType" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2663453265348162552">
            <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeCreator" typeId="tp25.1180636770613" id="2663453265348162553">
              <node role="createdType" roleId="tp25.1180636770616" type="tp25.SNodeType" typeId="tp25.1138055754698" id="2663453265348162554">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="sqp9.2663453265347399550" resolveInfo="UnitType" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2663453265348162556">
        <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2663453265348162570">
          <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2663453265348162558">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2663453265348162557">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2663453265348162549" resolveInfo="ut" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="2663453265348162562">
              <link role="property" roleId="tp25.1138056395725" targetNodeId="sqp9.2663453265347399891" resolveInfo="unit" />
            </node>
          </node>
          <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2663453265348162575">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2663453265348162574">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2663453265348159938" resolveInfo="ewu" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="2663453265348162579">
              <link role="property" roleId="tp25.1138056395725" targetNodeId="sqp9.2663453265347399826" resolveInfo="unit" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="2663453265348162539">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2663453265348162580">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2663453265348162581">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2663453265348162549" resolveInfo="ut" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2663453265348162542">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2663453265348162536">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2663453265348162538">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2663453265348159938" resolveInfo="ewu" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2663453265348159938">
      <property name="name" nameId="tpck.1169194664001" value="ewu" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.2663453265347366854" resolveInfo="ExpressionWithUnit" />
    </node>
  </root>
  <root id="5572604531249544061">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="5572604531249544062">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="5572604531249544068">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5572604531249544072">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5572604531249544084">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5572604531249544079">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5572604531249544074">
                <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5572604531249544073">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5572604531249544063" resolveInfo="apr" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5572604531249544078">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.5572604531249464316" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5572604531249544083">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.5572604531249464314" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5572604531249544088">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.6424935405034408144" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5572604531249544071">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5572604531249544065">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5572604531249544067">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5572604531249544063" resolveInfo="apr" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5572604531249544063">
      <property name="name" nameId="tpck.1169194664001" value="apr" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.5572604531249464315" resolveInfo="AspectParameterRef" />
    </node>
  </root>
  <root id="5572604531249544171">
    <node role="executeBlock" roleId="tpd4.1216383424566" type="tpd4.QuickFixExecuteBlock" typeId="tpd4.1216383287005" id="5572604531249544172">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5572604531249544173" />
    </node>
  </root>
  <root id="5572604531249544180">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="5572604531249544181">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.AssertStatement" typeId="tpd4.1175517400280" id="5572604531249544236">
        <node role="errorString" roleId="tpd4.1175517851849" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5572604531249544271">
          <property name="value" nameId="tpee.1070475926801" value="Wrong aspect parameters" />
        </node>
        <node role="nodeToReport" roleId="tpd4.1227096802790" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5572604531249552328">
          <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5572604531249544182" resolveInfo="hld" />
        </node>
        <node role="condition" roleId="tpd4.1175517761460" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5572604531249544266">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5572604531249544241">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5572604531249544242">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5572604531249544243">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5572604531249544244">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5572604531249544245">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5572604531249544182" resolveInfo="hld" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="5572604531249544246">
                    <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="5572604531249544247">
                      <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="5572604531249544248">
                        <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="sqp9.4391079257750389358" resolveInfo="ContainerTemplate" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5572604531249544249">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.4391079257750389360" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="5572604531249544250">
                <link role="link" roleId="tp25.1138056546658" targetNodeId="sqp9.6424935405034408112" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.DisjunctOperation" typeId="tp2q.1205598340672" id="5572604531249544251">
              <node role="rightExpression" roleId="tp2q.1176906787974" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5572604531249544252">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5572604531249544253">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5572604531249544254">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5572604531249544182" resolveInfo="hld" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="5572604531249544255">
                    <link role="link" roleId="tp25.1138056546658" targetNodeId="sqp9.5572604531249464318" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.SelectOperation" typeId="tp2q.1202128969694" id="5572604531249544256">
                  <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="5572604531249544257">
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="5572604531249544258">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5572604531249544259">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5572604531249544260">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5572604531249544261">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5572604531249544263" resolveInfo="it" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5572604531249544262">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="sqp9.5572604531249464314" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="5572604531249544263">
                      <property name="name" nameId="tpck.1169194664001" value="it" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490259" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp2q.IsEmptyOperation" typeId="tp2q.1165530316231" id="5572604531249544270" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5572604531249544182">
      <property name="name" nameId="tpck.1169194664001" value="hld" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="sqp9.5572604531249464317" resolveInfo="IAspectParameterHolder" />
    </node>
  </root>
</model>

