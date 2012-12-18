<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c8959055f(jetbrains.mps.uiLanguage.samples.grid)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="5d6bee4c-f891-4a93-a0c9-e2268726ae47(jetbrains.mps.uiLanguage)" />
  <import index="tpht" modelUID="r:00000000-0000-4000-0000-011c8959054d(jetbrains.mps.uiLanguage.components)" version="-1" />
  <import index="1t7x" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.awt(JDK/java.awt@java_stub)" version="-1" />
  <import index="dbrf" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.swing(JDK/javax.swing@java_stub)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tphr" modelUID="r:00000000-0000-4000-0000-011c89590553(jetbrains.mps.uiLanguage.structure)" version="1" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tphr.ComponentDeclaration" typeId="tphr.1202387718766" id="1202823852897">
      <property name="name" nameId="tpck.1169194664001" value="GridDemo" />
    </node>
    <node type="tphr.ComponentController" typeId="tphr.1202388384249" id="1203080345075">
      <link role="component" roleId="tphr.1202388401455" targetNodeId="1202823852897" resolveInfo="GridDemo" />
    </node>
  </roots>
  <root id="1202823852897">
    <node role="root" roleId="tphr.1202391997731" type="tphr.ComponentInstance" typeId="tphr.1202387945296" id="1202823856038">
      <link role="componentDeclaration" roleId="tphr.1202388027333" targetNodeId="tpht.1202393511419" resolveInfo="Frame" />
      <node role="content" roleId="tphr.1202817142302" type="tphr.Grid" typeId="tphr.1202823654753" id="1202824139244">
        <node role="row" roleId="tphr.1202823909833" type="tphr.GridRow" typeId="tphr.1202823683703" id="1202824139885">
          <node role="component" roleId="tphr.1202823766928" type="tphr.ComponentInstance" typeId="tphr.1202387945296" id="1202824149718">
            <link role="componentDeclaration" roleId="tphr.1202388027333" targetNodeId="tpht.1202465811094" resolveInfo="Label" />
            <node role="content" roleId="tphr.1202817142302" type="tphr.AttributeValue" typeId="tphr.1202389314593" id="1202824152266">
              <link role="attribute" roleId="tphr.1202389328439" targetNodeId="tpht.1202465836231" resolveInfo="text" />
              <node role="value" roleId="tphr.1202389410534" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1202824152924">
                <property name="value" nameId="tpee.1070475926801" value="1,1" />
              </node>
            </node>
          </node>
          <node role="component" roleId="tphr.1202823766928" type="tphr.ComponentInstance" typeId="tphr.1202387945296" id="1202824157521">
            <link role="componentDeclaration" roleId="tphr.1202388027333" targetNodeId="tpht.1202465811094" resolveInfo="Label" />
            <node role="content" roleId="tphr.1202817142302" type="tphr.AttributeValue" typeId="tphr.1202389314593" id="1202824159272">
              <link role="attribute" roleId="tphr.1202389328439" targetNodeId="tpht.1202465836231" resolveInfo="text" />
              <node role="value" roleId="tphr.1202389410534" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1202824160852">
                <property name="value" nameId="tpee.1070475926801" value="1,l2" />
              </node>
            </node>
          </node>
        </node>
        <node role="row" roleId="tphr.1202823909833" type="tphr.GridRow" typeId="tphr.1202823683703" id="1202824163587">
          <node role="component" roleId="tphr.1202823766928" type="tphr.ComponentInstance" typeId="tphr.1202387945296" id="1202824165667">
            <link role="componentDeclaration" roleId="tphr.1202388027333" targetNodeId="tpht.1202465811094" resolveInfo="Label" />
            <node role="content" roleId="tphr.1202817142302" type="tphr.AttributeValue" typeId="tphr.1202389314593" id="1202824166824">
              <link role="attribute" roleId="tphr.1202389328439" targetNodeId="tpht.1202465836231" resolveInfo="text" />
              <node role="value" roleId="tphr.1202389410534" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1202824167670">
                <property name="value" nameId="tpee.1070475926801" value="2,1" />
              </node>
            </node>
          </node>
          <node role="component" roleId="tphr.1202823766928" type="tphr.ComponentInstance" typeId="tphr.1202387945296" id="1202824170453">
            <link role="componentDeclaration" roleId="tphr.1202388027333" targetNodeId="tpht.1202465811094" resolveInfo="Label" />
            <node role="content" roleId="tphr.1202817142302" type="tphr.AttributeValue" typeId="tphr.1202389314593" id="1202824171673">
              <link role="attribute" roleId="tphr.1202389328439" targetNodeId="tpht.1202465836231" resolveInfo="text" />
              <node role="value" roleId="tphr.1202389410534" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1202824172925">
                <property name="value" nameId="tpee.1070475926801" value="2,2" />
              </node>
            </node>
          </node>
          <node role="component" roleId="tphr.1202823766928" type="tphr.ComponentInstance" typeId="tphr.1202387945296" id="1202825838927">
            <link role="componentDeclaration" roleId="tphr.1202388027333" targetNodeId="tpht.1202465811094" resolveInfo="Label" />
            <node role="content" roleId="tphr.1202817142302" type="tphr.AttributeValue" typeId="tphr.1202389314593" id="1202825839959">
              <link role="attribute" roleId="tphr.1202389328439" targetNodeId="tpht.1202465836231" resolveInfo="text" />
              <node role="value" roleId="tphr.1202389410534" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1202825841462">
                <property name="value" nameId="tpee.1070475926801" value="2,3" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="content" roleId="tphr.1202817142302" type="tphr.AttributeValue" typeId="tphr.1202389314593" id="1202823888060">
        <link role="attribute" roleId="tphr.1202389328439" targetNodeId="tpht.1202396307047" resolveInfo="size" />
        <node role="value" roleId="tphr.1202389410534" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1217888388961">
          <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1217888388963">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1t7x.~Dimension%d&lt;init&gt;(int,int)" resolveInfo="Dimension" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1202823896891">
              <property name="value" nameId="tpee.1068580320021" value="400" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1202823898987">
              <property name="value" nameId="tpee.1068580320021" value="300" />
            </node>
          </node>
        </node>
      </node>
      <node role="content" roleId="tphr.1202817142302" type="tphr.AttributeValue" typeId="tphr.1202389314593" id="1202823858119">
        <link role="attribute" roleId="tphr.1202389328439" targetNodeId="tpht.1202746217446" resolveInfo="defaultCloseOperation" />
        <node role="value" roleId="tphr.1202389410534" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1202823882801">
          <link role="classifier" roleId="tpee.1144433057691" targetNodeId="dbrf.~JFrame" resolveInfo="JFrame" />
          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="dbrf.~JFrame%dEXIT_ON_CLOSE" resolveInfo="EXIT_ON_CLOSE" />
        </node>
      </node>
      <node role="content" roleId="tphr.1202817142302" type="tphr.AttributeValue" typeId="tphr.1202389314593" id="1202823885821">
        <link role="attribute" roleId="tphr.1202389328439" targetNodeId="tpht.1202396132470" resolveInfo="visible" />
        <node role="value" roleId="tphr.1202389410534" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1202823886542">
          <property name="value" nameId="tpee.1068580123138" value="true" />
        </node>
      </node>
    </node>
  </root>
  <root id="1203080345075" />
</model>

