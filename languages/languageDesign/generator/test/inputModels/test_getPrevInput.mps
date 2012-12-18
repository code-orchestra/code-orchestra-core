<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c895905ff(jetbrains.mps.transformation.test.inputModels.test_getPrevInput)">
  <persistence version="7" />
  <language namespace="ab0ae915-e3b5-4f35-b55a-c655d649a03c(jetbrains.mps.transformation.test.inputLang)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpm0" modelUID="r:00000000-0000-4000-0000-011c895905f4(jetbrains.mps.transformation.test.inputLang.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpm0.InputRoot" typeId="tpm0.1195168316083" id="1202252822820">
      <property name="name" nameId="tpck.1169194664001" value="Input_root_1" />
      <property name="useInTest" nameId="tpm0.1202243304949" value="getPrevInputTest" />
    </node>
  </roots>
  <root id="1202252822820">
    <node role="inputChild" roleId="tpm0.1195169805620" type="tpm0.InputNode_A" typeId="tpm0.1195171011194" id="1202252885400">
      <property name="name" nameId="tpck.1169194664001" value="LEVEl 1 (1)" />
      <node role="inputChild" roleId="tpm0.1202254005876" type="tpm0.InputNode_A" typeId="tpm0.1195171011194" id="1202255039141">
        <property name="name" nameId="tpck.1169194664001" value="LEVEL 2 (1.1)" />
        <node role="inputChild" roleId="tpm0.1202254005876" type="tpm0.InputNode_A" typeId="tpm0.1195171011194" id="1202255079285">
          <property name="name" nameId="tpck.1169194664001" value="LEVEL 3 (1.1.1)" />
        </node>
      </node>
    </node>
    <node role="inputChild" roleId="tpm0.1195169805620" type="tpm0.InputNode_A" typeId="tpm0.1195171011194" id="1202252892215">
      <property name="name" nameId="tpck.1169194664001" value="LEVEl 1 (2)" />
      <node role="inputChild" roleId="tpm0.1202254005876" type="tpm0.InputNode_A" typeId="tpm0.1195171011194" id="1202255059189">
        <property name="name" nameId="tpck.1169194664001" value="LEVEL 2 (2.1)" />
        <node role="inputChild" roleId="tpm0.1202254005876" type="tpm0.InputNode_A" typeId="tpm0.1195171011194" id="1202255097756">
          <property name="name" nameId="tpck.1169194664001" value="LEVEL 3 (2.1.1)" />
        </node>
      </node>
    </node>
  </root>
</model>

