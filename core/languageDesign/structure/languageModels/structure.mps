<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1071489090640">
      <property name="name" nameId="tpck.1169194664001" value="ConceptDeclaration" />
      <property name="iconPath" nameId="1160488491229" value="${language_descriptor}/icons/structure.png" />
      <property name="rootable" nameId="1096454100552" value="true" />
      <link role="extends" roleId="1071489389519" targetNodeId="1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1071489288298">
      <property name="name" nameId="tpck.1169194664001" value="LinkDeclaration" />
      <property name="iconPath" nameId="1160488491229" value="${language_descriptor}/icons/link.png" />
      <link role="extends" roleId="1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1071489288299">
      <property name="name" nameId="tpck.1169194664001" value="PropertyDeclaration" />
      <property name="iconPath" nameId="1160488491229" value="${language_descriptor}/icons/property.png" />
      <link role="extends" roleId="1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1082978164218">
      <property name="name" nameId="tpck.1169194664001" value="DataTypeDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1082978164219">
      <property name="name" nameId="tpck.1169194664001" value="EnumerationDataTypeDeclaration" />
      <property name="iconPath" nameId="1160488491229" value="${language_descriptor}/icons/enum.png" />
      <property name="rootable" nameId="1096454100552" value="true" />
      <link role="extends" roleId="1071489389519" targetNodeId="1082978164218" resolveInfo="DataTypeDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1082978499127">
      <property name="name" nameId="tpck.1169194664001" value="ConstrainedDataTypeDeclaration" />
      <property name="iconPath" nameId="1160488491229" value="${language_descriptor}/icons/constrainedTD.png" />
      <property name="rootable" nameId="1096454100552" value="true" />
      <link role="extends" roleId="1071489389519" targetNodeId="1082978164218" resolveInfo="DataTypeDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1083171877298">
      <property name="name" nameId="tpck.1169194664001" value="EnumerationMemberDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1083243159079">
      <property name="iconPath" nameId="1160488491229" value="${language_descriptor}/icons/primitiveTD.png" />
      <property name="name" nameId="tpck.1169194664001" value="PrimitiveDataTypeDeclaration" />
      <link role="extends" roleId="1071489389519" targetNodeId="1082978164218" resolveInfo="DataTypeDeclaration" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="1082978164219" id="1084197782722">
      <property name="name" nameId="tpck.1169194664001" value="Cardinality" />
      <property name="memberIdentifierPolicy" nameId="1197591154882" value="derive_from_internal_value" />
      <property name="hasNoDefaultMember" nameId="1212080844762" value="false" />
      <link role="memberDataType" roleId="1083171729157" targetNodeId="tpck.1082983041843" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="1082978164219" id="1084199179703">
      <property name="name" nameId="tpck.1169194664001" value="LinkMetaclass" />
      <property name="hasNoDefaultMember" nameId="1212080844762" value="false" />
      <property name="memberIdentifierPolicy" nameId="1197591154882" value="derive_from_internal_value" />
      <link role="memberDataType" roleId="1083171729157" targetNodeId="tpck.1082983041843" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105725006687">
      <property name="name" nameId="tpck.1169194664001" value="ConceptPropertyDeclaration" />
      <property name="rootable" nameId="1096454100552" value="false" />
      <link role="extends" roleId="1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105725141344">
      <property name="name" nameId="tpck.1169194664001" value="IntegerConceptPropertyDeclaration" />
      <property name="rootable" nameId="1096454100552" value="false" />
      <link role="extends" roleId="1071489389519" targetNodeId="1105725006687" resolveInfo="ConceptPropertyDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105725240314">
      <property name="name" nameId="tpck.1169194664001" value="BooleanConceptPropertyDeclaration" />
      <link role="extends" roleId="1071489389519" targetNodeId="1105725006687" resolveInfo="ConceptPropertyDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105725281956">
      <property name="name" nameId="tpck.1169194664001" value="StringConceptPropertyDeclaration" />
      <property name="rootable" nameId="1096454100552" value="false" />
      <link role="extends" roleId="1071489389519" targetNodeId="1105725006687" resolveInfo="ConceptPropertyDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105725413739">
      <property name="name" nameId="tpck.1169194664001" value="ConceptProperty" />
      <link role="extends" roleId="1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105725498741">
      <property name="name" nameId="tpck.1169194664001" value="IntegerConceptProperty" />
      <link role="extends" roleId="1071489389519" targetNodeId="1105725413739" resolveInfo="ConceptProperty" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105725574259">
      <property name="name" nameId="tpck.1169194664001" value="BooleanConceptProperty" />
      <link role="extends" roleId="1071489389519" targetNodeId="1105725413739" resolveInfo="ConceptProperty" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105725638761">
      <property name="name" nameId="tpck.1169194664001" value="StringConceptProperty" />
      <link role="extends" roleId="1071489389519" targetNodeId="1105725413739" resolveInfo="ConceptProperty" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105736576531">
      <property name="name" nameId="tpck.1169194664001" value="ConceptLinkDeclaration" />
      <property name="rootable" nameId="1096454100552" value="false" />
      <link role="extends" roleId="1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105736674127">
      <property name="name" nameId="tpck.1169194664001" value="ConceptLink" />
      <link role="extends" roleId="1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105736778597">
      <property name="name" nameId="tpck.1169194664001" value="ReferenceConceptLink" />
      <property name="rootable" nameId="1096454100552" value="false" />
      <link role="extends" roleId="1071489389519" targetNodeId="1105736674127" resolveInfo="ConceptLink" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105736889287">
      <property name="name" nameId="tpck.1169194664001" value="AggregationConceptLink" />
      <property name="rootable" nameId="1096454100552" value="false" />
      <link role="extends" roleId="1071489389519" targetNodeId="1105736674127" resolveInfo="ConceptLink" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105741535888">
      <property name="name" nameId="tpck.1169194664001" value="AggregationConceptLinkDeclaration" />
      <property name="rootable" nameId="1096454100552" value="false" />
      <link role="extends" roleId="1071489389519" targetNodeId="1105736576531" resolveInfo="ConceptLinkDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1105741578420">
      <property name="name" nameId="tpck.1169194664001" value="ReferenceConceptLinkDeclaration" />
      <property name="rootable" nameId="1096454100552" value="false" />
      <link role="extends" roleId="1071489389519" targetNodeId="1105736576531" resolveInfo="ConceptLinkDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1149608206811">
      <property name="name" nameId="tpck.1169194664001" value="AnnotationLinkDeclaration" />
      <property name="rootable" nameId="1096454100552" value="true" />
      <property name="iconPath" nameId="1160488491229" value="${language_descriptor}/icons/annotationLink.png" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="annotation" />
      <link role="extends" roleId="1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="1082978164219" id="1149608316235">
      <property name="name" nameId="tpck.1169194664001" value="AnnotationLinkStereotype" />
      <property name="memberIdentifierPolicy" nameId="1197591154882" value="derive_from_internal_value" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="annotation" />
      <link role="memberDataType" roleId="1083171729157" targetNodeId="tpck.1082983041843" />
      <link role="defaultMember" roleId="1083241965437" targetNodeId="1149608364144" resolveInfo="node" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1169125787135">
      <property name="name" nameId="tpck.1169194664001" value="AbstractConceptDeclaration" />
      <link role="extends" roleId="1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1169125989551">
      <property name="name" nameId="tpck.1169194664001" value="InterfaceConceptDeclaration" />
      <property name="rootable" nameId="1096454100552" value="true" />
      <property name="iconPath" nameId="1160488491229" value="${language_descriptor}/icons/interfaceStructure.png" />
      <link role="extends" roleId="1071489389519" targetNodeId="1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1169127622168">
      <property name="name" nameId="tpck.1169194664001" value="InterfaceConceptReference" />
      <link role="extends" roleId="1071489389519" targetNodeId="tpck.1133920641626" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="1082978164219" id="1197590884613">
      <property name="name" nameId="tpck.1169194664001" value="EnumerationMemberIdentifierPolicy" />
      <property name="memberIdentifierPolicy" nameId="1197591154882" value="derive_from_internal_value" />
      <link role="memberDataType" roleId="1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
      <link role="defaultMember" roleId="1083241965437" targetNodeId="1197590884614" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="1082978164219" id="1204742406467">
      <property name="name" nameId="tpck.1169194664001" value="AnnotationLinkCardinality" />
      <property name="memberIdentifierPolicy" nameId="1197591154882" value="derive_from_internal_value" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="annotation" />
      <link role="memberDataType" roleId="1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="1071489090640" id="1224240836180">
      <property name="name" nameId="tpck.1169194664001" value="DeprecatedNodeAnnotation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="deprecatedAnnotation" />
      <link role="extends" roleId="1071489389519" targetNodeId="tpck.3364660638048049748" resolveInfo="NodeAttribute" />
    </node>
    <node type="tpce.AnnotationLinkDeclaration" typeId="1149608206811" id="1224241293279">
      <property name="role" nameId="1204740973143" value="deprecatedNode" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="deprecatedAnnotation" />
      <link role="target" roleId="1204741097161" targetNodeId="1224240836180" resolveInfo="DeprecatedNodeAnnotation" />
      <link role="source" roleId="1149608246500" targetNodeId="1224848324737" resolveInfo="IStructureDeprecatable" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="1169125989551" id="1224848324737">
      <property name="name" nameId="tpck.1169194664001" value="IStructureDeprecatable" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="deprecatedAnnotation" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="1169125989551" id="2621449412040133764">
      <property name="name" nameId="tpck.1169194664001" value="IConceptAspect" />
    </node>
  </roots>
  <root id="1071489090640">
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="8339862546319981475">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.8339862546319981473" resolveInfo="final" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.StringConceptProperty" typeId="1105725638761" id="1194565364187">
      <property name="value" nameId="1105725733873" value="Concept" />
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1096454100552">
      <property name="name" nameId="tpck.1169194664001" value="rootable" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983657063" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1160488491229">
      <property name="name" nameId="tpck.1169194664001" value="iconPath" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1071489389519">
      <property name="sourceCardinality" nameId="1071599893252" value="0..1" />
      <property name="role" nameId="1071599776563" value="extends" />
      <link role="target" roleId="1071599976176" targetNodeId="1071489090640" resolveInfo="ConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1169129564478">
      <property name="sourceCardinality" nameId="1071599893252" value="0..n" />
      <property name="role" nameId="1071599776563" value="implements" />
      <property name="metaClass" nameId="1071599937831" value="aggregation" />
      <link role="target" roleId="1071599976176" targetNodeId="1169127622168" resolveInfo="InterfaceConceptReference" />
    </node>
  </root>
  <root id="1071489288298">
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1071599776563">
      <property name="name" nameId="tpck.1169194664001" value="role" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1071599937831">
      <property name="name" nameId="tpck.1169194664001" value="metaClass" />
      <link role="dataType" roleId="1082985295845" targetNodeId="1084199179703" resolveInfo="LinkMetaclass" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1071599893252">
      <property name="name" nameId="tpck.1169194664001" value="sourceCardinality" />
      <link role="dataType" roleId="1082985295845" targetNodeId="1084197782722" resolveInfo="Cardinality" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="3236994869861844876">
      <property name="name" nameId="tpck.1169194664001" value="doNotGenerate" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1071599698500">
      <property name="sourceCardinality" nameId="1071599893252" value="0..1" />
      <property name="role" nameId="1071599776563" value="specializedLink" />
      <link role="target" roleId="1071599976176" targetNodeId="1071489288298" resolveInfo="LinkDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1071599976176">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="target" />
      <link role="target" roleId="1071599976176" targetNodeId="1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="implements" roleId="1169129564478" type="tpce.InterfaceConceptReference" typeId="1169127622168" id="1227629144741">
      <link role="intfc" roleId="1169127628841" targetNodeId="1224848324737" resolveInfo="IStructureDeprecatable" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="8642756583111987067">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.8339862546319981473" resolveInfo="final" />
    </node>
  </root>
  <root id="1071489288299">
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="9026942911489198753">
      <property name="name" nameId="tpck.1169194664001" value="doNotGenerate" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="implements" roleId="1169129564478" type="tpce.InterfaceConceptReference" typeId="1169127622168" id="1169197677374">
      <link role="intfc" roleId="1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
    <node role="implements" roleId="1169129564478" type="tpce.InterfaceConceptReference" typeId="1169127622168" id="1224848433249">
      <link role="intfc" roleId="1169127628841" targetNodeId="1224848324737" resolveInfo="IDeprecatableStructure" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1082985295845">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="dataType" />
      <link role="target" roleId="1071599976176" targetNodeId="1082978164218" resolveInfo="DataTypeDeclaration" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="8642756583112042982">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.8339862546319981473" resolveInfo="final" />
    </node>
  </root>
  <root id="1082978164218">
    <node role="implements" roleId="1169129564478" type="tpce.InterfaceConceptReference" typeId="1169127622168" id="1173471269815">
      <link role="intfc" roleId="1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
  </root>
  <root id="1082978164219">
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1197591154882">
      <property name="name" nameId="tpck.1169194664001" value="memberIdentifierPolicy" />
      <link role="dataType" roleId="1082985295845" targetNodeId="1197590884613" resolveInfo="EnumerationMemberIdentifierPolicy" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1212080844762">
      <property name="name" nameId="tpck.1169194664001" value="hasNoDefaultMember" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1212087449254">
      <property name="name" nameId="tpck.1169194664001" value="noValueText" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1083171729157">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="memberDataType" />
      <link role="target" roleId="1071599976176" targetNodeId="1083243159079" resolveInfo="PrimitiveDataTypeDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1083241965437">
      <property name="sourceCardinality" nameId="1071599893252" value="0..1" />
      <property name="role" nameId="1071599776563" value="defaultMember" />
      <link role="target" roleId="1071599976176" targetNodeId="1083171877298" resolveInfo="EnumerationMemberDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1083172003582">
      <property name="sourceCardinality" nameId="1071599893252" value="1..n" />
      <property name="role" nameId="1071599776563" value="member" />
      <property name="metaClass" nameId="1071599937831" value="aggregation" />
      <link role="target" roleId="1071599976176" targetNodeId="1083171877298" resolveInfo="EnumerationMemberDeclaration" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.StringConceptProperty" typeId="1105725638761" id="1194565666568">
      <property name="value" nameId="1105725733873" value="Enum Data Type" />
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1082978499127">
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1083066089218">
      <property name="name" nameId="tpck.1169194664001" value="constraint" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.StringConceptProperty" typeId="1105725638761" id="1194565683319">
      <property name="value" nameId="1105725733873" value="Constrained Data Type" />
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1083171877298">
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1083923523171">
      <property name="name" nameId="tpck.1169194664001" value="internalValue" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1083923523172">
      <property name="name" nameId="tpck.1169194664001" value="externalValue" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1192116978809">
      <property name="name" nameId="tpck.1169194664001" value="javaIdentifier" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="1083243159079">
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="580435652281609061">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.8339862546319981473" resolveInfo="final" />
    </node>
  </root>
  <root id="1084197782722">
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1084197782723">
      <property name="internalValue" nameId="1083923523171" value="0..1" />
      <property name="externalValue" nameId="1083923523172" value="0..1" />
    </node>
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1084197782724">
      <property name="internalValue" nameId="1083923523171" value="1" />
      <property name="externalValue" nameId="1083923523172" value="1" />
    </node>
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1084197782725">
      <property name="externalValue" nameId="1083923523172" value="0..n" />
      <property name="internalValue" nameId="1083923523171" value="0..n" />
    </node>
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1084197782726">
      <property name="externalValue" nameId="1083923523172" value="1..n" />
      <property name="internalValue" nameId="1083923523171" value="1..n" />
    </node>
  </root>
  <root id="1084199179703">
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1084199179704">
      <property name="externalValue" nameId="1083923523172" value="reference" />
      <property name="internalValue" nameId="1083923523171" value="reference" />
    </node>
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1084199179705">
      <property name="externalValue" nameId="1083923523172" value="aggregation" />
      <property name="internalValue" nameId="1083923523171" value="aggregation" />
    </node>
  </root>
  <root id="1105725006687">
    <node role="implements" roleId="1169129564478" type="tpce.InterfaceConceptReference" typeId="1169127622168" id="1169198088508">
      <link role="intfc" roleId="1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
    <node role="implements" roleId="1169129564478" type="tpce.InterfaceConceptReference" typeId="1169127622168" id="1224848442599">
      <link role="intfc" roleId="1169127628841" targetNodeId="1224848324737" resolveInfo="IDeprecatableStructure" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="1131940019080">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473854053" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1218571350029">
      <property name="name" nameId="tpck.1169194664001" value="inheritable" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
  </root>
  <root id="1105725141344">
    <node role="conceptProperty" roleId="1105725339613" type="tpce.StringConceptProperty" typeId="1105725638761" id="1137469216124">
      <property name="value" nameId="1105725733873" value="integer" />
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="772617204766503689">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.8339862546319981473" resolveInfo="final" />
    </node>
  </root>
  <root id="1105725240314">
    <node role="conceptProperty" roleId="1105725339613" type="tpce.StringConceptProperty" typeId="1105725638761" id="1137469190995">
      <property name="value" nameId="1105725733873" value="boolean" />
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="772617204766503687">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.8339862546319981473" resolveInfo="final" />
    </node>
  </root>
  <root id="1105725281956">
    <node role="conceptProperty" roleId="1105725339613" type="tpce.StringConceptProperty" typeId="1105725638761" id="1137469231375">
      <property name="value" nameId="1105725733873" value="string" />
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="772617204766503691">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.8339862546319981473" resolveInfo="final" />
    </node>
  </root>
  <root id="1105725413739">
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="1150227364245">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473854053" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1105725439818">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="conceptPropertyDeclaration" />
      <link role="target" roleId="1071599976176" targetNodeId="1105725006687" resolveInfo="ConceptPropertyDeclaration" />
    </node>
  </root>
  <root id="1105725498741">
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1105725713309">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983657062" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1105725523273">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="integerConceptPropertyDeclaration" />
      <link role="target" roleId="1071599976176" targetNodeId="1105725141344" resolveInfo="IntegerConceptPropertyDeclaration" />
      <link role="specializedLink" roleId="1071599698500" targetNodeId="1105725439818" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="772617204766503638">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.8339862546319981473" resolveInfo="final" />
    </node>
  </root>
  <root id="1105725574259">
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1105725597978">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="booleanConceptPropertyDeclaration" />
      <link role="target" roleId="1071599976176" targetNodeId="1105725240314" resolveInfo="BooleanConceptPropertyDeclaration" />
      <link role="specializedLink" roleId="1071599698500" targetNodeId="1105725439818" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="772617204766503636">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.8339862546319981473" resolveInfo="final" />
    </node>
  </root>
  <root id="1105725638761">
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1105725733873">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1105725659058">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="stringConceptPropertyDeclaration" />
      <link role="specializedLink" roleId="1071599698500" targetNodeId="1105725439818" />
      <link role="target" roleId="1071599976176" targetNodeId="1105725281956" resolveInfo="StringConceptPropertyDeclaration" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="772617204766503637">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.8339862546319981473" resolveInfo="final" />
    </node>
  </root>
  <root id="1105736576531">
    <node role="implements" roleId="1169129564478" type="tpce.InterfaceConceptReference" typeId="1169127622168" id="1169197959642">
      <link role="intfc" roleId="1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
    <node role="implements" roleId="1169129564478" type="tpce.InterfaceConceptReference" typeId="1169127622168" id="1224848449418">
      <link role="intfc" roleId="1169127628841" targetNodeId="1224848324737" resolveInfo="IDeprecatableStructure" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="1137532397763">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473854053" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1105736621938">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="targetType" />
      <link role="target" roleId="1071599976176" targetNodeId="1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
  </root>
  <root id="1105736674127">
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="1142040108511">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473854053" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1105736734721">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="conceptLinkDeclaration" />
      <link role="target" roleId="1071599976176" targetNodeId="1105736576531" resolveInfo="ConceptLinkDeclaration" />
    </node>
  </root>
  <root id="1105736778597">
    <node role="conceptProperty" roleId="1105725339613" type="tpce.StringConceptProperty" typeId="1105725638761" id="1150228875552">
      <property name="value" nameId="1105725733873" value="&lt;{referenceConceptLinkDeclaration}&gt;" />
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1105742372452">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="referenceConceptLinkDeclaration" />
      <link role="specializedLink" roleId="1071599698500" targetNodeId="1105736734721" />
      <link role="target" roleId="1071599976176" targetNodeId="1105741578420" resolveInfo="ReferenceConceptLinkDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1105736807942">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="target" />
      <link role="target" roleId="1071599976176" targetNodeId="tpck.1133920641626" />
    </node>
  </root>
  <root id="1105736889287">
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1105742417828">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="aggregationConceptLinkDeclaration" />
      <link role="target" roleId="1071599976176" targetNodeId="1105741535888" resolveInfo="AggregationConceptLinkDeclaration" />
      <link role="specializedLink" roleId="1071599698500" targetNodeId="1105736734721" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1105736901241">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="target" />
      <property name="metaClass" nameId="1071599937831" value="aggregation" />
      <link role="target" roleId="1071599976176" targetNodeId="tpck.1133920641626" />
    </node>
  </root>
  <root id="1105741535888">
    <node role="conceptProperty" roleId="1105725339613" type="tpce.StringConceptProperty" typeId="1105725638761" id="1137532980164">
      <property name="value" nameId="1105725733873" value="aggregation" />
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
  </root>
  <root id="1105741578420">
    <node role="conceptProperty" roleId="1105725339613" type="tpce.StringConceptProperty" typeId="1105725638761" id="1137533021041">
      <property name="value" nameId="1105725733873" value="reference" />
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
  </root>
  <root id="1149608206811">
    <node role="implements" roleId="1169129564478" type="tpce.InterfaceConceptReference" typeId="1169127622168" id="1174387216526">
      <link role="intfc" roleId="1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1204740973143">
      <property name="name" nameId="tpck.1169194664001" value="role" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1149608445162">
      <property name="name" nameId="tpck.1169194664001" value="stereotype" />
      <link role="dataType" roleId="1082985295845" targetNodeId="1149608316235" resolveInfo="AnnotationLinkStereotype" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1204741022738">
      <property name="name" nameId="tpck.1169194664001" value="sourceCardinality" />
      <link role="dataType" roleId="1082985295845" targetNodeId="1204742406467" resolveInfo="AnnotationLinkCardinality" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1149608246500">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="source" />
      <link role="target" roleId="1071599976176" targetNodeId="1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1204741097161">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="target" />
      <link role="target" roleId="1071599976176" targetNodeId="1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="1174386183942">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473994950" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.StringConceptProperty" typeId="1105725638761" id="1194565744884">
      <property name="value" nameId="1105725733873" value="Annotation Link" />
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="1224240836180" id="6740862279712728259" />
  </root>
  <root id="1149608316235">
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1149608364144">
      <property name="externalValue" nameId="1083923523172" value="node" />
      <property name="internalValue" nameId="1083923523171" value="node" />
    </node>
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1149608316236">
      <property name="externalValue" nameId="1083923523172" value="link" />
      <property name="internalValue" nameId="1083923523171" value="link" />
    </node>
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1149608344284">
      <property name="externalValue" nameId="1083923523172" value="property" />
      <property name="internalValue" nameId="1083923523171" value="property" />
    </node>
  </root>
  <root id="1169125787135">
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="2465654535473034588">
      <property name="name" nameId="tpck.1169194664001" value="helpURL" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="implements" roleId="1169129564478" type="tpce.InterfaceConceptReference" typeId="1169127622168" id="1169197806875">
      <link role="intfc" roleId="1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
    <node role="implements" roleId="1169129564478" type="tpce.InterfaceConceptReference" typeId="1169127622168" id="1224848455018">
      <link role="intfc" roleId="1169127628841" targetNodeId="1224848324737" resolveInfo="IDeprecatableStructure" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="1169125985753">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473854053" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1071489727083">
      <property name="sourceCardinality" nameId="1071599893252" value="0..n" />
      <property name="role" nameId="1071599776563" value="linkDeclaration" />
      <property name="metaClass" nameId="1071599937831" value="aggregation" />
      <link role="target" roleId="1071599976176" targetNodeId="1071489288298" resolveInfo="LinkDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1071489727084">
      <property name="sourceCardinality" nameId="1071599893252" value="0..n" />
      <property name="role" nameId="1071599776563" value="propertyDeclaration" />
      <property name="metaClass" nameId="1071599937831" value="aggregation" />
      <link role="target" roleId="1071599976176" targetNodeId="1071489288299" resolveInfo="PropertyDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1105725339613">
      <property name="sourceCardinality" nameId="1071599893252" value="0..n" />
      <property name="role" nameId="1071599776563" value="conceptProperty" />
      <property name="metaClass" nameId="1071599937831" value="aggregation" />
      <link role="target" roleId="1071599976176" targetNodeId="1105725413739" resolveInfo="ConceptProperty" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1105736949336">
      <property name="sourceCardinality" nameId="1071599893252" value="0..n" />
      <property name="role" nameId="1071599776563" value="conceptLink" />
      <property name="metaClass" nameId="1071599937831" value="aggregation" />
      <link role="target" roleId="1071599976176" targetNodeId="1105736674127" resolveInfo="ConceptLink" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1137467167200">
      <property name="sourceCardinality" nameId="1071599893252" value="0..n" />
      <property name="role" nameId="1071599776563" value="conceptPropertyDeclaration" />
      <property name="metaClass" nameId="1071599937831" value="aggregation" />
      <link role="target" roleId="1071599976176" targetNodeId="1105725006687" resolveInfo="ConceptPropertyDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1137532086877">
      <property name="sourceCardinality" nameId="1071599893252" value="0..n" />
      <property name="role" nameId="1071599776563" value="conceptLinkDeclaration" />
      <property name="metaClass" nameId="1071599937831" value="aggregation" />
      <link role="target" roleId="1071599976176" targetNodeId="1105736576531" resolveInfo="ConceptLinkDeclaration" />
    </node>
  </root>
  <root id="1169125989551">
    <node role="conceptProperty" roleId="1105725339613" type="tpce.BooleanConceptProperty" typeId="1105725574259" id="8339862546319981477">
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.8339862546319981473" resolveInfo="final" />
    </node>
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1169127546356">
      <property name="metaClass" nameId="1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="1071599893252" value="0..n" />
      <property name="role" nameId="1071599776563" value="extends" />
      <link role="target" roleId="1071599976176" targetNodeId="1169127622168" resolveInfo="InterfaceConceptReference" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.StringConceptProperty" typeId="1105725638761" id="1169126267841">
      <property name="value" nameId="1105725733873" value="Interface Concept" />
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
  </root>
  <root id="1169127622168">
    <node role="linkDeclaration" roleId="1071489727083" type="tpce.LinkDeclaration" typeId="1071489288298" id="1169127628841">
      <property name="sourceCardinality" nameId="1071599893252" value="1" />
      <property name="role" nameId="1071599776563" value="intfc" />
      <link role="target" roleId="1071599976176" targetNodeId="1169125989551" resolveInfo="InterfaceConceptDeclaration" />
    </node>
  </root>
  <root id="1197590884613">
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1197590884614">
      <property name="externalValue" nameId="1083923523172" value="derive from presentation" />
      <property name="internalValue" nameId="1083923523171" value="derive_from_presentation" />
    </node>
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1197591048630">
      <property name="externalValue" nameId="1083923523172" value="derive from internal value" />
      <property name="internalValue" nameId="1083923523171" value="derive_from_internal_value" />
    </node>
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1197591075491">
      <property name="externalValue" nameId="1083923523172" value="custom" />
      <property name="internalValue" nameId="1083923523171" value="custom" />
    </node>
  </root>
  <root id="1204742406467">
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1204742406468">
      <property name="internalValue" nameId="1083923523171" value="0..1" />
      <property name="externalValue" nameId="1083923523172" value="1" />
    </node>
    <node role="member" roleId="1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="1083171877298" id="1204742457437">
      <property name="internalValue" nameId="1083923523171" value="0..n" />
      <property name="externalValue" nameId="1083923523172" value="*" />
    </node>
  </root>
  <root id="1224240836180">
    <node role="implements" roleId="1169129564478" type="tpce.InterfaceConceptReference" typeId="1169127622168" id="1224240859229">
      <link role="intfc" roleId="1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1225118929411">
      <property name="name" nameId="tpck.1169194664001" value="build" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="1071489727084" type="tpce.PropertyDeclaration" typeId="1071489288299" id="1225118933224">
      <property name="name" nameId="tpck.1169194664001" value="comment" />
      <link role="dataType" roleId="1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="1105725339613" type="tpce.StringConceptProperty" typeId="1105725638761" id="5216537374825317499">
      <property name="value" nameId="1105725733873" value="deprecatedNode" />
      <link role="conceptPropertyDeclaration" roleId="1105725439818" targetNodeId="tpck.5169995583184591164" resolveInfo="role" />
    </node>
    <node role="conceptLink" roleId="1105736949336" type="tpce.ReferenceConceptLink" typeId="1105736778597" id="5216537374825317500">
      <link role="conceptLinkDeclaration" roleId="1105736734721" targetNodeId="tpck.5169995583184591169" resolveInfo="attributed" />
      <link role="target" roleId="1105736807942" targetNodeId="1224848324737" resolveInfo="IStructureDeprecatable" />
    </node>
  </root>
  <root id="1224241293279" />
  <root id="1224848324737">
    <node role="extends" roleId="1169127546356" type="tpce.InterfaceConceptReference" typeId="1169127622168" id="1224848346098">
      <link role="intfc" roleId="1169127628841" targetNodeId="tpck.1224608834445" resolveInfo="IDeprecatable" />
    </node>
  </root>
  <root id="2621449412040133764" />
</model>

