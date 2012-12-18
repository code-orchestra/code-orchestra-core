<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c895905fe(jetbrains.mps.transformation.test.inputModels.test_generationScripts)">
  <persistence version="7" />
  <language namespace="ab0ae915-e3b5-4f35-b55a-c655d649a03c(jetbrains.mps.transformation.test.inputLang)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpm0" modelUID="r:00000000-0000-4000-0000-011c895905f4(jetbrains.mps.transformation.test.inputLang.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpm0.InputRoot" typeId="tpm0.1195168316083" id="1195168442106">
      <property name="name" nameId="tpck.1169194664001" value="Input_root_1" />
      <property name="useInTest" nameId="tpm0.1202243304949" value="test1" />
    </node>
  </roots>
  <root id="1195168442106">
    <node role="inputChild" roleId="tpm0.1195169805620" type="tpm0.InputNode_A" typeId="tpm0.1195171011194" id="1195171261183" />
    <node role="inputChild" roleId="tpm0.1195169805620" type="tpm0.InputNode_A" typeId="tpm0.1195171011194" id="1195171265293">
      <property name="option" nameId="tpm0.1195171080307" value="option_1" />
    </node>
    <node role="inputChild" roleId="tpm0.1195169805620" type="tpm0.InputNode_A" typeId="tpm0.1195171011194" id="1202780836195">
      <property name="name" nameId="tpck.1169194664001" value="dropped!!!" />
      <property name="option" nameId="tpm0.1195171080307" value="drop_it" />
    </node>
  </root>
</model>

