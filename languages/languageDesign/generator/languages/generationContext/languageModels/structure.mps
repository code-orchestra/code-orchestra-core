<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c895902f3(jetbrains.mps.lang.generator.generationContext.structure)" version="0">
  <persistence version="7" />
  <language namespace="c72da2b9-7cce-4447-8389-f407dc1158b7(jetbrains.mps.lang.structure)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="d7706f63-9be2-479c-a3da-ae92af1e64d5(jetbrains.mps.lang.generator.generationContext)" />
  <language namespace="d4615e3b-d671-4ba9-af01-2b78369b0ba7(jetbrains.mps.lang.pattern)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpf8" modelUID="r:00000000-0000-4000-0000-011c895902e8(jetbrains.mps.lang.generator.structure)" version="2" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" />
  <import index="tp3t" modelUID="r:00000000-0000-4000-0000-011c89590345(jetbrains.mps.lang.pattern.structure)" version="0" />
  <import index="lkfb" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.smodel(jetbrains.mps.smodel@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(java.lang@java_stub)" version="-1" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="tpf3" modelUID="r:00000000-0000-4000-0000-011c895902f3(jetbrains.mps.lang.generator.generationContext.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1216860049619">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_Base" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpck.1133920641626" resolveInfo="BaseConcept" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1216860049622">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GetOutputByLabel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1216860049627">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GetOutputByLabelAndInput" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1216860049633">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextType" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1068431790189" resolveInfo="Type" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1216860049635">
      <property name="name" nameId="tpck.1169194664001" value="TemplateFunctionParameter_generationContext" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="tpee.1107135704075" resolveInfo="ConceptFunctionParameter" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1216945228272">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GetScope" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217004708011">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GetInputModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217026863835">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GetOriginalInputModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217282130234">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GetOutputModel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217369610610">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GetTemplateNode" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217881979074">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GetPrevInputByLabel" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217884725453">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GetCopiedOutputByInput" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217889725928">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_SessionObjectAccess" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1217889960776" resolveInfo="GenerationContextOp_UserObjectAccessBase" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217889960776">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_UserObjectAccessBase" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217894011536">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_StepObjectAccess" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1217889960776" resolveInfo="GenerationContextOp_UserObjectAccessBase" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217894033795">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_TransientObjectAccess" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1217889960776" resolveInfo="GenerationContextOp_UserObjectAccessBase" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217960179967">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_ShowErrorMessage" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1217960314443" resolveInfo="GenerationContextOp_ShowMessageBase" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217960314443">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_ShowMessageBase" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217969995796">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_ShowWarningMessage" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1217960314443" resolveInfo="GenerationContextOp_ShowMessageBase" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1217970068025">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_ShowInfoMessage" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1217960314443" resolveInfo="GenerationContextOp_ShowMessageBase" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1218047638031">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_CreateUniqueName" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1221156564099">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GetOutputListByLabelAndInput" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1221218985173">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GetOutputByLabelAndInputAndReferenceScope" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1224102704684">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GetInvocationContext" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1229477454423">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GetOriginalCopiedInputByOutput" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="4589968773278056990">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_NodePatternRef" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1758784108619328022" resolveInfo="GenerationContextOp_PatternRefBase" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5190093307972723402">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_ParameterRef" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1758784108619220823">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_LinkPatternRef" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1758784108619328022" resolveInfo="GenerationContextOp_PatternRefBase" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1758784108619220824">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_PropertyPatternRef" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1758784108619328022" resolveInfo="GenerationContextOp_PatternRefBase" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="1758784108619328022">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_PatternRef" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="5403673535105109113">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_DirtyNode" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
    <node type="tpce.ConceptDeclaration" typeId="tpce.1071489090640" id="2507865635201615235">
      <property name="name" nameId="tpck.1169194664001" value="GenerationContextOp_GenParameterRef" />
      <link role="extends" roleId="tpce.1071489389519" targetNodeId="1216860049619" resolveInfo="GenerationContextOp_Base" />
    </node>
  </roots>
  <root id="1216860049619">
    <node role="implements" roleId="tpce.1169129564478" type="tpce.InterfaceConceptReference" typeId="tpce.1169127622168" id="1216860049620">
      <link role="intfc" roleId="tpce.1169127628841" targetNodeId="tpee.1197027803184" resolveInfo="IOperation" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1216860049621">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1218574577861">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
  </root>
  <root id="1216860049622">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1216860049623">
      <property name="role" nameId="tpce.1071599776563" value="label" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpf8.1200911316486" resolveInfo="MappingLabelDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1216860049625">
      <property name="value" nameId="tpce.1105725733873" value="get output by label" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217282035887">
      <property name="value" nameId="tpce.1105725733873" value="search output node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1217271982808">
      <property name="name" nameId="tpck.1169194664001" value="labelName_intern" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="1216860049627">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1217272005596">
      <property name="name" nameId="tpck.1169194664001" value="labelName_intern" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1216860049628">
      <property name="role" nameId="tpce.1071599776563" value="label" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpf8.1200911316486" resolveInfo="MappingLabelDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1216860049630">
      <property name="value" nameId="tpce.1105725733873" value="get output by label and input" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217282076780">
      <property name="value" nameId="tpce.1105725733873" value="search output node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1216860049632">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="inputNode" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="1216860049633">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1216860049634">
      <property name="value" nameId="tpce.1105725733873" value="gencontext" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217362319643">
      <property name="value" nameId="tpce.1105725733873" value="generation context type" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
  </root>
  <root id="1216860049635">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1216860049636">
      <property name="value" nameId="tpce.1105725733873" value="genContext" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1216860049637">
      <property name="value" nameId="tpce.1105725733873" value="generation context parameter" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1216860049638">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473994950" resolveInfo="dontSubstituteByDefault" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1216861920336">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1137545963098" resolveInfo="conceptFunctionParameterType" />
      <node role="target" roleId="tpce.1105736901241" type="tpf3.GenerationContextType" typeId="1216860049633" id="1216861951775" />
    </node>
  </root>
  <root id="1216945228272">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1216945228275">
      <property name="value" nameId="tpce.1105725733873" value="scope" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217281960527">
      <property name="value" nameId="tpce.1105725733873" value="access to IScope" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1217026337388">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1217026404184">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~IScope" resolveInfo="IScope" />
      </node>
    </node>
  </root>
  <root id="1217004708011">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217004708014">
      <property name="value" nameId="tpce.1105725733873" value="inputModel" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217281871506">
      <property name="value" nameId="tpce.1105725733873" value="current input model" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1217025941076">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SModelType" typeId="tp25.1143226024141" id="1217025946859" />
    </node>
  </root>
  <root id="1217026863835">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217026863836">
      <property name="value" nameId="tpce.1105725733873" value="originalModel" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217281911229">
      <property name="value" nameId="tpce.1105725733873" value="original input model" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1217026863838">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SModelType" typeId="tp25.1143226024141" id="1217026863839" />
    </node>
  </root>
  <root id="1217282130234">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217282130235">
      <property name="value" nameId="tpce.1105725733873" value="outputModel" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217282130236">
      <property name="value" nameId="tpce.1105725733873" value="current output model" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1217282130238">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SModelType" typeId="tp25.1143226024141" id="1217282130239" />
    </node>
  </root>
  <root id="1217369610610">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217369610611">
      <property name="value" nameId="tpce.1105725733873" value="templateNode" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217369610612">
      <property name="value" nameId="tpce.1105725733873" value="template node under macro" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1217369610614">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1217369699850" />
    </node>
  </root>
  <root id="1217881979074">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1217881979075">
      <property name="role" nameId="tpce.1071599776563" value="label" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpf8.1200911316486" resolveInfo="MappingLabelDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217881979076">
      <property name="value" nameId="tpce.1105725733873" value="get prev input by label" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217881979077">
      <property name="value" nameId="tpce.1105725733873" value="search preceding input node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1217881979079">
      <property name="name" nameId="tpck.1169194664001" value="labelName_intern" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="1217884725453">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217884725456">
      <property name="value" nameId="tpce.1105725733873" value="get copied output by input" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217884725457">
      <property name="value" nameId="tpce.1105725733873" value="search output node" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1217884725459">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="inputNode" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="1217889725928">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217889725929">
      <property name="value" nameId="tpce.1105725733873" value="session object" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217889725930">
      <property name="value" nameId="tpce.1105725733873" value="access to user object" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1217891230226">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpee.1197029536315" resolveInfo="lvalue" />
    </node>
  </root>
  <root id="1217889960776">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1217889977080">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1217889993472">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1217889997318">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
      </node>
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1217890689512">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="userKey" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="1217894011536">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217894011537">
      <property name="value" nameId="tpce.1105725733873" value="step object" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217894011538">
      <property name="value" nameId="tpce.1105725733873" value="access to user object" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1217894011539">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpee.1197029536315" resolveInfo="lvalue" />
    </node>
  </root>
  <root id="1217894033795">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217894033796">
      <property name="value" nameId="tpce.1105725733873" value="transient object" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217894033797">
      <property name="value" nameId="tpce.1105725733873" value="access to user object" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1217894033798">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpee.1197029536315" resolveInfo="lvalue" />
    </node>
  </root>
  <root id="1217960179967">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217960179970">
      <property name="value" nameId="tpce.1105725733873" value="show error" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217960179971">
      <property name="value" nameId="tpce.1105725733873" value="logging" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
  </root>
  <root id="1217960314443">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1217960314448">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="messageText" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1217960407512">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="referenceNode" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1217960375574">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1217960829615">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.VoidType" typeId="tpee.1068581517677" id="1217960831867" />
    </node>
  </root>
  <root id="1217969995796">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217969995797">
      <property name="value" nameId="tpce.1105725733873" value="show warning" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217969995798">
      <property name="value" nameId="tpce.1105725733873" value="logging" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
  </root>
  <root id="1217970068025">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217970068026">
      <property name="value" nameId="tpce.1105725733873" value="show info" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1217970068027">
      <property name="value" nameId="tpce.1105725733873" value="logging" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
  </root>
  <root id="1218047638031">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1218047638032">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="baseName" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1218049772449">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="contextNode" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1218047809928">
      <property name="value" nameId="tpce.1105725733873" value="unique name" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1218047858274">
      <property name="value" nameId="tpce.1105725733873" value="generate unique name " />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1218047638035">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.StringType" typeId="tpee.1225271177708" id="1303564268278398850" />
    </node>
  </root>
  <root id="1221156564099">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1221156564100">
      <property name="name" nameId="tpck.1169194664001" value="labelName_intern" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1221156564101">
      <property name="role" nameId="tpce.1071599776563" value="label" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpf8.1200911316486" resolveInfo="MappingLabelDeclaration" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1221156564102">
      <property name="value" nameId="tpce.1105725733873" value="get output list by label and input" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1221156564103">
      <property name="value" nameId="tpce.1105725733873" value="search output nodes" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1221156564104">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="inputNode" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="1221218985173">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1221219412886">
      <property name="value" nameId="tpce.1105725733873" value="pick output by label and input using ref.scope" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1221219412888">
      <property name="value" nameId="tpce.1105725733873" value="search output node using ref.scope" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1221219379823">
      <property name="role" nameId="tpce.1071599776563" value="label" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpf8.1200911316486" resolveInfo="MappingLabelDeclaration" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1221219370977">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="inputNode" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1221219363547">
      <property name="name" nameId="tpck.1169194664001" value="labelName_intern" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
  </root>
  <root id="1224102704684">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1224102704685">
      <property name="value" nameId="tpce.1105725733873" value="invocation context" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1224102704686">
      <property name="value" nameId="tpce.1105725733873" value="generator invocation context (IOperationContext)" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="short_description" />
    </node>
    <node role="conceptLink" roleId="tpce.1105736949336" type="tpce.AggregationConceptLink" typeId="tpce.1105736889287" id="1224102704687">
      <link role="conceptLinkDeclaration" roleId="tpce.1105736734721" targetNodeId="tpee.1217022095863" resolveInfo="returnType" />
      <node role="target" roleId="tpce.1105736901241" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1224102912533">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~IOperationContext" resolveInfo="IOperationContext" />
      </node>
    </node>
  </root>
  <root id="1229477454423">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1229477546801">
      <property name="value" nameId="tpce.1105725733873" value="get original copied input by output" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="1229477546818">
      <property name="value" nameId="tpce.1105725733873" value="original input node copied to output" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1229477520175">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="outputNode" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="4589968773278056990">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="4589968773278063829">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="patternVarDecl" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tp3t.1136720037779" resolveInfo="PatternVariableDeclaration" />
    </node>
  </root>
  <root id="5190093307972723402">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="8224086392574645374">
      <property name="name" nameId="tpck.1169194664001" value="name_intern" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5190093307972736266">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="parameter" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpf8.1805153994415891174" resolveInfo="TemplateParameterDeclaration" />
    </node>
  </root>
  <root id="1758784108619220823">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1758784108619220827">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="linkPatternVar" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tp3t.1137418540378" resolveInfo="LinkPatternVariableDeclaration" />
    </node>
  </root>
  <root id="1758784108619220824">
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="1758784108619220828">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="propertyPatternVar" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tp3t.1136720037781" resolveInfo="PropertyPatternVariableDeclaration" />
    </node>
  </root>
  <root id="1758784108619328022">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="1758784108619487309">
      <property name="name" nameId="tpck.1169194664001" value="name_intern" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.BooleanConceptProperty" typeId="tpce.1105725574259" id="1758784108619586712">
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473854053" resolveInfo="abstract" />
    </node>
  </root>
  <root id="5403673535105109113">
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5403673535105109115">
      <property name="value" nameId="tpce.1105725733873" value="is dirty" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473891462" resolveInfo="alias" />
    </node>
    <node role="conceptProperty" roleId="tpce.1105725339613" type="tpce.StringConceptProperty" typeId="tpce.1105725638761" id="5403673535105109116">
      <property name="value" nameId="tpce.1105725733873" value="checks if node is not ignored by generator" />
      <link role="conceptPropertyDeclaration" roleId="tpce.1105725439818" targetNodeId="tpck.1137473914776" resolveInfo="shortDescription" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="5403673535105109114">
      <property name="metaClass" nameId="tpce.1071599937831" value="aggregation" />
      <property name="role" nameId="tpce.1071599776563" value="nodeToCheck" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
    </node>
  </root>
  <root id="2507865635201615235">
    <node role="propertyDeclaration" roleId="tpce.1071489727084" type="tpce.PropertyDeclaration" typeId="tpce.1071489288299" id="4517825979522476799">
      <property name="name" nameId="tpck.1169194664001" value="name_intern" />
      <link role="dataType" roleId="tpce.1082985295845" targetNodeId="tpck.1082983041843" resolveInfo="string" />
    </node>
    <node role="linkDeclaration" roleId="tpce.1071489727083" type="tpce.LinkDeclaration" typeId="tpce.1071489288298" id="2507865635201615236">
      <property name="metaClass" nameId="tpce.1071599937831" value="reference" />
      <property name="role" nameId="tpce.1071599776563" value="importClause" />
      <property name="sourceCardinality" nameId="tpce.1071599893252" value="1" />
      <link role="target" roleId="tpce.1071599976176" targetNodeId="tpf8.650531548511911818" resolveInfo="GeneratorParameterReference" />
    </node>
  </root>
</model>

