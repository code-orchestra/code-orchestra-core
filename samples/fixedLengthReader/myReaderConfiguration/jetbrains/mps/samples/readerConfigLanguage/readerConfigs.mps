<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c89590433(jetbrains.mps.samples.readerConfigLanguage.readerConfigs)">
  <persistence version="7" />
  <language namespace="089e26c5-bfc3-4a60-9953-f68169a4608a(jetbrains.mps.samples.readerConfigLanguage)" />
  <import index="tpnu" modelUID="r:00000000-0000-4000-0000-011c89590436(jetbrains.mps.samples.readerConfigLanguage.structure)" version="0" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpnu.ReaderConfiguration" typeId="tpnu.1116534870455" id="1127341420738">
      <property name="name" nameId="tpck.1169194664001" value="Config1" />
    </node>
  </roots>
  <root id="1127341420738">
    <node role="mapping" roleId="tpnu.1116535202619" type="tpnu.Mapping" typeId="tpnu.1116534914096" id="1127341428473">
      <property name="code" nameId="tpnu.1116534988614" value="SVCL" />
      <property name="targetClass" nameId="tpnu.1116534997224" value="jetbrains.mps.samples.readerConfigLanguage.dsl.ServiceCall" />
      <node role="field" roleId="tpnu.1116535614925" type="tpnu.Field" typeId="tpnu.1116534962441" id="1127341587349">
        <property name="start" nameId="tpnu.1116535027491" value="4" />
        <property name="end" nameId="tpnu.1116535032695" value="18" />
        <property name="name" nameId="tpck.1169194664001" value="CustomerName" />
      </node>
      <node role="field" roleId="tpnu.1116535614925" type="tpnu.Field" typeId="tpnu.1116534962441" id="1127341592366">
        <property name="start" nameId="tpnu.1116535027491" value="19" />
        <property name="end" nameId="tpnu.1116535032695" value="23" />
        <property name="name" nameId="tpck.1169194664001" value="CustomerID" />
      </node>
      <node role="field" roleId="tpnu.1116535614925" type="tpnu.Field" typeId="tpnu.1116534962441" id="1127341627429">
        <property name="start" nameId="tpnu.1116535027491" value="24" />
        <property name="end" nameId="tpnu.1116535032695" value="27" />
        <property name="name" nameId="tpck.1169194664001" value="CallTypeCode" />
      </node>
      <node role="field" roleId="tpnu.1116535614925" type="tpnu.Field" typeId="tpnu.1116534962441" id="1127341645509">
        <property name="start" nameId="tpnu.1116535027491" value="28" />
        <property name="end" nameId="tpnu.1116535032695" value="35" />
        <property name="name" nameId="tpck.1169194664001" value="DateOfCallString" />
      </node>
    </node>
    <node role="mapping" roleId="tpnu.1116535202619" type="tpnu.Mapping" typeId="tpnu.1116534914096" id="1127341677293">
      <property name="code" nameId="tpnu.1116534988614" value="USGE" />
      <property name="targetClass" nameId="tpnu.1116534997224" value="jetbrains.mps.samples.readerConfigLanguage.dsl.Usage" />
      <node role="field" roleId="tpnu.1116535614925" type="tpnu.Field" typeId="tpnu.1116534962441" id="1127341692184">
        <property name="start" nameId="tpnu.1116535027491" value="4" />
        <property name="end" nameId="tpnu.1116535032695" value="8" />
        <property name="name" nameId="tpck.1169194664001" value="CustomerID" />
      </node>
      <node role="field" roleId="tpnu.1116535614925" type="tpnu.Field" typeId="tpnu.1116534962441" id="1127341706154">
        <property name="start" nameId="tpnu.1116535027491" value="9" />
        <property name="end" nameId="tpnu.1116535032695" value="22" />
        <property name="name" nameId="tpck.1169194664001" value="CustomerName" />
      </node>
      <node role="field" roleId="tpnu.1116535614925" type="tpnu.Field" typeId="tpnu.1116534962441" id="1127341709999">
        <property name="start" nameId="tpnu.1116535027491" value="23" />
        <property name="end" nameId="tpnu.1116535032695" value="30" />
        <property name="name" nameId="tpck.1169194664001" value="Cycle" />
      </node>
      <node role="field" roleId="tpnu.1116535614925" type="tpnu.Field" typeId="tpnu.1116534962441" id="1127341746234">
        <property name="start" nameId="tpnu.1116535027491" value="31" />
        <property name="end" nameId="tpnu.1116535032695" value="36" />
        <property name="name" nameId="tpck.1169194664001" value="ReadDate" />
      </node>
    </node>
  </root>
</model>

