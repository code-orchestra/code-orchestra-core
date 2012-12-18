<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c89590436(jetbrains.mps.samples.readerConfigLanguage.structure)">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1116534870455">
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="ReaderConfiguration" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1116534914096">
      <property name="name" nameId="tpck.1169194664001" value="Mapping" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1116534962441">
      <property name="name" nameId="tpck.1169194664001" value="Field" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
  </roots>
  <root id="1116534870455">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1175153786600">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1116535202619">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <property name="role" nameId="tpce.1071599776563" value="mapping" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1116534914096" />
    </node>
  </root>
  <root id="1116534914096">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1175153780615">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1116535614925">
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <property name="role" nameId="tpce.1071599776563" value="field" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1116534962441" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1116534988614">
      <property name="name" nameId="tpck.1169194664001" value="code" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1116534997224">
      <property name="name" nameId="tpck.1169194664001" value="targetClass" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
  </root>
  <root id="1116534962441">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1175153775082">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1116535027491">
      <property name="name" nameId="tpck.1169194664001" value="start" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657062" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1116535032695">
      <property name="name" nameId="tpck.1169194664001" value="end" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657062" />
    </node>
  </root>
</model>

