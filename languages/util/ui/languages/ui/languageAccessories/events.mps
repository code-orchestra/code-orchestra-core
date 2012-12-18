<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:840b989b-d75d-4268-abaa-4676d1720c58(jetbrains.mps.ui.events)">
  <persistence version="7" />
  <language namespace="8a448bd0-1380-4c01-9820-0f051d33888c(jetbrains.mps.ui.modeling)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="sqp9" modelUID="r:ba1d89ed-800e-4d0a-ad09-221b1011fbd1(jetbrains.mps.ui.modeling.structure)" version="2" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <roots>
    <node type="sqp9.Event" typeId="sqp9.8381258131358158046" id="7421785601023888120">
      <property name="handleable" nameId="sqp9.5263857617435649274" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="CustomEvent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="events" />
    </node>
    <node type="sqp9.Event" typeId="sqp9.8381258131358158046" id="7421785601023888121">
      <property name="name" nameId="tpck.1169194664001" value="ClickEvent" />
      <property name="handleable" nameId="sqp9.5263857617435649274" value="true" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="events" />
      <link role="extends" roleId="sqp9.8381258131358158058" targetNodeId="7421785601023888125" resolveInfo="MouseEvent" />
    </node>
    <node type="sqp9.Event" typeId="sqp9.8381258131358158046" id="7421785601023888124">
      <property name="name" nameId="tpck.1169194664001" value="SelectEvent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="events" />
    </node>
    <node type="sqp9.Event" typeId="sqp9.8381258131358158046" id="7421785601023888125">
      <property name="name" nameId="tpck.1169194664001" value="MouseEvent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="events" />
    </node>
    <node type="sqp9.Event" typeId="sqp9.8381258131358158046" id="5275753781174783545">
      <property name="handleable" nameId="sqp9.5263857617435649274" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="ActionEvent" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="events" />
    </node>
  </roots>
  <root id="7421785601023888120" />
  <root id="7421785601023888121">
    <node role="property" roleId="sqp9.5224413709454661150" type="sqp9.EventProperty" typeId="sqp9.5263857617434463752" id="7421785601023888122">
      <property name="name" nameId="tpck.1169194664001" value="button" />
      <node role="dataType" roleId="sqp9.5263857617434463754" type="tpee.IntegerType" typeId="tpee.1070534370425" id="7421785601023888123" />
    </node>
  </root>
  <root id="7421785601023888124" />
  <root id="7421785601023888125" />
  <root id="5275753781174783545" />
</model>

