<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:f7558de1-c673-4688-b6e9-c5672dde2290(jetbrains.mps.samples.xmlLiterals.editor)">
  <persistence version="7" />
  <language namespace="18bc6592-03a6-4e29-a83a-7ff23bde13ba(jetbrains.mps.lang.editor)" />
  <import index="v5hn" modelUID="r:a9473eef-c3e7-4713-b3b3-57facda6958d(jetbrains.mps.samples.xmlLiterals.structure)" version="-1" />
  <import index="tpc2" modelUID="r:00000000-0000-4000-0000-011c8959029e(jetbrains.mps.lang.editor.structure)" version="32" implicit="yes" />
  <roots>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="9152904044274328780">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="v5hn.9152904044274328259" resolveInfo="XmlLiteral" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="9152904044274469603">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="v5hn.9152904044274469601" resolveInfo="TextMacro" />
    </node>
    <node type="tpc2.ConceptEditorDeclaration" typeId="tpc2.1071666914219" id="9152904044274518129">
      <link role="conceptDeclaration" roleId="tpc2.1166049300910" targetNodeId="v5hn.9152904044274518122" resolveInfo="ElementMacro" />
    </node>
  </roots>
  <root id="9152904044274328780">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="9152904044274328782">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="9152904044274328785">
        <property name="text" nameId="tpc2.1073389577007" value="&lt;xml" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="9152904044274328786">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="9152904044274328788">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="v5hn.9152904044274328260" />
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutIndentStyleClassItem" typeId="tpc2.1237307900041" id="9152904044274328789">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
        <node role="styleItem" roleId="tpc2.1219418656006" type="tpc2.IndentLayoutNewLineStyleClassItem" typeId="tpc2.1237308012275" id="9152904044274328790">
          <property name="flag" nameId="tpc2.1186414551515" value="true" />
        </node>
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="9152904044274328792">
        <property name="text" nameId="tpc2.1073389577007" value="&gt;" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="9152904044274328784" />
    </node>
  </root>
  <root id="9152904044274469603">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="9152904044274469605">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="9152904044274469608">
        <property name="text" nameId="tpc2.1073389577007" value="${" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="9152904044274469610">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="v5hn.9152904044274469602" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="9152904044274469612">
        <property name="text" nameId="tpc2.1073389577007" value="}" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="9152904044274469607" />
    </node>
  </root>
  <root id="9152904044274518129">
    <node role="cellModel" roleId="tpc2.1080736633877" type="tpc2.CellModel_Collection" typeId="tpc2.1073389446423" id="9152904044274518131">
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="9152904044274518134">
        <property name="text" nameId="tpc2.1073389577007" value="$${" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_RefNode" typeId="tpc2.1073389882823" id="9152904044274518136">
        <link role="relationDeclaration" roleId="tpc2.1140103550593" targetNodeId="v5hn.9152904044274518128" />
      </node>
      <node role="childCellModel" roleId="tpc2.1073389446424" type="tpc2.CellModel_Constant" typeId="tpc2.1073389577006" id="9152904044274518138">
        <property name="text" nameId="tpc2.1073389577007" value="}" />
      </node>
      <node role="cellLayout" roleId="tpc2.1106270802874" type="tpc2.CellLayout_Indent" typeId="tpc2.1237303669825" id="9152904044274518133" />
    </node>
  </root>
</model>

