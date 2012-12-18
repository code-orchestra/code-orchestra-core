<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" />
  <import index="1i04" modelUID="r:3270011d-8b2d-4938-8dff-d256a759e017(jetbrains.mps.lang.behavior.structure)" version="-1" />
  <import index="hypd" modelUID="r:aa31e43e-9240-4f4d-b6db-5c1c9a86c59e(jetbrains.mps.lang.project.structure)" version="-1" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1138055754698">
      <property name="name" nameId="tpck.1169194664001" value="SNodeType" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="type" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1138056022639">
      <property name="name" nameId="tpck.1169194664001" value="SPropertyAccess" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.featureAccess" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1138056143562">
      <property name="name" nameId="tpck.1169194664001" value="SLinkAccess" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.featureAccess" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1138056282393">
      <property name="name" nameId="tpck.1169194664001" value="SLinkListAccess" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.featureAccess" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1138411891628">
      <property name="name" nameId="tpck.1169194664001" value="SNodeOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1138661924179">
      <property name="name" nameId="tpck.1169194664001" value="Property_SetOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.property" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1138676077309">
      <property name="name" nameId="tpck.1169194664001" value="EnumMemberReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.property" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1138757581985">
      <property name="name" nameId="tpck.1169194664001" value="Link_SetNewChildOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.link.child" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1139184414036">
      <property name="name" nameId="tpck.1169194664001" value="LinkList_AddNewChildOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.linkList" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1139613262185">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetParentOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1139621453865">
      <property name="name" nameId="tpck.1169194664001" value="Node_IsInstanceOfOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1139858892567">
      <property name="name" nameId="tpck.1169194664001" value="Node_InsertNewNextSiblingOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1139867745658">
      <property name="name" nameId="tpck.1169194664001" value="Node_ReplaceWithNewOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1139870260207">
      <property name="name" nameId="tpck.1169194664001" value="LinkList_AddChildOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.linkList" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1140029532506">
      <property name="name" nameId="tpck.1169194664001" value="LinkList_InsertChildFirstOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.linkList" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1140129518788">
      <property name="name" nameId="tpck.1169194664001" value="Link_DeleteChildOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.link.child" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1140131837776">
      <property name="name" nameId="tpck.1169194664001" value="Node_ReplaceWithAnotherOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1140133623887">
      <property name="name" nameId="tpck.1169194664001" value="Node_DeleteOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1140137987495">
      <property name="name" nameId="tpck.1169194664001" value="SNodeTypeCastExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1140725362528">
      <property name="name" nameId="tpck.1169194664001" value="Link_SetTargetOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.link" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1143221076066">
      <property name="name" nameId="tpck.1169194664001" value="Node_InsertNewPrevSiblingOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1143224066846">
      <property name="name" nameId="tpck.1169194664001" value="Node_InsertNextSiblingOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1143224127713">
      <property name="name" nameId="tpck.1169194664001" value="Node_InsertPrevSiblingOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1143226024141">
      <property name="name" nameId="tpck.1169194664001" value="SModelType" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="type" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1143234257716">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetModelOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1143235216708">
      <property name="name" nameId="tpck.1169194664001" value="Model_CreateNewNodeOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.model" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1143511969223">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetPrevSiblingOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1143512015885">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetNextSiblingOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1144100743722">
      <property name="name" nameId="tpck.1169194664001" value="AbstractOperationParameter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.parameter" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1144100932627">
      <property name="name" nameId="tpck.1169194664001" value="OperationParm_Inclusion" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.parameter" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1144100743722" resolveInfo="AbstractOperationParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1144101597970">
      <property name="name" nameId="tpck.1169194664001" value="OperationParm_Root" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.parameter" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1144100743722" resolveInfo="AbstractOperationParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1144101972840">
      <property name="name" nameId="tpck.1169194664001" value="OperationParm_Concept" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.parameter" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1144100743722" resolveInfo="AbstractOperationParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1144146199828">
      <property name="name" nameId="tpck.1169194664001" value="Node_CopyOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1144195091934">
      <property name="name" nameId="tpck.1169194664001" value="Node_IsRoleOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1145383075378">
      <property name="name" nameId="tpck.1169194664001" value="SNodeListType" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="type" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1145404486709">
      <property name="name" nameId="tpck.1169194664001" value="SemanticDowncastExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1145468686058">
      <property name="name" nameId="tpck.1169194664001" value="LinkList_GetCountOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.linkList" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1145567426890">
      <property name="name" nameId="tpck.1169194664001" value="SNodeListCreator" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1145552809883" resolveInfo="AbstractCreator" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1145570846907">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetNextSiblingsOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1145572800087">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetPrevSiblingsOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1145573345940">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetAllSiblingsOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1145994841052">
      <property name="name" nameId="tpck.1169194664001" value="SConceptPropertyAccess" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.featureAccess" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1146171026731">
      <property name="name" nameId="tpck.1169194664001" value="Property_HasValue_Enum" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.property" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1146253292180">
      <property name="name" nameId="tpck.1169194664001" value="Property_HasValue_Simple" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.property" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1154546920561">
      <property name="name" nameId="tpck.1169194664001" value="OperationParm_ConceptList" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.parameter" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1144100743722" resolveInfo="AbstractOperationParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1154546950173">
      <property name="name" nameId="tpck.1169194664001" value="ConceptReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.parameter" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1166648550386">
      <property name="name" nameId="tpck.1169194664001" value="Model_CreateNewRootNodeOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.model" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1143235216708" resolveInfo="Model_CreateNewNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1170384605257">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetAdapterOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1171305280644">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetDescendantsOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1171310072040">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetContainingRootOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1171315804604">
      <property name="name" nameId="tpck.1169194664001" value="Model_RootsOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.model" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1171323947159">
      <property name="name" nameId="tpck.1169194664001" value="Model_NodesOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.model" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1171407110247">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetAncestorOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1171500988903">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetChildrenOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1171999116870">
      <property name="name" nameId="tpck.1169194664001" value="Node_IsNullOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1172008320231">
      <property name="name" nameId="tpck.1169194664001" value="Node_IsNotNullOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1172244025706">
      <property name="name" nameId="tpck.1169194664001" value="LinkList_AddAllOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.linkList" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1172323065820">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetConceptOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1172326502327">
      <property name="name" nameId="tpck.1169194664001" value="Concept_IsExactlyOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.concept" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1172420572800">
      <property name="name" nameId="tpck.1169194664001" value="SConceptType" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="type" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1172424058054">
      <property name="name" nameId="tpck.1169194664001" value="ConceptRefExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1173122760281">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetAncestorsOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1175618182947">
      <property name="name" nameId="tpck.1169194664001" value="SConceptLinkAccess" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.featureAccess" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1176109685393">
      <property name="name" nameId="tpck.1169194664001" value="Model_RootsIncludingImportedOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.model" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1177026924588">
      <property name="name" nameId="tpck.1169194664001" value="RefConcept_Reference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.parameter" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1179168000618">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetIndexInParentOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1179350041460">
      <property name="name" nameId="tpck.1169194664001" value="Concept_GetDirectSuperConcepts" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.concept" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1179409122411">
      <property name="name" nameId="tpck.1169194664001" value="Node_ConceptMethodCall" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1180028149140">
      <property name="name" nameId="tpck.1169194664001" value="Concept_IsSuperConceptOfOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.concept" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1180031783296">
      <property name="name" nameId="tpck.1169194664001" value="Concept_IsSubConceptOfOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.concept" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1180457458947">
      <property name="name" nameId="tpck.1169194664001" value="Concept_GetAllSuperConcepts" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.concept" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1180458444893">
      <property name="name" nameId="tpck.1169194664001" value="Concept_GetHierarchy" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.concept" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1180636770613">
      <property name="name" nameId="tpck.1169194664001" value="SNodeCreator" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1145552809883" resolveInfo="AbstractCreator" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1181949435690">
      <property name="name" nameId="tpck.1169194664001" value="Concept_NewInstance" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.concept" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1181952871644">
      <property name="name" nameId="tpck.1169194664001" value="Concept_GetAllSubConcepts" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.concept" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1182279509750">
      <property name="name" nameId="tpck.1169194664001" value="Concept_FindInstances" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.concept" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1182511038748">
      <property name="name" nameId="tpck.1169194664001" value="Model_NodesIncludingImportedOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.model" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1204762015203">
      <property name="name" nameId="tpck.1169194664001" value="IAttributeAccessQualifier" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attribute" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1204763358057">
      <property name="name" nameId="tpck.1169194664001" value="NodeAttributeAccessQualifier" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1204832665472">
      <property name="name" nameId="tpck.1169194664001" value="PropertyAttributeAccessQualifier" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1204834061007">
      <property name="name" nameId="tpck.1169194664001" value="IPropertyAccessQualifier" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attribute" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1204834851141">
      <property name="name" nameId="tpck.1169194664001" value="PoundExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.parameter" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1204837120311">
      <property name="name" nameId="tpck.1169194664001" value="PropertyRefQualifier" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1204848879094">
      <property name="name" nameId="tpck.1169194664001" value="ILinkAccessQualifier" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attribute" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1204848911283">
      <property name="name" nameId="tpck.1169194664001" value="LinkAttributeAccessQualifier" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1204851882688">
      <property name="name" nameId="tpck.1169194664001" value="LinkRefQualifier" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1204919674986">
      <property name="name" nameId="tpck.1169194664001" value="_LinkAccessT" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="type_internal" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1205357139746">
      <property name="name" nameId="tpck.1169194664001" value="AllAttributesQualifier" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1204761823073">
      <property name="name" nameId="tpck.1169194664001" value="AttributeAccessOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1205861725686">
      <property name="name" nameId="tpck.1169194664001" value="Node_IsAttributeOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1206019730951">
      <property name="name" nameId="tpck.1169194664001" value="StaticConceptMethodCall" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068499141036" resolveInfo="BaseMethodCall" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1206482823744">
      <property name="name" nameId="tpck.1169194664001" value="Model_AddRootOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.model" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1206659704055">
      <property name="name" nameId="tpck.1169194664001" value="IRefConceptArg" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.parameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1212008292747">
      <property name="name" nameId="tpck.1169194664001" value="Model_GetLongNameOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.model" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1215103457144">
      <property name="name" nameId="tpck.1169194664001" value="LinkList_RemoveAllChildrenOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.linkList" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1215467301810">
      <property name="name" nameId="tpck.1169194664001" value="Property_RemoveOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.property" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1219352745532">
      <property name="name" nameId="tpck.1169194664001" value="NodeRefExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1221161909218">
      <property name="name" nameId="tpck.1169194664001" value="SearchScopeType" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="type" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1221163681458">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetReferentSearchScopeOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1221170373891">
      <property name="name" nameId="tpck.1169194664001" value="SearchScope_ContainsOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1226359078165">
      <property name="name" nameId="tpck.1169194664001" value="LinkRefExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1227264722563">
      <property name="name" nameId="tpck.1169194664001" value="EqualsStructurallyExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1081773326031" resolveInfo="BinaryOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1228341669568">
      <property name="name" nameId="tpck.1169194664001" value="Node_DetachOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1240170042401">
      <property name="name" nameId="tpck.1169194664001" value="SEnumMemberType" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="type" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1240171359678">
      <property name="name" nameId="tpck.1169194664001" value="EnumMember_ValueOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="enum.enumoperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1240173327827">
      <property name="name" nameId="tpck.1169194664001" value="EnumMember_NameOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="enum.enumoperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1240930118027">
      <property name="name" nameId="tpck.1169194664001" value="SEnumOperationInvocation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="enum" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1240930395965">
      <property name="name" nameId="tpck.1169194664001" value="SEnumOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="enum.enumoperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1240930444812">
      <property name="name" nameId="tpck.1169194664001" value="SEnum_MemberForNameOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="enum.enumoperation" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1240930444878">
      <property name="name" nameId="tpck.1169194664001" value="SEnum_MemberForValueOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="enum.enumoperation" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1240930444945">
      <property name="name" nameId="tpck.1169194664001" value="SEnum_MemberOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="enum.enumoperation" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1240930444980">
      <property name="name" nameId="tpck.1169194664001" value="SEnum_MembersOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="enum.enumoperation" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1241015185235">
      <property name="name" nameId="tpck.1169194664001" value="SEnumMemberOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="enum.enumoperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1803469493727536395">
      <property name="name" nameId="tpck.1169194664001" value="OperationParm_StopConceptList" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.parameter" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1144100743722" resolveInfo="AbstractOperationParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2648652578096473304">
      <property name="name" nameId="tpck.1169194664001" value="ConceptProperty_SetOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.concept" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="4024382256428848843">
      <property name="name" nameId="tpck.1169194664001" value="ILinkAccess" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3562215692195599741">
      <property name="name" nameId="tpck.1169194664001" value="SLinkImplicitSelect" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.featureAccess" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8758390115028452779">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetReferencesOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8758390115029295477">
      <property name="name" nameId="tpck.1169194664001" value="SReferenceType" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="type" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4124388153790980106">
      <property name="name" nameId="tpck.1169194664001" value="Reference_GetTargetOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1547759872598425067">
      <property name="name" nameId="tpck.1169194664001" value="Reference_GetLinkDeclarationOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1547759872598425074">
      <property name="name" nameId="tpck.1169194664001" value="IReferenceOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.reference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5692182839349412519">
      <property name="name" nameId="tpck.1169194664001" value="Reference_GetRoleOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5820409030208923287">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetContainingLinkOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1960721196051541146">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetContainingRoleOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3609773094169249792">
      <property name="name" nameId="tpck.1169194664001" value="Node_GetReferenceOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="3542758363529077353">
      <property name="name" nameId="tpck.1169194664001" value="ILinkAccessQualifierContainer" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attribute" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5168775467716640652">
      <property name="name" nameId="tpck.1169194664001" value="OperationParm_LinkQualifier" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.parameter" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1144100743722" resolveInfo="AbstractOperationParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5708036808576088033">
      <property name="name" nameId="tpck.1169194664001" value="Reference_GetResolveInfo" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4357968816427488499">
      <property name="name" nameId="tpck.1169194664001" value="CheckedModuleReference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1540150895035667832">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.parameter" />
      <property name="name" nameId="tpck.1169194664001" value="OperationParm_SameMetaLevel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1144100743722" resolveInfo="AbstractOperationParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8339862546319741524">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <property name="name" nameId="tpck.1169194664001" value="ConceptFqNameRefExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1883223317721008708">
      <property name="name" nameId="tpck.1169194664001" value="IfInstanceOfStatement" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068580123157" resolveInfo="Statement" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1883223317721008713">
      <property name="name" nameId="tpck.1169194664001" value="IfInstanceOfVariable" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.4972933694980447171" resolveInfo="BaseVariableDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1883223317721107059">
      <property name="name" nameId="tpck.1169194664001" value="IfInstanceOfVarReference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.5497648299878491908" resolveInfo="BaseVariableReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5253134957341697434">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <property name="name" nameId="tpck.1169194664001" value="LinkNameRefExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5253134957341870583">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <property name="name" nameId="tpck.1169194664001" value="PropertyNameRefExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6407023681583031218">
      <property name="name" nameId="tpck.1169194664001" value="AttributeAccess" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attributes" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6407023681583036843">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attributes" />
      <property name="name" nameId="tpck.1169194664001" value="AttributeQualifier" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6407023681583036853">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attributes" />
      <property name="name" nameId="tpck.1169194664001" value="NodeAttributeQualifier" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="6407023681583036843" resolveInfo="AttributeQualifier" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6407023681583036855">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attributes" />
      <property name="name" nameId="tpck.1169194664001" value="LinkAttributeQualifier" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="6407023681583036843" resolveInfo="AttributeQualifier" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6407023681583040688">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attributes" />
      <property name="name" nameId="tpck.1169194664001" value="AllAttributeQualifier" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="6407023681583036843" resolveInfo="AttributeQualifier" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6407023681583040953">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attributes" />
      <property name="name" nameId="tpck.1169194664001" value="PropertyAttributeQualifier" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="6407023681583036843" resolveInfo="AttributeQualifier" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="2788452359612124330">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attributes" />
      <property name="name" nameId="tpck.1169194664001" value="ILinkQualifier" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="2788452359612124331">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attributes" />
      <property name="name" nameId="tpck.1169194664001" value="IPropertyQualifier" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2788452359612124332">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attributes" />
      <property name="name" nameId="tpck.1169194664001" value="LinkQualifier" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2788452359612124333">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="attributes" />
      <property name="name" nameId="tpck.1169194664001" value="PropertyQualifier" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5897605856268838718">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <property name="name" nameId="tpck.1169194664001" value="ConceptPropertyNameRefExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6995935425733782641">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="operation.model" />
      <property name="name" nameId="tpck.1169194664001" value="Model_GetModule" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4040588429969021681">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference.module" />
      <property name="name" nameId="tpck.1169194664001" value="ModuleReferenceExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4040588429969069898">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference.module" />
      <property name="name" nameId="tpck.1169194664001" value="LanguageReferenceExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4040588429969021681" resolveInfo="ModuleReferenceExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="448792706993295611">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <property name="name" nameId="tpck.1169194664001" value="ReadConceptReferenceExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </roots>
  <root id="1138055754698">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1138405853777">
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1138055932762">
      <property name="value" nameId="tpce.1105725733873" value="node&lt;&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1205963330815">
      <property name="value" nameId="tpce.1105725733873" value="node type" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1138056022639">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178560704219">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178560707674">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178560711770">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1206551419468">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpee.1197029536315" resolveInfo="lvalue" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1138056395725">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="property" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288299" resolveInfo="PropertyDeclaration" />
    </node>
  </root>
  <root id="1138056143562">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178326400883">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178326405417">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178552624954">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1206556926047">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpee.1197029536315" resolveInfo="lvalue" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1138056516764">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="link" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4024382256428848864">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4024382256428848843" resolveInfo="ILinkAccess" />
    </node>
  </root>
  <root id="1138056282393">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178559936953">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178559940455">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178559945036">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1138056546658">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="link" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4024382256428848939">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4024382256428848843" resolveInfo="ILinkAccess" />
    </node>
  </root>
  <root id="1138411891628">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1144104376918">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <property name="role" nameId="tpce.1071599776563" value="parameter" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1144100743722" resolveInfo="AbstractOperationParameter" />
    </node>
    <node role="conceptLinkDeclaration" roleId="tpce.1137532086877" type="tpce.ReferenceConceptLinkDeclaration" typeId="tpce.1105741578420" id="1144102537873">
      <property name="name" nameId="tpck.1169194664001" value="applicableParameter" />
      <link role="targetType" roleId="tpce.1105736621938" targetNodeId="tpce.1071489090640" resolveInfo="ConceptDeclaration" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="1143235288634">
      <property name="name" nameId="tpck.1169194664001" value="applicableToModel" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="1138763241883">
      <property name="name" nameId="tpck.1169194664001" value="applicableToNode" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="1138763303089">
      <property name="name" nameId="tpck.1169194664001" value="applicableToSimpleProperty" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="1146171845591">
      <property name="name" nameId="tpck.1169194664001" value="applicableToEnumProperty" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="1145994733391">
      <property name="name" nameId="tpck.1169194664001" value="applicableToConceptProperty" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="1138763325919">
      <property name="name" nameId="tpck.1169194664001" value="applicableToLink" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="1138763350436">
      <property name="name" nameId="tpck.1169194664001" value="applicableToLinkList" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="1172326539502">
      <property name="name" nameId="tpck.1169194664001" value="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1138411942177">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1203100323708">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpee.1197027803184" resolveInfo="IOperation" />
    </node>
  </root>
  <root id="1138661924179">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1138662048170">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="value" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1138661952712">
      <property name="value" nameId="tpce.1105725733873" value="set" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1138763502178">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763303089" resolveInfo="applicableToSimpleProperty" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1146171993189">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1146171845591" resolveInfo="applicableToEnumProperty" />
    </node>
  </root>
  <root id="1138676077309">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1150219721031">
      <property name="value" nameId="tpce.1105725733873" value="&lt;&lt;{enumMember}&gt;&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1138676095763">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="enumMember" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1083171877298" resolveInfo="EnumerationMemberDeclaration" />
    </node>
  </root>
  <root id="1138757581985">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1139880128956">
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489090640" resolveInfo="ConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1138757626129">
      <property name="value" nameId="tpce.1105725733873" value="set new" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1139345750082">
      <property name="value" nameId="tpce.1105725733873" value="set new child" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1138763471144">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
  </root>
  <root id="1139184414036">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1139877738879">
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489090640" resolveInfo="ConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1139184414037">
      <property name="value" nameId="tpce.1105725733873" value="add new" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1139351292093">
      <property name="value" nameId="tpce.1105725733873" value="add new child" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1139184414038">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763350436" resolveInfo="applicableToLinkList" />
    </node>
  </root>
  <root id="1139613262185">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1139613319562">
      <property name="value" nameId="tpce.1105725733873" value="parent" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1139613328923">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1167389280314">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179357478030">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="1138055754698" id="1179357481267" />
    </node>
  </root>
  <root id="1139621453865">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1177027386292">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptArgument" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1206659704055" resolveInfo="IRefConceptArg" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1139621506245">
      <property name="value" nameId="tpce.1105725733873" value="isInstanceOf" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1139621550545">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1180546376229">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1145915035426">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179357619822">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1179357622590" />
    </node>
  </root>
  <root id="1139858892567">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1139858989851">
      <property name="value" nameId="tpce.1105725733873" value="new next-sibling" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1139859038385">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1139858951584">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489090640" resolveInfo="ConceptDeclaration" />
    </node>
  </root>
  <root id="1139867745658">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1139867979117">
      <property name="value" nameId="tpce.1105725733873" value="replace with new" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1139868001822">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1139867957129">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489090640" resolveInfo="ConceptDeclaration" />
    </node>
  </root>
  <root id="1139870260207">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1139870362308">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="childNode" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1139870333258">
      <property name="value" nameId="tpce.1105725733873" value="add" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1139870333259">
      <property name="value" nameId="tpce.1105725733873" value="add child" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1139870333260">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763350436" resolveInfo="applicableToLinkList" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3342854882747946698">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="4943859628564383037">
      <property name="comment" nameId="tpce.1225118933224" value="this 'add' operation was replaced with nlist&lt;&gt; 'add' operation from collections laguage" />
      <property name="build" nameId="tpce.1225118929411" value="14333" />
    </node>
  </root>
  <root id="1140029532506">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1140029532507">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="childNode" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1140029532508">
      <property name="value" nameId="tpce.1105725733873" value="insert first" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1140029532509">
      <property name="value" nameId="tpce.1105725733873" value="insert child at first position" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1140029532510">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763350436" resolveInfo="applicableToLinkList" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3342854882747946702">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="4943859628564383093">
      <property name="comment" nameId="tpce.1225118933224" value="this 'insert first' operation was replaced with nlist&lt;&gt; 'addFirst' operation from collections laguage" />
      <property name="build" nameId="tpce.1225118929411" value="14333" />
    </node>
  </root>
  <root id="1140129518788">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1140129518790">
      <property name="value" nameId="tpce.1105725733873" value="remove" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1140129518791">
      <property name="value" nameId="tpce.1105725733873" value="remove child" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1140129518792">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1228342618466">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="1228342515854">
      <property name="comment" nameId="tpce.1225118933224" value="this 'remove' operation has been replaced with 'detach' operation" />
      <property name="build" nameId="tpce.1225118929411" value="1193" />
    </node>
  </root>
  <root id="1140131837776">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1140131837777">
      <property name="value" nameId="tpce.1105725733873" value="replace with" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1140131837778">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1140131861877">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="replacementNode" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="1140133623887">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1140133646408">
      <property name="value" nameId="tpce.1105725733873" value="delete" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1140133646409">
      <property name="value" nameId="tpce.1105725733873" value="delete this node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1140133669692">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="5299096511375816355">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
  </root>
  <root id="1140137987495">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1140138123956">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="leftExpression" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1140138128738">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1140138076840">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1218737842543">
      <property name="value" nameId="tpce.1105725733873" value=":" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1238684351431">
      <property name="name" nameId="tpck.1169194664001" value="asCast" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
  </root>
  <root id="1140725362528">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1140725362529">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="linkTarget" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1140725362530">
      <property name="value" nameId="tpce.1105725733873" value="set" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1140725362531">
      <property name="value" nameId="tpce.1105725733873" value="set child or referent" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1140725362532">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
  </root>
  <root id="1143221076066">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1143221076067">
      <property name="value" nameId="tpce.1105725733873" value="new prev-sibling" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1143221076068">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1143221076069">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489090640" resolveInfo="ConceptDeclaration" />
    </node>
  </root>
  <root id="1143224066846">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1143224066847">
      <property name="value" nameId="tpce.1105725733873" value="add next-sibling" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1143224066848">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1143224066849">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="insertedNode" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="1143224127713">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1143224127714">
      <property name="value" nameId="tpce.1105725733873" value="add prev-sibling" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1143224127715">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1143224127716">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="insertedNode" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="1143226024141">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1143226106435">
      <property name="value" nameId="tpce.1105725733873" value="model" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1205963602338">
      <property name="value" nameId="tpce.1105725733873" value="model type" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1143234257716">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1143234257717">
      <property name="value" nameId="tpce.1105725733873" value="model" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1143234257718">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1145915496910">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178552649581">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179357351079">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SModelType" typeId="1143226024141" id="1179357353659" />
    </node>
  </root>
  <root id="1143235216708">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1143235391024">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489090640" resolveInfo="ConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1177700677986">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="prototypeNode" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="3757480014665019795" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1143235216709">
      <property name="value" nameId="tpce.1105725733873" value="new node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1143235216710">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1143235288634" resolveInfo="applicableToModel" />
    </node>
  </root>
  <root id="1143511969223">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1143511969224">
      <property name="value" nameId="tpce.1105725733873" value="prev-sibling" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1143511969225">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179357521033">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="1138055754698" id="1179357523848" />
    </node>
  </root>
  <root id="1143512015885">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1143512015886">
      <property name="value" nameId="tpce.1105725733873" value="next-sibling" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1143512015887">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179357432804">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="1138055754698" id="1179357435619" />
    </node>
  </root>
  <root id="1144100743722">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1144100769264">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="1144100932627">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1144101304618">
      <property name="value" nameId="tpce.1105725733873" value="+" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1144101315948">
      <property name="value" nameId="tpce.1105725733873" value="inclusion" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1206998361897">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1144101597970">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1144101631503">
      <property name="value" nameId="tpce.1105725733873" value="root" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1206998367789">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1144101972840">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1144108253675">
      <property name="value" nameId="tpce.1105725733873" value="concept" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1206998343969">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1207343664468">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="conceptArgument" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1206659704055" resolveInfo="IRefConceptArg" />
    </node>
  </root>
  <root id="1144146199828">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1144146320702">
      <property name="value" nameId="tpce.1105725733873" value="copy" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1144152536095">
      <property name="value" nameId="tpce.1105725733873" value="creates copy of this node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1144146329360">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1144152651654">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
  </root>
  <root id="1144195091934">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1144195362400">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptOfParent" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1144195396777">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="linkInParent" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1144195091935">
      <property name="value" nameId="tpce.1105725733873" value="hasRole" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1144195091936">
      <property name="value" nameId="tpce.1105725733873" value="test role of the node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1144195091937">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1145915044490">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179357674047">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1179357676049" />
    </node>
  </root>
  <root id="1145383075378">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1145383176232">
      <property name="value" nameId="tpce.1105725733873" value="nlist&lt;&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1145383185202">
      <property name="value" nameId="tpce.1105725733873" value="list of nodes" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1145383142433">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="elementConcept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
  </root>
  <root id="1145404486709">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1145404754951">
      <property name="value" nameId="tpce.1105725733873" value="/" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1145404760531">
      <property name="value" nameId="tpce.1105725733873" value="downcast to lower semantic level" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1145404630761">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1145404616321">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="leftExpression" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="1145468686058">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1145468686060">
      <property name="value" nameId="tpce.1105725733873" value="count" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1145468686061">
      <property name="value" nameId="tpce.1105725733873" value="number of children/referents" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1145468686062">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763350436" resolveInfo="applicableToLinkList" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3342854882747946700">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179356603587">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1179356605386" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="4943859628564383057">
      <property name="comment" nameId="tpce.1225118933224" value="this 'count' operation was replaced with nlist&lt;&gt; 'size' operation from collections laguage" />
      <property name="build" nameId="tpce.1225118929411" value="14333" />
    </node>
  </root>
  <root id="1145567426890">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1145567483100">
      <property name="value" nameId="tpce.1105725733873" value="nlist" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1145567500180">
      <property name="value" nameId="tpce.1105725733873" value="list of (s)nodes" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1145567471833">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="createdType" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1145383075378" resolveInfo="SNodeListType" />
    </node>
  </root>
  <root id="1145570846907">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1145570991951">
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1144100932627" resolveInfo="OperationParm_Inclusion" />
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179357401270">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeListType" typeId="1145383075378" id="1179357404257" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1145570846908">
      <property name="value" nameId="tpce.1105725733873" value="next-siblings" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1145570846909">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
  </root>
  <root id="1145572800087">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1145572800088">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1144100932627" resolveInfo="OperationParm_Inclusion" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179357543100">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeListType" typeId="1145383075378" id="1179357546430" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1145572800089">
      <property name="value" nameId="tpce.1105725733873" value="prev-siblings" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1145572800090">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
  </root>
  <root id="1145573345940">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1145573345941">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1144100932627" resolveInfo="OperationParm_Inclusion" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179357140525">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeListType" typeId="1145383075378" id="1179357144667" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1145573345942">
      <property name="value" nameId="tpce.1105725733873" value="siblings" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1145573345943">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
  </root>
  <root id="1145994841052">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178324100725">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178324117602">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178552681649">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="4726561250374487608">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpee.1197029536315" resolveInfo="lvalue" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1145994841055">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptProperty" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1105725006687" resolveInfo="ConceptPropertyDeclaration" />
    </node>
  </root>
  <root id="1146171026731">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1146171026732">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="value" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1138676077309" resolveInfo="EnumMemberReference" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1146171026733">
      <property name="value" nameId="tpce.1105725733873" value="is" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1146171101876">
      <property name="value" nameId="tpce.1105725733873" value="check value of enum property" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1146171873374">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1146171845591" resolveInfo="applicableToEnumProperty" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179357742167">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1179357744262" />
    </node>
  </root>
  <root id="1146253292180">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1146253292181">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="value" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1146253292182">
      <property name="value" nameId="tpce.1105725733873" value="is" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1146253292183">
      <property name="value" nameId="tpce.1105725733873" value="check value of property" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1146253292184">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763303089" resolveInfo="applicableToSimpleProperty" />
    </node>
  </root>
  <root id="1154546920561">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1154546920562">
      <property name="value" nameId="tpce.1105725733873" value="concept in" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1206998356910">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1154546920563">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1154546950173" resolveInfo="ConceptReference" />
    </node>
  </root>
  <root id="1154546950173">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1154546997487">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
  </root>
  <root id="1166648550386">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1166648550388">
      <property name="value" nameId="tpce.1105725733873" value="new root node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1166648568734">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1143235288634" resolveInfo="applicableToModel" />
    </node>
  </root>
  <root id="1170384605257">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1170384605258">
      <property name="value" nameId="tpce.1105725733873" value="adapter" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1170384605259">
      <property name="value" nameId="tpce.1105725733873" value="get node's adapter class" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1170384605260">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1170384605261">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1179506213992">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
  </root>
  <root id="1171305280644">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176946796709">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1144100932627" resolveInfo="OperationParm_Inclusion" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1171305443260">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1144101972840" resolveInfo="OperationParm_Concept" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1173118322375">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1154546920561" resolveInfo="OperationParm_ConceptList" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1803469493727566475">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1803469493727536395" resolveInfo="OperationParm_StopConceptList" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1171305333426">
      <property name="value" nameId="tpce.1105725733873" value="descendants" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1171305365459">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1171305405508">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
  </root>
  <root id="1171310072040">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1171310072045">
      <property name="value" nameId="tpce.1105725733873" value="containing root" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1171310336173">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1171310339206">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179358066006">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="1138055754698" id="1179358068774" />
    </node>
  </root>
  <root id="1171315804604">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1171315804605">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1171315804606">
      <property name="value" nameId="tpce.1105725733873" value="roots" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1171315844233">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1143235288634" resolveInfo="applicableToModel" />
    </node>
  </root>
  <root id="1171323947159">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1171323947160">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1171323947161">
      <property name="value" nameId="tpce.1105725733873" value="nodes" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1171323960960">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1143235288634" resolveInfo="applicableToModel" />
    </node>
  </root>
  <root id="1171407110247">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1171407110248">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1144101972840" resolveInfo="OperationParm_Concept" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1171407110249">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1154546920561" resolveInfo="OperationParm_ConceptList" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1171407110250">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1144100932627" resolveInfo="OperationParm_Inclusion" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="260052663850947025">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1540150895035667832" resolveInfo="OperationParm_SameMetaLevel" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1171407110251">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1144101597970" resolveInfo="OperationParm_Root" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1171407110252">
      <property name="value" nameId="tpce.1105725733873" value="ancestor" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1171407415521">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1171407418147">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
  </root>
  <root id="1171500988903">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1171500988904">
      <property name="value" nameId="tpce.1105725733873" value="children" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1171501005235">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1171501009517">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="5168775467716642237">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="5168775467716640652" resolveInfo="OperationParm_LinkQualifier" />
    </node>
  </root>
  <root id="1171999116870">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1171999116871">
      <property name="value" nameId="tpce.1105725733873" value="isNull" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1171999116873">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1171999152798">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178552656723">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179357649544">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1179357651983" />
    </node>
  </root>
  <root id="1172008320231">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1172008320232">
      <property name="value" nameId="tpce.1105725733873" value="isNotNull" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1172008320233">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1172008320234">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178552610858">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179357688566">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1179357691489" />
    </node>
  </root>
  <root id="1172244025706">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1172244025707">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="childNodes" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1172244025708">
      <property name="value" nameId="tpce.1105725733873" value="add all" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1205532279587">
      <property name="value" nameId="tpce.1105725733873" value="add children" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1172244025710">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763350436" resolveInfo="applicableToLinkList" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3342854882747836492">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="4943859628564361193">
      <property name="comment" nameId="tpce.1225118933224" value="this 'add all' operation was replaced with nlist&lt;&gt; 'addAll' operation from collections laguage" />
      <property name="build" nameId="tpce.1225118929411" value="14333" />
    </node>
  </root>
  <root id="1172323065820">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1172323065821">
      <property name="value" nameId="tpce.1105725733873" value="concept" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1172323065822">
      <property name="value" nameId="tpce.1105725733873" value="get node's concept declaration" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1172323065823">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1172323065824">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178552696948">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
  </root>
  <root id="1172326502327">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1206733650006">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptArgument" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1206659704055" resolveInfo="IRefConceptArg" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1172326559519">
      <property name="value" nameId="tpce.1105725733873" value="isExactly" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1172326587443">
      <property name="value" nameId="tpce.1105725733873" value="concept declaration is exactly the same" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1172326607351">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1207686226938">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179356403775">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1179356426855" />
    </node>
  </root>
  <root id="1172420572800">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1180481110358">
      <property name="role" nameId="tpce.1071599776563" value="conceptDeclaraton" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1172420572801">
      <property name="value" nameId="tpce.1105725733873" value="concept&lt; &gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1205963346849">
      <property name="value" nameId="tpce.1105725733873" value="concept type" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1172424058054">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1172424100906">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1172424146100">
      <property name="value" nameId="tpce.1105725733873" value="concept/&lt;name&gt;/" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1177028913076">
      <property name="value" nameId="tpce.1105725733873" value="concept reference" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1173122760281">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1173122795259">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1144100932627" resolveInfo="OperationParm_Inclusion" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1173122760282">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1144101972840" resolveInfo="OperationParm_Concept" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1173122760283">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1154546920561" resolveInfo="OperationParm_ConceptList" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1173122760284">
      <property name="value" nameId="tpce.1105725733873" value="ancestors" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1173122760285">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1173122760286">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
  </root>
  <root id="1175618182947">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1175618223511">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptLinkDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1105736576531" resolveInfo="ConceptLinkDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178324170214">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178324177325">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1178552592997">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
  </root>
  <root id="1176109685393">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1176109762787">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="scope" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1176109685394">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176109685395">
      <property name="value" nameId="tpce.1105725733873" value="rootsIncludingImported" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1176109696522">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1143235288634" resolveInfo="applicableToModel" />
    </node>
  </root>
  <root id="1177026924588">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1177026940964">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1206659736713">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1206659704055" resolveInfo="IRefConceptArg" />
    </node>
  </root>
  <root id="1179168000618">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1179168040057">
      <property name="value" nameId="tpce.1105725733873" value="index" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1179168055325">
      <property name="value" nameId="tpce.1105725733873" value="gets node's index in parent's collection" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1179168123999">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1179168128251">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
  </root>
  <root id="1179350041460">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1179350114101">
      <property name="value" nameId="tpce.1105725733873" value="super-concepts/direct" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1179350172619">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1207686062124">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1206991868482">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1144100932627" resolveInfo="OperationParm_Inclusion" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1179353368598">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp2q.ListType" typeId="tp2q.1151688443754" id="1179353434194">
        <node role="elementType" roleId="tp2q.1151688676805" type="tp25.SConceptType" typeId="1172420572800" id="1179355748352" />
      </node>
    </node>
  </root>
  <root id="1179409122411">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="2853323645193760541">
      <property name="name" nameId="tpck.1169194664001" value="directCall" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1179409206125">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptMethodDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1i04.1225194472830" resolveInfo="ConceptMethodDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="tpee.1068499141037" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1179409127152">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1179409130528">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1179409132561">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1225282062807">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpee.1204053956946" resolveInfo="IMethodCall" />
    </node>
  </root>
  <root id="1180028149140">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1180028346304">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptArgument" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1206659704055" resolveInfo="IRefConceptArg" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180028236375">
      <property name="value" nameId="tpce.1105725733873" value="isSuperConceptOf" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1180028244127">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1207677998983">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1180028372571">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1180028374713" />
    </node>
  </root>
  <root id="1180031783296">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1180031783297">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptArgument" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1206659704055" resolveInfo="IRefConceptArg" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180031783298">
      <property name="value" nameId="tpce.1105725733873" value="isSubConceptOf" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1180031797114">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1207686447050">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1180031783300">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1180031783301" />
    </node>
  </root>
  <root id="1180457458947">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180457458948">
      <property name="value" nameId="tpce.1105725733873" value="super-concepts/all" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1180457472469">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1207685914531">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1206993087993">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1144102537873" resolveInfo="applicableParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1144100932627" resolveInfo="OperationParm_Inclusion" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1180457458950">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp2q.ListType" typeId="tp2q.1151688443754" id="1180457458951">
        <node role="elementType" roleId="tp2q.1151688676805" type="tp25.SConceptType" typeId="1172420572800" id="1180457458952" />
      </node>
    </node>
  </root>
  <root id="1180458444893">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180458444894">
      <property name="value" nameId="tpce.1105725733873" value="hierarchy" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1180458449586">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1207686113984">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1180458444896">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp2q.ListType" typeId="tp2q.1151688443754" id="1180458444897">
        <node role="elementType" roleId="tp2q.1151688676805" type="tp25.SConceptType" typeId="1172420572800" id="1180458444898" />
      </node>
    </node>
  </root>
  <root id="1180636770613">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180636770614">
      <property name="value" nameId="tpce.1105725733873" value="node&lt;&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180636770615">
      <property name="value" nameId="tpce.1105725733873" value="create new node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1180636770616">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="createdType" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1138055754698" resolveInfo="SNodeType" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1181937442359">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="prototypeNode" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="3757480014665019775" />
    </node>
  </root>
  <root id="1181949435690">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1181949561194">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="prototypeNode" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="3757480014665019785" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1181949486312">
      <property name="value" nameId="tpce.1105725733873" value="new instance" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1181949486313">
      <property name="value" nameId="tpce.1105725733873" value="create new node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1181949486314">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1207688008770">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
  </root>
  <root id="1181952871644">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1182506816063">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="smodel" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1182506966389">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="scope" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1181952912153">
      <property name="value" nameId="tpce.1105725733873" value="sub-concepts" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1181952912154">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1207683783583">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
  </root>
  <root id="1182279509750">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1182279708330">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="scope" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1182279627419">
      <property name="value" nameId="tpce.1105725733873" value="find instances" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1182279659907">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1207680758128">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
  </root>
  <root id="1182511038748">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1182511038749">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="scope" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1182511038750">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1182511038751">
      <property name="value" nameId="tpce.1105725733873" value="nodesIncludingImported" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1182511050096">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1143235288634" resolveInfo="applicableToModel" />
    </node>
  </root>
  <root id="1204762015203">
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="3050731179906816823" />
  </root>
  <root id="1204763358057">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1204763443606">
      <property name="role" nameId="tpce.1071599776563" value="annotationLink" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1149608206811" resolveInfo="AnnotationLinkDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1204763424573">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1204762015203" resolveInfo="IAttributeAccessQualifier" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4024382256428849248">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4024382256428848843" resolveInfo="ILinkAccess" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="3050731179906816842" />
  </root>
  <root id="1204832665472">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1204834178790">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="propertyQualifier" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1204834061007" resolveInfo="IPropertyAccessQualifier" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1204832665473">
      <property name="role" nameId="tpce.1071599776563" value="annotationLink" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1149608206811" resolveInfo="AnnotationLinkDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1204832665474">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1204762015203" resolveInfo="IAttributeAccessQualifier" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4024382256428849251">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4024382256428848843" resolveInfo="ILinkAccess" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="3050731179906816843" />
  </root>
  <root id="1204834061007" />
  <root id="1204834851141">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1204834868751">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="expression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1204834996268">
      <property name="value" nameId="tpce.1105725733873" value="# &lt;expr&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1204835013129">
      <property name="value" nameId="tpce.1105725733873" value="expression" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1204835048021">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1204834061007" resolveInfo="IPropertyAccessQualifier" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="2788452359612125239">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="2788452359612124331" resolveInfo="IPropertyQualifier" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1204850568614">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1204848879094" resolveInfo="ILinkAccessQualifier" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="2788452359612125241">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="2788452359612124330" resolveInfo="ILinkQualifier" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1206660470183">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1206659704055" resolveInfo="IRefConceptArg" />
    </node>
  </root>
  <root id="1204837120311">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1204837225594">
      <property name="role" nameId="tpce.1071599776563" value="property" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288299" resolveInfo="PropertyDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1204837131328">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1204834061007" resolveInfo="IPropertyAccessQualifier" />
    </node>
  </root>
  <root id="1204848879094" />
  <root id="1204848911283">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1204848911284">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="linkQualifier" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1204848879094" resolveInfo="ILinkAccessQualifier" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1204848911285">
      <property name="role" nameId="tpce.1071599776563" value="annotationLink" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1149608206811" resolveInfo="AnnotationLinkDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1204848911286">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1204762015203" resolveInfo="IAttributeAccessQualifier" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4024382256428849245">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4024382256428848843" resolveInfo="ILinkAccess" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3542758363529077388">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3542758363529077353" resolveInfo="ILinkAccessQualifierContainer" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="3050731179906816841" />
  </root>
  <root id="1204851882688">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1204851882689">
      <property name="role" nameId="tpce.1071599776563" value="link" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1204851897988">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1204848879094" resolveInfo="ILinkAccessQualifier" />
    </node>
  </root>
  <root id="1204919674986">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1205264860045">
      <property name="name" nameId="tpck.1169194664001" value="singularCradinality" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1205266306005">
      <property name="name" nameId="tpck.1169194664001" value="aggregation" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1204926237448">
      <property name="role" nameId="tpce.1071599776563" value="targetConcept" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1204919745471">
      <property name="value" nameId="tpce.1105725733873" value="link acc" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1206036984625">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpee.1206036041805" resolveInfo="IInternalType" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="6037466102201905966" />
  </root>
  <root id="1205357139746">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1205357175701">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1204762015203" resolveInfo="IAttributeAccessQualifier" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1205357188670">
      <property name="value" nameId="tpce.1105725733873" value="&lt;all&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1205357194157">
      <property name="value" nameId="tpce.1105725733873" value="all attributes" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="3050731179906814123" />
  </root>
  <root id="1204761823073">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1204762310079">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="attributeQualifier" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1204762015203" resolveInfo="IAttributeAccessQualifier" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1204761852761">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpee.1197027803184" resolveInfo="IOperation" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1818067991806882401">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4024382256428848843" resolveInfo="ILinkAccess" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1204761912669">
      <property name="value" nameId="tpce.1105725733873" value="$@" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1204761921358">
      <property name="value" nameId="tpce.1105725733873" value="attribute access (deprecated)" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1204840857881">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1204840860351">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="8765008720200392214">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="3050731179906814124" />
  </root>
  <root id="1205861725686">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1205861725689">
      <property name="value" nameId="tpce.1105725733873" value="isAttribute" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1205861725690">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1205861725692">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1205861725694">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1205861725695" />
    </node>
  </root>
  <root id="1206019730951">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1206019820684">
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1206019830404">
      <property name="role" nameId="tpce.1071599776563" value="methodDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1i04.1225194588610" resolveInfo="StaticConceptMethodDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="tpee.1068499141037" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1206020090768">
      <property name="value" nameId="tpce.1105725733873" value="&lt;static concept method call&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1206482823744">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1206482823746">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="nodeArgument" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1206482823747">
      <property name="value" nameId="tpce.1105725733873" value="add root" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1206482823748">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1143235288634" resolveInfo="applicableToModel" />
    </node>
  </root>
  <root id="1206659704055" />
  <root id="1212008292747">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1212009559902">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StringType" typeId="tpee.1225271177708" id="4853609160933269572" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1212008780883">
      <property name="value" nameId="tpce.1105725733873" value="name" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1212008780884">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1143235288634" resolveInfo="applicableToModel" />
    </node>
  </root>
  <root id="1215103457144">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1215103457146">
      <property name="value" nameId="tpce.1105725733873" value="remove all" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1215103457147">
      <property name="value" nameId="tpce.1105725733873" value="remove children" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1215103457148">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763350436" resolveInfo="applicableToLinkList" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3342854882747946704">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="4943859628564383100">
      <property name="comment" nameId="tpce.1225118933224" value="this 'remove all' operation was replaced with nlist&lt;&gt; 'clear' operation from collections laguage" />
      <property name="build" nameId="tpce.1225118929411" value="14333" />
    </node>
  </root>
  <root id="1215467301810">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1215467301812">
      <property name="value" nameId="tpce.1105725733873" value="remove" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1215467301813">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763303089" resolveInfo="applicableToSimpleProperty" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1215467301814">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1146171845591" resolveInfo="applicableToEnumProperty" />
    </node>
  </root>
  <root id="1219352745532">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1219352800908">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="referentNode" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1219353051865">
      <property name="value" nameId="tpce.1105725733873" value="node /&lt;name&gt;/" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1219353067960">
      <property name="value" nameId="tpce.1105725733873" value="named node reference" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1221161909218">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1221161944969">
      <property name="value" nameId="tpce.1105725733873" value="search scope" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1221162008065">
      <property name="value" nameId="tpce.1105725733873" value="search scope type" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1221163681458">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1221163785568">
      <property name="value" nameId="tpce.1105725733873" value="search scope" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1221163804242">
      <property name="value" nameId="tpce.1105725733873" value="obtain referent search scope" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1221163839713">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1221163842730">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1221164004670">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="operationContext" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1221164078452">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="referenceLink" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
    </node>
  </root>
  <root id="1221170373891">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1221170459283">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpee.1197027803184" resolveInfo="IOperation" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1221170468050">
      <property name="value" nameId="tpce.1105725733873" value="contains" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1221170499223">
      <property name="value" nameId="tpce.1105725733873" value="test node visibility in scope" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1221170724607">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="nodeToCheck" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="1226359078165">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1226359078166">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1226359192215">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="linkDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1226359078167">
      <property name="value" nameId="tpce.1105725733873" value="link/&lt;role&gt;/" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1226359078168">
      <property name="value" nameId="tpce.1105725733873" value="link reference" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1227264722563">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1227265358462">
      <property name="value" nameId="tpce.1105725733873" value="matches" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1227265389277">
      <property name="value" nameId="tpce.1105725733873" value="nodes structural equality operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.IntegerConceptProperty" typeId="tpce.1105725498741" id="1227265355101">
      <property name="value" nameId="tpce.1105725713309" value="0" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpee.1166617629900" resolveInfo="priority" />
    </node>
  </root>
  <root id="1228341669568">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1228341730131">
      <property name="value" nameId="tpce.1105725733873" value="detach" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1228341730132">
      <property name="value" nameId="tpce.1105725733873" value="removes from container" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1228341730133">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1228341730134">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
  </root>
  <root id="1240170042401">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1240170836027">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="enum" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1082978164219" resolveInfo="EnumerationDataTypeDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240170070012">
      <property name="value" nameId="tpce.1105725733873" value="enummember&lt; &gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240170070013">
      <property name="value" nameId="tpce.1105725733873" value="enum member type" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1240171359678">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240171382804">
      <property name="value" nameId="tpce.1105725733873" value="value" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240171403028">
      <property name="value" nameId="tpce.1105725733873" value="enum member value" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1241015229854">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1241015185235" resolveInfo="SEnumMemberOperation" />
    </node>
  </root>
  <root id="1240173327827">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240173327828">
      <property name="value" nameId="tpce.1105725733873" value="name" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240173327829">
      <property name="value" nameId="tpce.1105725733873" value="enum member name" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1241015236622">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1241015185235" resolveInfo="SEnumMemberOperation" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="7775308804414322955">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StringType" typeId="tpee.1225271177708" id="7775308804414322958" />
    </node>
  </root>
  <root id="1240930118027">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1240930317927">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="operation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1240930395965" resolveInfo="SEnumOperation" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1240930118028">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="enumDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1082978164219" resolveInfo="EnumerationDataTypeDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240930118029">
      <property name="value" nameId="tpce.1105725733873" value="enum/&lt;name&gt;/.operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240930118030">
      <property name="value" nameId="tpce.1105725733873" value="enum operation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1240930395965" />
  <root id="1240930444812">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1240930444813">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="nameExpression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240930444814">
      <property name="value" nameId="tpce.1105725733873" value="memberForName()" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240930444815">
      <property name="value" nameId="tpce.1105725733873" value="parse enum name" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1240930525703">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1240930395965" resolveInfo="SEnumOperation" />
    </node>
  </root>
  <root id="1240930444878">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1240930444879">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="valueExpression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240930444880">
      <property name="value" nameId="tpce.1105725733873" value="memberForValue()" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240930444881">
      <property name="value" nameId="tpce.1105725733873" value="parse enum value" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1240930535298">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1240930395965" resolveInfo="SEnumOperation" />
    </node>
  </root>
  <root id="1240930444945">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1240930444946">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="member" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1083171877298" resolveInfo="EnumerationMemberDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240930444947">
      <property name="value" nameId="tpce.1105725733873" value="&lt;{member}&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240930444948">
      <property name="value" nameId="tpce.1105725733873" value="enum member access" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1240930543627">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1240930395965" resolveInfo="SEnumOperation" />
    </node>
  </root>
  <root id="1240930444980">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240930444981">
      <property name="value" nameId="tpce.1105725733873" value="members" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240930444982">
      <property name="value" nameId="tpce.1105725733873" value="members list" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1240930547769">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1240930395965" resolveInfo="SEnumOperation" />
    </node>
  </root>
  <root id="1241015185235">
    <node role="extends" roleId="tpce.1169127546356" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1241015195408">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpee.1197027803184" resolveInfo="IOperation" />
    </node>
  </root>
  <root id="1803469493727536395">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1803469493727536398">
      <property name="value" nameId="tpce.1105725733873" value="stop concepts are" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1803469493727536400">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1803469493727536396">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <property name="role" nameId="tpce.1071599776563" value="concept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1154546950173" resolveInfo="ConceptReference" />
    </node>
  </root>
  <root id="2648652578096473304">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2648652578096473306">
      <property name="value" nameId="tpce.1105725733873" value="set" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="2648652578096508239">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1145994733391" resolveInfo="applicableToConceptProperty" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2648652578096473305">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="value" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="4024382256428848843" />
  <root id="3562215692195599741">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3562215692195600259">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="link" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="288031370649138922">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpee.1197027803184" resolveInfo="IOperation" />
    </node>
  </root>
  <root id="8758390115028452779">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8758390115028597868">
      <property name="value" nameId="tpce.1105725733873" value="references" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="8758390115028597873">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="8758390115028597875">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="6253932327130086989">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp2q.SequenceType" typeId="tp2q.1151689724996" id="6253932327130086991">
        <node role="elementType" roleId="tp2q.1151689745422" type="tp25.SReferenceType" typeId="8758390115029295477" id="6253932327130086993" />
      </node>
    </node>
  </root>
  <root id="8758390115029295477">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8758390115029297015">
      <property name="value" nameId="tpce.1105725733873" value="reference" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8758390115029297017">
      <property name="value" nameId="tpce.1105725733873" value="reference type" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="4124388153790980106">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4124388153790980109">
      <property name="value" nameId="tpce.1105725733873" value="target" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1547759872598425097">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1547759872598425074" resolveInfo="IReferenceOperation" />
    </node>
  </root>
  <root id="1547759872598425067">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1547759872598425070">
      <property name="value" nameId="tpce.1105725733873" value="linkDeclaration" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1547759872598425098">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1547759872598425074" resolveInfo="IReferenceOperation" />
    </node>
  </root>
  <root id="1547759872598425074">
    <node role="extends" roleId="tpce.1169127546356" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1547759872598425075">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpee.1197027803184" resolveInfo="IOperation" />
    </node>
  </root>
  <root id="5692182839349412519">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5692182839349412521">
      <property name="value" nameId="tpce.1105725733873" value="role" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5692182839349412547">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1547759872598425074" resolveInfo="IReferenceOperation" />
    </node>
  </root>
  <root id="5820409030208923287">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5820409030208923289">
      <property name="value" nameId="tpce.1105725733873" value="containingLink" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="5820409030208925313">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="5820409030208925315">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="5820409030208925316">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="1138055754698" id="5820409030208925318">
        <link role="concept" roleId="1138405853777" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
      </node>
    </node>
  </root>
  <root id="1960721196051541146">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1960721196051541148">
      <property name="value" nameId="tpce.1105725733873" value="containingRole" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1960721196051541150">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1960721196051541152">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1960721196051541153">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StringType" typeId="tpee.1225271177708" id="1960721196051541156" />
    </node>
  </root>
  <root id="3609773094169249792">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3609773094169252180">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="linkQualifier" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="5168775467716640652" resolveInfo="OperationParm_LinkQualifier" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3609773094169249794">
      <property name="value" nameId="tpce.1105725733873" value="reference" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3609773094169249889">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3609773094169249891">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="8310560509811067921">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SReferenceType" typeId="8758390115029295477" id="8310560509811067923" />
    </node>
  </root>
  <root id="3542758363529077353" />
  <root id="5168775467716640652">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5168775467716640653">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="linkQualifier" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1204848879094" resolveInfo="ILinkAccessQualifier" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5168775467716640657">
      <property name="value" nameId="tpce.1105725733873" value="linkQualifier" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5815925154349132184">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3542758363529077353" resolveInfo="ILinkAccessQualifierContainer" />
    </node>
  </root>
  <root id="5708036808576088033">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5708036808576088212">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1547759872598425074" resolveInfo="IReferenceOperation" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2071115835942712551">
      <property name="value" nameId="tpce.1105725733873" value="resolveInfo" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4357968816427488499">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4357968816427488500">
      <property name="name" nameId="tpck.1169194664001" value="moduleId" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="1540150895035667832">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="260052663850933187">
      <property name="value" nameId="tpce.1105725733873" value="M" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="260052663850933189">
      <property name="value" nameId="tpce.1105725733873" value="same metalevel" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="260052663850933191">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="8339862546319741524">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8339862546319742067">
      <property name="value" nameId="tpce.1105725733873" value="concept qualified name/&lt;name&gt;/" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8339862546319741525">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
  </root>
  <root id="1883223317721008708">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1883223317721008712">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="nodeConcept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1883223317721008710">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="nodeExpression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1883223317721008709">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="body" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068580123136" resolveInfo="StatementList" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1883223317721008711">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="variable" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1883223317721008713" resolveInfo="IfInstanceOfVariable" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1883223317721106418">
      <property name="value" nameId="tpce.1105725733873" value="ifInstanceOf" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1883223317721106420">
      <property name="value" nameId="tpce.1105725733873" value="if a node is instance of concept" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1883223317721008713" />
  <root id="1883223317721107059">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1883223317721107060">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="instanceOfVariable" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="tpee.5497648299878491909" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1883223317721008713" resolveInfo="IfInstanceOfVariable" />
    </node>
  </root>
  <root id="5253134957341697434">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5253134957341833005">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5253134957341833006">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="linkDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5253134957341832999">
      <property name="value" nameId="tpce.1105725733873" value="link name/&lt;role&gt;/" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5253134957341833000">
      <property name="value" nameId="tpce.1105725733873" value="name" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="5253134957341870583">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5253134957341870586">
      <property name="value" nameId="tpce.1105725733873" value="property name/&lt;role&gt;/" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5253134957341870587">
      <property name="value" nameId="tpce.1105725733873" value="name" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5253134957341870584">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5253134957341870585">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="propertyDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288299" resolveInfo="PropertyDeclaration" />
    </node>
  </root>
  <root id="6407023681583031218">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2788452359611883772">
      <property name="value" nameId="tpce.1105725733873" value="@" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2788452359611883774">
      <property name="value" nameId="tpce.1105725733873" value="attribute access" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="2788452359611883776">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="2788452359611883778">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1138763325919" resolveInfo="applicableToLink" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="2788452359611883804">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1172326539502" resolveInfo="applicableToConcept" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6407023681583036852">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="qualifier" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6407023681583036843" resolveInfo="AttributeQualifier" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="6960953357954063536">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="4024382256428848843" resolveInfo="ILinkAccess" />
    </node>
  </root>
  <root id="6407023681583036843">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="6407023681583036846">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="6407023681583036853">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6407023681583036854">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="attributeConcept" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489090640" resolveInfo="ConceptDeclaration" />
    </node>
  </root>
  <root id="6407023681583036855">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6407023681583038098">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="linkQualifier" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="2788452359612124330" resolveInfo="ILinkQualifier" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6407023681583036856">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="attributeConcept" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489090640" resolveInfo="ConceptDeclaration" />
    </node>
  </root>
  <root id="6407023681583040688">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="6407023681583066492">
      <property name="value" nameId="tpce.1105725733873" value="&lt;all&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="6407023681583066494">
      <property name="value" nameId="tpce.1105725733873" value="all attributes" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="6407023681583040953">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6407023681583040955">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="propertyQualifier" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="2788452359612124331" resolveInfo="IPropertyQualifier" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6407023681583040954">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="attributeConcept" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489090640" resolveInfo="ConceptDeclaration" />
    </node>
  </root>
  <root id="2788452359612124330" />
  <root id="2788452359612124331" />
  <root id="2788452359612124332">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2788452359612124336">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="link" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="2788452359612124337">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="2788452359612124330" resolveInfo="ILinkQualifier" />
    </node>
  </root>
  <root id="2788452359612124333">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2788452359612124335">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="property" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288299" resolveInfo="PropertyDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="2788452359612124334">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="2788452359612124331" resolveInfo="IPropertyQualifier" />
    </node>
  </root>
  <root id="5897605856268838718">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5897605856268838719">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="conceptDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5897605856268838720">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="conceptPropertyDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1105725006687" resolveInfo="ConceptPropertyDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5897605856268838721">
      <property name="value" nameId="tpce.1105725733873" value="concept property name/&lt;name&gt;/" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="6995935425733782641">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="6995935425733782644">
      <property name="value" nameId="tpce.1105725733873" value="module" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="6995935425733782642">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1143235288634" resolveInfo="applicableToModel" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="6995935425733782645">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="1138055754698" id="6995935425733782647">
        <link role="concept" roleId="1138405853777" targetNodeId="hypd.6370754048397540894" resolveInfo="Module" />
      </node>
    </node>
  </root>
  <root id="4040588429969021681">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4040588429969021682">
      <property name="name" nameId="tpck.1169194664001" value="name" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4040588429969021683">
      <property name="name" nameId="tpck.1169194664001" value="moduleId" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4040588429969021687">
      <property name="value" nameId="tpce.1105725733873" value="module" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4040588429969069898">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4040588429969069899">
      <property name="value" nameId="tpce.1105725733873" value="language" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="448792706993295611">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="448792706993295615">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="448792706993295614">
      <property name="value" nameId="tpce.1105725733873" value="read concept" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="448792706993295612">
      <property name="value" nameId="tpce.1105725733873" value="concept reference with built-in read action" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
</model>

