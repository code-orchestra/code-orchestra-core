<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:def9da36-61ed-4f39-9c10-98a9883447d1(jetbrains.mps.baseLanguage.runConfigurations.editor)">
  <persistence version="7" />
  <language namespace="82c32a3b-4a54-4fc1-b551-7ff9f198d7c1(jetbrains.mps.baseLanguage.runConfigurations)" />
  <language namespace="18bc6592-03a6-4e29-a83a-7ff23bde13ba(jetbrains.mps.lang.editor)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="11eb" modelUID="r:550fbd90-c9f2-4576-a8a6-223eca16d68b(jetbrains.mps.baseLanguage.runConfigurations.structure)" version="0" />
  <import index="tp4v" modelUID="r:00000000-0000-4000-0000-011c89590363(jetbrains.mps.lang.plugin.editor)" version="-1" />
  <import index="tpc2" modelUID="r:00000000-0000-4000-0000-011c8959029e(jetbrains.mps.lang.editor.structure)" version="32" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="6629582826328966249">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="node" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="11eb.8456022385895583119" resolveInfo="JavaNodeRunConfiguration" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="3405970486215434351">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="java" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="11eb.655818460756091959" resolveInfo="JavaRunConfiguration" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="2178855608170754548">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="node" />
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="11eb.2178855608170754068" resolveInfo="JavaNodeConfigurationEditorDeclaration" />
    </node>
  </roots>
  <root id="6629582826328966249">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Block" typeId="tpc2.1198489924438" id="6629582826328966251">
      <node role="body" roleId="tpc2.1198489993734" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="6629582826328966252">
        <property name="vertical" nameId="tpc2.1073389446425" value="true" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="6629582826328966260">
          <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="tp4v.8456022385895659119" resolveInfo="RunConfigurationPresentation" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3592413331516836937">
          <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="3592413331516836938">
            <property name="flag" nameId="tpc2.1186414551515" value="false" />
          </node>
          <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3592413331516836941">
            <property name="text" nameId="tpc2.1073389577007" value="generate before run:" />
          </node>
          <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="3592413331516836943">
            <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="11eb.3592413331516836478" resolveInfo="generate" />
          </node>
          <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="3592413331516836940" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4462513030603986931" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4462513030603986933">
          <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Vertical" typeId="tpc2.1106270571710" id="4462513030603986934" />
          <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4462513030603986924">
            <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="4462513030603986925">
              <property name="text" nameId="tpc2.1073389577007" value="target concept:" />
            </node>
            <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4462513030603986926" />
            <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefCell" typeId="tpc2.1088013125922" id="4462513030603986927">
              <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="11eb.3607966867310500324" />
              <node role="editorComponent" roleId="tpc2.1088186146602" type="tpc2.InlineEditorComponent" typeId="tpc2.1088185857835" id="4462513030603986928">
                <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="4462513030603986929">
                  <property name="readOnly" nameId="tpc2.1140017977771" value="true" />
                  <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpck.1169194664001" resolveInfo="name" />
                </node>
              </node>
            </node>
          </node>
          <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="4462513030603986936">
            <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Indent" typeId="tpc2.1198256887712" id="4462513030603986941" />
            <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.SelectableStyleSheetItem" typeId="tpc2.1186414928363" id="4462513030603986937">
              <property name="flag" nameId="tpc2.1186414551515" value="false" />
            </node>
            <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="4462513030603986939" />
            <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="4462513030604064306">
              <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="11eb.4462513030604064304" />
            </node>
          </node>
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="6629582826328966261" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="6629582826328966262">
          <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="tp4v.8456022385895659191" resolveInfo="RunConfigurationBody" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="5156436276193323062">
          <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="tp4v.8255351389869730373" resolveInfo="RunConfigurationMethods" />
        </node>
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Vertical" typeId="tpc2.1106270571710" id="6629582826328966263" />
      </node>
      <node role="header" roleId="tpc2.1198489985045" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="6629582826328966264">
        <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="tp4v.8456022385895659107" resolveInfo="RunConfigurationHeader" />
      </node>
    </node>
  </root>
  <root id="3405970486215434351">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Block" typeId="tpc2.1198489924438" id="3405970486215434353">
      <node role="body" roleId="tpc2.1198489993734" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="3405970486215434354">
        <property name="vertical" nameId="tpc2.1073389446425" value="true" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="3405970486215434355">
          <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="tp4v.8456022385895659119" resolveInfo="RunConfigurationPresentation" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="3405970486215434367" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="3405970486215434368">
          <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="tp4v.8456022385895659191" resolveInfo="RunConfigurationBody" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="5156436276193306986">
          <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="tp4v.8255351389869730373" resolveInfo="RunConfigurationMethods" />
        </node>
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Vertical" typeId="tpc2.1106270571710" id="3405970486215434369" />
      </node>
      <node role="header" roleId="tpc2.1198489985045" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="3405970486215434370">
        <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="tp4v.8456022385895659107" resolveInfo="RunConfigurationHeader" />
      </node>
    </node>
  </root>
  <root id="2178855608170754548">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="2178855608170754550">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Component" typeId="tpc2.1078939183254" id="2178855608170754554">
        <link role="editorComponent" roleId="tpc2.1078939183255" targetNodeId="tp4v.2178855608170754530" resolveInfo="ConfigurationEditorDeclaration_BasicEditor" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="2178855608170754555">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="11eb.2178855608170754524" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Vertical" typeId="tpc2.1106270571710" id="2178855608170754552" />
    </node>
  </root>
</model>

