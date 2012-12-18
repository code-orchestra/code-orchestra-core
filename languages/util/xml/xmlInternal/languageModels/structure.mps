<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c89590591(jetbrains.mps.xmlInternal.structure)" version="2">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" />
  <import index="tpjo" modelUID="r:00000000-0000-4000-0000-011c89590588(jetbrains.mps.xml.structure)" version="0" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="tpj8" modelUID="r:00000000-0000-4000-0000-011c89590598(jetbrains.mps.xmlSchema.structure)" version="3" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="tpjh" modelUID="r:00000000-0000-4000-0000-011c89590591(jetbrains.mps.xmlInternal.structure)" version="2" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165761580958">
      <property name="name" nameId="tpck.1169194664001" value="StatementElement" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpjo.1161371727643" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1165765736183">
      <property name="name" nameId="tpck.1169194664001" value="ContentStatement" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068580123157" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1166472279594">
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="XmlFile" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1174840096626">
      <property name="name" nameId="tpck.1169194664001" value="Document" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1174840272325">
      <property name="name" nameId="tpck.1169194664001" value="Comment" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpjo.1161371727643" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1174856278879">
      <property name="name" nameId="tpck.1169194664001" value="DocumentStatement" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068580123157" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1174858745369">
      <property name="name" nameId="tpck.1169194664001" value="Prolog" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1174859135071">
      <property name="name" nameId="tpck.1169194664001" value="DocumentTypeDeclaration" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1174861226436">
      <property name="name" nameId="tpck.1169194664001" value="ExternalId" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1174861653404">
      <property name="name" nameId="tpck.1169194664001" value="PublicExternalId" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1174861226436" resolveInfo="ExternalId" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1174862616672">
      <property name="name" nameId="tpck.1169194664001" value="Literal" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1179105519357">
      <property name="name" nameId="tpck.1169194664001" value="SimpleElement" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpjo.1179102053371" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1188772500757">
      <property name="name" nameId="tpck.1169194664001" value="SimpleAttribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpjo.1165235274815" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1191201692482">
      <property name="name" nameId="tpck.1169194664001" value="NamespaceAttribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpjo.1165235274815" />
    </node>
  </roots>
  <root id="1165761580958">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1174864971277">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="statementList" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068580123136" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1165761652407">
      <property name="value" nameId="tpce.1105725733873" value="statementElement" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1168793018304">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpjo.1168792704590" />
    </node>
  </root>
  <root id="1165765736183">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1165765736184">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="content" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpjo.1161371727643" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1165765736185">
      <property name="value" nameId="tpce.1105725733873" value="contentStatement" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
  </root>
  <root id="1166472279594">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1167755304238">
      <property name="name" nameId="tpck.1169194664001" value="fileName" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1188753321461">
      <property name="name" nameId="tpck.1169194664001" value="extension" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1167755779835">
      <property name="role" nameId="tpce.1071599776563" value="schema" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpj8.1167513239198" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1174833330733">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="document" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1174840096626" resolveInfo="Document" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1173487594724">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1198862833697">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpjo.1198862578220" resolveInfo="XmlRoot" />
    </node>
  </root>
  <root id="1174840096626">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1174858761932">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="prolog" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1174858745369" resolveInfo="Prolog" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1174840096627">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="rootElement" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpjo.1179102053371" />
    </node>
  </root>
  <root id="1174840272325">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1174840272326">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="text" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpjo.1163340203555" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1174840272327">
      <property name="value" nameId="tpce.1105725733873" value="!-- comment" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
  </root>
  <root id="1174856278879">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1174856278880">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="document" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1174840096626" resolveInfo="Document" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1174856278881">
      <property name="value" nameId="tpce.1105725733873" value="document statement" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
  </root>
  <root id="1174858745369">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1174859166338">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="documentTypeDeclaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1174859135071" resolveInfo="DocumentTypeDeclaration" />
    </node>
  </root>
  <root id="1174859135071">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1174861256953">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="externalId" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1174861226436" resolveInfo="ExternalId" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1174860910721">
      <property name="name" nameId="tpck.1169194664001" value="docTypeName" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
  </root>
  <root id="1174861226436">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1174861247171">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" />
    </node>
  </root>
  <root id="1174861653404">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1174862790436">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="pubidLiteral" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1174862616672" resolveInfo="Literal" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1174862801156">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="systemLiteral" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1174862616672" resolveInfo="Literal" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1174863063158">
      <property name="value" nameId="tpce.1105725733873" value="PUBLIC" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
  </root>
  <root id="1174862616672">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1174862633361">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
  </root>
  <root id="1179105519357">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1179271242032">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="elementName" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpjo.1163340203555" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1179106523284">
      <property name="value" nameId="tpce.1105725733873" value="simple element" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1179265695977">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpjo.1168792704590" />
    </node>
  </root>
  <root id="1188772500757">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1188772833817">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="value" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpjo.1163340203555" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1188772810752">
      <property name="name" nameId="tpck.1169194664001" value="attributeName" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1188772516196">
      <property name="value" nameId="tpce.1105725733873" value="simple attribute" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
  </root>
  <root id="1191201692482">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1191204299313">
      <property name="name" nameId="tpck.1169194664001" value="prefix" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1191202073955">
      <property name="name" nameId="tpck.1169194664001" value="uri" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
  </root>
</model>

