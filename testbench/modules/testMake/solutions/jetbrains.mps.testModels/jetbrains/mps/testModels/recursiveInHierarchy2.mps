<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:efeaae46-06f7-44f8-b5cd-cacdae3a27e2(jetbrains.mps.testModels.recursiveInHierarchy2)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="3043583937669651988">
      <property name="name" nameId="tpck.1169194664001" value="MyClass2" />
      <property name="abstractClass" nameId="tpee.1075300953594" value="true" />
    </node>
    <node type="tpee.Interface" typeId="tpee.1107796713796" id="3043583937669651994">
      <property name="name" nameId="tpck.1169194664001" value="MyInterface" />
    </node>
  </roots>
  <root id="3043583937669651988">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3043583937669651989" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="3043583937669651990">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3043583937669651991" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3043583937669651992" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3043583937669651993" />
    </node>
    <node role="implementedInterface" roleId="tpee.1095933932569" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3043583937669651996">
      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3043583937669651994" resolveInfo="MyInperface" />
    </node>
  </root>
  <root id="3043583937669651994">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3043583937669651995" />
  </root>
</model>

