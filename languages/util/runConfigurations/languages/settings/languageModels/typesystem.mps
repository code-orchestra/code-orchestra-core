<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:e115237b-80f4-4ca3-87d6-2ac891492994(jetbrains.mps.execution.settings.typesystem)">
  <persistence version="7" />
  <language namespace="756e911c-3f1f-4a48-bdf5-a2ceb91b723c(jetbrains.mps.execution.settings)" />
  <language namespace="7a5dda62-9140-4668-ab76-d5ed1746f2b2(jetbrains.mps.lang.typesystem)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="ed6d7656-532c-4bc2-81d1-af945aeb8280(jetbrains.mps.baseLanguage.blTypes)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="fb9u" modelUID="r:0194e190-08ef-44f6-ab95-d9cffdb7e27b(jetbrains.mps.execution.settings.structure)" version="0" />
  <import index="tpdt" modelUID="r:00000000-0000-4000-0000-011c895902dd(jetbrains.mps.baseLanguage.blTypes.structure)" version="-1" />
  <import index="k7g3" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.util(JDK/java.util@java_stub)" version="-1" />
  <import index="tpek" modelUID="r:00000000-0000-4000-0000-011c895902c0(jetbrains.mps.baseLanguage.behavior)" version="-1" />
  <import index="4cri" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.execution.api.settings(MPS.Classpath/jetbrains.mps.execution.api.settings@java_stub)" version="-1" />
  <import index="1t7x" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.awt(JDK/java.awt@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpd4" modelUID="r:00000000-0000-4000-0000-011c895902b4(jetbrains.mps.lang.typesystem.structure)" version="3" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tp3r" modelUID="r:00000000-0000-4000-0000-011c8959034b(jetbrains.mps.lang.quotation.structure)" version="0" implicit="yes" />
  <import index="tpdu" modelUID="r:00000000-0000-4000-0000-011c895902de(jetbrains.mps.baseLanguage.blTypes.primitiveDescriptors)" version="-1" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" implicit="yes" />
  <import index="hilv" modelUID="r:afd0247c-5ce3-4424-8951-51083e421123(jetbrains.mps.execution.settings.behavior)" version="-1" implicit="yes" />
  <roots>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6981317760235393639">
      <property name="name" nameId="tpck.1169194664001" value="typeof_GetEditorOperation" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="6981317760235477733">
      <property name="name" nameId="tpck.1169194664001" value="PersistentConfigurationIsPersistentConfiguration" />
      <property name="isWeak" nameId="tpd4.1175607673137" value="true" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6981317760235477739">
      <property name="name" nameId="tpck.1169194664001" value="typeof_ReportConfigurationErrorStatement" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6981317760235477752">
      <property name="name" nameId="tpck.1169194664001" value="typeof_PersistentPropertyDeclaration" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="properties" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6981317760235477778">
      <property name="name" nameId="tpck.1169194664001" value="typeof_PersistentPropertyReferenceOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="properties" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="6981317760235477791">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="template" />
      <property name="name" nameId="tpck.1169194664001" value="TemplatePersistentPropertyIsSubtypeOfPersistentConfiguration" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6981317760235477807">
      <property name="name" nameId="tpck.1169194664001" value="typeof_PersistentConfigurationTemplateInitializer" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="template" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="6981317760235477872">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="editor" />
      <property name="name" nameId="tpck.1169194664001" value="EditorIsSusbtypeOfEditor" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6981317760235477878">
      <property name="name" nameId="tpck.1169194664001" value="typeof_EditorExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="editor" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6981317760235477903">
      <property name="name" nameId="tpck.1169194664001" value="typeof_EditorOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="editor" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6981317760235497140">
      <property name="name" nameId="tpck.1169194664001" value="typeof_Configuration_Parameter" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="6746885276348592032">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="template" />
      <property name="name" nameId="tpck.1169194664001" value="TemplatePersistentConfigurationIsITemplatePersistentConfigurationClassifier" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="6746885276348602954">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="template" />
      <property name="name" nameId="tpck.1169194664001" value="TemplatePersistentConfigurationTypeIsTemplatePersistentConfiguration" />
      <property name="isWeak" nameId="tpd4.1175607673137" value="true" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="2722628536112115603">
      <property name="name" nameId="tpck.1169194664001" value="typeof_GridBagConstraints" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="editor.ui" />
    </node>
  </roots>
  <root id="6981317760235393639">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235393640">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.TypeVarDeclaration" typeId="tpd4.1174665551739" id="6981317760235403018">
        <property name="name" nameId="tpck.1169194664001" value="T" />
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateStrongLessThanInequationStatement" typeId="tpd4.1179832490862" id="6981317760235403036">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235403041">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6981317760235403042">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="fb9u.PersistentConfigurationType" typeId="fb9u.946964771156066332" id="6981317760235403044">
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="6981317760235403045">
                <property name="linkRole" nameId="tpck.1757699476691236116" value="persistentConfiguration" />
                <node role="expression" roleId="tp3r.1196350785111" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="6981317760235403047">
                  <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="6981317760235403018" resolveInfo="T" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235403040">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6981317760235403021">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235403031">
              <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="6981317760235403029">
                <link role="concept" roleId="tp25.1140138128738" targetNodeId="tpee.1197027756228" resolveInfo="DotExpression" />
                <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235403024">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235403023">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235393641" resolveInfo="operation" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="6981317760235403028" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6981317760235403035">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1197027771414" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="6981317760235403009">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235403013">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6981317760235403014">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="fb9u.SettingsEditorType" typeId="fb9u.946964771156066618" id="6981317760235403016">
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="6981317760235403048">
                <property name="linkRole" nameId="tpck.1757699476691236116" value="configuration" />
                <node role="expression" roleId="tp3r.1196350785111" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="6981317760235403050">
                  <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="6981317760235403018" resolveInfo="T" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235403012">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6981317760235403006">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235403008">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235393641" resolveInfo="operation" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6981317760235393641">
      <property name="name" nameId="tpck.1169194664001" value="operation" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.5365453833390705317" resolveInfo="GetEditorOperation" />
    </node>
  </root>
  <root id="6981317760235477733">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235477734">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6981317760235477735">
        <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6981317760235477736">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="fb9u.PersistentConfigurationType" typeId="fb9u.946964771156066332" id="6981317760235477737" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6981317760235477738">
      <property name="name" nameId="tpck.1169194664001" value="persistentConfigurationType" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.946964771156066332" resolveInfo="PersistentConfigurationType" />
    </node>
  </root>
  <root id="6981317760235477739">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235477740">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="6981317760235477741">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477743">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6981317760235477744">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477745">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477746">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477751" resolveInfo="reportConfigurationErrorStatement" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6981317760235477747">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb9u.946964771156066565" />
              </node>
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477748">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6981317760235477749">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StringType" typeId="tpee.1225271177708" id="6981317760235477750" />
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6981317760235477751">
      <property name="name" nameId="tpck.1169194664001" value="reportConfigurationErrorStatement" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.946964771156066563" resolveInfo="ReportConfigurationErrorStatement" />
    </node>
  </root>
  <root id="6981317760235477752">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235477753">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6981317760235477754">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6981317760235477755">
          <property name="name" nameId="tpck.1169194664001" value="primitive" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="6981317760235477756">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpdt.1159268590033" resolveInfo="PrimitiveTypeDescriptor" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477757">
            <node role="operand" roleId="tpee.1197027771414" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6981317760235477758">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tpdt.PrimitiveTypeRef" typeId="tpdt.1159268661480" id="6981317760235477759">
                <link role="descriptor" roleId="tpdt.1159268661479" targetNodeId="tpdu.1196683941620" resolveInfo="Primitive" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6981317760235477760">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="tpdt.1159268661479" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="6981317760235477761">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477763">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477764">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477765">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477777" resolveInfo="persistentPropertyDeclaration" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6981317760235477766">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.5680397130376446158" />
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477767">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6981317760235477768">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpd4.JoinType" typeId="tpd4.1179479408386" id="6981317760235477769">
              <node role="argument" roleId="tpd4.1179479418730" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6981317760235477770">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Cloneable" resolveInfo="Cloneable" />
              </node>
              <node role="argument" roleId="tpd4.1179479418730" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6981317760235477771">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Enum" resolveInfo="Enum" />
              </node>
              <node role="argument" roleId="tpd4.1179479418730" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6981317760235477772">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" resolveInfo="String" />
              </node>
              <node role="argument" roleId="tpd4.1179479418730" type="tpck.BaseConcept" typeId="tpck.1133920641626" id="6981317760235477773">
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="6981317760235477774">
                  <node role="expression" roleId="tp3r.1196350785111" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6981317760235477775">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477755" resolveInfo="primitive" />
                  </node>
                </node>
              </node>
              <node role="argument" roleId="tpd4.1179479418730" type="fb9u.TemplatePersistentConfigurationType" typeId="fb9u.946964771156066557" id="6981317760235477776" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6981317760235477777">
      <property name="name" nameId="tpck.1169194664001" value="persistentPropertyDeclaration" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.946964771156066585" resolveInfo="PersistentPropertyDeclaration" />
    </node>
  </root>
  <root id="6981317760235477778">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235477779">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="6981317760235477780">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477781">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477782">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477783">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477784">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477790" resolveInfo="persistentPropertyReferenceOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6981317760235477785">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb9u.946964771156066575" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6981317760235477786">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.5680397130376446158" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477787">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6981317760235477788">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477789">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477790" resolveInfo="persistentPropertyReferenceOperation" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6981317760235477790">
      <property name="name" nameId="tpck.1169194664001" value="persistentPropertyReferenceOperation" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.946964771156066574" resolveInfo="PersistentPropertyReferenceOperation" />
    </node>
  </root>
  <root id="6981317760235477791">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235477792">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6981317760235477793">
        <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6981317760235477794">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="fb9u.PersistentConfigurationType" typeId="fb9u.946964771156066332" id="6981317760235477795">
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="6981317760235477796">
              <property name="linkRole" nameId="tpck.1757699476691236116" value="persistentConfiguration" />
              <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477797">
                <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477798">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477800" resolveInfo="templatePersistentPropertyType" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6981317760235477799">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="fb9u.946964771156066558" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6981317760235477800">
      <property name="name" nameId="tpck.1169194664001" value="templatePersistentPropertyType" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.946964771156066557" resolveInfo="TemplatePersistentConfigurationType" />
    </node>
  </root>
  <root id="6981317760235477807">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235477808">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="6981317760235477809">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477810">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6981317760235477811">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="fb9u.TemplatePersistentConfigurationType" typeId="fb9u.946964771156066557" id="6981317760235477812">
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="6981317760235546760">
                <property name="linkRole" nameId="tpck.1757699476691236116" value="persistentConfiguration" />
                <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235546763">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235546762">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477870" resolveInfo="configurationTemplateInitializer" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6981317760235546767">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="fb9u.946964771156066583" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477817">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6981317760235477818">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477819">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477870" resolveInfo="configurationTemplateInitializer" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6981317760235477820">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6981317760235477821">
          <property name="name" nameId="tpck.1169194664001" value="parameters" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="6981317760235477822">
            <link role="elementConcept" roleId="tp25.1145383142433" targetNodeId="fb9u.946964771156066586" resolveInfo="TemplateParameter" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477823">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477824">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477825">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477870" resolveInfo="configurationTemplateInitializer" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6981317760235477826">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb9u.946964771156066583" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="6981317760235477827">
              <link role="link" roleId="tp25.1138056546658" targetNodeId="fb9u.946964771156066581" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="6981317760235477828">
        <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="6981317760235477829">
          <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6981317760235477830">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477859" resolveInfo="i" />
          </node>
        </node>
        <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235477831">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6981317760235477832">
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235477833">
              <node role="statement" roleId="tpee.1068581517665" type="tpd4.ReportErrorStatement" typeId="tpd4.1175517767210" id="6981317760235477834">
                <node role="nodeToReport" roleId="tpd4.1227096802790" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477835">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477870" resolveInfo="configurationTemplateInitializer" />
                </node>
                <node role="errorString" roleId="tpd4.1175517851849" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6981317760235477836">
                  <property name="value" nameId="tpee.1070475926801" value="Incompatible number of parameters" />
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6981317760235477837" />
            </node>
            <node role="condition" roleId="tpee.1068580123160" type="tpee.GreaterThanOrEqualsExpression" typeId="tpee.1153417849900" id="6981317760235477838">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477839">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6981317760235477840">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477821" resolveInfo="parameters" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="6981317760235477841" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6981317760235477842">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477859" resolveInfo="i" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateStrongLessThanInequationStatement" typeId="tpd4.1179832490862" id="6981317760235477843">
            <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
            <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477845">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6981317760235477846">
                <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477847">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6981317760235477848">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477821" resolveInfo="parameters" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetElementOperation" typeId="tp2q.1162934736510" id="6981317760235477849">
                    <node role="argument" roleId="tp2q.1162934736511" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6981317760235477850">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477859" resolveInfo="i" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477851">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6981317760235477852">
                <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477853">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477854">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477855">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477870" resolveInfo="configurationTemplateInitializer" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="6981317760235477856">
                      <link role="link" roleId="tp25.1138056546658" targetNodeId="fb9u.946964771156066584" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6981317760235477857">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dget(int)%cjava%dlang%dObject" resolveInfo="get" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6981317760235477858">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477859" resolveInfo="i" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6981317760235477859">
          <property name="name" nameId="tpck.1169194664001" value="i" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6981317760235477860" />
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6981317760235477861">
            <property name="value" nameId="tpee.1068580320021" value="0" />
          </node>
        </node>
        <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="6981317760235477862">
          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477863">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477864">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477865">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477870" resolveInfo="configurationTemplateInitializer" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="6981317760235477866">
                <link role="link" roleId="tp25.1138056546658" targetNodeId="fb9u.946964771156066584" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="6981317760235477867" />
          </node>
          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6981317760235477868">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477859" resolveInfo="i" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="6981317760235477869" />
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6981317760235477870">
      <property name="name" nameId="tpck.1169194664001" value="configurationTemplateInitializer" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.946964771156066582" resolveInfo="PersistentConfigurationTemplateInitializer" />
    </node>
  </root>
  <root id="6981317760235477872">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235477873">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6981317760235477874">
        <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6981317760235477875">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="fb9u.SettingsEditorType" typeId="fb9u.946964771156066618" id="6981317760235477876" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6981317760235477877">
      <property name="name" nameId="tpck.1169194664001" value="settingsEditorType" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.946964771156066618" resolveInfo="SettingsEditorType" />
    </node>
  </root>
  <root id="6981317760235477878">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235477879">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.TypeVarDeclaration" typeId="tpd4.1174665551739" id="6981317760235477880">
        <property name="name" nameId="tpck.1169194664001" value="T" />
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateStrongLessThanInequationStatement" typeId="tpd4.1179832490862" id="6981317760235477881">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477882">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6981317760235477883">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477884">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477885">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477902" resolveInfo="editorExpression" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6981317760235477886">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb9u.946964771156066589" />
              </node>
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477887">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6981317760235477888">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="fb9u.PersistentConfigurationType" typeId="fb9u.946964771156066332" id="6981317760235477889">
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="6981317760235477890">
                <property name="linkRole" nameId="tpck.1757699476691236116" value="persistentConfiguration" />
                <node role="expression" roleId="tp3r.1196350785111" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="6981317760235477891">
                  <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="6981317760235477880" resolveInfo="T" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="6981317760235477893">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477894">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6981317760235477895">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="fb9u.SettingsEditorType" typeId="fb9u.946964771156066618" id="6981317760235477896">
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="6981317760235477897">
                <property name="linkRole" nameId="tpck.1757699476691236116" value="configuration" />
                <node role="expression" roleId="tp3r.1196350785111" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="6981317760235477898">
                  <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="6981317760235477880" resolveInfo="T" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477899">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6981317760235477900">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477901">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477902" resolveInfo="editorExpression" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6981317760235477902">
      <property name="name" nameId="tpck.1169194664001" value="editorExpression" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.946964771156066588" resolveInfo="EditorExpression" />
    </node>
  </root>
  <root id="6981317760235477903">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235477904">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="6981317760235477905">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477906">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6981317760235477907">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477908">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477909">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477964" resolveInfo="editorOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6981317760235477910">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb9u.946964771156066609" />
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235477911">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6981317760235477912">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477913">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477964" resolveInfo="editorOperation" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6981317760235477914">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6981317760235477915">
          <property name="name" nameId="tpck.1169194664001" value="parameters" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="6981317760235477916">
            <node role="elementType" roleId="tp2q.1151688676805" type="tp25.SConceptType" typeId="tp25.1172420572800" id="6981317760235477917">
              <link role="conceptDeclaraton" roleId="tp25.1180481110358" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
            </node>
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477918">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477919">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477920">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477964" resolveInfo="editorOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6981317760235477921">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb9u.946964771156066609" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="6981317760235477922">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpek.1213877374450" resolveInfo="getParameters" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="6981317760235639136" />
      <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="6981317760235639134">
        <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="6981317760235639135">
          <property name="text" nameId="tpee.6329021646629104958" value="all editor operation parameters are declared" />
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="6981317760235477923">
        <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="6981317760235477924">
          <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6981317760235477925">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477954" resolveInfo="i" />
          </node>
        </node>
        <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235477926">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6981317760235477927">
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235477928">
              <node role="statement" roleId="tpee.1068581517665" type="tpd4.ReportErrorStatement" typeId="tpd4.1175517767210" id="6981317760235477929">
                <node role="nodeToReport" roleId="tpd4.1227096802790" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477930">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477964" resolveInfo="editorOperation" />
                </node>
                <node role="errorString" roleId="tpd4.1175517851849" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6981317760235477931">
                  <property name="value" nameId="tpee.1070475926801" value="Incompatible number of parameters" />
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6981317760235477932" />
            </node>
            <node role="condition" roleId="tpee.1068580123160" type="tpee.GreaterThanOrEqualsExpression" typeId="tpee.1153417849900" id="6981317760235477933">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477934">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6981317760235477935">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477915" resolveInfo="parameters" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="6981317760235477936" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6981317760235477937">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477954" resolveInfo="i" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="5313207397360251117">
            <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
            <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5313207397360251118">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5313207397360251119">
                <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5313207397360251120">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5313207397360251121">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5313207397360251122">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477964" resolveInfo="editorOperation" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="5313207397360251123">
                      <link role="link" roleId="tp25.1138056546658" targetNodeId="fb9u.946964771156066607" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5313207397360251124">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dget(int)%cjava%dlang%dObject" resolveInfo="get" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5313207397360251125">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477954" resolveInfo="i" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5313207397360251126">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5313207397360251127">
                <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5313207397360251128">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5313207397360251129">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477915" resolveInfo="parameters" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetElementOperation" typeId="tp2q.1162934736510" id="5313207397360251130">
                    <node role="argument" roleId="tp2q.1162934736511" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5313207397360251131">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477954" resolveInfo="i" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6981317760235477954">
          <property name="name" nameId="tpck.1169194664001" value="i" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6981317760235477955" />
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6981317760235477956">
            <property name="value" nameId="tpee.1068580320021" value="0" />
          </node>
        </node>
        <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="6981317760235477957">
          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477958">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235477959">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235477960">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477964" resolveInfo="editorOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="6981317760235477961">
                <link role="link" roleId="tp25.1138056546658" targetNodeId="fb9u.946964771156066607" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="6981317760235477962" />
          </node>
          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6981317760235477963">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477954" resolveInfo="i" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="6981317760235639138" />
      <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="6981317760235639140">
        <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="6981317760235639141">
          <property name="text" nameId="tpee.6329021646629104958" value="all declared parameters present" />
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6981317760235639129">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235639130">
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.ReportErrorStatement" typeId="tpd4.1175517767210" id="6981317760235639162">
            <node role="errorString" roleId="tpd4.1175517851849" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6981317760235639165">
              <property name="value" nameId="tpee.1070475926801" value="Incompatible number of parameters" />
            </node>
            <node role="nodeToReport" roleId="tpd4.1227096802790" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235639166">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477964" resolveInfo="editorOperation" />
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="6981317760235639153">
          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235639157">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6981317760235639156">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6981317760235477915" resolveInfo="parameters" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="6981317760235639161" />
          </node>
          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235639148">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6981317760235639143">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235639142">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235477964" resolveInfo="editorOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="6981317760235639147">
                <link role="link" roleId="tp25.1138056546658" targetNodeId="fb9u.946964771156066607" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="6981317760235639152" />
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6981317760235477964">
      <property name="name" nameId="tpck.1169194664001" value="editorOperation" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.946964771156066606" resolveInfo="EditorOperationCall" />
    </node>
  </root>
  <root id="6981317760235497140">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6981317760235497141">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="6981317760235497142">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235497143">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="6981317760235497144">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="hilv.946964771156066389" resolveInfo="getContextPersistentConfigurationType" />
            <link role="concept" roleId="tp25.1206019820684" targetNodeId="fb9u.946964771156066336" resolveInfo="PersistentConfiguration" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235497145">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235497149" resolveInfo="configurationParameter" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6981317760235497146">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6981317760235497147">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6981317760235497148">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6981317760235497149" resolveInfo="configurationParameter" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6981317760235497149">
      <property name="name" nameId="tpck.1169194664001" value="configurationParameter" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.946964771156067216" resolveInfo="Configuration_Parameter" />
    </node>
  </root>
  <root id="6746885276348592032">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="6746885276348592033">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6746885276348593449">
        <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6746885276348593451">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6131607264791629803">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4cri.~ITemplatePersistentConfiguration" resolveInfo="ITemplatePersistentConfiguration" />
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6746885276348592034">
      <property name="name" nameId="tpck.1169194664001" value="templatePersistentConfigurationType" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.946964771156066557" resolveInfo="TemplatePersistentConfigurationType" />
    </node>
  </root>
  <root id="6746885276348602954">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="6746885276348602955">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6746885276348607764">
        <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6746885276348607766">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="fb9u.TemplatePersistentConfigurationType" typeId="fb9u.946964771156066557" id="6746885276348607768" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6746885276348602956">
      <property name="name" nameId="tpck.1169194664001" value="templatePersistentConfigurationType" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.946964771156066557" resolveInfo="TemplatePersistentConfigurationType" />
    </node>
  </root>
  <root id="2722628536112115603">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="2722628536112115604">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="2722628536112115610">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2722628536112115614">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2722628536112115615">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2722628536112115618">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1t7x.~GridBagConstraints" resolveInfo="GridBagConstraints" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2722628536112115613">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2722628536112115607">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2722628536112115609">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2722628536112115605" resolveInfo="gridBagConstraints" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateStrongLessThanInequationStatement" typeId="tpd4.1179832490862" id="2158326176673575456">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2158326176673575457">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2158326176673575458">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2158326176673575459">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2158326176673575460">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2722628536112115605" resolveInfo="gridBagConstraints" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2158326176673575461">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fb9u.2722628536112144966" />
              </node>
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2158326176673575462">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2158326176673575463">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpd4.JoinType" typeId="tpd4.1179479408386" id="2158326176673575464">
              <node role="argument" roleId="tpd4.1179479418730" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2158326176673575465" />
              <node role="argument" roleId="tpd4.1179479418730" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2158326176673575466">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2722628536112115605">
      <property name="name" nameId="tpck.1169194664001" value="gridBagConstraints" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fb9u.2722628536111969416" resolveInfo="GridBagConstraints" />
    </node>
  </root>
</model>

