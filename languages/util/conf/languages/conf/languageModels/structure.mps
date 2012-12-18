<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:d3304d29-cd93-4341-982d-9f0d1a8b40bf(jetbrains.mps.platform.conf.structure)" version="1">
  <persistence version="7" />
  <language namespace="32d0a39c-772f-4490-8142-e50f9a9f19d4(jetbrains.mps.platform.conf)" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="cs0q" modelUID="r:d3304d29-cd93-4341-982d-9f0d1a8b40bf(jetbrains.mps.platform.conf.structure)" version="1" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4635942846893810046">
      <property name="name" nameId="tpck.1169194664001" value="Component" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.extensions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5066720069350533029" resolveInfo="XmlNode" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5314521579133239121">
      <property name="name" nameId="tpck.1169194664001" value="Extension" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.extensions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5066720069350533029" resolveInfo="ConfigurationXmlNode" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="5314521579133239127">
      <property name="name" nameId="tpck.1169194664001" value="IConfigurationElement" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="configuration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5314521579133239132">
      <property name="name" nameId="tpck.1169194664001" value="ExtensionPoint" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.extensionPoints" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="5314521579133239148">
      <property name="name" nameId="tpck.1169194664001" value="IConfigurationFragment" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="configuration" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="5314521579133239158">
      <property name="name" nameId="tpck.1169194664001" value="IConfiguration" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="configuration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5314521579133271086">
      <property name="name" nameId="tpck.1169194664001" value="ConfigurationXmlDocument" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="xml" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="5066720069350533017">
      <property name="name" nameId="tpck.1169194664001" value="IExternalConfigurationFragment" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="configuration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5066720069350533027">
      <property name="name" nameId="tpck.1169194664001" value="XInclude" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="xml" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5066720069350533029" resolveInfo="ConfigurationXmlNode" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5066720069350533029">
      <property name="name" nameId="tpck.1169194664001" value="ConfigurationXmlNode" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="xml" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7130790807395857422">
      <property name="name" nameId="tpck.1169194664001" value="ExtensionPoints" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.containers" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5066720069350533029" resolveInfo="XmlConfigurationNode" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1740160309778170999">
      <property name="name" nameId="tpck.1169194664001" value="Components" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.containers" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5066720069350533029" resolveInfo="ConfigurationXmlNode" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1740160309778171006">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.extensionPoints" />
      <property name="name" nameId="tpck.1169194664001" value="BeanExtensionPoint" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5314521579133239132" resolveInfo="ExtensionPoint" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1740160309778171007">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.extensionPoints" />
      <property name="name" nameId="tpck.1169194664001" value="IntefaceExtensionPoint" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5314521579133239132" resolveInfo="ExtensionPoint" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1740160309778171009">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements" />
      <property name="name" nameId="tpck.1169194664001" value="Level" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1740160309778171016">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.extensions" />
      <property name="name" nameId="tpck.1169194664001" value="Service" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5314521579133239121" resolveInfo="Extension" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1740160309778171018">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements" />
      <property name="name" nameId="tpck.1169194664001" value="HasLevel" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1740160309778208723">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.containers" />
      <property name="name" nameId="tpck.1169194664001" value="Extensions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5066720069350533029" resolveInfo="ConfigurationXmlNode" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1740160309778217806">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="xml.root" />
      <property name="name" nameId="tpck.1169194664001" value="IdeaPluginRoot" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3963070320413563577" resolveInfo="ConfigurationXmlRootNote" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6121364846593763655">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.extensions" />
      <property name="name" nameId="tpck.1169194664001" value="BeanExtension" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5314521579133239121" resolveInfo="Extension" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6121364846593790701">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.extensions" />
      <property name="name" nameId="tpck.1169194664001" value="InterfaceExtension" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5314521579133239121" resolveInfo="Extension" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6121364846593790726">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.extensions" />
      <property name="name" nameId="tpck.1169194664001" value="BeanExtensionAttribute" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="5066720069350533013">
      <property name="name" nameId="tpck.1169194664001" value="IConfigurationElementFragment" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="configuration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5522969664585014978">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="xml.root" />
      <property name="name" nameId="tpck.1169194664001" value="ComponentsRoot" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3963070320413563577" resolveInfo="ConfigurationXmlRootNote" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8009656244648532777">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="xml.root" />
      <property name="name" nameId="tpck.1169194664001" value="ComponentRoot" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3963070320413563577" resolveInfo="ConfigurationXmlRootNote" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7225089784577918894">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="xml.root" />
      <property name="name" nameId="tpck.1169194664001" value="RootRoot" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3963070320413563577" resolveInfo="ConfigurationXmlRootNote" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="6536266708345244484">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="configuration" />
      <property name="name" nameId="tpck.1169194664001" value="IPluginConfigurationFragment" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6536266708345244486">
      <property name="name" nameId="tpck.1169194664001" value="Plugin" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.plugin" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1740160309778217806" resolveInfo="IdeaPlugin" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6536266708345244487">
      <property name="name" nameId="tpck.1169194664001" value="PluginDependency" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.plugin" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6536266708345244494">
      <property name="name" nameId="tpck.1169194664001" value="PluginVendor" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.plugin" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6536266708345244502">
      <property name="name" nameId="tpck.1169194664001" value="PluginDetails" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.plugin" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6536266708345477897">
      <property name="name" nameId="tpck.1169194664001" value="IdeaVersion" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.plugin" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="6536266708345477902">
      <property name="name" nameId="tpck.1169194664001" value="PluginDetail" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.plugin" />
      <property name="memberIdentifierPolicy" nameId="tpce.1197591154882" value="derive_from_internal_value" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6536266708345477909">
      <property name="name" nameId="tpck.1169194664001" value="PluginHelpset" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.plugin" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4383174161801812099">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.containers" />
      <property name="name" nameId="tpck.1169194664001" value="Actions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5066720069350533029" resolveInfo="ConfigurationXmlNode" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4383174161801969971">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.actions" />
      <property name="name" nameId="tpck.1169194664001" value="AbstractAction" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5066720069350533029" resolveInfo="ConfigurationXmlNode" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4383174161802016293">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.actions" />
      <property name="name" nameId="tpck.1169194664001" value="Shortcut" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4383174161802016297">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.actions" />
      <property name="name" nameId="tpck.1169194664001" value="MouseShortcut" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4383174161802016293" resolveInfo="Shortcut" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4383174161802016298">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.actions" />
      <property name="name" nameId="tpck.1169194664001" value="KeyboardShortcut" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4383174161802016293" resolveInfo="Shortcut" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4383174161802026701">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.actions" />
      <property name="name" nameId="tpck.1169194664001" value="Group" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4383174161801969971" resolveInfo="AbstractAction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4383174161802026705">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.actions" />
      <property name="name" nameId="tpck.1169194664001" value="GroupReference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4383174161802026707">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.actions" />
      <property name="name" nameId="tpck.1169194664001" value="ActionReference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8605160448688984307">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.actions" />
      <property name="name" nameId="tpck.1169194664001" value="Action" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="4383174161801969971" resolveInfo="AbstractAction" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="8605160448688984319">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.actions" />
      <property name="name" nameId="tpck.1169194664001" value="IActionItem" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8605160448688984324">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.actions" />
      <property name="name" nameId="tpck.1169194664001" value="Separator" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="8605160448689289377">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="elements.actions" />
      <property name="name" nameId="tpck.1169194664001" value="GroupPosition" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3963070320413563577">
      <property name="virtualPackage" nameId="tpck.1193676396447" value="xml" />
      <property name="name" nameId="tpck.1169194664001" value="ConfigurationXmlRootNode" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5066720069350533029" resolveInfo="ConfigurationXmlNode" />
    </node>
  </roots>
  <root id="4635942846893810046">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1740160309778171032">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="ifaceClass" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1107461130800" resolveInfo="Classifier" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1740160309778171033">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="implClass" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1107461130800" resolveInfo="Classifier" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1740160309778171030">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239127" resolveInfo="IConfigurationElement" />
    </node>
  </root>
  <root id="5314521579133239121">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6121364846593763607">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="extensionPoint" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="5314521579133239132" resolveInfo="ExtensionPoint" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5314521579133239129">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239127" resolveInfo="IConfigurationChunk" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="6121364846593790700">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="6121364846593763599">
      <property name="value" nameId="tpce.1105725733873" value="extension" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="5314521579133239127">
    <node role="extends" roleId="tpce.1169127546356" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="7161354651095811206">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239148" resolveInfo="IConfigurationFragment" />
    </node>
  </root>
  <root id="5314521579133239132">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5314521579133239133">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3793993770298286784">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1196978630214" resolveInfo="IResolveInfo" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5314521579133239135">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239127" resolveInfo="IConfigurationElement" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="6121364846593825080">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3793993770298286790">
      <property name="value" nameId="tpce.1105725733873" value="extensionPoint" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="5314521579133239148" />
  <root id="5314521579133239158">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1740160309778170996">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="fragment" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="5314521579133239148" resolveInfo="IConfigurationFragment" />
    </node>
    <node role="extends" roleId="tpce.1169127546356" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5066720069350533026">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239148" resolveInfo="IConfigurationFragment" />
    </node>
  </root>
  <root id="5314521579133271086">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7130790807395857418">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="root" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3963070320413563577" resolveInfo="ConfigurationXmlRootNote" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5314521579133271100">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
  </root>
  <root id="5066720069350533017">
    <node role="extends" roleId="tpce.1169127546356" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5066720069350533018">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239148" resolveInfo="IConfigurationChunk" />
    </node>
  </root>
  <root id="5066720069350533027">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1829899669318982164">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="document" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="5314521579133271086" resolveInfo="ConfigurationXmlDocument" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4559888222469859036">
      <property name="name" nameId="tpck.1169194664001" value="includeRoot" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1740160309778213311">
      <property name="value" nameId="tpce.1105725733873" value="include" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5066720069350533028">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5066720069350533017" resolveInfo="IExternalFragment" />
    </node>
  </root>
  <root id="5066720069350533029">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1740160309778208743">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1740160309778170997">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239148" resolveInfo="IConfigurationFragment" />
    </node>
  </root>
  <root id="7130790807395857422">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1740160309778213318">
      <property name="value" nameId="tpce.1105725733873" value="extensionPoints" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="6121364846593814078">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239158" resolveInfo="IConfiguration" />
    </node>
  </root>
  <root id="1740160309778170999">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1740160309778217810">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239158" resolveInfo="IConfiguration" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1740160309778171022">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1740160309778171018" resolveInfo="HasLevel" />
    </node>
  </root>
  <root id="1740160309778171006">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="6183559520328510636">
      <property name="value" nameId="tpce.1105725733873" value="extensionPoint" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1740160309778171025">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="beanClass" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068390468198" resolveInfo="ClassConcept" />
    </node>
  </root>
  <root id="1740160309778171007">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1740160309778171026">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="iface" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1107461130800" resolveInfo="Classifier" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="6618365175184935551">
      <property name="value" nameId="tpce.1105725733873" value="extensionPoint" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1740160309778171009">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1740160309778171010">
      <property name="internalValue" nameId="tpce.1083923523171" value="APPLICATION" />
      <property name="externalValue" nameId="tpce.1083923523172" value="application" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1740160309778171011">
      <property name="internalValue" nameId="tpce.1083923523171" value="PROJECT" />
      <property name="externalValue" nameId="tpce.1083923523172" value="project" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1740160309778171012">
      <property name="internalValue" nameId="tpce.1083923523171" value="MODULE" />
      <property name="externalValue" nameId="tpce.1083923523172" value="module" />
    </node>
  </root>
  <root id="1740160309778171016">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1740160309778171028">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="serviceIface" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1107461130800" resolveInfo="Classifier" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1740160309778171029">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="serviceImpl" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1107461130800" resolveInfo="Classifier" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1740160309778171023">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1740160309778171018" resolveInfo="HasLevel" />
    </node>
  </root>
  <root id="1740160309778171018">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1740160309778171019">
      <property name="name" nameId="tpck.1169194664001" value="level" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1740160309778171009" resolveInfo="Level" />
    </node>
  </root>
  <root id="1740160309778208723">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1740160309778213319">
      <property name="value" nameId="tpce.1105725733873" value="extensions" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="6121364846593555999">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239158" resolveInfo="IConfiguration" />
    </node>
  </root>
  <root id="1740160309778217806">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="4691677767846423023">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1740160309778217807">
      <property name="value" nameId="tpce.1105725733873" value="idea-plugin" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1740160309778217808">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239158" resolveInfo="IConfiguration" />
    </node>
  </root>
  <root id="6121364846593763655">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6121364846593790725">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="attribute" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6121364846593790726" resolveInfo="BeanExtensionAttribute" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6121364846593763657">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="beanExtensionPoint" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1740160309778171006" resolveInfo="BeanExtensionPoint" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="6121364846593763607" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="618741292999329660">
      <property name="value" nameId="tpce.1105725733873" value="extension" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="6121364846593790701">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6121364846593790702">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="intefaceExtensionPoint" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1740160309778171007" resolveInfo="IntefaceExtensionPoint" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="6121364846593763607" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7161354651095889473">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="impl" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068390468198" resolveInfo="ClassConcept" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="618741292999329657">
      <property name="value" nameId="tpce.1105725733873" value="extension" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="6121364846593790726">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6121364846593790729">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="6121364846593790760">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
  </root>
  <root id="5066720069350533013" />
  <root id="5522969664585014978">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5522969664585014979">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239158" resolveInfo="IConfiguration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5522969664585014981">
      <property name="value" nameId="tpce.1105725733873" value="components" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="8009656244648532777">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="8009656244648532779">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239158" resolveInfo="IConfiguration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8009656244648532781">
      <property name="value" nameId="tpce.1105725733873" value="component" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="7225089784577918894">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="7225089784577918895">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239158" resolveInfo="IConfiguration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3963070320413563579">
      <property name="value" nameId="tpce.1105725733873" value="root" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="6536266708345244484" />
  <root id="6536266708345244486">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2195238324467320951">
      <property name="value" nameId="tpce.1105725733873" value="plugin" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6536266708345244498">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="vendor" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6536266708345244494" resolveInfo="PluginVendor" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6536266708345477901">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="ideaVersion" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6536266708345477897" resolveInfo="IdeaVersion" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6536266708345477912">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="helpset" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6536266708345477909" resolveInfo="PluginHelpset" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6536266708345244499">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="depends" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6536266708345244487" resolveInfo="PluginReference" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6536266708345477915">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="details" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6536266708345244502" resolveInfo="PluginDetails" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6536266708345244491">
      <property name="name" nameId="tpck.1169194664001" value="id" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6536266708345244493">
      <property name="name" nameId="tpck.1169194664001" value="version" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="6536266708345477917">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239148" resolveInfo="IConfigurationFragment" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="6536266708345244490">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="2195238324467320975">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1196978630214" resolveInfo="IResolveInfo" />
    </node>
  </root>
  <root id="6536266708345244487">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6536266708345244500">
      <property name="name" nameId="tpck.1169194664001" value="optional" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6536266708345244501">
      <property name="name" nameId="tpck.1169194664001" value="config" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6536266708345244489">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="plugin" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6536266708345244486" resolveInfo="Plugin" />
    </node>
  </root>
  <root id="6536266708345244494">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6536266708345244495">
      <property name="name" nameId="tpck.1169194664001" value="url" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6536266708345244496">
      <property name="name" nameId="tpck.1169194664001" value="email" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6536266708345244497">
      <property name="name" nameId="tpck.1169194664001" value="logo" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="2195238324467554678">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
  </root>
  <root id="6536266708345244502">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6536266708345477913">
      <property name="name" nameId="tpck.1169194664001" value="kind" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="6536266708345477902" resolveInfo="PluginDetail" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6536266708345477914">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="6536266708345477897">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6536266708345477899">
      <property name="name" nameId="tpck.1169194664001" value="sinceBuild" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6536266708345477900">
      <property name="name" nameId="tpck.1169194664001" value="untilBuild" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="6536266708345477902">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="6536266708345477903">
      <property name="internalValue" nameId="tpce.1083923523171" value="description" />
      <property name="externalValue" nameId="tpce.1083923523172" value="description" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="6536266708345477906">
      <property name="internalValue" nameId="tpce.1083923523171" value="changeNotes" />
      <property name="externalValue" nameId="tpce.1083923523172" value="change-notes" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="6536266708345477908">
      <property name="internalValue" nameId="tpce.1083923523171" value="resourceBundle" />
      <property name="externalValue" nameId="tpce.1083923523172" value="resource-bundle" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="2139702042201195788">
      <property name="internalValue" nameId="tpce.1083923523171" value="category" />
      <property name="externalValue" nameId="tpce.1083923523172" value="category" />
    </node>
  </root>
  <root id="6536266708345477909">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6536266708345477910">
      <property name="name" nameId="tpck.1169194664001" value="file" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6536266708345477911">
      <property name="name" nameId="tpck.1169194664001" value="path" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="4383174161801812099">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4383174161801812100">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239158" resolveInfo="IConfiguration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7208030699524859784">
      <property name="value" nameId="tpce.1105725733873" value="actions" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4383174161801969971">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8605160448688984311">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="addToGroup" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4383174161802026705" resolveInfo="GroupReference" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4383174161802026699">
      <property name="name" nameId="tpck.1169194664001" value="id" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4383174161802026696">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4383174161802026697">
      <property name="name" nameId="tpck.1169194664001" value="description" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4383174161802026698">
      <property name="name" nameId="tpck.1169194664001" value="icon" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4383174161802026700">
      <property name="name" nameId="tpck.1169194664001" value="popup" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4383174161801969972">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239127" resolveInfo="IConfigurationElement" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3299465005540162118">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1196978630214" resolveInfo="IResolveInfo" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="8605160448688984306">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="4383174161802016293">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7208030699524832372">
      <property name="value" nameId="tpce.1105725733873" value="shortcut" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4383174161802016294">
      <property name="name" nameId="tpck.1169194664001" value="keystroke" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4383174161802016295">
      <property name="name" nameId="tpck.1169194664001" value="keystroke2" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4383174161802016296">
      <property name="name" nameId="tpck.1169194664001" value="keymap" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="4383174161802016297">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7208030699524893921">
      <property name="value" nameId="tpce.1105725733873" value="mouse shortcut" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4383174161802016298">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7208030699524893920">
      <property name="value" nameId="tpce.1105725733873" value="keyboard shortcut" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4383174161802026701">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="7208030699524554273">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="groupClass" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068390468198" resolveInfo="ClassConcept" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8605160448688984317">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="actionItem" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8605160448688984319" resolveInfo="IActionItem" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8605160448688984328">
      <property name="value" nameId="tpce.1105725733873" value="group" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4383174161802026705">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="8605160448689289382">
      <property name="name" nameId="tpck.1169194664001" value="position" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="8605160448689289377" resolveInfo="GroupPosition" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4383174161802026706">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="group" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4383174161802026701" resolveInfo="Group" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8605160448689289384">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="anchor" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4383174161801969971" resolveInfo="AbstractAction" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7208030699524950026">
      <property name="value" nameId="tpce.1105725733873" value="add to group" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4383174161802026707">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4383174161802026708">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="action" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4383174161801969971" resolveInfo="Action" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="8605160448688984322">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="8605160448688984319" resolveInfo="IActionItem" />
    </node>
  </root>
  <root id="8605160448688984307">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8605160448688984309">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="actionClass" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068390468198" resolveInfo="ClassConcept" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8605160448688984308">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="shortcut" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4383174161802016293" resolveInfo="Shortcut" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="8605160448688984323">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="8605160448688984319" resolveInfo="IActionItem" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8605160448688984327">
      <property name="value" nameId="tpce.1105725733873" value="action" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="8605160448688984319" />
  <root id="8605160448688984324">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="8605160448688984325">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="8605160448688984319" resolveInfo="IActionItem" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8605160448688984326">
      <property name="value" nameId="tpce.1105725733873" value="---- (separator)" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="8605160448689289377">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="8605160448689289378">
      <property name="internalValue" nameId="tpce.1083923523171" value="first" />
      <property name="externalValue" nameId="tpce.1083923523172" value="FIRST" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="8605160448689289380">
      <property name="internalValue" nameId="tpce.1083923523171" value="last" />
      <property name="externalValue" nameId="tpce.1083923523172" value="LAST" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="8605160448689289379">
      <property name="internalValue" nameId="tpce.1083923523171" value="before" />
      <property name="externalValue" nameId="tpce.1083923523172" value="BEFORE" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="8605160448689289381">
      <property name="internalValue" nameId="tpce.1083923523171" value="after" />
      <property name="externalValue" nameId="tpce.1083923523172" value="AFTER" />
    </node>
  </root>
  <root id="3963070320413563577">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3963070320413656617">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="node" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="1740160309778170996" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="5066720069350533029" resolveInfo="ConfigurationXmlNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="3963070320413563578">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3963070320413821544">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="5314521579133239158" resolveInfo="IConfiguration" />
    </node>
  </root>
</model>

