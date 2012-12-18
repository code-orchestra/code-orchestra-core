<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:550fbd90-c9f2-4576-a8a6-223eca16d68b(jetbrains.mps.baseLanguage.runConfigurations.structure)" version="0">
  <persistence version="7" />
  <language namespace="82c32a3b-4a54-4fc1-b551-7ff9f198d7c1(jetbrains.mps.baseLanguage.runConfigurations)" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="b83431fe-5c8f-40bc-8a36-65e25f4dd253(jetbrains.mps.lang.textGen)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" />
  <import index="tp4k" modelUID="r:00000000-0000-4000-0000-011c89590368(jetbrains.mps.lang.plugin.structure)" version="23" />
  <import index="swvc" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.baseLanguage.util.plugin.run(MPS.Classpath/jetbrains.mps.baseLanguage.util.plugin.run@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="11eb" modelUID="r:550fbd90-c9f2-4576-a8a6-223eca16d68b(jetbrains.mps.baseLanguage.runConfigurations.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8456022385895583119">
      <property name="name" nameId="tpck.1169194664001" value="JavaNodeRunConfiguration" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="655818460756091959" resolveInfo="JavaRunConfiguration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8456022385895584871">
      <property name="name" nameId="tpck.1169194664001" value="JavaCheckBlock" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tp4k.1347772807199150767" resolveInfo="AbstractCheckConfigBlock" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="655818460756091959">
      <property name="name" nameId="tpck.1169194664001" value="JavaRunConfiguration" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="java" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tp4k.7035278950562851062" resolveInfo="RunConfigurationDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4964800443628314809">
      <property name="name" nameId="tpck.1169194664001" value="JavaConfigurationRunParameters_FunctionParameter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="java" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.AnnotationLinkDeclaration" typeId="tpce.1149608206811" id="7549816165173144969">
      <property name="role" nameId="tpce.1204740973143" value="userComponentReferenceAnnotation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="annotations" />
      <link role="source" roleId="tpce.1149608246500" targetNodeId="tp4k.3452826078638178132" resolveInfo="ComponentReference" />
      <link role="target" roleId="tpce.1204741097161" targetNodeId="7549816165173145425" resolveInfo="UserComponentReferenceAnnotation" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7549816165173145425">
      <property name="name" nameId="tpck.1169194664001" value="UserComponentReferenceAnnotation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="annotations" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.3364660638048049748" resolveInfo="NodeAttribute" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3607966867310075767">
      <property name="name" nameId="tpck.1169194664001" value="Node_FunctionParameter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1810772216404800349">
      <property name="name" nameId="tpck.1169194664001" value="IJavaRunConfigurationParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3361586479360705438">
      <property name="name" nameId="tpck.1169194664001" value="NodeRunConfigPropertyInstance" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2178855608170754068">
      <property name="name" nameId="tpck.1169194664001" value="JavaNodeConfigurationEditorDeclaration" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tp4k.162872405267681132" resolveInfo="ConfigurationEditorDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2178855608170754525">
      <property name="name" nameId="tpck.1169194664001" value="OnChangeNodeBlock" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1566895476211680658">
      <property name="name" nameId="tpck.1169194664001" value="ComponentInsideOfChangeListenerAnnotation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="annotations" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.3364660638048049748" resolveInfo="NodeAttribute" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="1566895476211680660">
      <property name="name" nameId="tpck.1169194664001" value="IOnChangeEditorBlock" />
    </node>
    <node type="tpce.AnnotationLinkDeclaration" typeId="tpce.1149608206811" id="1566895476211680990">
      <property name="role" nameId="tpce.1204740973143" value="componentInsideOfChangeListenerAnnotation" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="annotations" />
      <link role="target" roleId="tpce.1204741097161" targetNodeId="1566895476211680658" resolveInfo="ComponentInsideOfChangeListenerAnnotation" />
      <link role="source" roleId="tpce.1149608246500" targetNodeId="tp4k.3452826078638178132" resolveInfo="ComponentReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4462513030604064303">
      <property name="name" nameId="tpck.1169194664001" value="IsApplicableBlock" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="node" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1137021947720" resolveInfo="ConceptFunction" />
    </node>
  </roots>
  <root id="8456022385895583119">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="3592413331516836478">
      <property name="name" nameId="tpck.1169194664001" value="generate" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3607966867310500324">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="conceptDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8456022385895584872">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="checkBlock" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8456022385895584871" resolveInfo="JavaCheckBlock" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="tp4k.678887849223472883" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2178855608170933990">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="editor" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="tp4k.162872405267681133" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="2178855608170754068" resolveInfo="JavaNodeConfigurationEditorDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4462513030604064304">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="isApplicableBlock" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4462513030604064303" resolveInfo="IsApplicableBlock" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="8294204555084781727" />
  </root>
  <root id="8456022385895584871">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="668913963929392860">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="3607966867310075767" resolveInfo="Node_FunctionParameter" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="6629582826329141261">
      <property name="value" nameId="tpce.1105725733873" value="check java" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="668913963929538836">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpee.1216468774225" resolveInfo="showName" />
    </node>
  </root>
  <root id="655818460756091959">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="655818460756092288">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tp4k.3636700473138841144" resolveInfo="IEnhancedRunConfiguration" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpce.DeprecatedNodeAnnotation" typeId="tpce.1224240836180" id="8294204555084781728" />
  </root>
  <root id="4964800443628314809">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="4964800443628314814">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545963098" resolveInfo="conceptFunctionParameterType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4283697670712531649">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="swvc.~ConfigRunParameters" resolveInfo="ConfigRunParameters" />
      </node>
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4964800443628314811">
      <property name="value" nameId="tpce.1105725733873" value="javaParameters" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1810772216404802094">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1810772216404800349" resolveInfo="IJavaRunConfigurationParameter" />
    </node>
  </root>
  <root id="7549816165173144969" />
  <root id="7549816165173145425">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7549816165173145427">
      <property name="value" nameId="tpce.1105725733873" value="user component reference" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5216537374825317513">
      <property name="value" nameId="tpce.1105725733873" value="userComponentReferenceAnnotation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.5169995583184591164" resolveInfo="role" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="5216537374825317514">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpck.5169995583184591169" resolveInfo="attributed" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tp4k.3452826078638178132" resolveInfo="ComponentReference" />
    </node>
  </root>
  <root id="3607966867310075767">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3607966867310076241">
      <property name="value" nameId="tpce.1105725733873" value="node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="3607966867310747841">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545963098" resolveInfo="conceptFunctionParameterType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="tp25.1138055754698" id="3607966867310749204" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1810772216404831565">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1810772216404800349" resolveInfo="IJavaRunConfigurationParameter" />
    </node>
  </root>
  <root id="1810772216404800349" />
  <root id="3361586479360705438">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3361586479361483886">
      <property name="value" nameId="tpce.1105725733873" value="node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="7589249354678411013">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tp4k.7086588812844908357" resolveInfo="IRunConfigPropertyInstance" />
    </node>
  </root>
  <root id="2178855608170754068">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2178855608170754524">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="onChangeNodeBlock" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="2178855608170754525" resolveInfo="OnChangeNodeBlock" />
    </node>
  </root>
  <root id="2178855608170754525">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="2178855608171215724">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="3607966867310075767" resolveInfo="Node_FunctionParameter" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2178855608170754527">
      <property name="value" nameId="tpce.1105725733873" value="onChange" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="2178855608170754529">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpee.1216468774225" resolveInfo="showName" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1566895476211680989">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="1566895476211680660" resolveInfo="IOnChangeEditorBlock" />
    </node>
  </root>
  <root id="1566895476211680658">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1566895476211680659">
      <property name="value" nameId="tpce.1105725733873" value="component inside of change listener" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5216537374825317493">
      <property name="value" nameId="tpce.1105725733873" value="componentInsideOfChangeListenerAnnotation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.5169995583184591164" resolveInfo="role" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="5216537374825317494">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpck.5169995583184591169" resolveInfo="attributed" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tp4k.3452826078638178132" resolveInfo="ComponentReference" />
    </node>
  </root>
  <root id="1566895476211680660" />
  <root id="1566895476211680990" />
  <root id="4462513030604064303">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="4462513030604064310">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1161119487665" resolveInfo="applicableConceptFunctionParameter" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="3607966867310075767" resolveInfo="Node_FunctionParameter" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="4462513030604244386">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpee.1216468774225" resolveInfo="showName" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4462513030604064308">
      <property name="value" nameId="tpce.1105725733873" value="is applicable" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
</model>

