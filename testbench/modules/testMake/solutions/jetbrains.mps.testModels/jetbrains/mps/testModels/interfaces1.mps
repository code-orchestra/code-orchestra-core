<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:93a6ef2e-9f35-4228-b460-87597e0be7c4(jetbrains.mps.testModels.interfaces1)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="dtn5" modelUID="r:1d00dd1b-8d1d-4696-8986-1d57f71f4e8b(jetbrains.mps.testModels.interfaces2)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="2265759664131825325">
      <property name="name" nameId="tpck.1169194664001" value="MyClass" />
    </node>
  </roots>
  <root id="2265759664131825325">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2265759664131825326" />
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8218697679631023642">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="dtn5.1196985119947853670" resolveInfo="Int2" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2265759664131825332">
      <property name="name" nameId="tpck.1169194664001" value="bbb" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2265759664131825333" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2265759664131825334" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2265759664131825335" />
    </node>
  </root>
</model>

