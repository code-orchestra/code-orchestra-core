<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c8a4661cb(testRefactoring.sandbox)" doNotGenerate="true">
  <persistence version="7" />
  <language namespace="343e2a8b-449f-45b3-9da8-1463945cb208(testRefactoring)" />
  <import index="2f2o" modelUID="r:00000000-0000-4000-0000-011c8a4661cc(testRefactoring.sandbox2)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="2f2n" modelUID="r:00000000-0000-4000-0000-011c8a4661d3(testRefactoringTargetLang.structure)" version="-1" implicit="yes" />
  <import index="2f2k" modelUID="r:00000000-0000-4000-0000-011c8a4661d0(testRefactoring.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="2f2k.MyVeryGoodConcept1" typeId="2f2k.1198157505315" id="1198157680448">
      <property name="name" nameId="tpck.1169194664001" value="MyGood" />
      <property name="veryNiceProperty" nameId="2f2n.1199636171013" value="xcxcxcxcx" />
      <link role="brother" roleId="2f2k.1198591068787" targetNodeId="2f2o.1198590875560" resolveInfo="MyGood2" />
    </node>
  </roots>
  <root id="1198157680448">
    <node role="anotherGoodConcept" roleId="2f2n.1199636171011" type="2f2k.YetAnotherGoodConcept" typeId="2f2k.1198176302417" id="1198176531644">
      <property name="niceProperty" nameId="2f2k.1200588769474" value="cat" />
    </node>
    <node role="anotherGoodConcept" roleId="2f2n.1199636171011" type="2f2k.YetAnotherGoodConcept" typeId="2f2k.1198176302417" id="1198176534786">
      <property name="niceProperty" nameId="2f2k.1200588769474" value="dog" />
    </node>
    <node role="anotherGoodConcept" roleId="2f2n.1199636171011" type="2f2k.YetAnotherGoodConcept" typeId="2f2k.1198176302417" id="1198176536537">
      <property name="niceProperty" nameId="2f2k.1200588769474" value="hamster" />
    </node>
    <node role="anotherGoodConcept" roleId="2f2n.1199636171011" type="2f2k.YetAnotherGoodConcept" typeId="2f2k.1198176302417" id="1198176538069">
      <property name="niceProperty" nameId="2f2k.1200588769474" value="rat" />
    </node>
  </root>
</model>

