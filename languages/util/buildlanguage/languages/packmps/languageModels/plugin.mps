<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:9efaaa92-cbf5-4ff1-8667-230ab5907739(jetbrains.mps.build.packaging.mps.plugin)">
  <persistence version="7" />
  <language namespace="3c6d6f72-fc0d-4d9d-8c5d-cb82e96c422b(jetbrains.mps.build.packaging.mps)" />
  <language namespace="760a0a8c-eabb-4521-8bfd-65db761a9ba3(jetbrains.mps.baseLanguage.logging)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="28f9e497-3b42-4291-aeba-0a1039153ab1(jetbrains.mps.lang.plugin)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="2ghw" modelUID="r:4af4b24f-f2e3-4d05-9cb9-962796451769(jetbrains.mps.build.packaging.mps.generator.template.util)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tprs" modelUID="r:00000000-0000-4000-0000-011c895904a4(jetbrains.mps.ide.actions)" version="-1" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tp4k" modelUID="r:00000000-0000-4000-0000-011c89590368(jetbrains.mps.lang.plugin.structure)" version="23" implicit="yes" />
  <roots>
    <node type="tp4k.ActionDeclaration" typeId="tp4k.1203071646776" id="3583849467507913695">
      <property name="name" nameId="tpck.1169194664001" value="CheckCoreRuntimeDeps" />
      <property name="caption" nameId="tp4k.1205250923097" value="Check Core Runtime Deps" />
    </node>
    <node type="tp4k.ActionDeclaration" typeId="tp4k.1203071646776" id="3583849467507913837">
      <property name="name" nameId="tpck.1169194664001" value="CheckIncludedLanguages" />
      <property name="caption" nameId="tp4k.1205250923097" value="Check Included Languages" />
    </node>
    <node type="tp4k.ActionDeclaration" typeId="tp4k.1203071646776" id="3583849467507913885">
      <property name="name" nameId="tpck.1169194664001" value="CheckSamples" />
      <property name="caption" nameId="tp4k.1205250923097" value="Check Samples" />
    </node>
    <node type="tp4k.ActionGroupDeclaration" typeId="tp4k.1203087890642" id="3583849467507913934">
      <property name="name" nameId="tpck.1169194664001" value="InternalChecks" />
      <property name="isInternal" nameId="tp4k.1205160838084" value="true" />
      <property name="isPopup" nameId="tp4k.1213283637680" value="true" />
      <property name="caption" nameId="tp4k.1204991940915" value="Checks" />
    </node>
  </roots>
  <root id="3583849467507913695">
    <node role="executeFunction" roleId="tp4k.1203083461638" type="tp4k.ExecuteBlock" typeId="tp4k.1203083511112" id="3583849467507913696">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3583849467507913697">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3583849467508048985">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3583849467508048987">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2ghw.3583849467508042431" resolveInfo="checkCoreRuntimeDeps" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2ghw.3583849467508042415" resolveInfo="CheckUtil" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="3583849467507913837">
    <node role="executeFunction" roleId="tp4k.1203083461638" type="tp4k.ExecuteBlock" typeId="tp4k.1203083511112" id="3583849467507913838">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3583849467507913839">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3583849467508048933">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3583849467508048935">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2ghw.3583849467508042435" resolveInfo="checkIncludedLanguage" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2ghw.3583849467508042415" resolveInfo="CheckUtil" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="3583849467507913885">
    <node role="executeFunction" roleId="tp4k.1203083461638" type="tp4k.ExecuteBlock" typeId="tp4k.1203083511112" id="3583849467507913886">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3583849467507913887">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3583849467508042444">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3583849467508042447">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2ghw.3583849467508042421" resolveInfo="checkSamples" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2ghw.3583849467508042415" resolveInfo="CheckUtil" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="3583849467507913934">
    <node role="modifier" roleId="tp4k.1204991552650" type="tp4k.ModificationStatement" typeId="tp4k.1203092361741" id="3583849467507913935">
      <link role="modifiedGroup" roleId="tp4k.1203092736097" targetNodeId="tprs.1215013255981" resolveInfo="Build" />
      <link role="point" roleId="tp4k.1204992316090" targetNodeId="tprs.5716258091890928630" resolveInfo="aux" />
    </node>
    <node role="contents" roleId="tp4k.1207145245948" type="tp4k.ElementListContents" typeId="tp4k.1207145163717" id="3583849467507913936">
      <node role="reference" roleId="tp4k.1207145201301" type="tp4k.ActionInstance" typeId="tp4k.1203088046679" id="3583849467507913937">
        <link role="action" roleId="tp4k.1203088061055" targetNodeId="3583849467507913885" resolveInfo="CheckSamples" />
      </node>
      <node role="reference" roleId="tp4k.1207145201301" type="tp4k.ActionInstance" typeId="tp4k.1203088046679" id="3583849467507913938">
        <link role="action" roleId="tp4k.1203088061055" targetNodeId="3583849467507913695" resolveInfo="CheckCoreRuntimeDeps" />
      </node>
      <node role="reference" roleId="tp4k.1207145201301" type="tp4k.ActionInstance" typeId="tp4k.1203088046679" id="3583849467507913939">
        <link role="action" roleId="tp4k.1203088061055" targetNodeId="3583849467507913837" resolveInfo="CheckIncludedLanguages" />
      </node>
    </node>
  </root>
</model>

