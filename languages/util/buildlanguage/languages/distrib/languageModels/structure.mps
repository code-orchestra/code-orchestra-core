<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:3ffa047e-f111-477c-9b1d-805bb060825a(jetbrains.mps.build.distrib.structure)" version="0">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tps4" modelUID="r:00000000-0000-4000-0000-011c895904d8(jetbrains.mps.build.packaging.structure)" version="8" />
  <import index="tpsk" modelUID="r:00000000-0000-4000-0000-011c895904c8(jetbrains.mps.buildlanguage.structure)" version="21" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="60oz" modelUID="r:3ffa047e-f111-477c-9b1d-805bb060825a(jetbrains.mps.build.distrib.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1230056066379">
      <property name="name" nameId="tpck.1169194664001" value="DistribConfiguration" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1230059161510">
      <property name="name" nameId="tpck.1169194664001" value="ClassPath" />
      <property name="rootable" nameId="tpce.1096454100552" value="false" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="classpath" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1230059161512">
      <property name="name" nameId="tpck.1169194664001" value="AbstractPath" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="classpath" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1230059161514">
      <property name="name" nameId="tpck.1169194664001" value="SimplePath" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="classpath" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1230059161512" resolveInfo="AbstractPath" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1230207207601">
      <property name="name" nameId="tpck.1169194664001" value="SystemSpecificConfig" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1230207753430">
      <property name="name" nameId="tpck.1169194664001" value="WindowsConfig" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="systemSpecific.windows" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1230207207601" resolveInfo="SystemSpecificConfig" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1230292331281">
      <property name="name" nameId="tpck.1169194664001" value="UniversalConfig" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="systemSpecific" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1230207207601" resolveInfo="SystemSpecificConfig" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1231848405646">
      <property name="name" nameId="tpck.1169194664001" value="DigitalSignatureWindowsConfiguration" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="systemSpecific.windows" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1231859852975">
      <property name="name" nameId="tpck.1169194664001" value="AbstractCommandLinePart" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="systemSpecific.windows" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1231859958652">
      <property name="name" nameId="tpck.1169194664001" value="StringCommandLinePart" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="systemSpecific.windows" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1231859852975" resolveInfo="AbstractCommandLinePart" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1231860019901">
      <property name="name" nameId="tpck.1169194664001" value="ArtifactReferenceCommandLinePart" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="systemSpecific.windows" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1231859852975" resolveInfo="AbstractCommandLinePart" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1233939045984">
      <property name="name" nameId="tpck.1169194664001" value="MacConfig" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="systemSpecific" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1230207207601" resolveInfo="SystemSpecificConfig" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1234515156408">
      <property name="name" nameId="tpck.1169194664001" value="ExternalVariableReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="systemSpecific" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpsk.1196851952934" resolveInfo="PropertyValueExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1234543390854">
      <property name="name" nameId="tpck.1169194664001" value="FileAssociation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="systemSpecific" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1234544102398">
      <property name="name" nameId="tpck.1169194664001" value="MacOsFileAssociation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="systemSpecific" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1234543390854" resolveInfo="FileAssociation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1234544143490">
      <property name="name" nameId="tpck.1169194664001" value="Role" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="systemSpecific" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1238070714613">
      <property name="name" nameId="tpck.1169194664001" value="PathCommantLinePart" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="systemSpecific.windows" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1231859852975" resolveInfo="AbstractCommandLinePart" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1241440443288">
      <property name="name" nameId="tpck.1169194664001" value="UnixConfig" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="systemSpecific" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1230207207601" resolveInfo="SystemSpecificConfig" />
    </node>
  </roots>
  <root id="1230056066379">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1230216533585">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="buildScriptConfiguration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1204115658627" resolveInfo="Configuration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1230293684459">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="projectFolder" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1203598512427" resolveInfo="Folder" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234784278747">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="shortName" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1205339194346" resolveInfo="IStringExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234784294876">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="longName" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1205339194346" resolveInfo="IStringExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234784329127">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="releaseVersion" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1205339194346" resolveInfo="IStringExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234784309457">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="buildVersion" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1205339194346" resolveInfo="IStringExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234786563468">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="company" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1205339194346" resolveInfo="IStringExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234787338210">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="webSite" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1205339194346" resolveInfo="IStringExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1230059446051">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="classPath" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1230059161510" resolveInfo="ClassPath" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1230207493185">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="systemSpecificConfig" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1230207207601" resolveInfo="SystemSpecificConfig" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1231848554347">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="startupDirectory" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1230059161512" resolveInfo="AbstractPath" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1231848671127">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="vmOptionsDir" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1230059161512" resolveInfo="AbstractPath" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1230056405379">
      <property name="value" nameId="tpce.1105725733873" value="distribution configuration" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1230056399938">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1234871158456">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tps4.1234864659795" resolveInfo="IVariableHolder" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1234970506509">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tps4.1234968728594" resolveInfo="IMacroHolder" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1230058022109">
      <property name="name" nameId="tpck.1169194664001" value="startupClass" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1231691563959">
      <property name="name" nameId="tpck.1169194664001" value="useVMOptionsFile" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1231691593776">
      <property name="name" nameId="tpck.1169194664001" value="defaultVMOptions" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1240321503907">
      <property name="name" nameId="tpck.1169194664001" value="additionalVMOptions" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpck.ExportScopeNamespace" typeId="tpck.2565736246230036151" id="144296692409136173">
      <property name="namespace" nameId="tpck.2565736246230036153" value="jetbrains.mps" />
    </node>
  </root>
  <root id="1230059161510">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1230059161511">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="classPathItem" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1230059161512" resolveInfo="AbstractPath" />
    </node>
  </root>
  <root id="1230059161512">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1230059161513">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="1230059161514">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1230059161515">
      <property name="name" nameId="tpck.1169194664001" value="path" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="1230207207601">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1230207288694">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1230207299135">
      <property name="value" nameId="tpce.1105725733873" value="system specific config" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="1230207324294">
      <property name="name" nameId="tpck.1169194664001" value="operatingSystem" />
      <property name="inheritable" nameId="tpce.1218571350029" value="true" />
    </node>
    <node role="conceptPropertyDeclaration" roleId="tpce.1137467167200" type="tpce.StringConceptPropertyDeclaration" typeId="tpce.1105725281956" id="1231769310934">
      <property name="name" nameId="tpck.1169194664001" value="pathSeparator" />
      <property name="inheritable" nameId="tpce.1218571350029" value="true" />
    </node>
  </root>
  <root id="1230207753430">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1230208346120">
      <property name="value" nameId="tpce.1105725733873" value="windows" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1230207768490">
      <property name="value" nameId="tpce.1105725733873" value="windows" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1230207324294" resolveInfo="operatingSystem" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1231769745334">
      <property name="value" nameId="tpce.1105725733873" value="\" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1231769310934" resolveInfo="pathSeparator" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234790749272">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="license" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1233321544558" resolveInfo="IPath" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1231848713325">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="pathToNsisZipFile" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1233321544558" resolveInfo="IPath" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234795184694">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="applicationIcon" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1233321544558" resolveInfo="IPath" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234795196738">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="homepageIcon" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1233321544558" resolveInfo="IPath" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1240556282503">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="installerIcon" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1233321544558" resolveInfo="IPath" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1240556295367">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="uninstallerIcon" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1233321544558" resolveInfo="IPath" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1238075486867">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="embeddedJrePath" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1233321544558" resolveInfo="IPath" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1231856017880">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="signatureConfiguration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1231848405646" resolveInfo="DigitalSignatureWindowsConfiguration" />
    </node>
  </root>
  <root id="1230292331281">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1230292394720">
      <property name="value" nameId="tpce.1105725733873" value="universal" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1230207324294" resolveInfo="operatingSystem" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1230292555791">
      <property name="value" nameId="tpce.1105725733873" value="universal" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1231769761796">
      <property name="value" nameId="tpce.1105725733873" value="/" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1231769310934" resolveInfo="pathSeparator" />
    </node>
  </root>
  <root id="1231848405646">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1231859196186">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="pathToExecutable" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1233321544558" resolveInfo="IPath" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1231859334762">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="commandLine" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1231859852975" resolveInfo="AbstractCommandLinePart" />
    </node>
  </root>
  <root id="1231859852975">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1231859948220">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="1231859958652">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1231861633100">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1231862317747">
      <property name="value" nameId="tpce.1105725733873" value="simple text" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1231860019901">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1231861683501">
      <property name="value" nameId="tpce.1105725733873" value="artifact reference" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1231861704471">
      <property name="value" nameId="tpce.1105725733873" value="reference to file, generated by nsis" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="1233939045984">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1233939070858">
      <property name="value" nameId="tpce.1105725733873" value="mac os" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1233939080686">
      <property name="value" nameId="tpce.1105725733873" value="macos" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1230207324294" resolveInfo="operatingSystem" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1233939103517">
      <property name="value" nameId="tpce.1105725733873" value="/" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1231769310934" resolveInfo="pathSeparator" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234512917007">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="iconPath" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1233321544558" resolveInfo="IPath" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234535772720">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="javaApplicationStubPath" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1233321544558" resolveInfo="IPath" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234544418896">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="association" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1234544102398" resolveInfo="MacOsFileAssociation" />
    </node>
  </root>
  <root id="1234515156408">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1234515167308">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tps4.1205339194346" resolveInfo="IStringExpression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234515169991">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="variable" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1205335290326" resolveInfo="Variable" />
    </node>
  </root>
  <root id="1234543390854">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234543961966">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="icon" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1233321544558" resolveInfo="IPath" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1234543956343">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1234544065816">
      <property name="name" nameId="tpck.1169194664001" value="extensions" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1234544216254">
      <property name="value" nameId="tpce.1105725733873" value="file association" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1234544102398">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234544190921">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="role" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1234544143490" resolveInfo="Role" />
    </node>
  </root>
  <root id="1234544143490">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1234544164749">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
  </root>
  <root id="1238070714613">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1238070747265">
      <property name="value" nameId="tpce.1105725733873" value="path" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1238070735094">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="path" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1220973916698" resolveInfo="Path" />
    </node>
  </root>
  <root id="1241440443288">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1241440481672">
      <property name="value" nameId="tpce.1105725733873" value="unix" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1230207324294" resolveInfo="operatingSystem" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1241440481674">
      <property name="value" nameId="tpce.1105725733873" value="unix" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1241440481675">
      <property name="value" nameId="tpce.1105725733873" value="/" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="1231769310934" resolveInfo="pathSeparator" />
    </node>
  </root>
</model>

