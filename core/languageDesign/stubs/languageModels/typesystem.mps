<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:cfd36f38-4b85-4dbc-852c-079f3960dd0b(jetbrains.mps.lang.stubs.typesystem)">
  <persistence version="7" />
  <language namespace="ef703a71-a5a3-42af-b53c-ddced816ad5c(jetbrains.mps.lang.stubs)" />
  <language namespace="7a5dda62-9140-4668-ab76-d5ed1746f2b2(jetbrains.mps.lang.typesystem)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="3a13115c-633c-4c5c-bbcc-75c4219e9555(jetbrains.mps.lang.quotation)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="n3kn" modelUID="r:4b48a44f-6ba9-48c3-ad27-273fa72f5664(jetbrains.mps.lang.stubs.structure)" version="-1" />
  <import index="ltn8" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.stubs(jetbrains.mps.stubs@java_stub)" version="-1" />
  <import index="p4ns" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.smodel.persistence(jetbrains.mps.smodel.persistence@java_stub)" version="-1" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tpd4" modelUID="r:00000000-0000-4000-0000-011c895902b4(jetbrains.mps.lang.typesystem.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tp3r" modelUID="r:00000000-0000-4000-0000-011c8959034b(jetbrains.mps.lang.quotation.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="5516999836374121358">
      <property name="name" nameId="tpck.1169194664001" value="StubsCreatorType_SubtypeOf_ModelRootManager" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stubs" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="5553449326502623316">
      <property name="name" nameId="tpck.1169194664001" value="ModelManagerType_SubtypeOf_ModelRootManager" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stubs" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="972176972348203852">
      <property name="name" nameId="tpck.1169194664001" value="typeof_Stereotype" />
    </node>
  </roots>
  <root id="5516999836374121358">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="5516999836374121359">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5516999836374123404">
        <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5516999836374123407">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5516999836374540668">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ltn8.~BaseStubModelRootManager" resolveInfo="BaseStubModelRootManager" />
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5516999836374121361">
      <property name="name" nameId="tpck.1169194664001" value="creatorType" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="n3kn.5516999836374121342" resolveInfo="StubsCreatorType" />
    </node>
  </root>
  <root id="5553449326502623316">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="5553449326502623317">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5553449326502623318">
        <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="5553449326502623319">
          <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5553449326502640419">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="p4ns.~AbstractModelRootManager" resolveInfo="AbstractModelRootManager" />
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5553449326502623321">
      <property name="name" nameId="tpck.1169194664001" value="creatorType" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="n3kn.5516999836374121342" resolveInfo="StubsCreatorType" />
    </node>
  </root>
  <root id="972176972348203852">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="972176972348203853">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="972176972348206638">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="972176972348206642">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="972176972348206643">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StringType" typeId="tpee.1225271177708" id="972176972348206645" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="972176972348206641">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="972176972348206635">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="972176972348206637">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="972176972348203854" resolveInfo="stereotype" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="972176972348244532">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="972176972348244542">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="972176972348244543">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StringType" typeId="tpee.1225271177708" id="972176972348244545" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="972176972348244536">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="972176972348206648">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="972176972348244527">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="972176972348244526">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="972176972348203854" resolveInfo="stereotype" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="972176972348244531">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="n3kn.972176972348203841" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="972176972348203854">
      <property name="name" nameId="tpck.1169194664001" value="stereotype" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="n3kn.972176972348203840" resolveInfo="Stereotype" />
    </node>
  </root>
</model>

