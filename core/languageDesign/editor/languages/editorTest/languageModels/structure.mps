<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:1a7fc406-f263-498c-a126-51036fe6a9da(jetbrains.mps.lang.editor.editorTest.structure)" version="5">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="68nn" modelUID="r:1a7fc406-f263-498c-a126-51036fe6a9da(jetbrains.mps.lang.editor.editorTest.structure)" version="5" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3702466984434609595">
      <property name="name" nameId="tpck.1169194664001" value="TestBlockList" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3702466984434723496">
      <property name="name" nameId="tpck.1169194664001" value="BracesBlock" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3702466984434609595" resolveInfo="TestStatenetList" />
    </node>
    <node type="tpce.InterfaceConceptDeclaration" typeId="tpce.1169125989551" id="3702466984434723497">
      <property name="name" nameId="tpck.1169194664001" value="IBaseTestBlock" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3702466984434811404">
      <property name="name" nameId="tpck.1169194664001" value="StubBlock" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="6859592652550843066">
      <property name="name" nameId="tpck.1169194664001" value="VerticalLayoutBlockList" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="3702466984434609595" resolveInfo="TestStatenetList" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="8497577741385080308">
      <property name="name" nameId="tpck.1169194664001" value="BracesStubBlock" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="3582597462265868788">
      <property name="name" nameId="tpck.1169194664001" value="InspectorBlock" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="7658393498702771296">
      <property name="name" nameId="tpck.1169194664001" value="ReferenceAnnotataion" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.3364660638048049745" resolveInfo="LinkAttribute" />
    </node>
    <node type="tpce.AnnotationLinkDeclaration" typeId="tpce.1149608206811" id="7658393498702861285">
      <property name="role" nameId="tpce.1204740973143" value="referenceAnnotation" />
      <property name="stereotype" nameId="tpce.1149608445162" value="link" />
      <link role="source" roleId="tpce.1149608246500" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
      <link role="target" roleId="tpce.1204741097161" targetNodeId="7658393498702771296" resolveInfo="ReferenceAnnotataion" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5110219550149792114">
      <property name="name" nameId="tpck.1169194664001" value="SideTranformWrapper" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5110219550150263047">
      <property name="name" nameId="tpck.1169194664001" value="IntegerLiteral" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5110219550150320602">
      <property name="name" nameId="tpck.1169194664001" value="BinaryExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5110219550150492628">
      <property name="name" nameId="tpck.1169194664001" value="PlusExpression" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="5110219550150320602" resolveInfo="BinaryExpression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2613454275903805304">
      <property name="name" nameId="tpck.1169194664001" value="AttractsFocusBlock" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2613454275903819473">
      <property name="name" nameId="tpck.1169194664001" value="VariableDeclarationBlock" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2613454275903920988">
      <property name="name" nameId="tpck.1169194664001" value="VariableDeclarationReference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5633355289409839142">
      <property name="name" nameId="tpck.1169194664001" value="NonEmptyProperty" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4965160547087302660">
      <property name="name" nameId="tpck.1169194664001" value="NotEditableVaraileReference" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
  </roots>
  <root id="3702466984434609595">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3727822333335546449">
      <property name="value" nameId="tpce.1105725733873" value="{" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3702466984434609602">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="statement" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3702466984434723497" resolveInfo="TestStatement" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3167392541572622492">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
  </root>
  <root id="3702466984434723496">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3702466984434806357">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="TestStatement" />
    </node>
  </root>
  <root id="3702466984434723497" />
  <root id="3702466984434811404">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3702466984434845379">
      <property name="value" nameId="tpce.1105725733873" value="stub" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="3702466984434811405">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="TestStatement" />
    </node>
  </root>
  <root id="6859592652550843066">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="6859592652551032234">
      <property name="value" nameId="tpce.1105725733873" value="vericalLayout" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="6951814850419516533">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="BaseTestBlock" />
    </node>
  </root>
  <root id="8497577741385080308">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="8497577741385080322">
      <property name="value" nameId="tpce.1105725733873" value="braces stub" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="8497577741385080309">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
  </root>
  <root id="3582597462265868788">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="3582597462266222479">
      <property name="value" nameId="tpce.1105725733873" value="inspector" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="3582597462265868798">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="block" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4937962197548800603">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
  </root>
  <root id="7658393498702771296">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5216537374825317511">
      <property name="value" nameId="tpce.1105725733873" value="referenceAnnotation" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.5169995583184591164" resolveInfo="role" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.ReferenceConceptLink" typeId="tpce.1105736778597" id="5216537374825317512">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpck.5169995583184591169" resolveInfo="attributed" />
      <link role="target" roleId="tpce.1105736807942" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
  </root>
  <root id="7658393498702861285" />
  <root id="5110219550149792114">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5110219550150577779">
      <property name="value" nameId="tpce.1105725733873" value="side-transform-wrapper" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5110219550149792118">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="child" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="5110219550149792121">
      <property name="name" nameId="tpck.1169194664001" value="rightOpen" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657063" resolveInfo="boolean" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5110219550150263050">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
  </root>
  <root id="5110219550150263047">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="5110219550150263048">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983657062" resolveInfo="integer" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5110219550150263049">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
  </root>
  <root id="5110219550150320602">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5110219550150320604">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="left" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5110219550150320605">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="right" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5110219550150320603">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="5110219550150400726">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="5110219550150492628">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5110219550150492629">
      <property name="value" nameId="tpce.1105725733873" value="+" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
  <root id="2613454275903805304">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="7428162988804839411">
      <property name="value" nameId="tpce.1105725733873" value="attracts focus" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2613454275903805305">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="child" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="7428162988804758597">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
  </root>
  <root id="2613454275903819473">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="2613454275903819474">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="7428162988804872619">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
  </root>
  <root id="2613454275903920988">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2613454275903920989">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="var" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="2613454275903819473" resolveInfo="VariableDeclarationBlock" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="7428162988804905824">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
  </root>
  <root id="5633355289409839142">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5633355289410032964">
      <property name="value" nameId="tpce.1105725733873" value="non-empty-property" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="5633355289409839143">
      <property name="name" nameId="tpck.1169194664001" value="value" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="5633355289409887750">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
  </root>
  <root id="4965160547087302660">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4965160547087302661">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="variableDeclaration" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="2613454275903819473" resolveInfo="VariableDeclarationBlock" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="4965160547087514874">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="3702466984434723497" resolveInfo="IBaseTestBlock" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="4965160547087514875">
      <property name="value" nameId="tpce.1105725733873" value="{&lt;{variableDeclaration}&gt;} not editable" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
  </root>
</model>

