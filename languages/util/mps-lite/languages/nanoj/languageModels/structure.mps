<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c895905df(jetbrains.mps.nanoj.structure)">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="tpkz" modelUID="r:00000000-0000-4000-0000-011c895905df(jetbrains.mps.nanoj.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="689680155165915335">
      <property name="name" nameId="tpck.1169194664001" value="MinusExpression" />
      <property name="rootable" nameId="tpce.1096454100552" value="false" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="689680155165915337">
      <property name="name" nameId="tpck.1169194664001" value="NanoClass" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="689680155165915339">
      <property name="name" nameId="tpck.1169194664001" value="VarDecl" />
      <property name="rootable" nameId="tpce.1096454100552" value="false" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="689680155165915342">
      <property name="name" nameId="tpck.1169194664001" value="NanoStatementList" />
      <property name="rootable" nameId="tpce.1096454100552" value="false" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="689680155165915346" resolveInfo="NanoStatement" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="689680155165915344">
      <property name="name" nameId="tpck.1169194664001" value="NanoExpression" />
      <property name="rootable" nameId="tpce.1096454100552" value="false" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="689680155165915346">
      <property name="name" nameId="tpck.1169194664001" value="NanoStatement" />
      <property name="rootable" nameId="tpce.1096454100552" value="false" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="689680155165915348">
      <property name="name" nameId="tpck.1169194664001" value="VarDeclReference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="689680155165915344" resolveInfo="NanoExpression" />
    </node>
  </roots>
  <root id="689680155165915335">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="689680155165915336">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="expr" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="689680155165915344" resolveInfo="NanoExpression" />
    </node>
  </root>
  <root id="689680155165915337">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="689680155165915338">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="statement" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="689680155165915346" resolveInfo="NanoStatement" />
    </node>
  </root>
  <root id="689680155165915339">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="689680155165915340">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="varType" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="689680155165915341">
      <property name="name" nameId="tpck.1169194664001" value="varName" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="689680155165915342">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="689680155165915343">
      <property name="role" nameId="tpce.1071599776563" value="body" />
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="689680155165915346" resolveInfo="NanoStatement" />
    </node>
  </root>
  <root id="689680155165915344">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="689680155165915345">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="689680155165915346">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="689680155165915347">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="689680155165915348">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="689680155165915349">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="declaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="689680155165915339" resolveInfo="VarDecl" />
    </node>
  </root>
</model>

