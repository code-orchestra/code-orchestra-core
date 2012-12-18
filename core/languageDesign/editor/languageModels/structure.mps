<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c8959029e(jetbrains.mps.lang.editor.structure)" version="32">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="18bc6592-03a6-4e29-a83a-7ff23bde13ba(jetbrains.mps.lang.editor)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="tpcw" modelUID="r:00000000-0000-4000-0000-011c895902bc(jetbrains.mps.lang.sharedConcepts.structure)" version="0" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" />
  <import index="tp4f" modelUID="r:00000000-0000-4000-0000-011c89590373(jetbrains.mps.baseLanguage.classifiers.structure)" version="0" />
  <import index="8q6x" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.awt.event(JDK/java.awt.event@java_stub)" version="-1" />
  <import index="dbrf" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.swing(JDK/javax.swing@java_stub)" version="-1" />
  <import index="1t7x" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.awt(JDK/java.awt@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="qxeo" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.nodeEditor(MPS.Classpath/jetbrains.mps.nodeEditor@java_stub)" version="-1" />
  <import index="ven7" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.nodeEditor.style(MPS.Classpath/jetbrains.mps.nodeEditor.style@java_stub)" version="-1" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="tpc2" modelUID="r:00000000-0000-4000-0000-011c8959029e(jetbrains.mps.lang.editor.structure)" version="32" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1071666914219">
      <property name="name" nameId="tpck.1169194664001" value="ConceptEditorDeclaration" />
      <property name="iconPath" nameId="tpce.1160488491229" value="${language_descriptor}/icons/editor.png" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1080736578640" resolveInfo="BaseEditorComponent" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1073389214265">
      <property name="name" nameId="tpck.1169194664001" value="EditorCellModel" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1073389446423">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_Collection" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1073389577006">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_Constant" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1079353555532" resolveInfo="CellModel_AbstractLabel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1073389658414">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_Property" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1139848536355" resolveInfo="CellModel_WithRole" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1073389882823">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_RefNode" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1139848536355" resolveInfo="CellModel_WithRole" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1073390211982">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_RefNodeList" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1140524381322" resolveInfo="CellModel_ListWithRole" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1074767920765">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_ModelAccess" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1079353555532" resolveInfo="CellModel_AbstractLabel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1075375595203">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_Error" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1079353555532" resolveInfo="CellModel_AbstractLabel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1078308402140">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_Custom" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1078938745671">
      <property name="name" nameId="tpck.1169194664001" value="EditorComponentDeclaration" />
      <property name="iconPath" nameId="tpce.1160488491229" value="${language_descriptor}/icons/editorComponent.png" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1080736578640" resolveInfo="BaseEditorComponent" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1078939183254">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_Component" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1079353555532">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_AbstractLabel" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1080736578640">
      <property name="name" nameId="tpck.1169194664001" value="BaseEditorComponent" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1166049232041" resolveInfo="AbstractComponent" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1081293058843">
      <property name="iconPath" nameId="tpce.1160488491229" value="${language_descriptor}/icons/keyMap.png" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="CellKeyMapDeclaration" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellKeyMap" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1083928804390">
      <property name="name" nameId="tpck.1169194664001" value="_YesNoDefault_Enum" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1083928804393" resolveInfo="none" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1083952545109">
      <property name="name" nameId="tpck.1169194664001" value="_Colors_Enum" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1083952545110" resolveInfo="none" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1088013125922">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_RefCell" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1139848536355" resolveInfo="CellModel_WithRole" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1088185857835">
      <property name="name" nameId="tpck.1169194664001" value="InlineEditorComponent" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1080736578640" resolveInfo="BaseEditorComponent" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1088612959204">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_Alternation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1101211480448">
      <property name="name" nameId="tpck.1169194664001" value="_FontStyle_Enum" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1134577855137" resolveInfo="plain" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1103016434866">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_JComponent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1106270491082">
      <property name="name" nameId="tpck.1169194664001" value="CellLayout" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellLayout" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1106270549637">
      <property name="name" nameId="tpck.1169194664001" value="CellLayout_Horizontal" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellLayout" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1106270491082" resolveInfo="CellLayout" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1106270571710">
      <property name="name" nameId="tpck.1169194664001" value="CellLayout_Vertical" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellLayout" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1106270491082" resolveInfo="CellLayout" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1106270637846">
      <property name="name" nameId="tpck.1169194664001" value="CellLayout_Flow" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellLayout" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1106270491082" resolveInfo="CellLayout" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1130847686886">
      <property name="name" nameId="tpck.1169194664001" value="UnderlineStyle" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983657062" resolveInfo="integer" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1130847686918" resolveInfo="as_is" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1130926557197">
      <property name="name" nameId="tpck.1169194664001" value="FocusPolicy" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983657062" resolveInfo="integer" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1130926557292" resolveInfo="noAttraction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1134379236839">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_AttributedPropertyCell" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1136564507907">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_AttributedLinkCell" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1136916919141">
      <property name="name" nameId="tpck.1169194664001" value="CellKeyMapItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellKeyMap" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1136916976737">
      <property name="name" nameId="tpck.1169194664001" value="CellKeyMapKeystroke" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellKeyMap" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1136917155755">
      <property name="name" nameId="tpck.1169194664001" value="CellKeyMap_AbstractFunction" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellKeyMap" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1136917249679">
      <property name="name" nameId="tpck.1169194664001" value="CellKeyMap_IsApplicableFunction" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellKeyMap" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1136917155755" resolveInfo="CellKeyMap_AbstractFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1136917288805">
      <property name="name" nameId="tpck.1169194664001" value="CellKeyMap_ExecuteFunction" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellKeyMap" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1136917155755" resolveInfo="CellKeyMap_AbstractFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1137553248617">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_ConceptProperty" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1139848536355" resolveInfo="CellModel_WithRole" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1138197387103">
      <property name="name" nameId="tpck.1169194664001" value="_Layout_Constraints_Enum" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1138197631095" resolveInfo="none" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1139535219966">
      <property name="name" nameId="tpck.1169194664001" value="CellActionMapDeclaration" />
      <property name="iconPath" nameId="tpce.1160488491229" value="${language_descriptor}/icons/actionMap.png" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1139535280617">
      <property name="name" nameId="tpck.1169194664001" value="CellActionMapItem" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1139535328871">
      <property name="name" nameId="tpck.1169194664001" value="CellActionId" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1139535329028" resolveInfo="right_transform" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1139535439104">
      <property name="name" nameId="tpck.1169194664001" value="CellActionMap_ExecuteFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1139744471051">
      <property name="name" nameId="tpck.1169194664001" value="_ImageAlignment_Enum" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1139744471411" resolveInfo="alignmentJustify" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1139744628335">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_Image" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1139848536355">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_WithRole" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1079353555532" resolveInfo="CellModel_AbstractLabel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1140524381322">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_ListWithRole" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1139848536355" resolveInfo="CellModel_WithRole" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1140813780565">
      <property name="name" nameId="tpck.1169194664001" value="RightTransformAnchorTag" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1140813780644" resolveInfo="none" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1141091053936">
      <property name="name" nameId="tpck.1169194664001" value="CellKeyMapCaretPolicy" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellKeyMap" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1141091054266" resolveInfo="ANY_POSITION" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1142886221719">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_NodeCondition" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1142886811589">
      <property name="name" nameId="tpck.1169194664001" value="ConceptFunctionParameter_node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1143891911797">
      <property name="name" nameId="tpck.1169194664001" value="_LeftRight_Enum" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1143891911798" resolveInfo="left" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1149850725784">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_AttributedNodeCell" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1160493135005">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_PropertyValues_GetValues" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1161622981231">
      <property name="name" nameId="tpck.1169194664001" value="ConceptFunctionParameter_editorContext" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1162497113192">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReplaceChild_currentChild" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1162498275506">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReplaceChild_defaultConceptOfChild" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1163613035599">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_AbstractGroup_Query" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1163613131943">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReplaceNode_Group_Create" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1163613549566">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_AbstractGroup_parameterObject" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1163613822479">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_Abstract_editedNode" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1164052439493">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_AbstractGroup_MatchingText" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1164052588708">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_AbstractGroup_DescriptionText" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1164824717996">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuDescriptor" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1164824854750">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_Abstract" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1164833692343">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_PropertyValues" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1164824854750" resolveInfo="CellMenuPart_Abstract" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1164914519156">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReplaceNode_CustomNodeConcept" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1164824854750" resolveInfo="CellMenuPart_Abstract" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1164996492011">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReferentPrimary" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1164824854750" resolveInfo="CellMenuPart_Abstract" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165004207520">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReplaceNode_Group" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1165253627126" resolveInfo="CellMenuPart_AbstractGroup" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165253627126">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_AbstractGroup" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1164824854750" resolveInfo="CellMenuPart_Abstract" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165270418989">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReplaceChild_Group" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1165253627126" resolveInfo="CellMenuPart_AbstractGroup" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165270662927">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReplaceChild_Group_Query" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165270999881">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReplaceChild_Group_Create" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165280503630">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReplaceChild_CustomChildConcept" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1164824854750" resolveInfo="CellMenuPart_Abstract" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165280856333">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReplaceChild_CustomChildConcept_Query" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165339175678">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReplaceChild_Item" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1164824854750" resolveInfo="CellMenuPart_Abstract" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165339307433">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReplaceChild_Item_Create" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165420413719">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_Generic_Group" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1165253627126" resolveInfo="CellMenuPart_AbstractGroup" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165420626554">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_Generic_Group_Handler" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165424453110">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_Generic_Item" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1164824854750" resolveInfo="CellMenuPart_Abstract" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165424657443">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_Generic_Item_Handler" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1166040637528">
      <property name="iconPath" nameId="tpce.1160488491229" value="${language_descriptor}/icons/menuComponent.png" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="CellMenuComponent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1166049232041" resolveInfo="AbstractComponent" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1166041033436">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuComponentFeature" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1166041748520">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuComponentFeature_Property" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1166041033436" resolveInfo="CellMenuComponentFeature" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1166042131867">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuComponentFeature_Link" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1166041033436" resolveInfo="CellMenuComponentFeature" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1166049232041">
      <property name="name" nameId="tpck.1169194664001" value="AbstractComponent" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1166059625718">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_CellMenuComponent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1164824854750" resolveInfo="CellMenuPart_Abstract" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1174088067129">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_ReplaceChildPrimary" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1164824854750" resolveInfo="CellMenuPart_Abstract" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1176474535556">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_JComponent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1176717779940">
      <property name="name" nameId="tpck.1169194664001" value="ConceptFunctionParameter_text" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1176717841777">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_ModelAccess_Getter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1176717871254">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_ModelAccess_Setter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1176717888428">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_ModelAccess_Validator" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1176717996748">
      <property name="name" nameId="tpck.1169194664001" value="ModelAccessor" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1176731909317">
      <property name="name" nameId="tpck.1169194664001" value="ConceptFunctionParameter_oldText" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1176749715029">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_CellProvider" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1176809959526">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_Color" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction.Style" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1221059528506" resolveInfo="QueryFunction_StyleParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1176897764478">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_NodeFactory" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1176899348742">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_ImagePath" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1180615838666">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_PropertyPostfixHints" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1164824854750" resolveInfo="CellMenuPart_Abstract" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1180616057533">
      <property name="name" nameId="tpck.1169194664001" value="CellMenuPart_PropertyPostfixHints_GetPostfixes" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellMenu" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1182191800432">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_NodeListFilter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1182233249301">
      <property name="name" nameId="tpck.1169194664001" value="ConceptFunctionParameter_childNode" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1184319644772">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_NonEmptyProperty" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389658414" resolveInfo="CellModel_Property" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186402211651">
      <property name="name" nameId="tpck.1169194664001" value="StyleSheet" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <property name="iconPath" nameId="tpce.1160488491229" value="${language_descriptor}/icons/editorStylesheet.png" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186402373407">
      <property name="name" nameId="tpck.1169194664001" value="StyleSheetClass" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186402475462">
      <property name="name" nameId="tpck.1169194664001" value="StyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186403694788">
      <property name="name" nameId="tpck.1169194664001" value="ColorStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186403751766">
      <property name="name" nameId="tpck.1169194664001" value="FontStyleStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186404549998">
      <property name="name" nameId="tpck.1169194664001" value="ForegroundColorStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186403694788" resolveInfo="ColorStyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186404574412">
      <property name="name" nameId="tpck.1169194664001" value="BackgroundColorStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186403694788" resolveInfo="ColorStyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186413799158">
      <property name="name" nameId="tpck.1169194664001" value="BracketColorStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186403694788" resolveInfo="ColorStyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186414536763">
      <property name="name" nameId="tpck.1169194664001" value="BooleanStyleSheetItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186414928363">
      <property name="name" nameId="tpck.1169194664001" value="SelectableStyleSheetItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186414949600">
      <property name="name" nameId="tpck.1169194664001" value="AutoDeletableStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186414976055">
      <property name="name" nameId="tpck.1169194664001" value="DrawBorderStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186414999511">
      <property name="name" nameId="tpck.1169194664001" value="UnderlinedStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186415722038">
      <property name="name" nameId="tpck.1169194664001" value="FontSizeStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1186414860679">
      <property name="name" nameId="tpck.1169194664001" value="EditableStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1187258617779">
      <property name="name" nameId="tpck.1169194664001" value="ForegroundNullColorStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186403694788" resolveInfo="ColorStyleClassItem" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1197893505573">
      <property name="name" nameId="tpck.1169194664001" value="_CaretPosition_Enum" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1198252130653">
      <property name="name" nameId="tpck.1169194664001" value="StyleSheetClassReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1198256887712">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_Indent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1198257632966">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_BlockStart" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1198257747917">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_BlockEnd" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1198489924438">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_Block" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1201265905111">
      <property name="name" nameId="tpck.1169194664001" value="SelectOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="SNode" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tp25.1138411891628" resolveInfo="SNodeOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1201266127262">
      <property name="name" nameId="tpck.1169194664001" value="SelectParameter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="SNode" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1201268783309">
      <property name="name" nameId="tpck.1169194664001" value="SelectPositionParameter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="SNode" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1201266127262" resolveInfo="SelectParameter" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1201268793545">
      <property name="name" nameId="tpck.1169194664001" value="SelectPosition" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="SNode" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1201270864927">
      <property name="name" nameId="tpck.1169194664001" value="CaretPositionParameter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="SNode" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1201266127262" resolveInfo="SelectParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1214317859050">
      <property name="name" nameId="tpck.1169194664001" value="LayoutConstraintStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1214320119173">
      <property name="name" nameId="tpck.1169194664001" value="SideTransformAnchorTagStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1214406454886">
      <property name="name" nameId="tpck.1169194664001" value="TextBackgroundColorStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186403694788" resolveInfo="ColorStyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1214406466686">
      <property name="name" nameId="tpck.1169194664001" value="TextBackgroundColorSelectedStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186403694788" resolveInfo="ColorStyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1214472762472">
      <property name="name" nameId="tpck.1169194664001" value="DefaultCaretPositionStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1215007762405">
      <property name="name" nameId="tpck.1169194664001" value="FloatStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1215007883204">
      <property name="name" nameId="tpck.1169194664001" value="PaddingLeftStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet.Paddings" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1226339938453" resolveInfo="AbstractPaddingStyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1215007897487">
      <property name="name" nameId="tpck.1169194664001" value="PaddingRightStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet.Paddings" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1226339938453" resolveInfo="AbstractPaddingStyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1215085112640">
      <property name="name" nameId="tpck.1169194664001" value="FirstPositionAllowedStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1215085197271">
      <property name="name" nameId="tpck.1169194664001" value="LastPositionAllowedStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1216308376568">
      <property name="name" nameId="tpck.1169194664001" value="_NextLine_Enum" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1216308599511">
      <property name="name" nameId="tpck.1169194664001" value="PositionStyleClassItem" />
      <property name="rootable" nameId="tpce.1096454100552" value="false" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1216380990741">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_TransactionalProperty" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1079353555532" resolveInfo="CellModel_AbstractLabel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1216381054717">
      <property name="name" nameId="tpck.1169194664001" value="TransactionalPropertyHandler" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1216381117100">
      <property name="name" nameId="tpck.1169194664001" value="TransactionPropertyHandler_oldValue" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1216381148013">
      <property name="name" nameId="tpck.1169194664001" value="TransactionPropertyHandler_newValue" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1216560327200">
      <property name="name" nameId="tpck.1169194664001" value="PositionChildrenStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1216672142186">
      <property name="name" nameId="tpck.1169194664001" value="CellLayout_Indent_Old" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellLayout" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1106270491082" resolveInfo="CellLayout" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1219226236603">
      <property name="name" nameId="tpck.1169194664001" value="DrawBracketsStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1219418625346">
      <property name="name" nameId="tpck.1169194664001" value="IStyleContainer" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1220974635399">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_FontStyle" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction.Style" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1221059528506" resolveInfo="QueryFunction_StyleParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1221057094638">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_Integer" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction.Style" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1221059528506" resolveInfo="QueryFunction_StyleParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1221059528506">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_StyleParameter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction.Style" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1221062700015">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_Underlined" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction.Style" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1221059528506" resolveInfo="QueryFunction_StyleParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1223386653097">
      <property name="name" nameId="tpck.1169194664001" value="StrikeOutStyleSheet" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1223387125302">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_Boolean" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction.Style" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1221059528506" resolveInfo="QueryFunction_StyleParameter" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1225456097782">
      <property name="name" nameId="tpck.1169194664001" value="IQueryFunction_Color" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction.Style" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1225456267680">
      <property name="name" nameId="tpck.1169194664001" value="RGBColor" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1225898583838">
      <property name="name" nameId="tpck.1169194664001" value="ReadOnlyModelAccessor" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1225900081164">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_ReadOnlyModelAccessor" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1079353555532" resolveInfo="CellModel_AbstractLabel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1226339751946">
      <property name="name" nameId="tpck.1169194664001" value="PaddingTopStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet.Paddings" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1226339938453" resolveInfo="AbstractPaddingStyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1226339813308">
      <property name="name" nameId="tpck.1169194664001" value="PaddingBottomStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet.Paddings" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1226339938453" resolveInfo="AbstractPaddingStyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1226339938453">
      <property name="name" nameId="tpck.1169194664001" value="AbstractPaddingStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet.Paddings" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1215007762405" resolveInfo="FloatStyleClassItem" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1226504633752">
      <property name="name" nameId="tpck.1169194664001" value="_Enum_Measure" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet.Paddings" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1226504706052" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1227861515039">
      <property name="name" nameId="tpck.1169194664001" value="NavigatableReferenceStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1233148810477">
      <property name="name" nameId="tpck.1169194664001" value="InlineStyleDeclaration" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1233758997495">
      <property name="name" nameId="tpck.1169194664001" value="PunctuationLeftStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1233759184865">
      <property name="name" nameId="tpck.1169194664001" value="PunctuationRightStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1233823429331">
      <property name="name" nameId="tpck.1169194664001" value="HorizontalGapStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet.Paddings" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1226339938453" resolveInfo="AbstractPaddingStyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1235728439575">
      <property name="name" nameId="tpck.1169194664001" value="BaseLineCell" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1235999440492">
      <property name="name" nameId="tpck.1169194664001" value="HorizontalAlign" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1235999709834">
      <property name="name" nameId="tpck.1169194664001" value="AlignEnum" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1235999709835" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1236262245656">
      <property name="name" nameId="tpck.1169194664001" value="MatchingLabelStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1236263696991">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_MatchingNode" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1236443640684">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_String" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1237303669825">
      <property name="name" nameId="tpck.1169194664001" value="CellLayout_Indent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellLayout" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1106270491082" resolveInfo="CellLayout" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1237307900041">
      <property name="name" nameId="tpck.1169194664001" value="IndentLayoutIndentStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet.IndentLayout" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1237308012275">
      <property name="name" nameId="tpck.1169194664001" value="IndentLayoutNewLineStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet.IndentLayout" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1237375020029">
      <property name="name" nameId="tpck.1169194664001" value="IndentLayoutNewLineChildrenStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet.IndentLayout" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1237385578942">
      <property name="name" nameId="tpck.1169194664001" value="IndentLayoutOnNewLineStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet.IndentLayout" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConstrainedDataTypeDeclaration" typeId="tpce.1082978499127" id="1239805001815">
      <property name="name" nameId="tpck.1169194664001" value="_FloatOrInteger_String" />
      <property name="constraint" nameId="tpce.1083066089218" value="-?[0-9]+\\.?[0-9]*" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet.Paddings" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1239814640496">
      <property name="name" nameId="tpck.1169194664001" value="CellLayout_VerticalGrid" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellLayout" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1106270571710" resolveInfo="CellLayout_Vertical" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1240253180846">
      <property name="name" nameId="tpck.1169194664001" value="IndentLayoutNoWrapClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet.IndentLayout" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186414536763" resolveInfo="BooleanStyleSheetItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="625126330682908270">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_ReferencePresentation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7667276221847570194">
      <property name="name" nameId="tpck.1169194664001" value="ParametersInformationStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7667276221847612622">
      <property name="name" nameId="tpck.1169194664001" value="ParametersInformationQuery" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="MethodParameters" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7667276221847612943">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_ParametersList" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="MethodParameters" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="671290755174094686">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_MethodPresentation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="MethodParameters" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="671290755174094691">
      <property name="name" nameId="tpck.1169194664001" value="ConceptFunctionParameter_parameterObject" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="MethodParameters" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6419604448124516209">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_IsMethodCurrent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="MethodParameters" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4526149749187797167">
      <property name="name" nameId="tpck.1169194664001" value="ConceptFunctionParameter_StyledText" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="MethodParameters" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="280151408461567367">
      <property name="name" nameId="tpck.1169194664001" value="AppendTextOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="MethodParameters" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4531786690998636238" resolveInfo="AbstractStyledTextOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="280151408461909164">
      <property name="name" nameId="tpck.1169194664001" value="SetBoldOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="MethodParameters" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4531786690998636238" resolveInfo="AbstractStyledTextOperation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4531786690998636238">
      <property name="name" nameId="tpck.1169194664001" value="AbstractStyledTextOperation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="MethodParameters" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3903367331818357915">
      <property name="name" nameId="tpck.1169194664001" value="StyledTextType" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="MethodParameters" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7620205565664569937">
      <property name="name" nameId="tpck.1169194664001" value="DefaultBaseLine" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="7620205565664606377">
      <property name="name" nameId="tpck.1169194664001" value="DefaultBaseLineEnum" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1886960078078641793">
      <property name="name" nameId="tpck.1169194664001" value="CellLayout_Superscript" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellLayout" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1106270491082" resolveInfo="CellLayout" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="8255250703325730686">
      <property name="name" nameId="tpck.1169194664001" value="ScriptSwitchEnum" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8255250703325731016">
      <property name="name" nameId="tpck.1169194664001" value="ScriptKindClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4203201205844553978">
      <property name="name" nameId="tpck.1169194664001" value="ConceptFunctionParameter_selectedNode" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="MethodParameters" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5949640294884234625">
      <property name="name" nameId="tpck.1169194664001" value="CellLayout_Table" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellLayout" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1106270491082" resolveInfo="CellLayout" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="6820251943131810951">
      <property name="name" nameId="tpck.1169194664001" value="TableComponentEnum" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6820251943131810950">
      <property name="name" nameId="tpck.1169194664001" value="TableComponentStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8313721352726366579">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_Empty" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7597241200646296617">
      <property name="name" nameId="tpck.1169194664001" value="NavigatableNodeStyleClassItem" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Stylesheet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7597241200646296619">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_SNode" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction.Style" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1221059528506" resolveInfo="QueryFunction_StyleParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3696012239575138270">
      <property name="name" nameId="tpck.1169194664001" value="CellModel_URL" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="CellModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1139848536355" resolveInfo="CellModel_WithRole" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3608226089191997415">
      <property name="name" nameId="tpck.1169194664001" value="RightTransformAnchorTagWrapper" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="709996738298806197">
      <property name="name" nameId="tpck.1169194664001" value="QueryFunction_SeparatorText" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="QueryFunction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
  </roots>
  <root id="1071666914219">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1078153129734">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="inspectedCellModel" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1158938128496">
      <property name="value" nameId="tpce.1105725733873" value="Concept Editor" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1210369064378">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="2621449412040149672">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpce.2621449412040133764" resolveInfo="IConceptAspect" />
    </node>
  </root>
  <root id="1073389214265">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1119645550923">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1142887637401">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="renderingCondition" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1142886221719" resolveInfo="QueryFunction_NodeCondition" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1139959269582">
      <property name="role" nameId="tpce.1071599776563" value="actionMap" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1139535219966" resolveInfo="CellActionMapDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1081339532145">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="keyMap" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1081293058843" resolveInfo="CellKeyMapDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1186406756722">
      <property name="role" nameId="tpce.1071599776563" value="styleClass" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1186402373407" resolveInfo="StyleSheetClass" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1164826688380">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="menuDescriptor" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1164824717996" resolveInfo="CellMenuDescriptor" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1176810465151">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="cellBackgroundFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176809959526" resolveInfo="QueryFunction_Color" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1198512004906">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="focusPolicyApplicable" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1142886221719" resolveInfo="QueryFunction_NodeCondition" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1130859485024">
      <property name="name" nameId="tpck.1169194664001" value="attractsFocus" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1130926557197" resolveInfo="FocusPolicy" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1219418770234">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1219418625346" resolveInfo="IStyleContainer" />
    </node>
  </root>
  <root id="1073389446423">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1073389446424">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <property name="role" nameId="tpce.1071599776563" value="childCellModel" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7723470090030138869">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="foldedCellModel" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1106270802874">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="cellLayout" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1106270491082" resolveInfo="CellLayout" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8709572687796959088">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="usesFoldingCondition" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1142886221719" resolveInfo="QueryFunction_NodeCondition" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1073389446425">
      <property name="name" nameId="tpck.1169194664001" value="vertical" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="1239869892471">
        <property name="comment" nameId="tpce.1225118933224" value="Use isVertical()" />
      </node>
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1073389446426">
      <property name="name" nameId="tpck.1169194664001" value="gridLayout" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="1239869894921">
        <property name="comment" nameId="tpce.1225118933224" value="Use isVerticalGrid()" />
      </node>
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1139416841293">
      <property name="name" nameId="tpck.1169194664001" value="usesBraces" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1160590353935">
      <property name="name" nameId="tpck.1169194664001" value="usesFolding" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377702">
      <property name="value" nameId="tpce.1105725733873" value="collection" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377703">
      <property name="value" nameId="tpce.1105725733873" value="collection of cells" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1073389577006">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1073389577007">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1082639509531">
      <property name="name" nameId="tpck.1169194664001" value="nullText" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377704">
      <property name="value" nameId="tpce.1105725733873" value="constant" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377705">
      <property name="value" nameId="tpce.1105725733873" value="text label" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1073389658414">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1073389964684">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="propertyDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288299" resolveInfo="PropertyDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="1140103550593" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377706">
      <property name="value" nameId="tpce.1105725733873" value="{&lt;{propertyDeclaration}&gt;}" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180268756546">
      <property name="value" nameId="tpce.1105725733873" value="property" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1073389882823">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1073389882824">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="linkDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="1140103550593" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180297564460">
      <property name="value" nameId="tpce.1105725733873" value="%&lt;{linkDeclaration}&gt;%" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180298340765">
      <property name="value" nameId="tpce.1105725733873" value="single aggregation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1073390211982">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1145360728033">
      <property name="name" nameId="tpck.1169194664001" value="reverse" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1073390211987">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="linkDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="1140103550593" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165347032372">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="elementMenuDescriptor" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1164824717996" resolveInfo="CellMenuDescriptor" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1173177718857">
      <property name="role" nameId="tpce.1071599776563" value="elementActionMap" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1139535219966" resolveInfo="CellActionMapDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1182233390675">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="filter" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1182191800432" resolveInfo="QueryFunction_NodeListFilter" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377710">
      <property name="value" nameId="tpce.1105725733873" value="%&lt;{linkDeclaration}&gt;%" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180298374005">
      <property name="value" nameId="tpce.1105725733873" value="multiple aggregation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1074767920765">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1176718152741">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="modelAcessor" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176717996748" resolveInfo="ModelAccessor" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1082638248796">
      <property name="name" nameId="tpck.1169194664001" value="nullText" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377711">
      <property name="value" nameId="tpce.1105725733873" value="model access" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377712">
      <property name="value" nameId="tpce.1105725733873" value="reference to accessor" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1075375595203">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1075375595204">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377713">
      <property name="value" nameId="tpce.1105725733873" value="error" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377714">
      <property name="value" nameId="tpce.1105725733873" value="red text label" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1078308402140">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1176795024817">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="cellProvider" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176749715029" resolveInfo="QueryFunction_CellProvider" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377720">
      <property name="value" nameId="tpce.1105725733873" value="custom" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377721">
      <property name="value" nameId="tpce.1105725733873" value="reference to cell provider" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1078938745671">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1158938178950">
      <property name="value" nameId="tpce.1105725733873" value="Editor Component" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1210369055138">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5270353093116097894">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpce.2621449412040133764" resolveInfo="IConceptAspect" />
    </node>
  </root>
  <root id="1078939183254">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1078939183255">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="editorComponent" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1078938745671" resolveInfo="EditorComponentDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377722">
      <property name="value" nameId="tpce.1105725733873" value="component" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377723">
      <property name="value" nameId="tpce.1105725733873" value="reference to editor component" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1079353555532">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1176889772388">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="cellForegroundFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176809959526" resolveInfo="QueryFunction_Color" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1185888338931">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="textForegroundEmptyFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176809959526" resolveInfo="QueryFunction_Color" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1185888173839">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="textBackgroundFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176809959526" resolveInfo="QueryFunction_Color" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1185888320335">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="textBgColorSelectedFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176809959526" resolveInfo="QueryFunction_Color" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1119646130993">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1197893615481">
      <property name="name" nameId="tpck.1169194664001" value="defaultCaretPosition" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1197893505573" resolveInfo="_CaretPosition_Enum" />
    </node>
  </root>
  <root id="1080736578640">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1080736633877">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="cellModel" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
  </root>
  <root id="1081293058843">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1173470710781">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5270353093116096533">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpce.2621449412040133764" resolveInfo="IConceptAspect" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1149937560128">
      <property name="name" nameId="tpck.1169194664001" value="everyModel" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1139445935125">
      <property name="role" nameId="tpce.1071599776563" value="applicableConcept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1136930944870">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <property name="role" nameId="tpce.1071599776563" value="item" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1136916919141" resolveInfo="CellKeyMapItem" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1158938229201">
      <property name="value" nameId="tpce.1105725733873" value="Cell Keymap" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1083928804390">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1083928804391">
      <property name="externalValue" nameId="tpce.1083923523172" value="yes" />
      <property name="internalValue" nameId="tpce.1083923523171" value="true" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1083928804392">
      <property name="externalValue" nameId="tpce.1083923523172" value="no" />
      <property name="internalValue" nameId="tpce.1083923523171" value="false" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1083928804393">
      <property name="externalValue" nameId="tpce.1083923523172" value="none" />
    </node>
  </root>
  <root id="1083952545109">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1083952545110">
      <property name="externalValue" nameId="tpce.1083923523172" value="none" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1083952545111">
      <property name="externalValue" nameId="tpce.1083923523172" value="red" />
      <property name="internalValue" nameId="tpce.1083923523171" value="red" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1083952545112">
      <property name="externalValue" nameId="tpce.1083923523172" value="pink" />
      <property name="internalValue" nameId="tpce.1083923523171" value="pink" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1083952545113">
      <property name="externalValue" nameId="tpce.1083923523172" value="orange" />
      <property name="internalValue" nameId="tpce.1083923523171" value="orange" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1083952545114">
      <property name="externalValue" nameId="tpce.1083923523172" value="yellow" />
      <property name="internalValue" nameId="tpce.1083923523171" value="yellow" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1083952545115">
      <property name="externalValue" nameId="tpce.1083923523172" value="green" />
      <property name="internalValue" nameId="tpce.1083923523171" value="green" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1101213169706">
      <property name="externalValue" nameId="tpce.1083923523172" value="darkGreen" />
      <property name="internalValue" nameId="tpce.1083923523171" value="DARK_GREEN" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1083952545116">
      <property name="externalValue" nameId="tpce.1083923523172" value="magenta" />
      <property name="internalValue" nameId="tpce.1083923523171" value="magenta" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1101213185757">
      <property name="externalValue" nameId="tpce.1083923523172" value="darkMagenta" />
      <property name="internalValue" nameId="tpce.1083923523171" value="DARK_MAGENTA" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1083952545117">
      <property name="externalValue" nameId="tpce.1083923523172" value="cyan" />
      <property name="internalValue" nameId="tpce.1083923523171" value="cyan" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1083952545118">
      <property name="externalValue" nameId="tpce.1083923523172" value="blue" />
      <property name="internalValue" nameId="tpce.1083923523171" value="blue" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1216404713420">
      <property name="externalValue" nameId="tpce.1083923523172" value="lightBlue" />
      <property name="internalValue" nameId="tpce.1083923523171" value="LIGHT_BLUE" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1101209985304">
      <property name="externalValue" nameId="tpce.1083923523172" value="darkBlue" />
      <property name="internalValue" nameId="tpce.1083923523171" value="DARK_BLUE" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1084208529765">
      <property name="externalValue" nameId="tpce.1083923523172" value="gray" />
      <property name="internalValue" nameId="tpce.1083923523171" value="gray" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1084208529766">
      <property name="externalValue" nameId="tpce.1083923523172" value="lightGray" />
      <property name="internalValue" nameId="tpce.1083923523171" value="lightGray" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1084208529767">
      <property name="externalValue" nameId="tpce.1083923523172" value="darkGray" />
      <property name="internalValue" nameId="tpce.1083923523171" value="darkGray" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1214395400259">
      <property name="externalValue" nameId="tpce.1083923523172" value="white" />
      <property name="internalValue" nameId="tpce.1083923523171" value="WHITE" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="7151630269404055096">
      <property name="externalValue" nameId="tpce.1083923523172" value="black" />
      <property name="internalValue" nameId="tpce.1083923523171" value="black" />
    </node>
  </root>
  <root id="1088013125922">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1088013239202">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="linkDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="1140103550593" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1088186146602">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="editorComponent" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1088185857835" resolveInfo="InlineEditorComponent" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180296391450">
      <property name="value" nameId="tpce.1105725733873" value="%&lt;{linkDeclaration}&gt;%-&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180298302748">
      <property name="value" nameId="tpce.1105725733873" value="reference" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1088185857835">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377726">
      <property name="value" nameId="tpce.1105725733873" value="in-line editor component" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1088612959204">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1088613081987">
      <property name="name" nameId="tpck.1169194664001" value="vertical" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1145918517974">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="alternationCondition" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1142886221719" resolveInfo="QueryFunction_NodeCondition" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1088612958265">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="ifTrueCellModel" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1088612973955">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="ifFalseCellModel" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377727">
      <property name="value" nameId="tpce.1105725733873" value="alternation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1107223377728">
      <property name="value" nameId="tpce.1105725733873" value="cell alternation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1101211480448">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1101211523070">
      <property name="externalValue" nameId="tpce.1083923523172" value="bold" />
      <property name="internalValue" nameId="tpce.1083923523171" value="BOLD" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1101211542532">
      <property name="externalValue" nameId="tpce.1083923523172" value="italic" />
      <property name="internalValue" nameId="tpce.1083923523171" value="ITALIC" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1101213960346">
      <property name="externalValue" nameId="tpce.1083923523172" value="boldItalic" />
      <property name="internalValue" nameId="tpce.1083923523171" value="BOLD_ITALIC" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1134577855137">
      <property name="externalValue" nameId="tpce.1083923523172" value="plain" />
      <property name="internalValue" nameId="tpce.1083923523171" value="PLAIN" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1220973684614">
      <property name="internalValue" nameId="tpce.1083923523171" value="QUERY" />
      <property name="externalValue" nameId="tpce.1083923523172" value="query" />
    </node>
  </root>
  <root id="1103016434866">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1176475119347">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="componentProvider" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176474535556" resolveInfo="QueryFunction_JComponent" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1137941825015">
      <property name="value" nameId="tpce.1105725733873" value="swing component" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1106270491082">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1235226217430">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="1106270549637">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1235227714767">
      <property name="value" nameId="tpce.1105725733873" value="horizontal" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1106270571710">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1235227746009">
      <property name="value" nameId="tpce.1105725733873" value="vertical" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1106270637846">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1235227699406">
      <property name="value" nameId="tpce.1105725733873" value="flow" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1130847686886">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1130847686918">
      <property name="externalValue" nameId="tpce.1083923523172" value="as_is" />
      <property name="internalValue" nameId="tpce.1083923523171" value="0" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1130847816499">
      <property name="externalValue" nameId="tpce.1083923523172" value="not_underlined" />
      <property name="internalValue" nameId="tpce.1083923523171" value="1" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1130847833453">
      <property name="externalValue" nameId="tpce.1083923523172" value="underlined" />
      <property name="internalValue" nameId="tpce.1083923523171" value="2" />
    </node>
  </root>
  <root id="1130926557197">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1130926557292">
      <property name="externalValue" nameId="tpce.1083923523172" value="noAttraction" />
      <property name="internalValue" nameId="tpce.1083923523171" value="0" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1130926591919">
      <property name="externalValue" nameId="tpce.1083923523172" value="attractsFocus" />
      <property name="internalValue" nameId="tpce.1083923523171" value="1" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1130926603060">
      <property name="externalValue" nameId="tpce.1083923523172" value="firstEditableCell" />
      <property name="internalValue" nameId="tpce.1083923523171" value="2" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1227082414196">
      <property name="internalValue" nameId="tpce.1083923523171" value="3" />
      <property name="externalValue" nameId="tpce.1083923523172" value="attractsRecursively" />
    </node>
  </root>
  <root id="1134379236839">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1134380148394">
      <property name="value" nameId="tpce.1105725733873" value="attributed property" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1134380159646">
      <property name="value" nameId="tpce.1105725733873" value="cell for attributed property" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1136564507907">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1136564532725">
      <property name="value" nameId="tpce.1105725733873" value="attributed link" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1136564532726">
      <property name="value" nameId="tpce.1105725733873" value="cell for attributed link" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1136916919141">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1136916998332">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <property name="role" nameId="tpce.1071599776563" value="keystroke" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1136916976737" resolveInfo="CellKeyMapKeystroke" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1136917325338">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="isApplicableFunction" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1136917249679" resolveInfo="CellKeyMap_IsApplicableFunction" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1136920925604">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="executeFunction" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1136917288805" resolveInfo="CellKeyMap_ExecuteFunction" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1136916941877">
      <property name="name" nameId="tpck.1169194664001" value="description" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1141091278922">
      <property name="name" nameId="tpck.1169194664001" value="caretPolicy" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1141091053936" resolveInfo="CellKeyMapCaretPolicy" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1163507208434">
      <property name="name" nameId="tpck.1169194664001" value="showInPopup" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1184322083615">
      <property name="name" nameId="tpck.1169194664001" value="menuAlwaysShown" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
  </root>
  <root id="1136916976737">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1136923970223">
      <property name="name" nameId="tpck.1169194664001" value="modifiers" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1136923970224">
      <property name="name" nameId="tpck.1169194664001" value="keycode" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="1136917155755">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1161630184985">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1137189922872">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137546998352" resolveInfo="conceptFunctionParameter" />
      <node role="target" roleId="tpce.1105736901241" type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1137189922873">
        <property name="name" nameId="tpck.1169194664001" value="CellKeyMap_FunctionParm_selectedNode" />
        <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
        <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1137189922876">
          <property name="value" nameId="tpce.1105725733873" value="node" />
          <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
        </node>
        <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1137189922877">
          <property name="value" nameId="tpce.1105725733873" value="keymap function parameter" />
          <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
        </node>
      </node>
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1189582551383">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137546998352" resolveInfo="conceptFunctionParameter" />
      <node role="target" roleId="tpce.1105736901241" type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1189582551384">
        <property name="name" nameId="tpck.1169194664001" value="CellKeyMap_FunctionParm_selectedNodes" />
        <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
        <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1189582551385">
          <property name="value" nameId="tpce.1105725733873" value="selectedNodes" />
          <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
        </node>
        <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1189582551386">
          <property name="value" nameId="tpce.1105725733873" value="keymap function parameter" />
          <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
        </node>
      </node>
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1143487952335">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137546998352" resolveInfo="conceptFunctionParameter" />
      <node role="target" roleId="tpce.1105736901241" type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1143487955383">
        <property name="name" nameId="tpck.1169194664001" value="CellKeyMap_FunctionParm_keyEvent" />
        <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
        <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1143490306697">
          <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545963098" resolveInfo="conceptFunctionParameterType" />
          <node role="target" roleId="tpce.1105736901241" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1143490313729">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8q6x.~KeyEvent" resolveInfo="KeyEvent" />
          </node>
        </node>
        <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1143488564542">
          <property name="value" nameId="tpce.1105725733873" value="keyEvent" />
          <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
        </node>
        <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1143488601967">
          <property name="value" nameId="tpce.1105725733873" value="keymap function parameter" />
          <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
        </node>
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1136917182663">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="1136917249679">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1137545690489">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1141871296431" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1158958783311">
      <property name="value" nameId="tpce.1105725733873" value="is applicable block" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1136917288805">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1158958837093">
      <property name="value" nameId="tpce.1105725733873" value="execute block" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1137553248617">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1137553248621">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="propertyDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1105725006687" resolveInfo="ConceptPropertyDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="1140103550593" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1137553248622">
      <property name="value" nameId="tpce.1105725733873" value="{{&lt;{propertyDeclaration}&gt;}}" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180269136114">
      <property name="value" nameId="tpce.1105725733873" value="concept property" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1138197387103">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1138197387339">
      <property name="externalValue" nameId="tpce.1083923523172" value="punctuation" />
      <property name="internalValue" nameId="tpce.1083923523171" value="punctuation" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1138197619454">
      <property name="externalValue" nameId="tpce.1083923523172" value="noflow" />
      <property name="internalValue" nameId="tpce.1083923523171" value="noflow" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1138197631095">
      <property name="externalValue" nameId="tpce.1083923523172" value="none" />
    </node>
  </root>
  <root id="1139535219966">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1173470751204">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5270353093116090437">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpce.2621449412040133764" resolveInfo="IConceptAspect" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1139535219968">
      <property name="role" nameId="tpce.1071599776563" value="applicableConcept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1139535219969">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <property name="role" nameId="tpce.1071599776563" value="item" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1139535280617" resolveInfo="CellActionMapItem" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1158938242046">
      <property name="value" nameId="tpce.1105725733873" value="Cell Action Map" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1139535280617">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1139537298254">
      <property name="name" nameId="tpck.1169194664001" value="description" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1139535298778">
      <property name="name" nameId="tpck.1169194664001" value="actionId" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1139535328871" resolveInfo="CellActionId" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1139535280620">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="executeFunction" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1139535439104" resolveInfo="CellActionMap_ExecuteFunction" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1185875612566">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1139535328871">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1139535329028">
      <property name="externalValue" nameId="tpce.1083923523172" value="RIGHT_TRANSFORM" />
      <property name="internalValue" nameId="tpce.1083923523171" value="right_transform_action_id" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1139535387060">
      <property name="externalValue" nameId="tpce.1083923523172" value="DELETE" />
      <property name="internalValue" nameId="tpce.1083923523171" value="delete_action_id" />
    </node>
  </root>
  <root id="1139535439104">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1161630496596">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1139535439111">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137546998352" resolveInfo="conceptFunctionParameter" />
      <node role="target" roleId="tpce.1105736901241" type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1139535439112">
        <property name="name" nameId="tpck.1169194664001" value="CellActionMap_FunctionParm_selectedNode" />
        <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
        <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1139535439113">
          <property name="value" nameId="tpce.1105725733873" value="node" />
          <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
        </node>
        <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1139535439114">
          <property name="value" nameId="tpce.1105725733873" value="selected node (action map function parameter)" />
          <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
        </node>
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1158959403408">
      <property name="value" nameId="tpce.1105725733873" value="execute block" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1139744471051">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1139744471411">
      <property name="externalValue" nameId="tpce.1083923523172" value="alignmentJustify" />
      <property name="internalValue" nameId="tpce.1083923523171" value="justify" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1139744531598">
      <property name="externalValue" nameId="tpce.1083923523172" value="alignmentCenter" />
      <property name="internalValue" nameId="tpce.1083923523171" value="center" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1139744545740">
      <property name="externalValue" nameId="tpce.1083923523172" value="alignmentTile" />
      <property name="internalValue" nameId="tpce.1083923523171" value="tile" />
    </node>
  </root>
  <root id="1139744628335">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1176899909521">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="imagePathProvider" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176899348742" resolveInfo="QueryFunction_ImagePath" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1139746504291">
      <property name="name" nameId="tpck.1169194664001" value="imageFile" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1139858284555">
      <property name="name" nameId="tpck.1169194664001" value="descent" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657062" resolveInfo="integer" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1139746404569">
      <property name="value" nameId="tpce.1105725733873" value="image" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1139746422633">
      <property name="value" nameId="tpce.1105725733873" value="cell for an image" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1139848536355">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1139849308084">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1139852716018">
      <property name="name" nameId="tpck.1169194664001" value="noTargetText" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1214560368769">
      <property name="name" nameId="tpck.1169194664001" value="emptyNoTargetText" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1140017977771">
      <property name="name" nameId="tpck.1169194664001" value="readOnly" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1140114345053">
      <property name="name" nameId="tpck.1169194664001" value="allowEmptyText" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1140103550593">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="relationDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
  </root>
  <root id="1140524381322">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1140524467909">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1176897874615">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="nodeFactory" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176897764478" resolveInfo="QueryFunction_NodeFactory" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1140524464359">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="emptyCellModel" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6046489571270834038">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="foldedCellModel" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1140524464360">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="cellLayout" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1106270491082" resolveInfo="CellLayout" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1233141163694">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="separatorStyle" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1233148810477" resolveInfo="InlineStyleDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="928328222691832421">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="separatorTextQuery" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="709996738298806197" resolveInfo="QueryFunction_SeparatorText" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4601216887035799527">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="usesFoldingCondition" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1142886221719" resolveInfo="QueryFunction_NodeCondition" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1140524450554">
      <property name="name" nameId="tpck.1169194664001" value="vertical" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="1239873962700" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1140524450555">
      <property name="name" nameId="tpck.1169194664001" value="gridLayout" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="1239873964974" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1140524450556">
      <property name="name" nameId="tpck.1169194664001" value="usesBraces" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1160590307797">
      <property name="name" nameId="tpck.1169194664001" value="usesFolding" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1140524450557">
      <property name="name" nameId="tpck.1169194664001" value="separatorText" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1156252885376">
      <property name="name" nameId="tpck.1169194664001" value="separatorLayoutConstraint" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1138197387103" resolveInfo="_Layout_Constraints_Enum" />
    </node>
  </root>
  <root id="1140813780565">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1140813780644">
      <property name="externalValue" nameId="tpce.1083923523172" value="none" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1140813835051">
      <property name="externalValue" nameId="tpce.1083923523172" value="default_" />
      <property name="internalValue" nameId="tpce.1083923523171" value="default_RTransform" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1140813898505">
      <property name="externalValue" nameId="tpce.1083923523172" value="ext_1" />
      <property name="internalValue" nameId="tpce.1083923523171" value="ext_1_RTransform" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1140813939727">
      <property name="externalValue" nameId="tpce.1083923523172" value="ext_2" />
      <property name="internalValue" nameId="tpce.1083923523171" value="ext_2_RTransform" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1140813947731">
      <property name="externalValue" nameId="tpce.1083923523172" value="ext_3" />
      <property name="internalValue" nameId="tpce.1083923523171" value="ext_3_RTransform" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1140813957048">
      <property name="externalValue" nameId="tpce.1083923523172" value="ext_4" />
      <property name="internalValue" nameId="tpce.1083923523171" value="ext_4_RTransform" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1140813967505">
      <property name="externalValue" nameId="tpce.1083923523172" value="ext_5" />
      <property name="internalValue" nameId="tpce.1083923523171" value="ext_5_RTransform" />
    </node>
  </root>
  <root id="1141091053936">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1141091054266">
      <property name="externalValue" nameId="tpce.1083923523172" value="ANY_POSITION" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1141091172402">
      <property name="externalValue" nameId="tpce.1083923523172" value="FIRST_POSITION" />
      <property name="internalValue" nameId="tpce.1083923523171" value="caret_at_first_position" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1141091209420">
      <property name="externalValue" nameId="tpce.1083923523172" value="LAST_POSITION" />
      <property name="internalValue" nameId="tpce.1083923523171" value="caret_at_last_position" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1143573566373">
      <property name="externalValue" nameId="tpce.1083923523172" value="INTERMEDIATE_POSITION" />
      <property name="internalValue" nameId="tpce.1083923523171" value="caret_at_intermediate_position" />
    </node>
  </root>
  <root id="1142886221719">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1145652669910">
      <property name="value" nameId="tpce.1105725733873" value="condition" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1145665848571">
      <property name="value" nameId="tpce.1105725733873" value="embedded block of code" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1142886758850">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1142886762757" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1161627665731">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1183571201975">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176473889746">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1142886811589" resolveInfo="ConceptFunctionParameter_node" />
    </node>
  </root>
  <root id="1142886811589">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1142886811590">
      <property name="value" nameId="tpce.1105725733873" value="node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1142886811591">
      <property name="value" nameId="tpce.1105725733873" value="function parameter" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1176492724289">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1143891911797">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1143891911798">
      <property name="externalValue" nameId="tpce.1083923523172" value="left" />
      <property name="internalValue" nameId="tpce.1083923523171" value="true" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1143891954220">
      <property name="externalValue" nameId="tpce.1083923523172" value="right" />
      <property name="internalValue" nameId="tpce.1083923523171" value="false" />
    </node>
  </root>
  <root id="1149850725784">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1149850757778">
      <property name="value" nameId="tpce.1105725733873" value="attributed node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1149850757779">
      <property name="value" nameId="tpce.1105725733873" value="cell for attributed node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1160493135005">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1160500373903">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp2q.ListType" typeId="tp2q.1151688443754" id="1160674633356">
        <node role="elementType" roleId="tp2q.1151688676805" type="tpee.StringType" typeId="tpee.1225271177708" id="1225191493854" />
      </node>
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1161629196402">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1161629292561">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622753914" resolveInfo="ConceptFunctionParameter_operationContext" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1164848564365">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613822479" resolveInfo="CellMenuPart_Abstract_editedNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1160493189132">
      <property name="value" nameId="tpce.1105725733873" value="property values" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1161622981231">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1161622981232">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545963098" resolveInfo="conceptFunctionParameterType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1161622981233">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="qxeo.~EditorContext" resolveInfo="EditorContext" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1161622981234">
      <property name="value" nameId="tpce.1105725733873" value="editorContext" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1161622981235">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1162497113192">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1162497113193">
      <property name="value" nameId="tpce.1105725733873" value="currentChild" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1162497113194">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1162498275506">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1162498325651">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545963098" resolveInfo="conceptFunctionParameterType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1162498330044">
        <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpce.1071489090640" resolveInfo="ConceptDeclaration" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1162498275507">
      <property name="value" nameId="tpce.1105725733873" value="defaultConceptOfChild" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1162498275508">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1163613035599">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1163613035600">
      <property name="value" nameId="tpce.1105725733873" value="get objects" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1178647877855">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp2q.ListType" typeId="tp2q.1151688443754" id="1178647881515">
        <node role="elementType" roleId="tp2q.1151688676805" type="tpee.WildCardType" typeId="tpee.1171903607971" id="1178647886236" />
      </node>
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1163613035601">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613822479" resolveInfo="CellMenuPart_Abstract_editedNode" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1163613035604">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1163613035605">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622753914" resolveInfo="ConceptFunctionParameter_operationContext" />
    </node>
  </root>
  <root id="1163613131943">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1163711457917">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1163711460075" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1163613131944">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613549566" resolveInfo="CellMenuPart_AbstractGroup_parameterObject" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1163613915977">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613822479" resolveInfo="CellMenuPart_Abstract_editedNode" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1163613131948">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622665029" resolveInfo="ConceptFunctionParameter_model" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1163613131949">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1163613131950">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622753914" resolveInfo="ConceptFunctionParameter_operationContext" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1163613131951">
      <property name="value" nameId="tpce.1105725733873" value="create replacement node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1163613549566">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1163613549567">
      <property name="value" nameId="tpce.1105725733873" value="parameterObject" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1163613549568">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1163613822479">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1163613822480">
      <property name="value" nameId="tpce.1105725733873" value="node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1163613822481">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1164052439493">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1164052439494">
      <property name="value" nameId="tpce.1105725733873" value="matching text" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1164052439495">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StringType" typeId="tpee.1225271177708" id="1225191500317" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1164052439497">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613549566" resolveInfo="CellMenuPart_AbstractGroup_parameterObject" />
    </node>
  </root>
  <root id="1164052588708">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1164052588709">
      <property name="value" nameId="tpce.1105725733873" value="description text" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1164052588710">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StringType" typeId="tpee.1225271177708" id="1225191499704" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1164052588712">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613549566" resolveInfo="CellMenuPart_AbstractGroup_parameterObject" />
    </node>
  </root>
  <root id="1164824717996">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1164824815888">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <property name="role" nameId="tpce.1071599776563" value="cellMenuPart" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1164824854750" resolveInfo="CellMenuPart_Abstract" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1164826227425">
      <property name="value" nameId="tpce.1105725733873" value="cell menu" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1164824854750">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1164824871502">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="1164833692343">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1164833692344">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="valuesFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1160493135005" resolveInfo="CellMenuPart_PropertyValues_GetValues" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1199894803096">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1164833692345">
      <property name="value" nameId="tpce.1105725733873" value="property values" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1164914519156">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1164914727930">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="replacementConcept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489090640" resolveInfo="ConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1164914519158">
      <property name="value" nameId="tpce.1105725733873" value="replace node (custom node concept)" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1164996492011">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1199894998166">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1164996492013">
      <property name="value" nameId="tpce.1105725733873" value="primary choose referent menu" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1165004207520">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165004529292">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="parametersFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1163613035599" resolveInfo="CellMenuPart_AbstractGroup_Query" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165004529293">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="createFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1163613131943" resolveInfo="CellMenuPart_ReplaceNode_Group_Create" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1165004207522">
      <property name="value" nameId="tpce.1105725733873" value="replace node (group of custom actions)" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1165253627126">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1165253627127">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165253890469">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="parameterObjectType" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1165254125954">
      <property name="name" nameId="tpck.1169194664001" value="presentation" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpcw.1165007009656" resolveInfo="NodePresentationOptions" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165254159533">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="matchingTextFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1164052439493" resolveInfo="CellMenuPart_AbstractGroup_MatchingText" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165254180581">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="descriptionTextFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1164052588708" resolveInfo="CellMenuPart_AbstractGroup_DescriptionText" />
    </node>
  </root>
  <root id="1165270418989">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165270418991">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="parametersFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1165270662927" resolveInfo="CellMenuPart_ReplaceChild_Group_Query" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165270418992">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="createFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1165270999881" resolveInfo="CellMenuPart_ReplaceChild_Group_Create" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1199895090639">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1165270418995">
      <property name="value" nameId="tpce.1105725733873" value="replace child (group of custom actions)" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1165270662927">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1165270662928">
      <property name="value" nameId="tpce.1105725733873" value="get objects" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165270662929">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613822479" resolveInfo="CellMenuPart_Abstract_editedNode" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165270662930">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1162497113192" resolveInfo="CellMenuPart_ReplaceChild_currentChild" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165270662931">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1162498275506" resolveInfo="CellMenuPart_ReplaceChild_defaultConceptOfChild" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165270662932">
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165270662933">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622753914" resolveInfo="ConceptFunctionParameter_operationContext" />
    </node>
  </root>
  <root id="1165270999881">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165270999882">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613549566" resolveInfo="CellMenuPart_AbstractGroup_parameterObject" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165270999883">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613822479" resolveInfo="CellMenuPart_Abstract_editedNode" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165270999884">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1162497113192" resolveInfo="CellMenuPart_ReplaceChild_currentChild" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165270999885">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1162498275506" resolveInfo="CellMenuPart_ReplaceChild_defaultConceptOfChild" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165270999886">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622665029" resolveInfo="ConceptFunctionParameter_model" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165270999887">
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165270999888">
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622753914" resolveInfo="ConceptFunctionParameter_operationContext" />
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1165270999889">
      <property name="value" nameId="tpce.1105725733873" value="create new child" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1165280503630">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165280503631">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="childConceptFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1165280856333" resolveInfo="CellMenuPart_ReplaceChild_CustomChildConcept_Query" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1199895114478">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1165280503632">
      <property name="value" nameId="tpce.1105725733873" value="replace child (custom child's concept)" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1165280856333">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1165280856334">
      <property name="value" nameId="tpce.1105725733873" value="get child concept" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1165280856335">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1165280856336">
        <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpce.1071489090640" resolveInfo="ConceptDeclaration" />
      </node>
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165280856337">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613822479" resolveInfo="CellMenuPart_Abstract_editedNode" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165280856338">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1162497113192" resolveInfo="CellMenuPart_ReplaceChild_currentChild" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165280856339">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1162498275506" resolveInfo="CellMenuPart_ReplaceChild_defaultConceptOfChild" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165280856340">
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165280856341">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622753914" resolveInfo="ConceptFunctionParameter_operationContext" />
    </node>
  </root>
  <root id="1165339175678">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1165339639991">
      <property name="name" nameId="tpck.1169194664001" value="matchingText" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1175117579502">
      <property name="name" nameId="tpck.1169194664001" value="descriptionText" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165339175680">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="createFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1165339307433" resolveInfo="CellMenuPart_ReplaceChild_Item_Create" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1199895109786">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1165339175681">
      <property name="value" nameId="tpce.1105725733873" value="replace child (custom action)" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1165339307433">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165339307434">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613822479" resolveInfo="CellMenuPart_Abstract_editedNode" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165339437299">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1162497113192" resolveInfo="CellMenuPart_ReplaceChild_currentChild" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165339437300">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1162498275506" resolveInfo="CellMenuPart_ReplaceChild_defaultConceptOfChild" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165339307435">
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622665029" resolveInfo="ConceptFunctionParameter_model" />
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165339307436">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165339307437">
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622753914" resolveInfo="ConceptFunctionParameter_operationContext" />
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
    </node>
  </root>
  <root id="1165420413719">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165420413720">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="parametersFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1163613035599" resolveInfo="CellMenuPart_AbstractGroup_Query" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165420413721">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="handlerFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1165420626554" resolveInfo="CellMenuPart_Generic_Group_Handler" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1165420413722">
      <property name="value" nameId="tpce.1105725733873" value="generic group" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1165420626554">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165420626557">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613549566" resolveInfo="CellMenuPart_AbstractGroup_parameterObject" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165420626558">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613822479" resolveInfo="CellMenuPart_Abstract_editedNode" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165420626559">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622665029" resolveInfo="ConceptFunctionParameter_model" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165420626560">
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165420626561">
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622753914" resolveInfo="ConceptFunctionParameter_operationContext" />
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="2265407187494681810">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1165420626562">
      <property name="value" nameId="tpce.1105725733873" value="generic handler" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1165424453110">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1165424453111">
      <property name="name" nameId="tpck.1169194664001" value="matchingText" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165424453112">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="handlerFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1165424657443" resolveInfo="CellMenuPart_Generic_Item_Handler" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1165424453113">
      <property name="value" nameId="tpce.1105725733873" value="generic item" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1165424657443">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165424657444">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613822479" resolveInfo="CellMenuPart_Abstract_editedNode" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165424657447">
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622665029" resolveInfo="ConceptFunctionParameter_model" />
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165424657448">
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1165424657449">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622753914" resolveInfo="ConceptFunctionParameter_operationContext" />
    </node>
  </root>
  <root id="1166040637528">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1166040865497">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="applicableFeature" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1166041033436" resolveInfo="CellMenuComponentFeature" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1166041505377">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="menuDescriptor" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1164824717996" resolveInfo="CellMenuDescriptor" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1166047295586">
      <property name="value" nameId="tpce.1105725733873" value="Cell Menu Component" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1210369041997">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5270353093116097656">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpce.2621449412040133764" resolveInfo="IConceptAspect" />
    </node>
  </root>
  <root id="1166041033436">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1166054297096">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="relationDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1166041079437">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="1166041748520">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1166041884271">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="propertyDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288299" resolveInfo="PropertyDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="1166054297096" />
    </node>
  </root>
  <root id="1166042131867">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1166042131869">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="linkDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="1166054297096" />
    </node>
  </root>
  <root id="1166049232041">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1166049251808">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1166049300910">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="conceptDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
  </root>
  <root id="1166059625718">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1166059677893">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="cellMenuComponent" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1166040637528" resolveInfo="CellMenuComponent" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1166059625736">
      <property name="value" nameId="tpce.1105725733873" value="menu component" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1174088067129">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1199895105514">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1174088067130">
      <property name="value" nameId="tpce.1105725733873" value="primary replace child menu" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1176474535556">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176474588488">
      <property name="value" nameId="tpce.1105725733873" value="component" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176474596599">
      <property name="value" nameId="tpce.1105725733873" value="embedded block of code" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1176474617542">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1176474640436">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dbrf.~JComponent" resolveInfo="JComponent" />
      </node>
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176474644923">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176474658345">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1142886811589" resolveInfo="ConceptFunctionParameter_node" />
    </node>
  </root>
  <root id="1176717779940">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1176717792086">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545963098" resolveInfo="conceptFunctionParameterType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StringType" typeId="tpee.1225271177708" id="1225191485527" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176717779941">
      <property name="value" nameId="tpce.1105725733873" value="text" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176717779942">
      <property name="value" nameId="tpce.1105725733873" value="function parameter" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1176717779943">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1176717841777">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176717841778">
      <property name="value" nameId="tpce.1105725733873" value="condition" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176717841779">
      <property name="value" nameId="tpce.1105725733873" value="embedded block of code" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1176717841780">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StringType" typeId="tpee.1225271177708" id="1225191497093" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176717841782">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176717841783">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1142886811589" resolveInfo="ConceptFunctionParameter_node" />
    </node>
  </root>
  <root id="1176717871254">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176717871255">
      <property name="value" nameId="tpce.1105725733873" value="condition" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176717871256">
      <property name="value" nameId="tpce.1105725733873" value="embedded block of code" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1176717871257">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.VoidType" typeId="tpee.1068581517677" id="1176717878779" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176717871259">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176717871260">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1142886811589" resolveInfo="ConceptFunctionParameter_node" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176725584265">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1176717779940" resolveInfo="ConceptFunctionParameter_text" />
    </node>
  </root>
  <root id="1176717888428">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176717888429">
      <property name="value" nameId="tpce.1105725733873" value="condition" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176717888430">
      <property name="value" nameId="tpce.1105725733873" value="embedded block of code" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1176717888431">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1176717902389" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176717888433">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176717888434">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1142886811589" resolveInfo="ConceptFunctionParameter_node" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176725860484">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1176717779940" resolveInfo="ConceptFunctionParameter_text" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176732129892">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1176731909317" resolveInfo="ConceptFunctionParameter_oldText" />
    </node>
  </root>
  <root id="1176717996748">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1176718001874">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="getter" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176717841777" resolveInfo="QueryFunction_ModelAccess_Getter" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1176718007938">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="setter" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176717871254" resolveInfo="QueryFunction_ModelAccess_Setter" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1176718014393">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="validator" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176717888428" resolveInfo="QueryFunction_ModelAccess_Validator" />
    </node>
  </root>
  <root id="1176731909317">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1176731909318">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545963098" resolveInfo="conceptFunctionParameterType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StringType" typeId="tpee.1225271177708" id="1225191495552" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176731909320">
      <property name="value" nameId="tpce.1105725733873" value="oldText" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176731909321">
      <property name="value" nameId="tpce.1105725733873" value="function parameter" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1176731909322">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1176749715029">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176749779885">
      <property name="value" nameId="tpce.1105725733873" value="cell provider" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176749779886">
      <property name="value" nameId="tpce.1105725733873" value="embedded block of code" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1176749854668">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1176794890268">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="qxeo.~AbstractCellProvider" resolveInfo="AbstractCellProvider" />
      </node>
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176749862944">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1142886811589" resolveInfo="ConceptFunctionParameter_node" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176749872102">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
  </root>
  <root id="1176809959526">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176809959527">
      <property name="value" nameId="tpce.1105725733873" value="color function" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1176809959529">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1176810139102">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="1t7x.~Color" resolveInfo="Color" />
      </node>
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1225456207992">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1225456097782" resolveInfo="IQueryFunction_Color" />
    </node>
  </root>
  <root id="1176897764478">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176897764479">
      <property name="value" nameId="tpce.1105725733873" value="node factory" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176897764480">
      <property name="value" nameId="tpce.1105725733873" value="embedded block of code" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1176897764481">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1176897813346" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176897764483">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176897764484">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1142886811589" resolveInfo="ConceptFunctionParameter_node" />
    </node>
  </root>
  <root id="1176899348742">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176899348743">
      <property name="value" nameId="tpce.1105725733873" value="string" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1176899348744">
      <property name="value" nameId="tpce.1105725733873" value="embedded block of code" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1176899348745">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StringType" typeId="tpee.1225271177708" id="1225191486628" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176899348747">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1142886811589" resolveInfo="ConceptFunctionParameter_node" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1176899348748">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
  </root>
  <root id="1180615838666">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1180615838667">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="postfixesFunction" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1180616057533" resolveInfo="CellMenuPart_PropertyPostfixHints_GetPostfixes" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180615838668">
      <property name="value" nameId="tpce.1105725733873" value="property postfix hints" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1205367019469">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1180616057533">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1180616057534">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp2q.ListType" typeId="tp2q.1151688443754" id="1180616057535">
        <node role="elementType" roleId="tp2q.1151688676805" type="tpee.StringType" typeId="tpee.1225271177708" id="1225191498477" />
      </node>
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1180616057537">
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1180616057538">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622753914" resolveInfo="ConceptFunctionParameter_operationContext" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1180616057539">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1163613822479" resolveInfo="CellMenuPart_Abstract_editedNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1180616057540">
      <property name="value" nameId="tpce.1105725733873" value="postfixes" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1182191800432">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1182191800433">
      <property name="value" nameId="tpce.1105725733873" value="node list provider" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1182191800434">
      <property name="value" nameId="tpce.1105725733873" value="embedded block of code" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1182191800435">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1182234187657" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1182191800437">
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1182191800438">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1182233249301" resolveInfo="ConceptFunctionParameter_childNode" />
    </node>
  </root>
  <root id="1182233249301">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1182233331889">
      <property name="value" nameId="tpce.1105725733873" value="childNode" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1182233336391">
      <property name="value" nameId="tpce.1105725733873" value="function parameter" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1182233342737">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1184319644772">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1184319817911">
      <property name="value" nameId="tpce.1105725733873" value="{+&lt;{propertyDeclaration}&gt;+}" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1184319817912">
      <property name="value" nameId="tpce.1105725733873" value="not empty property" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="5137527105084538846">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1186402211651">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1186402402630">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="styleClass" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1186402373407" resolveInfo="StyleSheetClass" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1186402303894">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1194566715035">
      <property name="value" nameId="tpce.1105725733873" value="Stylesheet" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1186402373407">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1198252369256">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="extendedClass" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1198252130653" resolveInfo="StyleSheetClassReference" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1186402391299">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1215087816795">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpee.1212170275853" resolveInfo="IValidIdentifier" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1219418689782">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1219418625346" resolveInfo="IStyleContainer" />
    </node>
  </root>
  <root id="1186402475462">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1186402481854">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="conceptLinkDeclaration" roleId="tpce.1137532086877" type="tpce.AggregationConceptLinkDeclaration" typeId="tpce.1105741535888" id="1215701938122">
      <property name="name" nameId="tpck.1169194664001" value="attributeConstant" />
      <link role="targetType" roleId="tpce.1105736621938" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="1186403694788">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1186403803051">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="query" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1225456097782" resolveInfo="IQueryFunction_Color" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1186403713874">
      <property name="name" nameId="tpck.1169194664001" value="color" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1083952545109" resolveInfo="_Colors_Enum" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1186403787518">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="1186403751766">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1220975211821">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="query" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1220974635399" resolveInfo="QueryFunction_FontStyle" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1186403918499">
      <property name="value" nameId="tpce.1105725733873" value="font-style" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1186403771423">
      <property name="name" nameId="tpck.1169194664001" value="style" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1101211480448" resolveInfo="_FontStyle_Enum" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1221051468077">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1221051476610">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dFONT_STYLE" resolveInfo="FONT_STYLE" />
      </node>
    </node>
  </root>
  <root id="1186404549998">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1215703469851">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1215703469852">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dTEXT_COLOR" resolveInfo="TEXT_COLOR" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1186404568646">
      <property name="value" nameId="tpce.1105725733873" value="text-foreground-color" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1186404574412">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1186404589776">
      <property name="value" nameId="tpce.1105725733873" value="background-color" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1215703443814">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1215703448660">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dBACKGROUND_COLOR" resolveInfo="BACKGROUND_COLOR" />
      </node>
    </node>
  </root>
  <root id="1186413799158">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1215703461771">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1215703461772">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dBRACKETS_COLOR" resolveInfo="BRACKETS_COLOR" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1186413814629">
      <property name="value" nameId="tpce.1105725733873" value="bracket-color" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1186414536763">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1223387335081">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="query" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1223387125302" resolveInfo="QueryFunction_Boolean" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1186414551515">
      <property name="name" nameId="tpck.1169194664001" value="flag" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1186414559000">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="1186414928363">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1215702083875">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1215702083876">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dSELECTABLE" resolveInfo="SELECTABLE" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1186414942927">
      <property name="value" nameId="tpce.1105725733873" value="selectable" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1186414949600">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1215702053365">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1215702053366">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dAUTO_DELETABLE" resolveInfo="AUTO_DELETABLE" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1186414964929">
      <property name="value" nameId="tpce.1105725733873" value="auto-deletable" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1186414976055">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1186414988603">
      <property name="value" nameId="tpce.1105725733873" value="draw-border" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1215702014501">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1215702044051">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dDRAW_BORDER" resolveInfo="DRAW_BORDER" />
      </node>
    </node>
  </root>
  <root id="1186414999511">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1214316229833">
      <property name="name" nameId="tpck.1169194664001" value="underlined" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1130847686886" resolveInfo="UnderlineStyle" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1186415029919">
      <property name="value" nameId="tpce.1105725733873" value="underlined" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1221219051630">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="query" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1221062700015" resolveInfo="QueryFunction_Underlined" />
    </node>
  </root>
  <root id="1186415722038">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1221064706952">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="query" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1221057094638" resolveInfo="QueryFunction_Integer" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1186415796023">
      <property name="value" nameId="tpce.1105725733873" value="font-size" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1221209241505">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657062" resolveInfo="integer" />
    </node>
  </root>
  <root id="1186414860679">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1215702059789">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1215702059790">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dEDITABLE" resolveInfo="EDITABLE" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1186414958479">
      <property name="value" nameId="tpce.1105725733873" value="editable" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1187258617779">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1215703479915">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1215703479916">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dNULL_TEXT_COLOR" resolveInfo="NULL_TEXT_COLOR" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1187258725566">
      <property name="value" nameId="tpce.1105725733873" value="text-foreground-null-color" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1197893505573">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1197893505574">
      <property name="internalValue" nameId="tpce.1083923523171" value="NONE" />
      <property name="externalValue" nameId="tpce.1083923523172" value="none" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1197893580900">
      <property name="internalValue" nameId="tpce.1083923523171" value="FIRST" />
      <property name="externalValue" nameId="tpce.1083923523172" value="first" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1197893584870">
      <property name="internalValue" nameId="tpce.1083923523171" value="LAST" />
      <property name="externalValue" nameId="tpce.1083923523172" value="last" />
    </node>
  </root>
  <root id="1198252130653">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1198252276894">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="styleSheetClass" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1186402373407" resolveInfo="StyleSheetClass" />
    </node>
  </root>
  <root id="1198256887712">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1198256955554">
      <property name="value" nameId="tpce.1105725733873" value="---&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1198509278511">
      <property name="value" nameId="tpce.1105725733873" value="indent" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1198257632966">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1198504797640">
      <property name="name" nameId="tpck.1169194664001" value="openBrace" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1198257692449">
      <property name="value" nameId="tpce.1105725733873" value="block start" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1198257747917">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1198257819370">
      <property name="value" nameId="tpce.1105725733873" value="block end" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1198506631483">
      <property name="name" nameId="tpck.1169194664001" value="closeBrace" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="1198489924438">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1198508727334">
      <property name="name" nameId="tpck.1169194664001" value="openBrace" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1198508733600">
      <property name="name" nameId="tpck.1169194664001" value="closeBrace" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1198490012674">
      <property name="value" nameId="tpce.1105725733873" value="block" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1198489985045">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="header" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1198489993734">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="body" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1073389214265" resolveInfo="EditorCellModel" />
    </node>
  </root>
  <root id="1201265905111">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1201266028598">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="editorContext" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1201266036224">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <property name="role" nameId="tpce.1071599776563" value="selectLaterParameter" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1201266127262" resolveInfo="SelectParameter" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1201269239863">
      <property name="value" nameId="tpce.1105725733873" value="select" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1201269290000">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tp25.1138763241883" resolveInfo="applicableToNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1201606885224">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tp25.1138763325919" resolveInfo="applicableToLink" />
    </node>
  </root>
  <root id="1201266127262">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1201266139935">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="1201268783309">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1201268911190">
      <property name="value" nameId="tpce.1105725733873" value="position=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1201268881975">
      <property name="name" nameId="tpck.1169194664001" value="position" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1201268793545" resolveInfo="SelectPosition" />
    </node>
  </root>
  <root id="1201268793545">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1201268793546">
      <property name="internalValue" nameId="tpce.1083923523171" value="before" />
      <property name="externalValue" nameId="tpce.1083923523172" value="before" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1201268803781">
      <property name="internalValue" nameId="tpce.1083923523171" value="after" />
      <property name="externalValue" nameId="tpce.1083923523172" value="after" />
    </node>
  </root>
  <root id="1201270864927">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1201270907764">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="position" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1201270898074">
      <property name="value" nameId="tpce.1105725733873" value="caret position=" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1214317859050">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1214317859051">
      <property name="name" nameId="tpck.1169194664001" value="layoutConstraint" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1138197387103" resolveInfo="_Layout_Constraints_Enum" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1214317859052">
      <property name="value" nameId="tpce.1105725733873" value="layout constraint" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1214320119173">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3608226089191997414">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="tags" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3608226089191997415" resolveInfo="RightTransformAnchorTagWrapper" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1214320119174">
      <property name="name" nameId="tpck.1169194664001" value="tag" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1140813780565" resolveInfo="RightTransformAnchorTag" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1214320119175">
      <property name="value" nameId="tpce.1105725733873" value="side-transform-anchor-tag" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1214406454886">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1215703515607">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1215703515608">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dTEXT_BACKGROUND_COLOR" resolveInfo="TEXT_BACKGROUND_COLOR" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1214406454887">
      <property name="value" nameId="tpce.1105725733873" value="text-background-color" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1214406466686">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1215703491746">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1215703491747">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dSELECTED_TEXT_BACKGROUND_COLOR" resolveInfo="SELECTED_TEXT_BACKGROUND_COLOR" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1214406466687">
      <property name="value" nameId="tpce.1105725733873" value="text-background-color-selected" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1214472762472">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1214472762473">
      <property name="name" nameId="tpck.1169194664001" value="position" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1197893505573" resolveInfo="_CaretPosition_Enum" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1214472762474">
      <property name="value" nameId="tpce.1105725733873" value="default-caret-position" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1215007762405">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1215007802031">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1239805001815" resolveInfo="_FloatOrInteger_String" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1215007873046">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="1215007883204">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1215007893986">
      <property name="value" nameId="tpce.1105725733873" value="padding-left" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1226491327426">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1226491332601">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dPADDING_LEFT" resolveInfo="PADDING_LEFT" />
      </node>
    </node>
  </root>
  <root id="1215007897487">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1215007897488">
      <property name="value" nameId="tpce.1105725733873" value="padding-right" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1226491349683">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1226491353889">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dPADDING_RIGHT" resolveInfo="PADDING_RIGHT" />
      </node>
    </node>
  </root>
  <root id="1215085112640">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1215702064900">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1215702064901">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dFIRST_POSITION_ALLOWED" resolveInfo="FIRST_POSITION_ALLOWED" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1215085187379">
      <property name="value" nameId="tpce.1105725733873" value="first-position-allowed" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1215085197271">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1215702077186">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1215702077187">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dLAST_POSITION_ALLOWED" resolveInfo="LAST_POSITION_ALLOWED" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1215085197272">
      <property name="value" nameId="tpce.1105725733873" value="last-position-allowed" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1216308376568">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1216308507057">
      <property name="externalValue" nameId="tpce.1083923523172" value="right" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1216308502931">
      <property name="externalValue" nameId="tpce.1083923523172" value="next-line" />
      <property name="internalValue" nameId="tpce.1083923523171" value="next-line" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1216308376569">
      <property name="externalValue" nameId="tpce.1083923523172" value="indented" />
      <property name="internalValue" nameId="tpce.1083923523171" value="indented" />
    </node>
  </root>
  <root id="1216308599511">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1216308761668">
      <property name="name" nameId="tpck.1169194664001" value="position" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1216308376568" resolveInfo="_NextLine_Enum" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1216308818747">
      <property name="value" nameId="tpce.1105725733873" value="position" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1216380990741">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1232439938817">
      <property name="name" nameId="tpck.1169194664001" value="runInCommand" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="8251517099537646385">
      <property name="name" nameId="tpck.1169194664001" value="allowEmptyText" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1216385453572">
      <property name="value" nameId="tpce.1105725733873" value="{T &lt;{property}&gt; T}" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="5137527105084538852">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1216381211800">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="handlerBlock" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1216381054717" resolveInfo="TransactionalPropertyHandler" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1216381219207">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="property" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288299" resolveInfo="PropertyDeclaration" />
    </node>
  </root>
  <root id="1216381054717">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1216381097005">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1216381148013" resolveInfo="TransactionPropertyHandler_newValue" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1216381170362">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1216381117100" resolveInfo="TransactionPropertyHandler_oldValue" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1216384575593">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1216384575594">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1142886811589" resolveInfo="ConceptFunctionParameter_node" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1216381091954">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.VoidType" typeId="tpee.1068581517677" id="1216381093987" />
    </node>
  </root>
  <root id="1216381117100">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1216381136570">
      <property name="value" nameId="tpce.1105725733873" value="oldValue" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1216381148013">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1216381148014">
      <property name="value" nameId="tpce.1105725733873" value="newValue" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1216383773966">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1216560327200">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1216560518566">
      <property name="name" nameId="tpck.1169194664001" value="position" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1216308376568" resolveInfo="_NextLine_Enum" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1216560546489">
      <property name="value" nameId="tpce.1105725733873" value="position-children" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1216672142186">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1235227729696">
      <property name="value" nameId="tpce.1105725733873" value="indent_old" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1219226236603">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1219226236604">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1219226236605">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dDRAW_BRACKETS" resolveInfo="DRAW_BRACKETS" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1219226236606">
      <property name="value" nameId="tpce.1105725733873" value="draw-brackets" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1219418625346">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1219418656006">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="styleItem" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1186402475462" resolveInfo="StyleClassItem" />
    </node>
  </root>
  <root id="1220974635399">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1220974841934">
      <property name="value" nameId="tpce.1105725733873" value="font style function" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1220974915063">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1221052118278" />
    </node>
  </root>
  <root id="1221057094638">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1221057195672">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1221057195673" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1221057173654">
      <property name="value" nameId="tpce.1105725733873" value="int function" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1221059528506">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1221211298019">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1221059797722">
      <property name="value" nameId="tpce.1105725733873" value="embedded block of code" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1221059701511">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1142886811589" resolveInfo="ConceptFunctionParameter_node" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1221059701512">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1221060393848">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1221060400056">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
      </node>
    </node>
  </root>
  <root id="1221062700015">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1221062795610">
      <property name="value" nameId="tpce.1105725733873" value="underlined function" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1221062811502">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1221062816176" />
    </node>
  </root>
  <root id="1223386653097">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1223386894103">
      <property name="value" nameId="tpce.1105725733873" value="strike-out" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1223388842734">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1223388868719">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dSTRIKE_OUT" resolveInfo="STRIKE_OUT" />
      </node>
    </node>
  </root>
  <root id="1223387125302">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1223387147820">
      <property name="value" nameId="tpce.1105725733873" value="boolean function" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1223387210120">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1223387224419" />
    </node>
  </root>
  <root id="1225456097782" />
  <root id="1225456267680">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1225456281899">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1225456097782" resolveInfo="IQueryFunction_Color" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1225456328150">
      <property name="value" nameId="tpce.1105725733873" value="#" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1225456336245">
      <property name="value" nameId="tpce.1105725733873" value="#RRGGBB" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1225456424731">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="1225898583838">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1225898971709">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="getter" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1176717841777" resolveInfo="QueryFunction_ModelAccess_Getter" />
    </node>
  </root>
  <root id="1225900081164">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1225903603081">
      <property name="value" nameId="tpce.1105725733873" value="read only model access" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1225903603082">
      <property name="value" nameId="tpce.1105725733873" value="reference to read only accessor" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1225900141900">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="modelAccessor" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1225898583838" resolveInfo="ReadOnlyModelAccessor" />
    </node>
  </root>
  <root id="1226339751946">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1226339797666">
      <property name="value" nameId="tpce.1105725733873" value="padding-top" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1226491363829">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1226491369520">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dPADDING_TOP" resolveInfo="PADDING_TOP" />
      </node>
    </node>
  </root>
  <root id="1226339813308">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1226339845434">
      <property name="value" nameId="tpce.1105725733873" value="padding-bottom" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1226491309950">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1226491315063">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dPADDING_BOTTOM" resolveInfo="PADDING_BOTTOM" />
      </node>
    </node>
  </root>
  <root id="1226339938453">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1226503604644">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1226504838901">
      <property name="name" nameId="tpck.1169194664001" value="measure" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1226504633752" resolveInfo="_Enum_Measure" />
    </node>
  </root>
  <root id="1226504633752">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1226504633753">
      <property name="externalValue" nameId="tpce.1083923523172" value="pixels" />
      <property name="internalValue" nameId="tpce.1083923523171" value="PIXELS" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1226504706052">
      <property name="externalValue" nameId="tpce.1083923523172" value="spaces" />
      <property name="internalValue" nameId="tpce.1083923523171" value="SPACES" />
    </node>
  </root>
  <root id="1227861515039">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1227861587090">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="link" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1227874655665">
      <property name="value" nameId="tpce.1105725733873" value="navigatable-reference" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1233148810477">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1233148881323">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="parentClass" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1186402373407" resolveInfo="StyleSheetClass" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1233148918310">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1219418625346" resolveInfo="IStyleContainer" />
    </node>
  </root>
  <root id="1233758997495">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1233759068045">
      <property name="value" nameId="tpce.1105725733873" value="punctuation-left" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1233759108034">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1233759122712">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dPUNCTUATION_LEFT" resolveInfo="PUNCTUATION_LEFT" />
      </node>
    </node>
  </root>
  <root id="1233759184865">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1233759225808">
      <property name="value" nameId="tpce.1105725733873" value="punctuation-right" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1233759264978">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1233759270401">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dPUNCTUATION_RIGHT" resolveInfo="PUNCTUATION_RIGHT" />
      </node>
    </node>
  </root>
  <root id="1233823429331">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1233823521393">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1233823532331">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dHORIZONTAL_GAP" resolveInfo="HORIZONTAL_GAP" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1233825610829">
      <property name="value" nameId="tpce.1105725733873" value="horizontal-gap" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1235728439575">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1235728439576">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1235728439577">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dBASE_LINE_CELL" resolveInfo="BASE_LINE_CELL" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1235728439578">
      <property name="value" nameId="tpce.1105725733873" value="base-line-cell" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1235999440492">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1235999512654">
      <property name="value" nameId="tpce.1105725733873" value="horizontal-align" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1235999557292">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1235999566301">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dHORIZONTAL_ALIGN" resolveInfo="HORIZONTAL_ALIGN" />
      </node>
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1235999920262">
      <property name="name" nameId="tpck.1169194664001" value="align" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1235999709834" resolveInfo="AlignEnum" />
    </node>
  </root>
  <root id="1235999709834">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1235999709835">
      <property name="externalValue" nameId="tpce.1083923523172" value="left" />
      <property name="internalValue" nameId="tpce.1083923523171" value="LEFT" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1235999738057">
      <property name="externalValue" nameId="tpce.1083923523172" value="right" />
      <property name="internalValue" nameId="tpce.1083923523171" value="RIGHT" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1235999744266">
      <property name="externalValue" nameId="tpce.1083923523172" value="center" />
      <property name="internalValue" nameId="tpce.1083923523171" value="CENTER" />
    </node>
  </root>
  <root id="1236262245656">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1238091709220">
      <property name="name" nameId="tpck.1169194664001" value="labelName" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="5915179142332960580">
      <property name="name" nameId="tpck.1169194664001" value="hasNoLabel" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1236443321503">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="query" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1236443640684" resolveInfo="QueryFunction_String" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1236263409818">
      <property name="value" nameId="tpce.1105725733873" value="matching-label" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1236266496796">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1236266567702">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dMATCHING_LABEL" resolveInfo="MATCHING_LABEL" />
      </node>
    </node>
  </root>
  <root id="1236263696991">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1236263780519">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1236263806677" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1236263761754">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1142886811589" resolveInfo="ConceptFunctionParameter_node" />
    </node>
  </root>
  <root id="1236443640684">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1236443640685">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StringType" typeId="tpee.1225271177708" id="1236443698038" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="1236443640687">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1142886811589" resolveInfo="ConceptFunctionParameter_node" />
    </node>
  </root>
  <root id="1237303669825">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1237303669826">
      <property name="value" nameId="tpce.1105725733873" value="indent" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1237307900041">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1237308006695">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1237308006696">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dINDENT_LAYOUT_INDENT" resolveInfo="INDENT_LAYOUT_INDENT" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1237307999225">
      <property name="value" nameId="tpce.1105725733873" value="indent-layout-indent" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1237308012275">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1237308012276">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1237308012277">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dINDENT_LAYOUT_NEW_LINE" resolveInfo="INDENT_LAYOUT_NEW_LINE" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1237308012278">
      <property name="value" nameId="tpce.1105725733873" value="indent-layout-new-line" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1237375020029">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1237374854247">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1237374854248">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dINDENT_LAYOUT_CHILDREN_NEWLINE" resolveInfo="INDENT_LAYOUT_CHILDREN_NEWLINE" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1237375109781">
      <property name="value" nameId="tpce.1105725733873" value="indent-layout-new-line-children" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1237385578942">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1237385578943">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1237385578944">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dINDENT_LAYOUT_ON_NEW_LINE" resolveInfo="INDENT_LAYOUT_ON_NEW_LINE" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1237385578945">
      <property name="value" nameId="tpce.1105725733873" value="indent-layout-on-new-line" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1239805001815" />
  <root id="1239814640496">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1239814668280">
      <property name="value" nameId="tpce.1105725733873" value="vertical grid" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1240253180846">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1240253297498">
      <property name="value" nameId="tpce.1105725733873" value="indent-layout-no-wrap" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1240251450434">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1240251450435">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dINDENT_LAYOUT_NO_WRAP" resolveInfo="INDENT_LAYOUT_NO_WRAP" />
      </node>
    </node>
  </root>
  <root id="625126330682908270">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="625126330682991093">
      <property name="value" nameId="tpce.1105725733873" value="ref. presentation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7667276221847570194">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8863456892852949148">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="parametersInformation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7667276221847612622" resolveInfo="ParametersInformationQuery" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7667276221847632140">
      <property name="value" nameId="tpce.1105725733873" value="parameters-information" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7667276221847612622">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4203201205843994215">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="applicableConcept" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8178273524755058633">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="type" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7667276221847612623">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="methods" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7667276221847612943" resolveInfo="QueryFunction_ParametersList" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="671290755174161557">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="presentation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="671290755174094686" resolveInfo="QueryFunction_MethodPresentation" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6419604448124516218">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="isMethodCurrent" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6419604448124516209" resolveInfo="QueryFunction_IsMethodCurrent" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1336839120510622371">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="methodDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tp4f.1205769003971" resolveInfo="DefaultClassifierMethodDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4755152624708547702">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1336839120510359488">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tp4f.1205751982837" resolveInfo="IClassifier" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="631314534572343042">
      <property name="value" nameId="tpce.1105725733873" value="Parameters Information Query" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7667276221847612943">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="671290755173763930">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="4203201205844553978" resolveInfo="ConceptFunctionParameter_selectedNode" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="671290755173777668">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
  </root>
  <root id="671290755174094686">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="671290755174094687">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="4203201205844553978" resolveInfo="ConceptFunctionParameter_selectedNode" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="671290755174094688">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="671290755174094690">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="671290755174094691" resolveInfo="ConceptFunctionParameter_parameterObject" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="4526149749187797166">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="4526149749187797167" resolveInfo="ConceptFunctionParameter_StyledText" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="671290755174161554">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.VoidType" typeId="tpee.1068581517677" id="4526149749187797164" />
    </node>
  </root>
  <root id="671290755174094691">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="671290755174094694">
      <property name="value" nameId="tpce.1105725733873" value="parameterObject" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="671290755174094695">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="7806530711847278494">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpee.1199886518837" resolveInfo="dontUseParameterObject" />
    </node>
  </root>
  <root id="6419604448124516209">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="6419604448124516210">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="4203201205844553978" resolveInfo="ConceptFunctionParameter_selectedNode" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="6419604448124516211">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1161622981231" resolveInfo="ConceptFunctionParameter_editorContext" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="6419604448124516212">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="671290755174094691" resolveInfo="ConceptFunctionParameter_parameterObject" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="6419604448124516213">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6419604448124773698" />
    </node>
  </root>
  <root id="4526149749187797167">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4526149749187797170">
      <property name="value" nameId="tpce.1105725733873" value="styledText" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="4526149749187797171">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="4526149749187937572">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545963098" resolveInfo="conceptFunctionParameterType" />
      <node role="target" roleId="tpce.1105736901241" type="tpc2.StyledTextType" typeId="3903367331818357915" id="1511134095826078599" />
    </node>
  </root>
  <root id="280151408461567367">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="280151408461603512">
      <property name="value" nameId="tpce.1105725733873" value="append" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4531786690998911346">
      <property name="value" nameId="tpce.1105725733873" value="append" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="4531786690998812995" resolveInfo="methodToGenerate" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="4531786690998911347">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="4531786690998812992" resolveInfo="operationArgumentType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StringType" typeId="tpee.1225271177708" id="4531786690998911349" />
    </node>
  </root>
  <root id="280151408461909164">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="280151408461967237">
      <property name="value" nameId="tpce.1105725733873" value="setBold" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="226730285128288237">
      <property name="value" nameId="tpce.1105725733873" value="setBold" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="4531786690998812995" resolveInfo="methodToGenerate" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="7686902624460872740">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="4531786690998812992" resolveInfo="operationArgumentType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7686902624460905120" />
    </node>
  </root>
  <root id="4531786690998636238">
    <node role="conceptLinkDeclaration" roleId="tpce.1137532086877" type="tpce.AggregationConceptLinkDeclaration" typeId="tpce.1105741535888" id="4531786690998812992">
      <property name="name" nameId="tpck.1169194664001" value="operationArgumentType" />
      <link role="targetType" roleId="tpce.1105736621938" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4531786690998636239">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpee.1197027803184" resolveInfo="IOperation" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4531786690998636240">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <property name="role" nameId="tpce.1071599776563" value="actualArgument" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="4531786690998812995">
      <property name="name" nameId="tpck.1169194664001" value="methodToGenerate" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="2835407828667813404">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="226730285126749472">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="3903367331818357915">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="6552123473823027984">
      <property name="value" nameId="tpce.1105725733873" value="styled text" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7620205565664569937">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="7620205565664606477">
      <property name="name" nameId="tpck.1169194664001" value="baseline" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="7620205565664606377" resolveInfo="DefaultBaseLineEnum" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="7620205565664606478">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1215701938122" resolveInfo="attributeConstant" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="4098449021143562584">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="ven7.~StyleAttributes" resolveInfo="StyleAttributes" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="ven7.~StyleAttributes%dDEFAULT_BASE_LINE" resolveInfo="DEFAULT_BASE_LINE" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7620205565664606480">
      <property name="value" nameId="tpce.1105725733873" value="default-baseline" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7620205565664606377">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="7620205565664606378">
      <property name="internalValue" nameId="tpce.1083923523171" value="FIRST" />
      <property name="externalValue" nameId="tpce.1083923523172" value="first cell baseline" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="7620205565664606380">
      <property name="internalValue" nameId="tpce.1083923523171" value="CENTER" />
      <property name="externalValue" nameId="tpce.1083923523172" value="collection center" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="7620205565664606448">
      <property name="internalValue" nameId="tpce.1083923523171" value="LAST" />
      <property name="externalValue" nameId="tpce.1083923523172" value="last cell baseline" />
    </node>
  </root>
  <root id="1886960078078641793">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1886960078078641794">
      <property name="value" nameId="tpce.1105725733873" value="superscript" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="8255250703325730686">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="8255250703325730687">
      <property name="internalValue" nameId="tpce.1083923523171" value="NORMAL" />
      <property name="externalValue" nameId="tpce.1083923523172" value="plain text" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="8255250703325731012">
      <property name="internalValue" nameId="tpce.1083923523171" value="SUPERSCRIPT" />
      <property name="externalValue" nameId="tpce.1083923523172" value="superscript" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="8255250703325731013">
      <property name="internalValue" nameId="tpce.1083923523171" value="SUBSCRIPT" />
      <property name="externalValue" nameId="tpce.1083923523172" value="subscript" />
    </node>
  </root>
  <root id="8255250703325731016">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8255250703325731017">
      <property name="value" nameId="tpce.1105725733873" value="script-kind" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="8255250703325731018">
      <property name="name" nameId="tpck.1169194664001" value="script" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="8255250703325730686" resolveInfo="ScriptSwitchEnum" />
    </node>
  </root>
  <root id="4203201205844553978">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4203201205844628834">
      <property name="value" nameId="tpce.1105725733873" value="node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4203201205844628835">
      <property name="value" nameId="tpce.1105725733873" value="selected node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="4203201205844628836">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="5949640294884234625">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5949640294884269781">
      <property name="value" nameId="tpce.1105725733873" value="table" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="6820251943131810951">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="6820251943131810953">
      <property name="internalValue" nameId="tpce.1083923523171" value="HORIZONTAL_COLLECTION" />
      <property name="externalValue" nameId="tpce.1083923523172" value="horizontal collection" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="6820251943131810954">
      <property name="internalValue" nameId="tpce.1083923523171" value="VERTICAL_COLLECTION" />
      <property name="externalValue" nameId="tpce.1083923523172" value="vertical collection" />
    </node>
  </root>
  <root id="6820251943131810950">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6820251943131810955">
      <property name="name" nameId="tpck.1169194664001" value="tableComponent" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="6820251943131810951" resolveInfo="TableComponentEnum" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1326688792171902653">
      <property name="value" nameId="tpce.1105725733873" value="table-component" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="8313721352726366579">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8313721352726450629">
      <property name="value" nameId="tpce.1105725733873" value="empty" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7597241200646296617">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7597241200646296626">
      <property name="value" nameId="tpce.1105725733873" value="navigatable-node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7597241200646296618">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="functionNode" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7597241200646296619" resolveInfo="QueryFunction_SNode" />
    </node>
  </root>
  <root id="7597241200646296619">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="7597241200646296622">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="tp25.1138055754698" id="7597241200646296624" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7597241200646296621">
      <property name="value" nameId="tpce.1105725733873" value="snode function" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="3696012239575138270">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3696012239575138271">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="propertyDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="1140103550593" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1071489288299" resolveInfo="PropertyDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3696012239575138272">
      <property name="value" nameId="tpce.1105725733873" value="URL" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3696012239575138273">
      <property name="value" nameId="tpce.1105725733873" value="URL property" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="3608226089191997415">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="3608226089191997418">
      <property name="name" nameId="tpck.1169194664001" value="tag" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1140813780565" resolveInfo="RightTransformAnchorTag" />
    </node>
  </root>
  <root id="709996738298806197">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="709996738298806202">
      <property name="value" nameId="tpce.1105725733873" value="separator text" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="709996738298806204">
      <property name="value" nameId="tpce.1105725733873" value="embedded block of code" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="709996738298806205">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545148427" resolveInfo="conceptFunctionReturnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StringType" typeId="tpee.1225271177708" id="709996738298806207" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="709996738298806218">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpcw.1161622878565" resolveInfo="ConceptFunctionParameter_scope" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="709996738298806220">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1142886811589" resolveInfo="ConceptFunctionParameter_node" />
    </node>
  </root>
</model>

