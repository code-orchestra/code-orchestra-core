<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:7736cb0a-06c8-464f-a1eb-5560b9560d89(jetbrains.mps.transformation.test.inputModels.test_reduceOneToMany)">
  <persistence version="7" />
  <language namespace="ab0ae915-e3b5-4f35-b55a-c655d649a03c(jetbrains.mps.transformation.test.inputLang)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpm0" modelUID="r:00000000-0000-4000-0000-011c895905f4(jetbrains.mps.transformation.test.inputLang.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpm0.InputRoot" typeId="tpm0.1195168316083" id="341670684286865619">
      <property name="name" nameId="tpck.1169194664001" value="Input_root_1" />
      <property name="useInTest" nameId="tpm0.1202243304949" value="reduceOneToMany" />
    </node>
  </roots>
  <root id="341670684286865619">
    <node role="inputChild" roleId="tpm0.1195169805620" type="tpm0.InputNode_A" typeId="tpm0.1195171011194" id="341670684286865621">
      <property name="name" nameId="tpck.1169194664001" value="reduce this to many" />
    </node>
  </root>
</model>

