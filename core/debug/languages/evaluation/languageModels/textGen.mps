<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:377d10f7-3b25-4fc8-965d-ff71d05a8c05(jetbrains.mps.debug.evaluation.textGen)">
  <persistence version="7" />
  <language namespace="b83431fe-5c8f-40bc-8a36-65e25f4dd253(jetbrains.mps.lang.textGen)" />
  <language namespace="7da4580f-9d75-4603-8162-51a896d78375(jetbrains.mps.debug.evaluation)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="8sls" modelUID="r:3a27a6eb-dfce-419d-9e4c-ca44cc01a2e2(jetbrains.mps.debug.evaluation.structure)" version="-1" />
  <import index="dmyu" modelUID="r:c6eeedda-084d-4659-9c4d-80b7768f2bb2(jetbrains.mps.baseLanguage.textGen)" version="-1" />
  <import index="2omo" modelUID="r:de0d3c0c-d049-41cf-bbf9-a920ba513cd3(jetbrains.mps.lang.textGen.structure)" version="12" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <roots>
    <node type="2omo.ConceptTextGenDeclaration" typeId="2omo.1233670071145" id="948722627350505706">
      <link role="conceptDeclaration" roleId="2omo.1233670257997" targetNodeId="8sls.6036237525966182694" resolveInfo="LowLevelVariable" />
    </node>
    <node type="2omo.LanguageTextGenDeclaration" typeId="2omo.1233921373471" id="948722627350506005">
      <property name="name" nameId="tpck.1169194664001" value="EvaluationTextGen" />
      <link role="baseTextGen" roleId="2omo.1234781160172" targetNodeId="dmyu.1234796104060" resolveInfo="BaseLanguageTextGen" />
    </node>
  </roots>
  <root id="948722627350505706">
    <node role="textGenBlock" roleId="2omo.1233749296504" type="2omo.GenerateTextDeclaration" typeId="2omo.1233749247888" id="948722627350505707">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="948722627350505708" />
    </node>
  </root>
  <root id="948722627350506005" />
</model>

