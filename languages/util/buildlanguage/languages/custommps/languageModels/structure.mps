<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:896f64dd-7cfe-4bc4-b401-38e2a027e9ae(jetbrains.mps.build.custommps.structure)">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tps4" modelUID="r:00000000-0000-4000-0000-011c895904d8(jetbrains.mps.build.packaging.structure)" version="8" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1233149592028">
      <property name="name" nameId="tpck.1169194664001" value="MPSBuild" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tps4.1203598300291" resolveInfo="AbstractProjectComponent" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1233679247700">
      <property name="name" nameId="tpck.1169194664001" value="LibraryFolder" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tps4.1203598512427" resolveInfo="Folder" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2235195415637073414">
      <property name="name" nameId="tpck.1169194664001" value="MPSDistribution" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tps4.1203598300291" resolveInfo="AbstractProjectComponent" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8431776905956790237">
      <property name="name" nameId="tpck.1169194664001" value="UndeclaredVariableReference" />
      <property name="rootable" nameId="tpce.1096454100552" value="false" />
    </node>
  </roots>
  <root id="1233149592028">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1233149869651">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tps4.1203617883391" resolveInfo="ICompositeComponent" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1240832859448">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tps4.1240832649054" resolveInfo="INotBuildableComponent" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1233150001577">
      <property name="value" nameId="tpce.1105725733873" value="mps-build" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1237394818532">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tps4.1233309050521" resolveInfo="acceptFiles" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1234290845440">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="pathToBuildToolsZip" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1220973916698" resolveInfo="Path" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1237897943794">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="licencePath" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1220973916698" resolveInfo="Path" />
    </node>
  </root>
  <root id="1233679247700">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1233679274643">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="libraryName" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1205339194346" resolveInfo="IStringExpression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1233679617947">
      <property name="value" nameId="tpce.1105725733873" value="library" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="2235195415637073414">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2235195415637073457">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="pathToBuildToolsZip" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1220973916698" resolveInfo="Path" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2235195415637073458">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="licencePath" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tps4.1220973916698" resolveInfo="Path" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2235195415637073419">
      <property name="value" nameId="tpce.1105725733873" value="mps-dist" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="2235195415637073415">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tps4.1203617883391" resolveInfo="ICompositeComponent" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="2235195415637073417">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tps4.1240832649054" resolveInfo="INotBuildableComponent" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpck.ExportScopeNamespace" typeId="tpck.2565736246230036151" id="8431776905956861662">
      <property name="namespace" nameId="tpck.2565736246230036153" value="jetbrains.mps.build" />
    </node>
  </root>
  <root id="8431776905956790237">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="8431776905956790238">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tps4.1205339194346" resolveInfo="IStringExpression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8431776905956790239">
      <property name="value" nameId="tpce.1105725733873" value="undeclared variable" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="8431776905956790240">
      <property name="name" nameId="tpck.1169194664001" value="antName" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tps4.1223640176546" resolveInfo="StringWithoutSpaces" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="8431776905956790241">
      <property name="name" nameId="tpck.1169194664001" value="name" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tps4.1223640176546" resolveInfo="StringWithoutSpaces" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpck.ExportScopeModule" typeId="tpck.2565736246230036154" id="8431776905956861661" />
  </root>
</model>

