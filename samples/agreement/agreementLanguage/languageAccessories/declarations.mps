<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c8959040b(jetbrains.mps.samples.agreementLanguage.declarations)">
  <persistence version="7" />
  <language namespace="144f7012-c2d5-43be-be2b-4bfb7dff6503(jetbrains.mps.samples.agreementLanguage)" />
  <import index="tpna" modelUID="r:00000000-0000-4000-0000-011c8959040a(jetbrains.mps.samples.agreementLanguage.structure)" version="0" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpna.AgreementDeclarations" typeId="tpna.1112310944779" id="1112315976835" />
  </roots>
  <root id="1112315976835">
    <node role="eventType" roleId="tpna.1112311033671" type="tpna.EventType" typeId="tpna.1111793698243" id="1112316021402">
      <property name="name" nameId="tpck.1169194664001" value="SERVICE CALL" />
      <node role="variable" roleId="tpna.1111793732478" type="tpna.EventVariable" typeId="tpna.1111793755198" id="1112316252581">
        <property name="type" nameId="tpna.1111793807574" value="Money" />
        <property name="name" nameId="tpck.1169194664001" value="fee" />
      </node>
    </node>
    <node role="eventType" roleId="tpna.1112311033671" type="tpna.EventType" typeId="tpna.1111793698243" id="1112316644479">
      <property name="name" nameId="tpck.1169194664001" value="TAX" />
      <node role="variable" roleId="tpna.1111793732478" type="tpna.EventVariable" typeId="tpna.1111793755198" id="1112316673589">
        <property name="type" nameId="tpna.1111793807574" value="Money" />
        <property name="name" nameId="tpck.1169194664001" value="fee" />
      </node>
    </node>
    <node role="eventType" roleId="tpna.1112311033671" type="tpna.EventType" typeId="tpna.1111793698243" id="1112316681746">
      <property name="name" nameId="tpck.1169194664001" value="USAGE" />
      <node role="variable" roleId="tpna.1111793732478" type="tpna.EventVariable" typeId="tpna.1111793755198" id="1112316685513">
        <property name="name" nameId="tpck.1169194664001" value="usage" />
      </node>
    </node>
    <node role="accountType" roleId="tpna.1112311143032" type="tpna.AccountType" typeId="tpna.1111795284642" id="1112315990977">
      <property name="name" nameId="tpck.1169194664001" value="base-usage" />
    </node>
    <node role="accountType" roleId="tpna.1112311143032" type="tpna.AccountType" typeId="tpna.1111795284642" id="1112316007244">
      <property name="name" nameId="tpck.1169194664001" value="service" />
    </node>
    <node role="accountType" roleId="tpna.1112311143032" type="tpna.AccountType" typeId="tpna.1111795284642" id="1112316013167">
      <property name="name" nameId="tpck.1169194664001" value="tax" />
    </node>
  </root>
</model>

