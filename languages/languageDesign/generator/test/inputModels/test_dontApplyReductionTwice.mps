<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c895905fd(jetbrains.mps.transformation.test.inputModels.test_dontApplyReductionTwice)">
  <persistence version="7" />
  <language namespace="ab0ae915-e3b5-4f35-b55a-c655d649a03c(jetbrains.mps.transformation.test.inputLang)" />
  <language namespace="157a9668-bf58-417b-893e-53d86388dc56(jetbrains.mps.transformation.test.outputLang)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tq1l" modelUID="r:00000000-0000-4000-0000-011c89590605(jetbrains.mps.transformation.test.outputLang.structure)" version="0" implicit="yes" />
  <import index="tpm0" modelUID="r:00000000-0000-4000-0000-011c895905f4(jetbrains.mps.transformation.test.inputLang.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpm0.InputRoot" typeId="tpm0.1195168316083" id="1209605989135">
      <property name="name" nameId="tpck.1169194664001" value="Input_root_1" />
      <property name="useInTest" nameId="tpm0.1202243304949" value="dontApplyReductionTwice" />
    </node>
    <node type="tq1l.OutputRoot" typeId="tq1l.1195164668463" id="1209658576147">
      <property name="name" nameId="tpck.1169194664001" value="Root_ToCopy" />
      <property name="text" nameId="tq1l.1195164732401" value="this root will be copied to output " />
    </node>
  </roots>
  <root id="1209605989135" />
  <root id="1209658576147">
    <node role="outputChild" roleId="tq1l.1195169631818" type="tq1l.OutputNode_forDontApplyReductionTwice_test" typeId="tq1l.1209604028561" id="1209658659867">
      <property name="text" nameId="tq1l.1195170441111" value="this node will be reduced to itself but that must not lead to a cycling" />
    </node>
  </root>
</model>

