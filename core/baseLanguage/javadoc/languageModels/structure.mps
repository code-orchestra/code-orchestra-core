<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:4095af4f-a097-4799-aaa9-03df087ddfa6(jetbrains.mps.baseLanguage.javadoc.structure)" version="5">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="m373" modelUID="r:4095af4f-a097-4799-aaa9-03df087ddfa6(jetbrains.mps.baseLanguage.javadoc.structure)" version="5" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5349172909345501395">
      <property name="name" nameId="tpck.1169194664001" value="BaseDocComment" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.3364660638048049748" resolveInfo="NodeAttribute" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5349172909345530173">
      <property name="name" nameId="tpck.1169194664001" value="BaseBlockDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5349172909345530174">
      <property name="name" nameId="tpck.1169194664001" value="AuthorBlockDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5349172909345530173" resolveInfo="BaseBlockDocTag" />
    </node>
    <node type="tpce.AnnotationLinkDeclaration" typeId="tpce.1149608206811" id="5349172909345532723">
      <property name="role" nameId="tpce.1204740973143" value="methodDocComment" />
      <property name="stereotype" nameId="tpce.1149608445162" value="node" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="annot" />
      <link role="source" roleId="tpce.1149608246500" targetNodeId="tpee.1068580123132" resolveInfo="BaseMethodDeclaration" />
      <link role="target" roleId="tpce.1204741097161" targetNodeId="5349172909345532724" resolveInfo="MethodDocComment" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5349172909345532724">
      <property name="name" nameId="tpck.1169194664001" value="MethodDocComment" />
      <property name="rootable" nameId="tpce.1096454100552" value="false" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5349172909345501395" resolveInfo="BaseDocComment" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8465538089690324384">
      <property name="name" nameId="tpck.1169194664001" value="VersionBlockDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5349172909345530173" resolveInfo="BaseBlockDocTag" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8465538089690324397">
      <property name="name" nameId="tpck.1169194664001" value="SinceBlockDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5349172909345530173" resolveInfo="BaseBlockDocTag" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8465538089690331492">
      <property name="name" nameId="tpck.1169194664001" value="DeprecatedBlockDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5349172909345530173" resolveInfo="BaseBlockDocTag" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8465538089690331500">
      <property name="name" nameId="tpck.1169194664001" value="CommentLine" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8465538089690881930">
      <property name="name" nameId="tpck.1169194664001" value="ParameterBlockDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5349172909345530173" resolveInfo="BaseBlockDocTag" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5858074156537397872">
      <property name="name" nameId="tpck.1169194664001" value="ThrowsBlockDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5349172909345530173" resolveInfo="BaseBlockDocTag" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5858074156537516430">
      <property name="name" nameId="tpck.1169194664001" value="ReturnBlockDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5349172909345530173" resolveInfo="BaseBlockDocTag" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6832197706140518103">
      <property name="name" nameId="tpck.1169194664001" value="BaseParameterReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6832197706140518104">
      <property name="name" nameId="tpck.1169194664001" value="DocMethodParameterReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="6832197706140518103" resolveInfo="BaseParameterReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6832197706140518107">
      <property name="name" nameId="tpck.1169194664001" value="DocTypeParameterReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="6832197706140518103" resolveInfo="BaseParameterReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6832197706140896242">
      <property name="name" nameId="tpck.1169194664001" value="FieldDocComment" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5349172909345501395" resolveInfo="BaseDocComment" />
    </node>
    <node type="tpce.AnnotationLinkDeclaration" typeId="tpce.1149608206811" id="6832197706140958194">
      <property name="role" nameId="tpce.1204740973143" value="fieldDocComment" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="annot" />
      <link role="source" roleId="tpce.1149608246500" targetNodeId="tpee.1068390468200" resolveInfo="FieldDeclaration" />
      <link role="target" roleId="tpce.1204741097161" targetNodeId="6832197706140896242" resolveInfo="FieldDocComment" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2068944020170241612">
      <property name="name" nameId="tpck.1169194664001" value="ClassifierDocComment" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5349172909345501395" resolveInfo="BaseDocComment" />
    </node>
    <node type="tpce.AnnotationLinkDeclaration" typeId="tpce.1149608206811" id="2068944020170372969">
      <property name="role" nameId="tpce.1204740973143" value="classifierDocComment" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="annot" />
      <link role="source" roleId="tpce.1149608246500" targetNodeId="tpee.1107461130800" resolveInfo="Classifier" />
      <link role="target" roleId="tpce.1204741097161" targetNodeId="2068944020170241612" resolveInfo="ClassifierDocComment" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8970989240999019142">
      <property name="name" nameId="tpck.1169194664001" value="CommentLinePart" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8970989240999019143">
      <property name="name" nameId="tpck.1169194664001" value="TextCommentLinePart" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8970989240999019142" resolveInfo="CommentLinePart" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8970989240999019145">
      <property name="name" nameId="tpck.1169194664001" value="InlineTagCommentLinePart" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8970989240999019142" resolveInfo="CommentLinePart" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6962838954693748792">
      <property name="name" nameId="tpck.1169194664001" value="BaseInlineDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6962838954693748795">
      <property name="name" nameId="tpck.1169194664001" value="ValueInlineDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="6962838954693748792" resolveInfo="BaseInlineDocTag" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2217234381367049075">
      <property name="name" nameId="tpck.1169194664001" value="CodeInlineDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="6962838954693748792" resolveInfo="BaseInlineDocTag" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2217234381367188006">
      <property name="name" nameId="tpck.1169194664001" value="BaseDocReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2217234381367188008">
      <property name="name" nameId="tpck.1169194664001" value="FieldDocReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5562345046718956738" resolveInfo="BaseVariableDocReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2217234381367190443">
      <property name="name" nameId="tpck.1169194664001" value="SeeBlockDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5349172909345530173" resolveInfo="BaseBlockDocTag" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2217234381367530195">
      <property name="name" nameId="tpck.1169194664001" value="MethodDocReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="2217234381367188006" resolveInfo="BaseDocReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2217234381367530212">
      <property name="name" nameId="tpck.1169194664001" value="ClassifierDocReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="2217234381367188006" resolveInfo="BaseDocReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2546654756694997551">
      <property name="name" nameId="tpck.1169194664001" value="LinkInlineDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="6962838954693748792" resolveInfo="BaseInlineDocTag" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2565027568480805887">
      <property name="name" nameId="tpck.1169194664001" value="CodeSnippet" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8465538089690331500" resolveInfo="CommentLine" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4730661099054379103">
      <property name="name" nameId="tpck.1169194664001" value="InheritDocInlineDocTag" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="6962838954693748792" resolveInfo="BaseInlineDocTag" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5562345046718956738">
      <property name="name" nameId="tpck.1169194664001" value="BaseVariableDocReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="2217234381367188006" resolveInfo="BaseDocReference" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6501140109493894267">
      <property name="name" nameId="tpck.1169194664001" value="StaticFieldDocReference" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="reference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5562345046718956738" resolveInfo="BaseVariableDocReference" />
    </node>
    <node type="tpce.AnnotationLinkDeclaration" typeId="tpce.1149608206811" id="4021391592916212750">
      <property name="role" nameId="tpce.1204740973143" value="staticFieldDocComment" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="annot" />
      <link role="source" roleId="tpce.1149608246500" targetNodeId="tpee.1070462154015" resolveInfo="StaticFieldDeclaration" />
      <link role="target" roleId="tpce.1204741097161" targetNodeId="6832197706140896242" resolveInfo="FieldDocComment" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6612597108003615641">
      <property name="name" nameId="tpck.1169194664001" value="HTMLElement" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="tag" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="8970989240999019142" resolveInfo="CommentLinePart" />
    </node>
  </roots>
  <root id="5349172909345501395">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8465538089690331502">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="body" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8465538089690331500" resolveInfo="CommentLine" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5349172909345532722">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="author" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="5349172909345530174" resolveInfo="AuthorBlockDocTag" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8465538089690331490">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="since" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8465538089690324397" resolveInfo="SinceBlockDocTag" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8465538089690331491">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="version" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8465538089690324384" resolveInfo="VersionBlockDocTag" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8465538089690331499">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="deprecated" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8465538089690331492" resolveInfo="DeprecatedBlockDocTag" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2217234381367277533">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="see" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="2217234381367190443" resolveInfo="SeeBlockDocTag" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="5349172909345532721">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="5349172909345530173">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="5349172909345532720">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="5349172909345530174">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="5349172909345532826">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="5349172909345532723" />
  <root id="5349172909345532724">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8465538089690917625">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="param" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8465538089690881930" resolveInfo="ParameterBlockDocTag" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5858074156537516428">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="throwsTag" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="5858074156537397872" resolveInfo="ThrowsBlockDocTag" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5858074156537516440">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="return" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="5858074156537516430" resolveInfo="ReturnBlockDocTag" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5216537374825317535">
      <property name="value" nameId="tpce.1105725733873" value="methodDocComment" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.5169995583184591164" resolveInfo="role" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="5216537374825317536">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpck.5169995583184591169" resolveInfo="attributed" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpee.1068580123132" resolveInfo="BaseMethodDeclaration" />
    </node>
  </root>
  <root id="8465538089690324384">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="8465538089690324385">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="8465538089690324397">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="8465538089690324399">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="8465538089690331492" />
  <root id="8465538089690331500">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8970989240999019149">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="part" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8970989240999019142" resolveInfo="CommentLinePart" />
    </node>
  </root>
  <root id="8465538089690881930">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6832197706140518123">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="parameter" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6832197706140518103" resolveInfo="BaseParameterReference" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="8465538089690881934">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="5858074156537397872">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6832197706140448505">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="exceptionType" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="5858074156537397874">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="5858074156537516430">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="5858074156537516431">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="6832197706140518103">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6832197706140518108">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="param" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1212170275853" resolveInfo="IValidIdentifier" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="6832197706140518105">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="6832197706140518104">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6832197706140518109">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="parameterDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="6832197706140518108" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068498886292" resolveInfo="ParameterDeclaration" />
    </node>
  </root>
  <root id="6832197706140518107">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6832197706140518110">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="typeVariableDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="6832197706140518108" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1109279763828" resolveInfo="TypeVariableDeclaration" />
    </node>
  </root>
  <root id="6832197706140896242">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="5216537374825317534">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpck.5169995583184591169" resolveInfo="attributed" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpee.1068390468200" resolveInfo="FieldDeclaration" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="5216537374825335894">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpck.5169995583184591169" resolveInfo="attributed" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpee.1070462154015" resolveInfo="StaticFieldDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5216537374825317532">
      <property name="value" nameId="tpce.1105725733873" value="fieldDocComment" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.5169995583184591164" resolveInfo="role" />
    </node>
  </root>
  <root id="6832197706140958194" />
  <root id="2068944020170241612">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="5216537374825317530">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpck.5169995583184591169" resolveInfo="attributed" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpee.1107461130800" resolveInfo="Classifier" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5216537374825317528">
      <property name="value" nameId="tpce.1105725733873" value="classifierDocComment" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.5169995583184591164" resolveInfo="role" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2068944020170241614">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="param" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8465538089690881930" resolveInfo="ParameterBlockDocTag" />
    </node>
  </root>
  <root id="2068944020170372969" />
  <root id="8970989240999019142">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="8970989240999019146">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="8970989240999019143">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="8970989240999019144">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="8970989240999019145">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6962838954693749192">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="tag" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="6962838954693748792" resolveInfo="BaseInlineDocTag" />
    </node>
  </root>
  <root id="6962838954693748792">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="6962838954693748794">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="6962838954693748795">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2565027568480644422">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="variableReference" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="5562345046718956738" resolveInfo="BaseVariableDocReference" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="6962838954693748797">
      <property name="value" nameId="tpce.1105725733873" value="value" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="6962838954693839257">
      <property name="value" nameId="tpce.1105725733873" value="constant value" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="2217234381367049075">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3106559687488741665">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="line" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8465538089690331500" resolveInfo="CommentLine" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2217234381367049079">
      <property name="value" nameId="tpce.1105725733873" value="code" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2217234381367049081">
      <property name="value" nameId="tpce.1105725733873" value="code piece" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="2217234381367188006">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="2217234381367188007">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="2217234381367188008">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2217234381367188009">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="fieldDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068390468200" resolveInfo="FieldDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="5562345046718956740" />
    </node>
  </root>
  <root id="2217234381367190443">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2217234381367190458">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="reference" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="2217234381367188006" resolveInfo="BaseDocReference" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="2217234381367190444">
      <property name="name" nameId="tpck.1169194664001" value="text" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="2217234381367530195">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2217234381367530196">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="methodDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068580123132" resolveInfo="BaseMethodDeclaration" />
    </node>
  </root>
  <root id="2217234381367530212">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2217234381367530213">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="classifier" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1107461130800" resolveInfo="Classifier" />
    </node>
  </root>
  <root id="2546654756694997551">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3106559687488913694">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="line" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8465538089690331500" resolveInfo="CommentLine" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2546654756694997556">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="reference" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="2217234381367188006" resolveInfo="BaseDocReference" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2546654756694997553">
      <property name="value" nameId="tpce.1105725733873" value="link" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="2546654756694997555">
      <property name="value" nameId="tpce.1105725733873" value="link to type or member" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="2565027568480805887">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2565027568480905697">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="statement" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068580123157" resolveInfo="Statement" />
    </node>
  </root>
  <root id="4730661099054379103">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4730661099054379104">
      <property name="value" nameId="tpce.1105725733873" value="inheritDoc" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4730661099054379106">
      <property name="value" nameId="tpce.1105725733873" value="inherit doc from parent" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="5562345046718956738">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="5562345046718956739">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5562345046718956740">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="declaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.4972933694980447171" resolveInfo="BaseVariableDeclaration" />
    </node>
  </root>
  <root id="6501140109493894267">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6501140109493894278">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="staticFieldDeclaration" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="5562345046718956740" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1070462154015" resolveInfo="StaticFieldDeclaration" />
    </node>
  </root>
  <root id="4021391592916212750" />
  <root id="6612597108003615641">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="6612597108003615643">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="line" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="8465538089690331500" resolveInfo="CommentLine" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="6612597108003615642">
      <property name="name" nameId="tpck.1169194664001" value="name" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
</model>

