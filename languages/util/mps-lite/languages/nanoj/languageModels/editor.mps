<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c895905dd(jetbrains.mps.nanoj.editor)">
  <persistence version="7" />
  <language namespace="18bc6592-03a6-4e29-a83a-7ff23bde13ba(jetbrains.mps.lang.editor)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpkz" modelUID="r:00000000-0000-4000-0000-011c895905df(jetbrains.mps.nanoj.structure)" version="-1" />
  <import index="tpc2" modelUID="r:00000000-0000-4000-0000-011c8959029e(jetbrains.mps.lang.editor.structure)" version="32" implicit="yes" />
  <roots>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="689680155165915350">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="tpkz.689680155165915335" resolveInfo="MinusExpression" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="689680155165915355">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="tpkz.689680155165915337" resolveInfo="NanoClass" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="689680155165915369">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="tpkz.689680155165915339" resolveInfo="VarDecl" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="689680155165915376">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="tpkz.689680155165915342" resolveInfo="NanoStatementList" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="689680155165915383">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="tpkz.689680155165915344" resolveInfo="NanoExpression" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="689680155165915385">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="tpkz.689680155165915346" resolveInfo="NanoStatement" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="689680155165915387">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="tpkz.689680155165915348" resolveInfo="VarDeclReference" />
    </node>
  </roots>
  <root id="689680155165915350">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="689680155165915351">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="689680155165915352" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="689680155165915353">
        <property name="text" nameId="tpc2.1073389577007" value="-" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="689680155165915354">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpkz.689680155165915336" />
      </node>
    </node>
  </root>
  <root id="689680155165915355">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="689680155165915356">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Vertical" typeId="tpc2.1106270571710" id="689680155165915357" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="689680155165915358">
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="689680155165915359" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="689680155165915360">
          <property name="text" nameId="tpc2.1073389577007" value="class" />
        </node>
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="689680155165915361">
          <property name="text" nameId="tpc2.1073389577007" value="{" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="689680155165915362">
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="689680155165915363" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Indent" typeId="tpc2.1198256887712" id="689680155165915364" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="689680155165915365">
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpkz.689680155165915338" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="689680155165915366">
        <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="689680155165915367" />
        <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="689680155165915368">
          <property name="text" nameId="tpc2.1073389577007" value="}" />
        </node>
      </node>
    </node>
  </root>
  <root id="689680155165915369">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="689680155165915370">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="689680155165915371" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="689680155165915372">
        <property name="text" nameId="tpc2.1073389577007" value="var" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="689680155165915373">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpkz.689680155165915341" resolveInfo="varName" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="689680155165915374">
        <property name="text" nameId="tpc2.1073389577007" value=":" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="689680155165915375">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpkz.689680155165915340" />
      </node>
    </node>
  </root>
  <root id="689680155165915376">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="689680155165915377">
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Horizontal" typeId="tpc2.1106270549637" id="689680155165915378" />
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="689680155165915379">
        <property name="text" nameId="tpc2.1073389577007" value="{" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNodeList" typeId="tpc2.1073390211982" id="689680155165915380">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpkz.689680155165915343" />
        <node role="cellLayout" roleId="tpc2.1140524464360" type="tpc2.CellLayout_Vertical" typeId="tpc2.1106270571710" id="689680155165915381" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="689680155165915382">
        <property name="text" nameId="tpc2.1073389577007" value="}" />
      </node>
    </node>
  </root>
  <root id="689680155165915383">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Error" typeId="tpc2.1075375595203" id="689680155165915384">
      <property name="text" nameId="tpc2.1075375595204" value="&lt;abstract expression&gt;" />
    </node>
  </root>
  <root id="689680155165915385">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Error" typeId="tpc2.1075375595203" id="689680155165915386">
      <property name="text" nameId="tpc2.1075375595204" value="&lt;abstract statement&gt;" />
    </node>
  </root>
  <root id="689680155165915387">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_RefCell" typeId="tpc2.1088013125922" id="689680155165915388">
      <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpkz.689680155165915349" />
      <node role="editorComponent" roleId="tpc2.1088186146602" type="tpc2.InlineEditorComponent" typeId="tpc2.1088185857835" id="689680155165915389">
        <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Property" typeId="tpc2.1073389658414" id="689680155165915390">
          <property name="readOnly" nameId="tpc2.1140017977771" value="true" />
          <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="tpkz.689680155165915341" resolveInfo="varName" />
        </node>
      </node>
    </node>
  </root>
</model>

