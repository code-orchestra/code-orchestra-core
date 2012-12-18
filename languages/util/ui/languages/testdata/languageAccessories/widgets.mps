<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:d4a6c696-53c3-4061-8ca7-f4d803aeab0a(jetbrains.mps.ui.internal.testdata.widgets)">
  <persistence version="7" />
  <language namespace="8a448bd0-1380-4c01-9820-0f051d33888c(jetbrains.mps.ui.modeling)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="sqp9" modelUID="r:ba1d89ed-800e-4d0a-ad09-221b1011fbd1(jetbrains.mps.ui.modeling.structure)" version="2" implicit="yes" />
  <roots>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="8977668887014122504">
      <property name="name" nameId="tpck.1169194664001" value="MockPanel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="8977668887014122506">
      <property name="name" nameId="tpck.1169194664001" value="MockWidget" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="6469323859730975167">
      <property name="name" nameId="tpck.1169194664001" value="MockDockPanel" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="8977668887014122504" resolveInfo="MockPanel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="4343029777915763961">
      <property name="name" nameId="tpck.1169194664001" value="MockHPanel" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="8977668887014122504" resolveInfo="MockPanel" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="3633072329222834069">
      <property name="name" nameId="tpck.1169194664001" value="CMockWidget" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="3633072329222834073">
      <property name="name" nameId="tpck.1169194664001" value="CMockPanel" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="3633072329222834069" resolveInfo="CMockWidget" />
    </node>
    <node type="sqp9.UIObject" typeId="sqp9.8381258131358158044" id="2462638993234615716">
      <property name="name" nameId="tpck.1169194664001" value="MockTabPanel" />
      <link role="extends" roleId="sqp9.8381258131358158057" targetNodeId="8977668887014122504" resolveInfo="MockPanel" />
    </node>
  </roots>
  <root id="8977668887014122504">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="8977668887014122505">
      <property name="name" nameId="tpck.1169194664001" value="*default*" />
    </node>
  </root>
  <root id="8977668887014122506">
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="4343029777915609934">
      <property name="name" nameId="tpck.1169194664001" value="id" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.StringType" typeId="tpee.1225271177708" id="4343029777915609936" />
    </node>
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.EditableUIProperty" typeId="sqp9.9014158157447011054" id="5520428330967866485">
      <property name="name" nameId="tpck.1169194664001" value="foo" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.StringType" typeId="tpee.1225271177708" id="5520428330967866487" />
    </node>
  </root>
  <root id="6469323859730975167">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="6469323859730975168">
      <property name="name" nameId="tpck.1169194664001" value="north" />
    </node>
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="6469323859730975169">
      <property name="name" nameId="tpck.1169194664001" value="south" />
    </node>
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="6469323859730975170">
      <property name="name" nameId="tpck.1169194664001" value="east" />
    </node>
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="6469323859730975171">
      <property name="name" nameId="tpck.1169194664001" value="west" />
    </node>
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="6469323859730975172">
      <property name="name" nameId="tpck.1169194664001" value="center" />
    </node>
  </root>
  <root id="4343029777915763961">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="4343029777915769854">
      <property name="name" nameId="tpck.1169194664001" value="children" />
    </node>
  </root>
  <root id="3633072329222834069">
    <node role="property" roleId="sqp9.8381258131358158103" type="sqp9.UIProperty" typeId="sqp9.8381258131358158045" id="3633072329222834070">
      <property name="name" nameId="tpck.1169194664001" value="id" />
      <node role="dataType" roleId="sqp9.9014158157446451474" type="tpee.StringType" typeId="tpee.1225271177708" id="3633072329222834072" />
    </node>
  </root>
  <root id="3633072329222834073">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="3633072329222834074">
      <property name="name" nameId="tpck.1169194664001" value="*default*" />
    </node>
  </root>
  <root id="2462638993234615716">
    <node role="compartment" roleId="sqp9.4391079257750042252" type="sqp9.Container" typeId="sqp9.4391079257750042251" id="2462638993234615717">
      <property name="name" nameId="tpck.1169194664001" value="tabs" />
      <node role="requiredAspect" roleId="sqp9.6424935405034408112" type="sqp9.ChildAspectDefinition" typeId="sqp9.6424935405034408143" id="2462638993234615718">
        <property name="name" nameId="tpck.1169194664001" value="tabName" />
        <node role="aspectType" roleId="sqp9.6424935405034408144" type="tpee.StringType" typeId="tpee.1225271177708" id="2462638993234615720" />
      </node>
    </node>
  </root>
</model>

