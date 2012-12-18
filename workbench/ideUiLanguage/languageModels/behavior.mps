<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c895904ad(jetbrains.mps.ide.uiLanguage.behavior)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="af65afd8-f0dd-4942-87d9-63a55f2a9db1(jetbrains.mps.lang.behavior)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tprh" modelUID="r:00000000-0000-4000-0000-011c895904b1(jetbrains.mps.ide.uiLanguage.structure)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="1i04" modelUID="r:3270011d-8b2d-4938-8dff-d256a759e017(jetbrains.mps.lang.behavior.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="1i04.ConceptBehavior" typeId="1i04.1225194240794" id="1213877315073">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="IDEDialog" />
      <link role="concept" roleId="1i04.1225194240799" targetNodeId="tprh.1203607523033" resolveInfo="ReportErrorExpression" />
    </node>
    <node type="1i04.ConceptBehavior" typeId="1i04.1225194240794" id="1213877331196">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="IDEDialog" />
      <link role="concept" roleId="1i04.1225194240799" targetNodeId="tprh.1203610466731" resolveInfo="DialogExpression" />
    </node>
    <node type="1i04.ConceptBehavior" typeId="1i04.1225194240794" id="1213877369278">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="IDEDialog" />
      <link role="concept" roleId="1i04.1225194240799" targetNodeId="tprh.1203592595174" resolveInfo="IDEDialog" />
    </node>
    <node type="1i04.ConceptBehavior" typeId="1i04.1225194240794" id="1213877501207">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="IDEDialog" />
      <link role="concept" roleId="1i04.1225194240799" targetNodeId="tprh.1203606241544" resolveInfo="DisposeDialogExpression" />
    </node>
  </roots>
  <root id="1213877315073">
    <node role="constructor" roleId="1i04.1225194240801" type="1i04.ConceptConstructorDeclaration" typeId="1i04.1225194413805" id="1213877315074">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1213877315075" />
    </node>
  </root>
  <root id="1213877331196">
    <node role="constructor" roleId="1i04.1225194240801" type="1i04.ConceptConstructorDeclaration" typeId="1i04.1225194413805" id="1213877331197">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1213877331198" />
    </node>
  </root>
  <root id="1213877369278">
    <node role="constructor" roleId="1i04.1225194240801" type="1i04.ConceptConstructorDeclaration" typeId="1i04.1225194413805" id="1213877369279">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1213877369280" />
    </node>
  </root>
  <root id="1213877501207">
    <node role="constructor" roleId="1i04.1225194240801" type="1i04.ConceptConstructorDeclaration" typeId="1i04.1225194413805" id="1213877501208">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1213877501209" />
    </node>
  </root>
</model>

