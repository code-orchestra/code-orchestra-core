<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:1ce92b75-a0c5-43f1-a14e-cfe3b58c4978(jetbrains.mps.calculator.sandbox.sandbox)">
  <persistence version="7" />
  <language namespace="26b3d6d5-b99a-4ed6-83be-d2ea6f3627a1(jetbrains.mps.calculator)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="64en" modelUID="r:87765d2d-a756-4883-9acc-6a42e5bf6c23(jetbrains.mps.calculator.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="64en.Calculator" typeId="64en.1241362555920" id="1241366278147">
      <property name="name" nameId="tpck.1169194664001" value="mySalary" />
    </node>
  </roots>
  <root id="1241366278147">
    <node role="outputField" roleId="64en.1241362849617" type="64en.OutputField" typeId="64en.1241362815640" id="1241366333402">
      <node role="expression" roleId="64en.1241363046126" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1241366339999">
        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.MulExpression" typeId="tpee.1092119917967" id="1241370253229">
          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1241370253810">
            <property name="value" nameId="tpee.1068580320021" value="5" />
          </node>
          <node role="leftExpression" roleId="tpee.1081773367580" type="64en.InputFieldReference" typeId="64en.1241363083334" id="1241370253181">
            <link role="field" roleId="64en.1241363105304" targetNodeId="1241366331479" resolveInfo="PHP Hours" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MulExpression" typeId="tpee.1092119917967" id="1241370251287">
          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1241370251415">
            <property name="value" nameId="tpee.1068580320021" value="10" />
          </node>
          <node role="leftExpression" roleId="tpee.1081773367580" type="64en.InputFieldReference" typeId="64en.1241363083334" id="1241370251129">
            <link role="field" roleId="64en.1241363105304" targetNodeId="1241366328869" resolveInfo="Java Hours" />
          </node>
        </node>
      </node>
    </node>
    <node role="inputField" roleId="64en.1241362671336" type="64en.InputField" typeId="64en.1241362608529" id="1241366328869">
      <property name="name" nameId="tpck.1169194664001" value="Java Hours" />
    </node>
    <node role="inputField" roleId="64en.1241362671336" type="64en.InputField" typeId="64en.1241362608529" id="1241366331479">
      <property name="name" nameId="tpck.1169194664001" value="PHP Hours" />
    </node>
  </root>
</model>

