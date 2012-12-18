<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:711fa6a3-3961-4b7b-b3da-5afbfdf297e7(jetbrains.mps.xmlUnitTest.sandbox)">
  <persistence version="7" />
  <language namespace="f85adbd8-2ec2-4572-bcfc-8dd799a7f025(jetbrains.mps.xmlUnitTest)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="f61473f9-130f-42f6-b98d-6c438812c2f6(jetbrains.mps.baseLanguage.unitTest)" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="mass" modelUID="r:77603f21-ab6b-487f-82f9-e98e1903f0fc(jetbrains.mps.xmlUnitTest.structure)" version="-1" implicit="yes" />
  <import index="tpe3" modelUID="r:00000000-0000-4000-0000-011c895902d7(jetbrains.mps.baseLanguage.unitTest.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="9070985627710925999">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="Sample" />
    </node>
  </roots>
  <root id="9070985627710925999">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9070985627710926000" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="9070985627710926001">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="9070985627710926002" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9070985627710926003" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9070985627710926004" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="9070985627710926005">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="9070985627710932722">
        <property name="methodName" nameId="tpe3.1171931690128" value="compareXML" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9070985627710932723" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="9070985627710932724" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9070985627710932725">
          <node role="statement" roleId="tpee.1068581517665" type="mass.AssertXMLEquals" typeId="mass.5211164146777002721" id="9070985627710932727">
            <node role="actual" roleId="mass.5211164146777002724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="9070985627710932736">
              <property name="value" nameId="tpee.1070475926801" value="&lt;foo&gt;&lt;bar id=\&quot;123\&quot;/&gt;&lt;/foo&gt;" />
            </node>
            <node role="expected" roleId="mass.5211164146777002723" type="mass.XMLStringLiteral" typeId="mass.5211164146776489223" id="9070985627710932730">
              <node role="xml" roleId="mass.5211164146776489224" type="mass.XMLLiteral" typeId="mass.5211164146776488214" id="9070985627710932731">
                <node role="element" roleId="mass.5211164146776488215" type="mass.Element" typeId="mass.5266766379151914058" id="6123597934392512203">
                  <property name="name" nameId="tpck.1169194664001" value="foo" />
                  <node role="content" roleId="mass.5266766379151914060" type="mass.Element" typeId="mass.5266766379151914058" id="6123597934392512205">
                    <property name="name" nameId="tpck.1169194664001" value="bar" />
                    <node role="attribute" roleId="mass.5266766379151914059" type="mass.Attribute" typeId="mass.5266766379151914050" id="6123597934392512206">
                      <property name="name" nameId="tpck.1169194664001" value="id" />
                      <property name="value" nameId="mass.5266766379151914052" value="123" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

