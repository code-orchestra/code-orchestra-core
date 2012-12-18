<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c89590600(jetbrains.mps.transformation.test.inputModels.test_reduceExpressionToStatement)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="ab0ae915-e3b5-4f35-b55a-c655d649a03c(jetbrains.mps.transformation.test.inputLang)" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpm0" modelUID="r:00000000-0000-4000-0000-011c895905f4(jetbrains.mps.transformation.test.inputLang.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpm0.InputRootWithStatementList" typeId="tpm0.1209149421970" id="1209149708201">
      <property name="name" nameId="tpck.1169194664001" value="Input" />
      <property name="useInTest" nameId="tpm0.1209149495553" value="reduceExpressionToStatement" />
    </node>
  </roots>
  <root id="1209149708201">
    <node role="statementList" roleId="tpm0.1209149449081" type="tpee.StatementList" typeId="tpee.1068580123136" id="1209149708202">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1209149739328">
        <node role="expression" roleId="tpee.1068580123156" type="tpm0.ExpressionToReduceToStatement" typeId="tpm0.1209146548167" id="1209149739329" />
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1209149741425" />
    </node>
  </root>
</model>

