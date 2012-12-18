<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c895905f4(jetbrains.mps.transformation.test.inputLang.structure)">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="tpm0" modelUID="r:00000000-0000-4000-0000-011c895905f4(jetbrains.mps.transformation.test.inputLang.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1195168316083">
      <property name="name" nameId="tpck.1169194664001" value="InputRoot" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1195169091918">
      <property name="name" nameId="tpck.1169194664001" value="InputNode" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1195169251499">
      <property name="name" nameId="tpck.1169194664001" value="Option" />
      <property name="memberIdentifierPolicy" nameId="tpce.1197591154882" value="derive_from_internal_value" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1195169251500" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1195171011194">
      <property name="name" nameId="tpck.1169194664001" value="InputNode_A" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1195169091918" resolveInfo="InputNode" />
    </node>
    <node type="tpce.EnumerationDataTypeDeclaration" typeId="tpce.1082978164219" id="1202242680337">
      <property name="name" nameId="tpck.1169194664001" value="UseInTest" />
      <property name="memberIdentifierPolicy" nameId="tpce.1197591154882" value="derive_from_internal_value" />
      <link role="memberDataType" roleId="tpce.1083171729157" targetNodeId="tpck.1082983041843" resolveInfo="string" />
      <link role="defaultMember" roleId="tpce.1083241965437" targetNodeId="1202242822699" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1206459872650">
      <property name="name" nameId="tpck.1169194664001" value="InputNode_B" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1195171011194" resolveInfo="InputNode_A" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1206462895210">
      <property name="name" nameId="tpck.1169194664001" value="InputNode_C" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1206459872650" resolveInfo="InputNode_B" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1209146548167">
      <property name="name" nameId="tpck.1169194664001" value="ExpressionToReduceToStatement" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1209149421970">
      <property name="name" nameId="tpck.1169194664001" value="InputRootWithStatementList" />
      <property name="rootable" nameId="tpce.1096454100552" value="true" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
  </roots>
  <root id="1195168316083">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1202243304949">
      <property name="name" nameId="tpck.1169194664001" value="useInTest" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1202242680337" resolveInfo="UseInTest" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1195169805620">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="inputChild" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1195169091918" resolveInfo="InputNode" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1195168344225">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
  </root>
  <root id="1195169091918">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1202254005876">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="inputChild" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="0..n" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="1195169091918" resolveInfo="InputNode" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1195171040070">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1202327528157">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
  </root>
  <root id="1195169251499">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1195169251500">
      <property name="externalValue" nameId="tpce.1083923523172" value="option_default" />
      <property name="internalValue" nameId="tpce.1083923523171" value="option_default" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1195169295907">
      <property name="externalValue" nameId="tpce.1083923523172" value="option_1" />
      <property name="internalValue" nameId="tpce.1083923523171" value="option_1" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1202780730330">
      <property name="externalValue" nameId="tpce.1083923523172" value="drop it" />
      <property name="internalValue" nameId="tpce.1083923523171" value="drop_it" />
    </node>
  </root>
  <root id="1195171011194">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1195171080307">
      <property name="name" nameId="tpck.1169194664001" value="option" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1195169251499" resolveInfo="Option" />
    </node>
  </root>
  <root id="1202242680337">
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1202242680338">
      <property name="internalValue" nameId="tpce.1083923523171" value="test1" />
      <property name="externalValue" nameId="tpce.1083923523172" value="test1" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1202242753917">
      <property name="internalValue" nameId="tpce.1083923523171" value="getPrevInputTest" />
      <property name="externalValue" nameId="tpce.1083923523172" value="getPrevInputTest" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1206459825805">
      <property name="externalValue" nameId="tpce.1083923523172" value="reduceInheritors" />
      <property name="internalValue" nameId="tpce.1083923523171" value="reduceInheritors" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1209146734796">
      <property name="externalValue" nameId="tpce.1083923523172" value="reduceExpressionToStatement" />
      <property name="internalValue" nameId="tpce.1083923523171" value="reduceExpressionToStatement" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1209603553188">
      <property name="internalValue" nameId="tpce.1083923523171" value="dontApplyReductionTwice" />
      <property name="externalValue" nameId="tpce.1083923523172" value="dontApplyReductionTwice" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1218736527492">
      <property name="externalValue" nameId="tpce.1083923523172" value="weaveManyToSingularChild" />
      <property name="internalValue" nameId="tpce.1083923523171" value="weaveManyToSingularChild" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="341670684286865622">
      <property name="externalValue" nameId="tpce.1083923523172" value="reduceOneToMany" />
      <property name="internalValue" nameId="tpce.1083923523171" value="reduceOneToMany" />
    </node>
    <node role="member" roleId="tpce.1083172003582" type="tpce.EnumerationMemberDeclaration" typeId="tpce.1083171877298" id="1202242822699">
      <property name="externalValue" nameId="tpce.1083923523172" value="none" />
      <property name="internalValue" nameId="tpce.1083923523171" value="none" />
    </node>
  </root>
  <root id="1206459872650" />
  <root id="1206462895210" />
  <root id="1209146548167">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1209146621012">
      <property name="value" nameId="tpce.1105725733873" value="expression to reduce to statement" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1209146642483">
      <property name="value" nameId="tpce.1105725733873" value="generator should produce clear warning" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
  </root>
  <root id="1209149421970">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1209149449081">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="statementList" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068580123136" resolveInfo="StatementList" />
    </node>
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1209149492537">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpck.1169194658468" resolveInfo="INamedConcept" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1209149495553">
      <property name="name" nameId="tpck.1169194664001" value="useInTest" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="1202242680337" resolveInfo="UseInTest" />
    </node>
  </root>
</model>

