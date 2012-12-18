<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c89590425(jetbrains.mps.samples.complex.structure)">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="ff24ab03-965e-4d15-9aed-52dc276658f4(jetbrains.mps.samples.complex)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="tpo9" modelUID="r:00000000-0000-4000-0000-011c89590425(jetbrains.mps.samples.complex.structure)" version="4" implicit="yes" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1196259557930">
      <property name="name" nameId="tpck.1169194664001" value="ComplexType" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1164118113764" resolveInfo="PrimitiveType" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1196260743057">
      <property name="name" nameId="tpck.1169194664001" value="ReExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1196260832413" resolveInfo="ComplexExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1196260832413">
      <property name="name" nameId="tpck.1169194664001" value="SingleComplexExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1196263843100">
      <property name="name" nameId="tpck.1169194664001" value="ArgExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1196260832413" resolveInfo="ComplexExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1196264034207">
      <property name="name" nameId="tpck.1169194664001" value="AbsExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1196260832413" resolveInfo="ComplexExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1196261859224">
      <property name="name" nameId="tpck.1169194664001" value="ImExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1196260832413" resolveInfo="ComplexExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1196418881524">
      <property name="name" nameId="tpck.1169194664001" value="ConjugateComplexExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1196260832413" resolveInfo="SingleComplexExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1196421957108">
      <property name="name" nameId="tpck.1169194664001" value="DegreeComplexExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1196260832413" resolveInfo="SingleComplexExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1196434001121">
      <property name="name" nameId="tpck.1169194664001" value="ImaginaryUnit" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </roots>
  <root id="1196259557930">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1196259984903">
      <property name="value" nameId="tpce.1105725733873" value="complex" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1196260743057">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1196261016993">
      <property name="value" nameId="tpce.1105725733873" value="re" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1196418742461">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1196418498814" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.DoubleType" typeId="tpee.1070534513062" id="1196418744322" />
    </node>
  </root>
  <root id="1196260832413">
    <node role="conceptLinkDeclaration" roleId="tpce.1137532086877" type="tpce.AggregationConceptLinkDeclaration" typeId="tpce.1105741535888" id="1196418498814">
      <property name="name" nameId="tpck.1169194664001" value="returnType" />
      <link role="targetType" roleId="tpce.1105736621938" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1196260892801">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="complexExpression" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1196261076958">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="1196263843100">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1196263863976">
      <property name="value" nameId="tpce.1105725733873" value="arg" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1196418763947">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1196418498814" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.DoubleType" typeId="tpee.1070534513062" id="1196418767636" />
    </node>
  </root>
  <root id="1196264034207">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1196264055958">
      <property name="value" nameId="tpce.1105725733873" value="abs" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1196418772512">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1196418498814" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.DoubleType" typeId="tpee.1070534513062" id="1196418775186" />
    </node>
  </root>
  <root id="1196261859224">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1196418637000">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1196418498814" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.DoubleType" typeId="tpee.1070534513062" id="1196418645565" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1196261893938">
      <property name="value" nameId="tpce.1105725733873" value="im" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1196418881524">
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1196418940099">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1196418498814" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpo9.ComplexType" typeId="1196259557930" id="1196419204127" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1196419247698">
      <property name="value" nameId="tpce.1105725733873" value="conj" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1196421957108">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1196422043474">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="degree" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1179362310214" resolveInfo="IntegerLiteral" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1196421987391">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="1196418498814" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpo9.ComplexType" typeId="1196259557930" id="1196422002159" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1196422008098">
      <property name="value" nameId="tpce.1105725733873" value="deg" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="1196434001121">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1196434710307">
      <property name="value" nameId="tpce.1105725733873" value="i" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1196436438637">
      <property name="value" nameId="tpce.1105725733873" value="complex imaginary unit" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
  </root>
</model>

