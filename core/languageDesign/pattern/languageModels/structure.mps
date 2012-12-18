<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c89590345(jetbrains.mps.lang.pattern.structure)" version="0">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="tp3t" modelUID="r:00000000-0000-4000-0000-011c89590345(jetbrains.mps.lang.pattern.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1136720037773">
      <property name="name" nameId="tpck.1169194664001" value="AsPattern" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1136720037779" resolveInfo="PatternVariableDeclaration" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1136720037775">
      <property name="name" nameId="tpck.1169194664001" value="Pattern" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.3364660638048049748" resolveInfo="NodeAttribute" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1136720037777">
      <property name="name" nameId="tpck.1169194664001" value="PatternExpression" />
      <property name="rootable" nameId="tpce.1096454100552" value="false" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1136720037779">
      <property name="name" nameId="tpck.1169194664001" value="PatternVariableDeclaration" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1136720037775" resolveInfo="Pattern" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1136720037781">
      <property name="name" nameId="tpck.1169194664001" value="PropertyPatternVariableDeclaration" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.3364660638048049750" resolveInfo="PropertyAttribute" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1136720037783">
      <property name="name" nameId="tpck.1169194664001" value="WildcardPattern" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1136720037775" resolveInfo="Pattern" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1136727061274">
      <property name="name" nameId="tpck.1169194664001" value="ListPattern" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1136720037773" resolveInfo="AsPattern" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1137418540378">
      <property name="name" nameId="tpck.1169194664001" value="LinkPatternVariableDeclaration" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.3364660638048049745" resolveInfo="LinkAttribute" />
    </node>
    <node type="tpce.AnnotationLinkDeclaration" typeId="tpce.1149608206811" id="1149610113525">
      <property name="role" nameId="tpce.1204740973143" value="pattern" />
      <link role="source" roleId="tpce.1149608246500" targetNodeId="tpck.1133920641626" />
      <link role="target" roleId="tpce.1204741097161" targetNodeId="1136720037775" resolveInfo="Pattern" />
    </node>
    <node type="tpce.AnnotationLinkDeclaration" typeId="tpce.1149608206811" id="1152030745648">
      <property name="role" nameId="tpce.1204740973143" value="asPattern" />
      <link role="source" roleId="tpce.1149608246500" targetNodeId="tpck.1133920641626" />
      <link role="target" roleId="tpce.1204741097161" targetNodeId="1136720037773" resolveInfo="AsPattern" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4413230749907733332">
      <property name="name" nameId="tpck.1169194664001" value="ActionAsPattern" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1136720037773" resolveInfo="AsPattern" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4413230749907802464">
      <property name="name" nameId="tpck.1169194664001" value="ActionStatement" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068580123157" resolveInfo="Statement" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3133930811460119173">
      <property name="name" nameId="tpck.1169194664001" value="PatternVariableReference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2879868312062962308">
      <property name="name" nameId="tpck.1169194664001" value="OrPattern" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1136720037775" resolveInfo="Pattern" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4855904478356877904">
      <property name="name" nameId="tpck.1169194664001" value="OrPatternClause" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1136720037777" resolveInfo="PatternExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4264731254635442556">
      <property name="name" nameId="tpck.1169194664001" value="OrPatternVariableReference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1649655856141352248">
      <property name="name" nameId="tpck.1169194664001" value="InsertAfterPosition" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Positions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1649655856141352252" resolveInfo="InsertPos" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1649655856141352250">
      <property name="name" nameId="tpck.1169194664001" value="InsertBeforePosition" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Positions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1649655856141352252" resolveInfo="InsertPos" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1649655856141352252">
      <property name="name" nameId="tpck.1169194664001" value="InsertPosition" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="Positions" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
  </roots>
  <root id="1136720037773">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1136720037774">
      <property name="value" nameId="tpce.1105725733873" value="@" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5216537374825427525">
      <property name="value" nameId="tpce.1105725733873" value="asPattern" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.5169995583184591164" resolveInfo="role" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="5216537374825427526">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpck.5169995583184591169" resolveInfo="attributed" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
  </root>
  <root id="1136720037775">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1136720037776">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5216537374825427522">
      <property name="value" nameId="tpce.1105725733873" value="pattern" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.5169995583184591164" resolveInfo="role" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="5216537374825427523">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpck.5169995583184591169" resolveInfo="attributed" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
  </root>
  <root id="1136720037777">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1136720037778">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="patternNode" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpck.1133920641626" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1174921053728">
      <property name="value" nameId="tpce.1105725733873" value="&gt;pattern&lt;" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="201537367881178489">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.201537367881071930" resolveInfo="IMetaLevelChanger" />
    </node>
  </root>
  <root id="1136720037779">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1174989324252">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1136720037780">
      <property name="name" nameId="tpck.1169194664001" value="varName" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
  </root>
  <root id="1136720037781">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="7235429427847393060">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpck.5169995583184591169" resolveInfo="attributed" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1136720037782">
      <property name="name" nameId="tpck.1169194664001" value="varName" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1174989345471">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7235429427847393058">
      <property name="value" nameId="tpce.1105725733873" value="propertyPatternVariableDeclaration" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.5169995583184591164" resolveInfo="role" />
    </node>
  </root>
  <root id="1136720037783">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1136720037784">
      <property name="value" nameId="tpce.1105725733873" value="_" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
  </root>
  <root id="1136727061274">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1136727099073">
      <property name="value" nameId="tpce.1105725733873" value="*" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1136727122888">
      <property name="value" nameId="tpce.1105725733873" value="list pattern" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" />
    </node>
  </root>
  <root id="1137418540378">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="7235429427847393057">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpck.5169995583184591169" resolveInfo="attributed" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1137418571428">
      <property name="name" nameId="tpck.1169194664001" value="varName" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1174989359378">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7235429427847393055">
      <property name="value" nameId="tpce.1105725733873" value="linkPatternVariableDeclaration" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.5169995583184591164" resolveInfo="role" />
    </node>
  </root>
  <root id="1149610113525" />
  <root id="1152030745648" />
  <root id="4413230749907733332">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="8990057180226016446">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="position" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1649655856141352252" resolveInfo="InsertPos" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4413230749907733337">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="action" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4413230749907802464" resolveInfo="ActionStatement" />
    </node>
  </root>
  <root id="4413230749907802464">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="4413230749907802485">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="3133930811460119173">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3133930811460119174">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="variable" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1136720037779" resolveInfo="PatternVariableDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3455673273919024975">
      <property name="value" nameId="tpce.1105725733873" value="pattern variable reference" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
  </root>
  <root id="2879868312062962308">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2879868312062970574">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1..n" />
      <property name="role" nameId="tpce.1071599776563" value="clause" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="4855904478356877904" resolveInfo="OrPatternClause" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4264731254635442558">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="variable" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1136720037779" resolveInfo="PatternVariableDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="612919440683661613">
      <property name="value" nameId="tpce.1105725733873" value="[|]" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="4855904478356877904">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4855904478356877905">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..1" />
      <property name="role" nameId="tpce.1071599776563" value="expression" />
      <link role="specializedLink" roleId="tpce.1071599698500" targetNodeId="1136720037778" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
  </root>
  <root id="4264731254635442556">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4264731254635442557">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <property name="role" nameId="tpce.1071599776563" value="declaration" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1136720037779" resolveInfo="PatternVariableDeclaration" />
    </node>
  </root>
  <root id="1649655856141352248">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="24089196730988504">
      <property name="value" nameId="tpce.1105725733873" value="after" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1649655856141352249">
      <property name="value" nameId="tpce.1105725733873" value="after" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1649655856141352250">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1649655856141352251">
      <property name="value" nameId="tpce.1105725733873" value="before" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1649655856141352252">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1649655856141368304">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
</model>

