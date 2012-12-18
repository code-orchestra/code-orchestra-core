<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpce.PrimitiveDataTypeDeclaration" typeId="tpce.1083243159079" id="1082983041843">
      <property name="name" nameId="1169194664001" value="string" />
    </node>
    <node type="tpce.PrimitiveDataTypeDeclaration" typeId="tpce.1083243159079" id="1082983657062">
      <property name="name" nameId="1169194664001" value="integer" />
    </node>
    <node type="tpce.PrimitiveDataTypeDeclaration" typeId="tpce.1083243159079" id="1082983657063">
      <property name="name" nameId="1169194664001" value="boolean" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1133920641626">
      <property name="name" nameId="1169194664001" value="BaseConcept" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1169194658468">
      <property name="name" nameId="1169194664001" value="INamedConcept" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1196978630214">
      <property name="name" nameId="1169194664001" value="IResolveInfo" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1221647093812">
      <property name="name" nameId="1169194664001" value="IWrapper" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1224608834445">
      <property name="name" nameId="1169194664001" value="IDeprecatable" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1233160296597">
      <property name="name" nameId="1169194664001" value="IContainer" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1234971358450">
      <property name="name" nameId="1169194664001" value="IType" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="201537367881071930">
      <property name="name" nameId="1169194664001" value="IMetaLevelChanger" />
    </node>
    <node type="tpce.AnnotationLinkDeclaration" typeId="tpce.1149608206811" id="376024488709664661">
      <property name="role" nameId="tpce.1204740973143" value="export" />
      <property name="stereotype" nameId="tpce.1149608445162" value="node" />
      <property name="virtualPackage" nameId="1193676396447" value="export" />
      <link role="source" roleId="tpce.1149608246500" targetNodeId="1133920641626" resolveInfo="BaseConcept" />
      <link role="target" roleId="tpce.1204741097161" targetNodeId="5425021671150136555" resolveInfo="ExportScope" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5425021671150136555">
      <property name="name" nameId="1169194664001" value="ExportScope" />
      <property name="virtualPackage" nameId="1193676396447" value="export" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3364660638048049748" resolveInfo="NodeAttribute" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2565736246230036150">
      <property name="name" nameId="1169194664001" value="ExportScopePublic" />
      <property name="virtualPackage" nameId="1193676396447" value="export" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5425021671150136555" resolveInfo="ExportScope" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2565736246230036151">
      <property name="name" nameId="1169194664001" value="ExportScopeNamespace" />
      <property name="virtualPackage" nameId="1193676396447" value="export" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5425021671150136555" resolveInfo="ExportScope" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2565736246230036154">
      <property name="name" nameId="1169194664001" value="ExportScopeModule" />
      <property name="virtualPackage" nameId="1193676396447" value="export" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5425021671150136555" resolveInfo="ExportScope" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5169995583184591161">
      <property name="name" nameId="1169194664001" value="Attribute" />
      <property name="iconPath" nameId="tpce.1160488491229" value="${mps_home}/core/languageDesign/structure/icons/annotationLink.png" />
      <property name="virtualPackage" nameId="1193676396447" value="attributes" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3364660638048049745">
      <property name="virtualPackage" nameId="1193676396447" value="attributes" />
      <property name="name" nameId="1169194664001" value="LinkAttribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5169995583184591161" resolveInfo="Attribute" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3364660638048049748">
      <property name="virtualPackage" nameId="1193676396447" value="attributes" />
      <property name="name" nameId="1169194664001" value="NodeAttribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5169995583184591161" resolveInfo="Attribute" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3364660638048049750">
      <property name="virtualPackage" nameId="1193676396447" value="attributes" />
      <property name="name" nameId="1169194664001" value="PropertyAttribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5169995583184591161" resolveInfo="Attribute" />
    </node>
  </roots>
  <root id="1082983041843" />
  <root id="1082983657062" />
  <root id="1082983657063" />
  <root id="1133920641626">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5169995583184591170">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="smodelAttribute" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="5169995583184591161" resolveInfo="Attribute" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1156234966388">
      <property name="name" nameId="1169194664001" value="shortDescription" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1156235010670">
      <property name="name" nameId="1169194664001" value="alias" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1193676396447">
      <property name="name" nameId="1169194664001" value="virtualPackage" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="1137473854053">
      <property name="name" nameId="1169194664001" value="abstract" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="8339862546319981473">
      <property name="name" nameId="1169194664001" value="final" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="1137473891462">
      <property name="name" nameId="1169194664001" value="alias" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="1137473914776">
      <property name="name" nameId="1169194664001" value="shortDescription" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="1137473994950">
      <property name="name" nameId="1169194664001" value="dontSubstituteByDefault" />
      <property name="inheritable" nameId="tpce.1218571350029" value="true" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="1218562853918">
      <property name="name" nameId="1169194664001" value="deprecated104" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="6293714305936158372">
      <property name="name" nameId="1169194664001" value="substituteInAmbigousPosition" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1133922314101">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="1169194658468">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1169194664001">
      <property name="name" nameId="1169194664001" value="name" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="1196978630214">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1196978656277">
      <property name="name" nameId="1169194664001" value="resolveInfo" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="1221647093812" />
  <root id="1224608834445" />
  <root id="1233160296597" />
  <root id="1234971358450" />
  <root id="201537367881071930" />
  <root id="376024488709664661">
    <node role="smodelAttribute" roleId="5169995583184591170" type="tpck.ExportScopePublic" typeId="2565736246230036150" id="9136532523118437100" />
  </root>
  <root id="5425021671150136555">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="4075196924244385128">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1137473854053" resolveInfo="abstract" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5216537374825317521">
      <property name="value" nameId="tpce.1105725733873" value="export" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="5169995583184591164" resolveInfo="role" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="5216537374825317522">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="5169995583184591169" resolveInfo="attributed" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="1133920641626" resolveInfo="BaseConcept" />
    </node>
  </root>
  <root id="2565736246230036150">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4075196924244376958">
      <property name="value" nameId="tpce.1105725733873" value="@export(public)" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1137473891462" resolveInfo="alias" />
    </node>
    <node role="smodelAttribute" roleId="5169995583184591170" type="tpck.ExportScopePublic" typeId="2565736246230036150" id="4075196924244431954" />
  </root>
  <root id="2565736246230036151">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4075196924244376960">
      <property name="value" nameId="tpce.1105725733873" value="@export(namespace)" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1137473891462" resolveInfo="alias" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="2565736246230036153">
      <property name="name" nameId="1169194664001" value="namespace" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1082983041843" resolveInfo="string" />
    </node>
    <node role="smodelAttribute" roleId="5169995583184591170" type="tpck.ExportScopePublic" typeId="2565736246230036150" id="4075196924244431953" />
  </root>
  <root id="2565736246230036154">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4075196924244376956">
      <property name="value" nameId="tpce.1105725733873" value="@export(module)" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1137473891462" resolveInfo="alias" />
    </node>
    <node role="smodelAttribute" roleId="5169995583184591170" type="tpck.ExportScopePublic" typeId="2565736246230036150" id="4075196924244431952" />
  </root>
  <root id="5169995583184591161">
    <node role="conceptLinkDeclaration" roleId="tpce.1137532086877" type="tpce.ReferenceConceptLinkDeclaration" typeId="tpce.1105741578420" id="5169995583184591169">
      <property name="name" nameId="1169194664001" value="attributed" />
      <link role="targetType" roleId="tpce.1105736621938" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="5169995583184591164">
      <property name="name" nameId="1169194664001" value="role" />
      <property name="inheritable" nameId="tpce.1218571350029" value="true" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.BooleanConceptPropertyDeclaration" typeId="tpce.1105725240314" id="5169995583184591167">
      <property name="name" nameId="1169194664001" value="multiple" />
      <property name="inheritable" nameId="tpce.1218571350029" value="true" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="5169995583184591165">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="3364660638048049745">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1757699476691236116">
      <property name="name" nameId="1169194664001" value="linkRole" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="3364660638048049748" />
  <root id="3364660638048049750">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1757699476691236117">
      <property name="name" nameId="1169194664001" value="propertyName" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1082983041843" resolveInfo="string" />
    </node>
  </root>
</model>

