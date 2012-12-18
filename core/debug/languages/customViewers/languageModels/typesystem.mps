<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:3883084c-f018-4330-aab0-6829350c4b17(jetbrains.mps.debug.customViewers.typesystem)">
  <persistence version="7" />
  <language namespace="fa8aeae9-4df9-4e13-bfb1-9b04c67ddb77(jetbrains.mps.debug.customViewers)" />
  <language namespace="7a5dda62-9140-4668-ab76-d5ed1746f2b2(jetbrains.mps.lang.typesystem)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="774bf8a0-62e5-41e1-af63-f4812e60e48b(jetbrains.mps.baseLanguage.checkedDots)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="3a13115c-633c-4c5c-bbcc-75c4219e9555(jetbrains.mps.lang.quotation)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="kisg" modelUID="r:c8cdf89f-8d25-442c-ae58-6e44844b68d7(jetbrains.mps.debug.customViewers.structure)" version="0" />
  <import index="k7g3" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.util(java.util@java_stub)" version="-1" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpd4" modelUID="r:00000000-0000-4000-0000-011c895902b4(jetbrains.mps.lang.typesystem.structure)" version="3" implicit="yes" />
  <import index="tp3r" modelUID="r:00000000-0000-4000-0000-011c8959034b(jetbrains.mps.lang.quotation.structure)" version="0" implicit="yes" />
  <import index="pxpg" modelUID="r:5a550369-d6d9-4c89-a89b-1bb748dc20b3(jetbrains.mps.baseLanguage.checkedDots.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="5117350825036256355">
      <property name="name" nameId="tpck.1169194664001" value="typeof_WatchableCreator" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="lowLevel.types" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="5264817233616805983">
      <property name="name" nameId="tpck.1169194664001" value="supertypesOfArrayValueType" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="lowLevel.types" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="5264817233616805992">
      <property name="name" nameId="tpck.1169194664001" value="supertypesOfPrimitiveValueType" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="lowLevel.types" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="5264817233616805998">
      <property name="name" nameId="tpck.1169194664001" value="supertypesOfObjectValueType" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="lowLevel.types" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="2488554353950312724">
      <property name="name" nameId="tpck.1169194664001" value="typeof_FieldOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="lowLevel.operations.object" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="2488554353950312780">
      <property name="name" nameId="tpck.1169194664001" value="typeof_ElementOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="lowLevel.operations.array" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="1843851250586697609">
      <property name="name" nameId="tpck.1169194664001" value="typeof_ElementsRangeOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="lowLevel.operations.array" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="7744028807303023773">
      <property name="name" nameId="tpck.1169194664001" value="typeof_CallMethodOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="lowLevel.operations.object" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="7430908097350531688">
      <property name="name" nameId="tpck.1169194664001" value="supertypesOfStringValueType" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="lowLevel.types" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="929171734855792317">
      <property name="name" nameId="tpck.1169194664001" value="typeof_IsInstanceOfOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="lowLevel.operations.object" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="43370322128290635">
      <property name="name" nameId="tpck.1169194664001" value="typeof_HighLevelWatchableCreator" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="highLevel" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="43370322128303938">
      <property name="name" nameId="tpck.1169194664001" value="typeof_HighLevelValue_ConceptFunctionParameter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="highLevel" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="1842653058274902924">
      <property name="name" nameId="tpck.1169194664001" value="WatchableListIsAListOrWatchables" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="types" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="1842653058275008950">
      <property name="name" nameId="tpck.1169194664001" value="WatchableListIsAList" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="highLevel" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="1842653058275013459">
      <property name="name" nameId="tpck.1169194664001" value="typeof_WatchablesListCreator" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="highLevel" />
    </node>
  </roots>
  <root id="5117350825036256355">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="5117350825036256356">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="5117350825036256362">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5264817233616805960">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5264817233616805961">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="kisg.WatchableType" typeId="kisg.5117350825036256333" id="5264817233616805963" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5117350825036256365">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5117350825036256359">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5117350825036256361">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5117350825036256357" resolveInfo="watchableCreator" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="5264817233616805974">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5264817233616805979">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5264817233616805980">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="kisg.ValueType" typeId="kisg.5117350825036234462" id="5264817233616805982" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5264817233616805978">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5264817233616805966">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5264817233616805969">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5264817233616805968">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5117350825036256357" resolveInfo="watchableCreator" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5264817233616805973">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="kisg.5117350825036256341" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5117350825036256357">
      <property name="name" nameId="tpck.1169194664001" value="watchableCreator" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.5117350825036256338" resolveInfo="WatchableCreator" />
    </node>
  </root>
  <root id="5264817233616805983">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="5264817233616805984">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5264817233616805987">
        <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5264817233616805989">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="kisg.ValueType" typeId="kisg.5117350825036234462" id="5264817233616805991" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5264817233616805986">
      <property name="name" nameId="tpck.1169194664001" value="arrayValueType" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.5117350825036234467" resolveInfo="ArrayValueType" />
    </node>
  </root>
  <root id="5264817233616805992">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="5264817233616805993">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5264817233616805994">
        <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5264817233616805995">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="kisg.ValueType" typeId="kisg.5117350825036234462" id="5264817233616805996" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5264817233616805997">
      <property name="name" nameId="tpck.1169194664001" value="primitiveValueType" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.5117350825036234478" resolveInfo="PrimitiveValueType" />
    </node>
  </root>
  <root id="5264817233616805998">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="5264817233616805999">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5264817233616806000">
        <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5264817233616806001">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="kisg.ValueType" typeId="kisg.5117350825036234462" id="5264817233616806002" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5264817233616806003">
      <property name="name" nameId="tpck.1169194664001" value="objectValueType" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.5117350825036234473" resolveInfo="ObjectValueType" />
    </node>
  </root>
  <root id="2488554353950312724">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="2488554353950312725">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="2488554353950312736">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2488554353950312741">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2488554353950312742">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StringType" typeId="tpee.1225271177708" id="2488554353950312744" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2488554353950312740">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2488554353950312728">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2488554353950312731">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2488554353950312730">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2488554353950312726" resolveInfo="fieldOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2488554353950312735">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="kisg.2488554353950312694" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2488554353950312726">
      <property name="name" nameId="tpck.1169194664001" value="fieldOperation" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.2488554353950312668" resolveInfo="FieldOperation" />
    </node>
  </root>
  <root id="2488554353950312780">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="2488554353950312781">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="2488554353950312792">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2488554353950312797">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2488554353950312798">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2488554353950312800" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2488554353950312796">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2488554353950312784">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2488554353950312787">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2488554353950312786">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2488554353950312782" resolveInfo="elementOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2488554353950312791">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="kisg.2488554353950312753" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2488554353950312782">
      <property name="name" nameId="tpck.1169194664001" value="elementOperation" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.2488554353950312745" resolveInfo="ElementOperation" />
    </node>
  </root>
  <root id="1843851250586697609">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="1843851250586697610">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="1843851250586699805">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1843851250586699810">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1843851250586699811">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1843851250586699813" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1843851250586699809">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1843851250586699797">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1843851250586699800">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1843851250586699799">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1843851250586697611" resolveInfo="elementsRangeOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1843851250586699804">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="kisg.1843851250586697565" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="1843851250586699814">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1843851250586699816">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1843851250586699817">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1843851250586699818" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1843851250586699819">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1843851250586699820">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1843851250586699821">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1843851250586699822">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1843851250586697611" resolveInfo="elementsRangeOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1843851250586699824">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="kisg.1843851250586697568" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1843851250586697611">
      <property name="name" nameId="tpck.1169194664001" value="elementsRangeOperation" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.1843851250586697564" resolveInfo="ElementsRangeOperation" />
    </node>
  </root>
  <root id="7744028807303023773">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="7744028807303023774">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="7744028807303023776">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7744028807303023778">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="7744028807303023779">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StringType" typeId="tpee.1225271177708" id="7744028807303023780" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7744028807303023781">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="7744028807303023782">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7744028807303023783">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7744028807303023786">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7744028807303023775" resolveInfo="callMethodOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="7744028807303023787">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="kisg.7744028807303021420" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="7744028807303028951">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7744028807303028953">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="7744028807303028954">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StringType" typeId="tpee.1225271177708" id="7744028807303028955" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7744028807303028956">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="7744028807303028957">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7744028807303028958">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7744028807303028959">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7744028807303023775" resolveInfo="callMethodOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="7744028807303028961">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="kisg.7744028807303028944" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="7744028807303023775">
      <property name="name" nameId="tpck.1169194664001" value="callMethodOperation" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.7744028807303021417" resolveInfo="CallMethodOperation" />
    </node>
  </root>
  <root id="7430908097350531688">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="7430908097350531689">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7430908097350531691">
        <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="7430908097350531693">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="kisg.ObjectValueType" typeId="kisg.5117350825036234473" id="7430908097350531695" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="7430908097350531690">
      <property name="name" nameId="tpck.1169194664001" value="stringValueType" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.7430908097350531683" resolveInfo="StringValueType" />
    </node>
  </root>
  <root id="929171734855792317">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="929171734855792318">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="929171734855794574">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="929171734855794579">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="929171734855794580">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StringType" typeId="tpee.1225271177708" id="929171734855794583" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="929171734855794578">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="929171734855794564">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="929171734855794567">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="929171734855794566">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="929171734855792319" resolveInfo="isInstanceOfOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="929171734855794571">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="kisg.929171734855790188" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="929171734855792319">
      <property name="name" nameId="tpck.1169194664001" value="isInstanceOfOperation" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.929171734855789933" resolveInfo="IsInstanceOfOperation" />
    </node>
  </root>
  <root id="43370322128290635">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="43370322128290636">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="43370322128303929">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="43370322128303933">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="43370322128303934">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="kisg.WatchableType" typeId="kisg.5117350825036256333" id="43370322128303937" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="43370322128303932">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="43370322128293457">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="43370322128303928">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="43370322128290637" resolveInfo="highLevelWatchableCreator" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="43370322128290637">
      <property name="name" nameId="tpck.1169194664001" value="highLevelWatchableCreator" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.43370322128285902" resolveInfo="HighLevelWatchableCreator" />
    </node>
  </root>
  <root id="43370322128303938">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="43370322128303939">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="43370322128303945">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="43370322128303949">
          <node role="normalType" roleId="tpd4.1185788644032" type="pxpg.CheckedDotExpression" typeId="pxpg.4079382982702596667" id="43370322128304578">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="43370322128303951">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="43370322128303950">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="43370322128303940" resolveInfo="highLevelValue_ConceptFunctionParameter" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="43370322128303955">
                <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="43370322128303956">
                  <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="43370322128303959">
                    <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="kisg.680105146889009728" resolveInfo="HighLevelCustomViewer" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="43370322128304581">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="kisg.43370322128256026" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="43370322128303948">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="43370322128303942">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="43370322128303944">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="43370322128303940" resolveInfo="highLevelValue_ConceptFunctionParameter" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="43370322128303940">
      <property name="name" nameId="tpck.1169194664001" value="highLevelValue_ConceptFunctionParameter" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.43370322128272301" resolveInfo="HighLevelValue_ConceptFunctionParameter" />
    </node>
  </root>
  <root id="1842653058274902924">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="1842653058274902925">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1842653058274918903">
        <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6113252630645067449">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6113252630645067450">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" resolveInfo="List" />
            <node role="parameter" roleId="tpee.1109201940907" type="kisg.WatchableType" typeId="kisg.5117350825036256333" id="6113252630645121106" />
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1842653058274902926">
      <property name="name" nameId="tpck.1169194664001" value="watchableListType" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.1842653058274900915" resolveInfo="WatchableListType" />
    </node>
  </root>
  <root id="1842653058275008950">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="1842653058275008951">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1842653058275008953">
        <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1842653058275008955">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6113252630645067443">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" resolveInfo="List" />
            <node role="parameter" roleId="tpee.1109201940907" type="tpee.WildCardType" typeId="tpee.1171903607971" id="6113252630645067447" />
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1842653058275008952">
      <property name="name" nameId="tpck.1169194664001" value="watchableListType" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.1842653058274900915" resolveInfo="WatchableListType" />
    </node>
  </root>
  <root id="1842653058275013459">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="1842653058275013460">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="1842653058275013466">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1842653058275013470">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1842653058275013471">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="kisg.WatchableListType" typeId="kisg.1842653058274900915" id="1842653058275013474" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1842653058275013469">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1842653058275013463">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1842653058275013465">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1842653058275013461" resolveInfo="watchablesListCreator" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1842653058275013461">
      <property name="name" nameId="tpck.1169194664001" value="watchablesListCreator" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="kisg.1842653058274900914" resolveInfo="WatchablesListCreator" />
    </node>
  </root>
</model>

