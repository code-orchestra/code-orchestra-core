<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c89590588(jetbrains.mps.xml.structure)" version="0">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" />
  <import index="tpj8" modelUID="r:00000000-0000-4000-0000-011c89590598(jetbrains.mps.xmlSchema.structure)" version="3" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="tpjo" modelUID="r:00000000-0000-4000-0000-011c89590588(jetbrains.mps.xml.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1161371727643">
      <property name="name" nameId="tpck.1169194664001" value="Content" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1161373262136">
      <property name="name" nameId="tpck.1169194664001" value="Text" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1163340203555" resolveInfo="BaseText" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1161911457732">
      <property name="name" nameId="tpck.1169194664001" value="ComplexText" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1163340203555" resolveInfo="BaseText" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1163340203555">
      <property name="name" nameId="tpck.1169194664001" value="BaseText" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1161371727643" resolveInfo="Content" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1163629230879">
      <property name="name" nameId="tpck.1169194664001" value="ContentList" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1161371727643" resolveInfo="Content" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165235274815">
      <property name="name" nameId="tpck.1169194664001" value="BaseAttribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1167523027466">
      <property name="name" nameId="tpck.1169194664001" value="Element" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1179102053371" resolveInfo="BaseElement" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1167700349452">
      <property name="name" nameId="tpck.1169194664001" value="Attribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1165235274815" resolveInfo="BaseAttribute" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1172960673168">
      <property name="name" nameId="tpck.1169194664001" value="EntityReference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1163340203555" resolveInfo="BaseText" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1179102053371">
      <property name="name" nameId="tpck.1169194664001" value="BaseElement" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1161371727643" resolveInfo="Content" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1192038615503">
      <property name="name" nameId="tpck.1169194664001" value="CDATA" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1161371727643" resolveInfo="Content" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1198862578220">
      <property name="name" nameId="tpck.1169194664001" value="XmlRoot" />
    </node>
  </roots>
  <root id="1161371727643">
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="1168792704590">
      <property name="name" nameId="tpck.1169194664001" value="isComplex" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1161371746114">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" />
    </node>
    <node role="conceptLinkDeclaration" roleId="tpce.1137532086877" type="tpce.ReferenceConceptLinkDeclaration" typeId="tpce.1105741578420" id="1175095327345">
      <property name="name" nameId="tpck.1169194664001" value="correspondingElement" />
      <link role="targetType" roleId="tpce.1105736621938" targetNodeId="tpj8.1167838236835" />
    </node>
  </root>
  <root id="1161373262136">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1162498464999">
      <property name="value" nameId="tpce.1105725733873" value="/text" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1192015953363">
      <property name="value" nameId="tpce.1105725733873" value="plain text" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1192016283176">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1161373273669">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
  </root>
  <root id="1161911457732">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1162498470751">
      <property name="value" nameId="tpce.1105725733873" value="*complexText" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1161911474092">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="text" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1163340203555" resolveInfo="BaseText" />
    </node>
  </root>
  <root id="1163340203555">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1163340214415">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" />
    </node>
  </root>
  <root id="1163629230879">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1166231449055">
      <property name="name" nameId="tpck.1169194664001" value="isHorizontal" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1163629255661">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="content" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1161371727643" resolveInfo="Content" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1166304178740">
      <property name="value" nameId="tpce.1105725733873" value="(contentList)" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1168792765501">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1168792704590" resolveInfo="isComplex" />
    </node>
  </root>
  <root id="1165235274815">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1165235282019">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" />
    </node>
  </root>
  <root id="1167523027466">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1167523262932">
      <property name="role" nameId="tpce.1071599776563" value="elementDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpj8.1167838236835" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1167523602746">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1168818951439">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1168792704590" resolveInfo="isComplex" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1172970532917">
      <property name="name" nameId="tpck.1169194664001" value="isEmpty" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" />
    </node>
  </root>
  <root id="1167700349452">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1167701332877">
      <property name="role" nameId="tpce.1071599776563" value="attributeDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpj8.1167697887602" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1167703268127">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="value" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1163340203555" resolveInfo="BaseText" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1167701543016">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" />
    </node>
  </root>
  <root id="1172960673168">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1172960837561">
      <property name="role" nameId="tpce.1071599776563" value="entityDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpj8.1172950047361" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1172960808169">
      <property name="value" nameId="tpce.1105725733873" value="&amp;entity;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
  </root>
  <root id="1179102053371">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1179102063903">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1179114219774">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="contentList" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1163629230879" resolveInfo="ContentList" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1188768803246">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="attribute" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1165235274815" resolveInfo="BaseAttribute" />
    </node>
  </root>
  <root id="1192038615503">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1192038646485">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="contentList" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1163629230879" resolveInfo="ContentList" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1192038635910">
      <property name="value" nameId="tpce.1105725733873" value="CDATA" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1198862578220" />
</model>

