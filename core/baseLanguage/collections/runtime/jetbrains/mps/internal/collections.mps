<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:9e8f23e3-7bd3-4292-ac1d-5693a6c373f3(jetbrains.mps.internal.collections)">
  <persistence version="7" />
  <language namespace="954c4d77-e24b-4e49-a5a5-5476c966c092(jetbrains.mps.gwt.client)" />
  <import index="dn91" modelUID="r:ab8aa33b-a984-44fa-94d6-fd9eb7f4fbaa(collections)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="k1iy" modelUID="r:940623f0-75cf-4f64-98fc-aef3fadfaedd(jetbrains.mps.gwt.client.structure)" version="0" implicit="yes" />
  <roots>
    <node type="k1iy.GWTModule" typeId="k1iy.1572321421811286040" id="6309092871163554394">
      <property name="name" nameId="tpck.1169194664001" value="runtime" />
    </node>
  </roots>
  <root id="6309092871163554394">
    <node role="element" roleId="k1iy.1572321421811416508" type="k1iy.Inherits" typeId="k1iy.1572321421811299552" id="6017889698595905769">
      <link role="module" roleId="k1iy.1572321421811299553" targetNodeId="dn91.2413200550064256033" resolveInfo="runtime-gwt" />
    </node>
    <node role="element" roleId="k1iy.1572321421811416508" type="k1iy.Source" typeId="k1iy.1572321421811416498" id="6309092871163554395">
      <node role="path" roleId="k1iy.1572321421811299609" type="k1iy.Path" typeId="k1iy.1572321421811299588" id="6309092871163554396">
        <property name="value" nameId="k1iy.1572321421811299589" value="runtime" />
      </node>
      <node role="pattern" roleId="k1iy.1572321421811299560" type="k1iy.Exclude" typeId="k1iy.1572321421811299558" id="6309092871163554397">
        <node role="pattern" roleId="k1iy.1572321421811299571" type="k1iy.Pattern" typeId="k1iy.1572321421811299563" id="6309092871163554398">
          <property name="value" nameId="k1iy.1572321421811299564" value="**/ArrayUtils.java" />
        </node>
      </node>
    </node>
    <node role="renameTo" roleId="k1iy.1572321421813882749" type="k1iy.RenameTo" typeId="k1iy.1572321421813875986" id="6309092871163554401">
      <property name="value" nameId="k1iy.1572321421813882746" value="jetbrains.mps.baseLanguage.collections.runtime" />
    </node>
  </root>
</model>

