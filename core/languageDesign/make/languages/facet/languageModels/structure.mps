<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:b16ff46d-fa06-479d-9f5c-5b6e17e7f1b2(jetbrains.mps.make.facet.structure)" version="1">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <language namespace="696c1165-4a59-463b-bc5d-902caab85dd0(jetbrains.mps.make.facet)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="cx9y" modelUID="r:309aeee7-bee8-445c-b31d-35928d1da75f(jetbrains.mps.baseLanguage.tuples.structure)" version="2" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="q9ra" modelUID="r:308041c6-80bc-4e26-b4b1-473fd45c9339(jetbrains.mps.make.script.structure)" version="-1" implicit="yes" />
  <import index="vvvw" modelUID="r:b16ff46d-fa06-479d-9f5c-5b6e17e7f1b2(jetbrains.mps.make.facet.structure)" version="1" implicit="yes" />
  <roots>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="6418371274763029521">
      <property name="name" nameId="tpck.1169194664001" value="IFacet" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="facet" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6418371274763029523">
      <property name="name" nameId="tpck.1169194664001" value="FacetDeclaration" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="facet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6418371274763029565">
      <property name="name" nameId="tpck.1169194664001" value="TargetDeclaration" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="target" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6418371274763029600">
      <property name="name" nameId="tpck.1169194664001" value="TargetDependency" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="target" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6447445394688422642">
      <property name="name" nameId="tpck.1169194664001" value="FacetReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="facet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6447445394688555033">
      <property name="name" nameId="tpck.1169194664001" value="ExtendsFacetReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="facet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="6447445394688422642" resolveInfo="FacetReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8351679702044320297">
      <property name="name" nameId="tpck.1169194664001" value="RelatedFacetReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="facet" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="6447445394688422642" resolveInfo="FacetReference" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="8351679702044326370">
      <property name="name" nameId="tpck.1169194664001" value="TargetDependencyQualifier" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="target" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7320828025189345662">
      <property name="name" nameId="tpck.1169194664001" value="ParametersDeclaration" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="target" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="cx9y.1239360506533" resolveInfo="NamedTupleDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7320828025189375154">
      <property name="name" nameId="tpck.1169194664001" value="LocalParametersExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="target" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7320828025189375155">
      <property name="name" nameId="tpck.1169194664001" value="LocalParametersComponentExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="target" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1197027756228" resolveInfo="DotExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3344436107830227888">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="target" />
      <property name="name" nameId="tpck.1169194664001" value="ForeignParametersExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3344436107830227889">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="target" />
      <property name="name" nameId="tpck.1169194664001" value="ForeignParametersComponentExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1197027756228" resolveInfo="DotExpression" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1675547159918562083">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="target" />
      <property name="name" nameId="tpck.1169194664001" value="ResourcesPolicy" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="119022571401949652">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="target" />
      <property name="name" nameId="tpck.1169194664001" value="ResourceTypeDeclaration" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="119022571402207412">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="target" />
      <property name="name" nameId="tpck.1169194664001" value="ResourceClassifierType" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107535904670" resolveInfo="ClassifierType" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7178445679340358576">
      <property name="name" nameId="tpck.1169194664001" value="FacetReferenceExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1919086248986845077">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="facet" />
      <property name="name" nameId="tpck.1169194664001" value="NamedFacetReference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="6447445394688422642" resolveInfo="FacetReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2191561637326275574">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="target" />
      <property name="name" nameId="tpck.1169194664001" value="ResourceSpecificPropertiesExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="2191561637326275576">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="target" />
      <property name="name" nameId="tpck.1169194664001" value="IPropertyExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8703512757937156087">
      <property name="name" nameId="tpck.1169194664001" value="TargetReferenceExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </roots>
  <root id="6418371274763029521" />
  <root id="6418371274763029523">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8853708281362095877">
      <property name="value" nameId="tpce.1105725733873" value="Facet" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6447445394688422654">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="extended" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6447445394688555033" resolveInfo="ExtendsFacetReference" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6447445394688422656">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="required" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8351679702044320297" resolveInfo="RelatedFacetReference" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6447445394688422657">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="optional" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8351679702044320297" resolveInfo="RelatedFacetReference" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6418371274763146558">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="targetDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6418371274763029565" resolveInfo="TargetDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="6418371274763029524">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="8853708281361928947">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpee.4609636120081351393" resolveInfo="IWillBeClassifier" />
    </node>
  </root>
  <root id="6418371274763029565">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1675547159918562088">
      <property name="name" nameId="tpck.1169194664001" value="resourcesPolicy" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1675547159918562083" resolveInfo="ResourcesPolicy" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7320828025189219295">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="parameters" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7320828025189345662" resolveInfo="ParametersDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6418371274763146553">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="dependency" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6418371274763029600" resolveInfo="TargetDependency" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2360002718792633290">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="job" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="q9ra.505095865854384109" resolveInfo="JobDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="119022571401949664">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="input" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="119022571401949652" resolveInfo="ResourceTypeDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="119022571401949665">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="output" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="119022571401949652" resolveInfo="ResourceTypeDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6418371274763029589">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="overrides" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6418371274763029565" resolveInfo="TargetDeclaration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="6418371274763029566">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
  </root>
  <root id="6418371274763029600">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="8351679702044326377">
      <property name="name" nameId="tpck.1169194664001" value="qualifier" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="8351679702044326370" resolveInfo="TargetDependencyQualifier" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6418371274763029603">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="dependsOn" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6418371274763029565" resolveInfo="TargetDeclaration" />
    </node>
  </root>
  <root id="6447445394688422642">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6447445394688422643">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="facet" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6418371274763029523" resolveInfo="FacetDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="8351679702044320296">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="6447445394688555033" />
  <root id="8351679702044320297" />
  <root id="8351679702044326370">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="8351679702044326371">
      <property name="internalValue" nameId="tpce.1083923523171" value="BEFORE" />
      <property name="externalValue" nameId="tpce.1083923523172" value="before" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="8351679702044326373">
      <property name="internalValue" nameId="tpce.1083923523171" value="NOT_BEFORE" />
      <property name="externalValue" nameId="tpce.1083923523172" value="not before" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="8351679702044326374">
      <property name="internalValue" nameId="tpce.1083923523171" value="AFTER" />
      <property name="externalValue" nameId="tpce.1083923523172" value="after" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="8351679702044326375">
      <property name="internalValue" nameId="tpce.1083923523171" value="NOT_AFTER" />
      <property name="externalValue" nameId="tpce.1083923523172" value="not after" />
    </node>
  </root>
  <root id="7320828025189345662">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7320828025189357540">
      <property name="value" nameId="tpce.1105725733873" value="&lt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="cx9y.1239546091267" resolveInfo="leftBracket" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7320828025189357542">
      <property name="value" nameId="tpce.1105725733873" value="&gt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="cx9y.1239546098880" resolveInfo="rightBracket" />
    </node>
  </root>
  <root id="7320828025189375154">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="7320828025189444082">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="7320828025189375155">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7320828025189375156">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="expression" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="tpee.1197027771414" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7320828025189375154" resolveInfo="LocalParametersExpression" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="8170824575195200901">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="2191561637326275576" resolveInfo="IPropertyExpression" />
    </node>
  </root>
  <root id="3344436107830227888">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3344436107830227902">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="target" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6418371274763029565" resolveInfo="TargetDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3344436107830276804">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="3344436107830227889">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3344436107830227890">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="expression" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3344436107830227888" resolveInfo="ForeignParametersExpression" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="tpee.1197027771414" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="8170824575195200900">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="2191561637326275576" resolveInfo="IPropertyExpression" />
    </node>
  </root>
  <root id="1675547159918562083">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1675547159918562084">
      <property name="internalValue" nameId="tpce.1083923523171" value="TRANSFORM" />
      <property name="externalValue" nameId="tpce.1083923523172" value="transform" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1675547159918562085">
      <property name="internalValue" nameId="tpce.1083923523171" value="PASSTHRU" />
      <property name="externalValue" nameId="tpce.1083923523172" value="pass through" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1675547159918562086">
      <property name="internalValue" nameId="tpce.1083923523171" value="CONSUME" />
      <property name="externalValue" nameId="tpce.1083923523172" value="consume" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1675547159918562087">
      <property name="internalValue" nameId="tpce.1083923523171" value="PRODUCE" />
      <property name="externalValue" nameId="tpce.1083923523172" value="produce" />
    </node>
  </root>
  <root id="119022571401949652">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="119022571401949655">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="resourceType" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="119022571402207412" resolveInfo="ResourceClassifierType" />
    </node>
  </root>
  <root id="119022571402207412">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="119022571402207413">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="resource" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="tpee.1107535924139" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1107461130800" resolveInfo="Classifier" />
    </node>
  </root>
  <root id="7178445679340358576">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7178445679340358578">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="reference" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1919086248986845077" resolveInfo="NamedFacetReference" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1919086248986855434">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpee.1241531154556" resolveInfo="legalAsStatement" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="6085445418775248849">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1919086248986845077" />
  <root id="2191561637326275574">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2191561637326275575">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="properties" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="2191561637326275576" resolveInfo="IPropertyExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2191561637326275592">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="resource" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="2191561637326275576">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8170824575195151990">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="resource" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="8703512757937156087">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8703512757937161148">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="target" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6418371274763029565" resolveInfo="TargetDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8703512757937161134">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="facetRef" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="7178445679340358576" resolveInfo="FacetReferenceExpression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="8703512757937161157">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpee.1241531154556" resolveInfo="legalAsStatement" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="8703512757937161159">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
</model>

