<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:5e2666e0-c7c7-4002-9ed9-38805719453d(jetbrains.mps.build.custommps.generator.template.main@generator)">
  <persistence version="7" />
  <language namespace="b401a680-8325-4110-8fd3-84331ff25bef(jetbrains.mps.lang.generator)" />
  <language namespace="d7706f63-9be2-479c-a3da-ae92af1e64d5(jetbrains.mps.lang.generator.generationContext)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="4e6c5313-7662-4c44-9bc7-b488cec17508(jetbrains.mps.build.packaging)" />
  <language namespace="0b608d44-1308-418d-8715-22d040c3b3cc(jetbrains.mps.buildlanguage)" />
  <language namespace="02824ec0-c6a4-4517-a484-12d85172bbaa(jetbrains.mps.build.distrib)" />
  <language namespace="fba399db-f591-45dc-a279-e2a2a986e262(jetbrains.mps.build.generictasks)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="a79f53b6-9aaa-48eb-9fbb-aaec80a6da9a(jetbrains.mps.build.custommps)" />
  <language namespace="3a13115c-633c-4c5c-bbcc-75c4219e9555(jetbrains.mps.lang.quotation)" />
  <import index="j1at" modelUID="r:896f64dd-7cfe-4bc4-b401-38e2a027e9ae(jetbrains.mps.build.custommps.structure)" version="-1" />
  <import index="zmlh" modelUID="r:0053416c-db1b-459c-a55a-a05cf9d1cf89(jetbrains.mps.build.custommps.behavior)" version="-1" />
  <import index="tpsf" modelUID="r:00000000-0000-4000-0000-011c895904d3(jetbrains.mps.build.packaging.behavior)" version="-1" />
  <import index="60oz" modelUID="r:3ffa047e-f111-477c-9b1d-805bb060825a(jetbrains.mps.build.distrib.structure)" version="0" />
  <import index="tpsk" modelUID="r:00000000-0000-4000-0000-011c895904c8(jetbrains.mps.buildlanguage.structure)" version="21" />
  <import index="tps4" modelUID="r:00000000-0000-4000-0000-011c895904d8(jetbrains.mps.build.packaging.structure)" version="8" />
  <import index="afxk" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.project(jetbrains.mps.project@java_stub)" version="-1" />
  <import index="eh1m" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.library(jetbrains.mps.library@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(java.lang@java_stub)" version="-1" />
  <import index="fxg7" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.io(java.io@java_stub)" version="-1" />
  <import index="tpf8" modelUID="r:00000000-0000-4000-0000-011c895902e8(jetbrains.mps.lang.generator.structure)" version="2" implicit="yes" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" implicit="yes" />
  <import index="tpf3" modelUID="r:00000000-0000-4000-0000-011c895902f3(jetbrains.mps.lang.generator.generationContext.structure)" version="0" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="tp3r" modelUID="r:00000000-0000-4000-0000-011c8959034b(jetbrains.mps.lang.quotation.structure)" version="0" implicit="yes" />
  <import index="ddum" modelUID="r:1e7ada09-c25e-41ea-a9b5-398e142ef533(jetbrains.mps.build.generictasks.structure)" version="22" implicit="yes" />
  <import index="adh8" modelUID="r:7a6a35c6-e369-4565-b91b-c7c8dfa2c8d7(jetbrains.mps.build.generictasks.generated)" version="-1" implicit="yes" />
  <import index="nqc9" modelUID="r:19a13561-830e-4400-a084-e2990744f9e1(jetbrains.mps.build.packaging.defaultVariables)" version="-1" implicit="yes" />
  <roots>
    <node type="tpf8.MappingConfiguration" typeId="tpf8.1095416546421" id="1233155140772">
      <property name="name" nameId="tpck.1169194664001" value="main" />
    </node>
    <node type="tpf8.TemplateDeclaration" typeId="tpf8.1092059087312" id="1233926023574">
      <property name="name" nameId="tpck.1169194664001" value="reduce_UndeclaredVariableReferenceInLayout" />
      <link role="applicableConcept" roleId="tpf8.1168285871518" targetNodeId="j1at.8431776905956790237" resolveInfo="UndeclaredVariableReference" />
    </node>
    <node type="tpf8.TemplateDeclaration" typeId="tpf8.1092059087312" id="1233931547920">
      <property name="name" nameId="tpck.1169194664001" value="weave_UndeclaredVariableReferenceDeclaration" />
      <link role="applicableConcept" roleId="tpf8.1168285871518" targetNodeId="j1at.8431776905956790237" resolveInfo="UndeclaredVariableReference" />
    </node>
    <node type="60oz.DistribConfiguration" typeId="60oz.1230056066379" id="1234779587495">
      <property name="name" nameId="tpck.1169194664001" value="MPS-autodist" />
      <property name="startupClass" nameId="60oz.1230058022109" value="jetbrains.mps.Launcher" />
      <property name="useVMOptionsFile" nameId="60oz.1231691563959" value="true" />
      <property name="defaultVMOptions" nameId="60oz.1231691593776" value="-client -Xss1024k -ea -Xmx1200m -XX:MaxPermSize=256m -XX:+HeapDumpOnOutOfMemoryError -Dfile.encoding=UTF-8" />
      <property name="additionalVMOptions" nameId="60oz.1240321503907" value="-Xdebug -Xrunjdwp:transport=dt_socket,server=y,suspend=n,address=5005" />
      <link role="buildScriptConfiguration" roleId="60oz.1230216533585" targetNodeId="1233926062534" resolveInfo="default" />
    </node>
    <node type="tpf8.TemplateDeclaration" typeId="tpf8.1092059087312" id="1234891595846">
      <property name="name" nameId="tpck.1169194664001" value="reduce_UndeclaredVariableReferenceInDistConfig" />
      <link role="applicableConcept" roleId="tpf8.1168285871518" targetNodeId="j1at.8431776905956790237" resolveInfo="UndeclaredVariableReference" />
    </node>
    <node type="tpf8.TemplateDeclaration" typeId="tpf8.1092059087312" id="1236881017235">
      <property name="name" nameId="tpck.1169194664001" value="weave_unpack_buildtools_MPSLayout" />
      <link role="applicableConcept" roleId="tpf8.1168285871518" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
    </node>
    <node type="tpf8.TemplateDeclaration" typeId="tpf8.1092059087312" id="1240396556348">
      <property name="name" nameId="tpck.1169194664001" value="weave_MPSLayout_AddPropertyFile" />
      <link role="applicableConcept" roleId="tpf8.1168285871518" targetNodeId="tps4.1202916958754" resolveInfo="Layout" />
    </node>
    <node type="tpf8.TemplateDeclaration" typeId="tpf8.1092059087312" id="2521628527372173250">
      <property name="name" nameId="tpck.1169194664001" value="reduce_MPSBuild" />
      <link role="applicableConcept" roleId="tpf8.1168285871518" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
    </node>
    <node type="tpsk.Project" typeId="tpsk.1196851066733" id="8716889635481488580">
      <property name="name" nameId="tpck.1169194664001" value="help-build" />
    </node>
    <node type="tpf8.TemplateDeclaration" typeId="tpf8.1092059087312" id="2235195415637079240">
      <property name="name" nameId="tpck.1169194664001" value="reduce_MPSDist" />
      <link role="applicableConcept" roleId="tpf8.1168285871518" targetNodeId="j1at.2235195415637073414" resolveInfo="MPSDistribution" />
    </node>
  </roots>
  <root id="1233155140772">
    <node role="reductionMappingRule" roleId="tpf8.1167328349397" type="tpf8.Reduction_MappingRule" typeId="tpf8.1167327847730" id="1233154893746">
      <link role="applicableConcept" roleId="tpf8.1167169349424" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
      <node role="ruleConsequence" roleId="tpf8.1169672767469" type="tpf8.TemplateDeclarationReference" typeId="tpf8.1168559333462" id="2521628527372173690">
        <link role="template" roleId="tpf8.1722980698497626483" targetNodeId="2521628527372173250" resolveInfo="reduce_MPSBuild" />
      </node>
    </node>
    <node role="reductionMappingRule" roleId="tpf8.1167328349397" type="tpf8.Reduction_MappingRule" typeId="tpf8.1167327847730" id="2235195415637092001">
      <link role="applicableConcept" roleId="tpf8.1167169349424" targetNodeId="j1at.2235195415637073414" resolveInfo="MPSDistribution" />
      <link role="labelDeclaration" roleId="tpf8.1200917515464" targetNodeId="1234780647459" resolveInfo="MPSDistToFolder" />
      <node role="ruleConsequence" roleId="tpf8.1169672767469" type="tpf8.TemplateDeclarationReference" typeId="tpf8.1168559333462" id="2235195415637092003">
        <link role="template" roleId="tpf8.1722980698497626483" targetNodeId="2235195415637079240" resolveInfo="reduce_MPSDist" />
      </node>
    </node>
    <node role="reductionMappingRule" roleId="tpf8.1167328349397" type="tpf8.Reduction_MappingRule" typeId="tpf8.1167327847730" id="1233931194398">
      <link role="applicableConcept" roleId="tpf8.1167169349424" targetNodeId="j1at.8431776905956790237" resolveInfo="UndeclaredVariableReference" />
      <node role="ruleConsequence" roleId="tpf8.1169672767469" type="tpf8.TemplateDeclarationReference" typeId="tpf8.1168559333462" id="1233931206835">
        <link role="template" roleId="tpf8.1722980698497626483" targetNodeId="1233926023574" resolveInfo="reduce_UndeclaredVariableReferenceInLayout" />
      </node>
      <node role="conditionFunction" roleId="tpf8.1167169362365" type="tpf8.BaseMappingRule_Condition" typeId="tpf8.1167168920554" id="1234891502382">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1234891502383">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1234891515249">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238405418952">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234891515633">
                <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1234891515250" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="1234891520924">
                  <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Inclusion" typeId="tp25.1144100932627" id="1234891538976" />
                  <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="1238405407074">
                    <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1238405414214">
                      <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tps4.1202916958754" resolveInfo="Layout" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="1238405421042" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="reductionMappingRule" roleId="tpf8.1167328349397" type="tpf8.Reduction_MappingRule" typeId="tpf8.1167327847730" id="1234891498528">
      <link role="applicableConcept" roleId="tpf8.1167169349424" targetNodeId="j1at.8431776905956790237" resolveInfo="UndeclaredVariableReference" />
      <node role="conditionFunction" roleId="tpf8.1167169362365" type="tpf8.BaseMappingRule_Condition" typeId="tpf8.1167168920554" id="1234891560671">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1234891560672">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1238405427011">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238405448933">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238405427494">
                <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1238405427012" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="1238405431519">
                  <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Inclusion" typeId="tp25.1144100932627" id="1238405445057" />
                  <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="1238405431520">
                    <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1238405439006">
                      <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="60oz.1230056066379" resolveInfo="DistribConfiguration" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="1238405450831" />
            </node>
          </node>
        </node>
      </node>
      <node role="ruleConsequence" roleId="tpf8.1169672767469" type="tpf8.TemplateDeclarationReference" typeId="tpf8.1168559333462" id="1234891663326">
        <link role="template" roleId="tpf8.1722980698497626483" targetNodeId="1234891595846" resolveInfo="reduce_UndeclaredVariableReferenceInDistConfig" />
      </node>
    </node>
    <node role="mappingLabel" roleId="tpf8.1200911492601" type="tpf8.MappingLabelDeclaration" typeId="tpf8.1200911316486" id="1233671018495">
      <property name="name" nameId="tpck.1169194664001" value="CustomMPSBuildToTargetDeclaration" />
      <link role="sourceConcept" roleId="tpf8.1200911342686" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
      <link role="targetConcept" roleId="tpf8.1200913004646" targetNodeId="tpsk.1196851099544" resolveInfo="TargetDeclaration" />
    </node>
    <node role="mappingLabel" roleId="tpf8.1200911492601" type="tpf8.MappingLabelDeclaration" typeId="tpf8.1200911316486" id="1233931087363">
      <property name="name" nameId="tpck.1169194664001" value="UndeclaredVariableReferenceToVariable" />
      <link role="sourceConcept" roleId="tpf8.1200911342686" targetNodeId="j1at.8431776905956790237" resolveInfo="UndeclaredVariableReference" />
      <link role="targetConcept" roleId="tpf8.1200913004646" targetNodeId="tps4.1205335290326" resolveInfo="Variable" />
    </node>
    <node role="mappingLabel" roleId="tpf8.1200911492601" type="tpf8.MappingLabelDeclaration" typeId="tpf8.1200911316486" id="1234780647459">
      <property name="name" nameId="tpck.1169194664001" value="MPSDistToFolder" />
      <link role="targetConcept" roleId="tpf8.1200913004646" targetNodeId="tps4.1203598512427" resolveInfo="Folder" />
      <link role="sourceConcept" roleId="tpf8.1200911342686" targetNodeId="j1at.2235195415637073414" resolveInfo="MPSDistribution" />
    </node>
    <node role="mappingLabel" roleId="tpf8.1200911492601" type="tpf8.MappingLabelDeclaration" typeId="tpf8.1200911316486" id="1237295614240">
      <property name="name" nameId="tpck.1169194664001" value="CustomMPSBuildToUnpackZipAntcall" />
      <link role="sourceConcept" roleId="tpf8.1200911342686" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
      <link role="targetConcept" roleId="tpf8.1200913004646" targetNodeId="tpsk.1196851099544" resolveInfo="TargetDeclaration" />
    </node>
    <node role="rootMappingRule" roleId="tpf8.1167514678247" type="tpf8.Root_MappingRule" typeId="tpf8.1167514355419" id="8716889635481504737">
      <property name="keepSourceRoot" nameId="tpf8.1177959072138" value="true" />
      <link role="applicableConcept" roleId="tpf8.1167169349424" targetNodeId="tps4.1202916958754" resolveInfo="Layout" />
      <link role="template" roleId="tpf8.1167514355421" targetNodeId="8716889635481488580" resolveInfo="help-build" />
      <node role="conditionFunction" roleId="tpf8.1167169362365" type="tpf8.BaseMappingRule_Condition" typeId="tpf8.1167168920554" id="8716889635481504738">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8716889635481504739">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8716889635481504740">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AndExpression" typeId="tpee.1080120340718" id="8716889635481504741">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="8716889635481504743">
                <link role="concept" roleId="tp25.1206019820684" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.1239995424995" resolveInfo="isInMPSBuild" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481504744">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481504745">
                  <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="8716889635481504746" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetDescendantsOperation" typeId="tp25.1171305280644" id="8716889635481504747">
                    <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="8716889635481504748">
                      <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="8716889635481504749">
                        <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.IsNotEmptyOperation" typeId="tp2q.1176501494711" id="8716889635481504750" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="rootMappingRule" roleId="tpf8.1167514678247" type="tpf8.Root_MappingRule" typeId="tpf8.1167514355419" id="1234781123286">
      <property name="keepSourceRoot" nameId="tpf8.1177959072138" value="true" />
      <link role="template" roleId="tpf8.1167514355421" targetNodeId="1234779587495" resolveInfo="MPS-autodist" />
      <link role="applicableConcept" roleId="tpf8.1167169349424" targetNodeId="j1at.2235195415637073414" resolveInfo="MPSDistribution" />
    </node>
    <node role="weavingMappingRule" roleId="tpf8.1167172143858" type="tpf8.Weaving_MappingRule" typeId="tpf8.1167171569011" id="6128676491055324580">
      <link role="applicableConcept" roleId="tpf8.1167169349424" targetNodeId="tps4.1202916958754" resolveInfo="Layout" />
      <node role="ruleConsequence" roleId="tpf8.1169570368028" type="tpf8.WeaveEach_RuleConsequence" typeId="tpf8.1169569792945" id="6128676491055373717">
        <link role="template" roleId="tpf8.1169569853122" targetNodeId="1233931547920" resolveInfo="weave_UndeclaredVariableReferenceDeclaration" />
        <node role="sourceNodesQuery" roleId="tpf8.1169569939267" type="tpf8.SourceSubstituteMacro_SourceNodesQuery" typeId="tpf8.1167951910403" id="6128676491055373718">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6128676491055373719">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6128676491055373720">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6128676491055373721">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="6128676491055373723">
                  <node role="elementType" roleId="tp2q.1237721435807" type="tp25.SNodeType" typeId="tp25.1138055754698" id="6128676491055373725">
                    <link role="concept" roleId="tp25.1138405853777" targetNodeId="j1at.8431776905956790237" resolveInfo="UndeclaredVariableReference" />
                  </node>
                  <node role="initValue" roleId="tp2q.1237721435808" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="4983785314006363648">
                    <node role="quotedNode" roleId="tp3r.1196350785114" type="j1at.UndeclaredVariableReference" typeId="j1at.8431776905956790237" id="4983785314006363650">
                      <property name="name" nameId="j1at.8431776905956790241" value="build" />
                      <property name="antName" nameId="j1at.8431776905956790240" value="build.number" />
                    </node>
                  </node>
                  <node role="initValue" roleId="tp2q.1237721435808" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="4983785314006363652">
                    <node role="quotedNode" roleId="tp3r.1196350785114" type="j1at.UndeclaredVariableReference" typeId="j1at.8431776905956790237" id="4983785314006363653">
                      <property name="name" nameId="j1at.8431776905956790241" value="version" />
                      <property name="antName" nameId="j1at.8431776905956790240" value="version" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="contextNodeQuery" roleId="tpf8.1184616230853" type="tpf8.Weaving_MappingRule_ContextNodeQuery" typeId="tpf8.1184616041890" id="6128676491055324582">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6128676491055324583">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4983785314006364882">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4983785314006364883">
              <node role="operand" roleId="tpee.1197027771414" type="tpf3.TemplateFunctionParameter_generationContext" typeId="tpf3.1216860049635" id="4983785314006364884" />
              <node role="operation" roleId="tpee.1197027833540" type="tpf3.GenerationContextOp_GetCopiedOutputByInput" typeId="tpf3.1217884725453" id="4983785314006364885">
                <node role="inputNode" roleId="tpf3.1217884725459" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="4983785314006364886" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="conditionFunction" roleId="tpf8.1167169362365" type="tpf8.BaseMappingRule_Condition" typeId="tpf8.1167168920554" id="6128676491055324584">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6128676491055324585">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6128676491055341145">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6128676491055373712">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6128676491055341147">
                <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="6128676491055341146" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetDescendantsOperation" typeId="tp25.1171305280644" id="6128676491055373706">
                  <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="6128676491055373707">
                    <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="6128676491055373711">
                      <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.IsNotEmptyOperation" typeId="tp2q.1176501494711" id="6128676491055373716" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="weavingMappingRule" roleId="tpf8.1167172143858" type="tpf8.Weaving_MappingRule" typeId="tpf8.1167171569011" id="1236880980815">
      <link role="applicableConcept" roleId="tpf8.1167169349424" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
      <node role="ruleConsequence" roleId="tpf8.1169570368028" type="tpf8.TemplateDeclarationReference" typeId="tpf8.1168559333462" id="1236881017239">
        <link role="template" roleId="tpf8.1722980698497626483" targetNodeId="1236881017235" resolveInfo="weave_unpack_buildtools_MPSLayout" />
      </node>
      <node role="contextNodeQuery" roleId="tpf8.1184616230853" type="tpf8.Weaving_MappingRule_ContextNodeQuery" typeId="tpf8.1184616041890" id="1236880980817">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1236880980818">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1236881012782">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1236881012783">
              <node role="operand" roleId="tpee.1197027771414" type="tpf3.TemplateFunctionParameter_generationContext" typeId="tpf3.1216860049635" id="1236881012784" />
              <node role="operation" roleId="tpee.1197027833540" type="tpf3.GenerationContextOp_GetCopiedOutputByInput" typeId="tpf3.1217884725453" id="1236881012785">
                <node role="inputNode" roleId="tpf3.1217884725459" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1236881012786">
                  <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1236881012787" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="1236881012788" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="conditionFunction" roleId="tpf8.1167169362365" type="tpf8.BaseMappingRule_Condition" typeId="tpf8.1167168920554" id="1236880986480">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1236880986481">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1236880995147">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1236880995148">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1236880995149">
                <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1236880995150" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="1236880995151" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="1236880995152">
                <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1236881000978">
                  <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tps4.1202916958754" resolveInfo="Layout" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="weavingMappingRule" roleId="tpf8.1167172143858" type="tpf8.Weaving_MappingRule" typeId="tpf8.1167171569011" id="1240396533791">
      <link role="applicableConcept" roleId="tpf8.1167169349424" targetNodeId="tps4.1202916958754" resolveInfo="Layout" />
      <node role="ruleConsequence" roleId="tpf8.1169570368028" type="tpf8.TemplateDeclarationReference" typeId="tpf8.1168559333462" id="1240396556352">
        <link role="template" roleId="tpf8.1722980698497626483" targetNodeId="1240396556348" resolveInfo="weave_MPSLayout_AddPropertyFile" />
      </node>
      <node role="contextNodeQuery" roleId="tpf8.1184616230853" type="tpf8.Weaving_MappingRule_ContextNodeQuery" typeId="tpf8.1184616041890" id="1240396533793">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1240396533794">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1240397038280">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240397038281">
              <node role="operand" roleId="tpee.1197027771414" type="tpf3.TemplateFunctionParameter_generationContext" typeId="tpf3.1216860049635" id="1240397038282" />
              <node role="operation" roleId="tpee.1197027833540" type="tpf3.GenerationContextOp_GetCopiedOutputByInput" typeId="tpf3.1217884725453" id="1240397038283">
                <node role="inputNode" roleId="tpf3.1217884725459" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1240397038284" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="conditionFunction" roleId="tpf8.1167169362365" type="tpf8.BaseMappingRule_Condition" typeId="tpf8.1167168920554" id="1240396552572">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1240396552573">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1240396553488">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240396553489">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240396553490">
                <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1240396553491" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetDescendantsOperation" typeId="tp25.1171305280644" id="1240396553492">
                  <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="1240396553493">
                    <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1240396553494">
                      <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.IsNotEmptyOperation" typeId="tp2q.1176501494711" id="1240396553495" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="1233926023574">
    <node role="contentNode" roleId="tpf8.1092060348987" type="tps4.Layout" typeId="tps4.1202916958754" id="1233926062533">
      <property name="name" nameId="tpck.1169194664001" value="some" />
      <node role="component" roleId="tps4.1203599325709" type="tps4.File" typeId="tps4.1203598322527" id="1233926079045">
        <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="1233926079046">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1233926079047">
            <property name="name" nameId="tps4.1220976068141" value="basedir" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1233926079048" />
        </node>
        <node role="title" roleId="tps4.1205340441197" type="tps4.VariableReference" typeId="tps4.1205339464939" id="1233931072848">
          <link role="variable" roleId="tps4.1205339484191" targetNodeId="1233926066007" resolveInfo="some.var" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.ReferenceMacro" typeId="tpf8.1088761943574" id="1233931081840">
            <property name="linkRole" nameId="tpck.1757699476691236116" value="variable" />
            <node role="referentFunction" roleId="tpf8.1167770376702" type="tpf8.ReferenceMacro_GetReferent" typeId="tpf8.1167770111131" id="1233931081841">
              <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1233931081842">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1234876246174">
                  <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1234876246175">
                    <property name="name" nameId="tpck.1169194664001" value="output" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1234876246176">
                      <link role="concept" roleId="tp25.1138405853777" targetNodeId="tps4.1205335290326" resolveInfo="Variable" />
                    </node>
                    <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234876246177">
                      <node role="operand" roleId="tpee.1197027771414" type="tpf3.TemplateFunctionParameter_generationContext" typeId="tpf3.1216860049635" id="1234876246178" />
                      <node role="operation" roleId="tpee.1197027833540" type="tpf3.GenerationContextOp_GetOutputByLabelAndInput" typeId="tpf3.1216860049627" id="1234876246179">
                        <link role="label" roleId="tpf3.1216860049628" targetNodeId="1233931087363" resolveInfo="UndeclaredVariableReferenceToVariable" />
                        <node role="inputNode" roleId="tpf3.1216860049632" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1234876246180" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1234876260122">
                  <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1234876260123">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1238405957148">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1238405960066">
                        <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238405957150">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1234876246175" resolveInfo="output" />
                        </node>
                        <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238405961329">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238405961330">
                            <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_outputNode" typeId="tpf8.1184690432998" id="1238405961331" />
                            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="1238405961332">
                              <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="1238405961333">
                                <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1238405961334">
                                  <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tps4.1234864659795" resolveInfo="IVariableHolder" />
                                </node>
                              </node>
                              <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Inclusion" typeId="tp25.1144100932627" id="1238405961335" />
                            </node>
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="1238405961336">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpsf.1234876428215" resolveInfo="findVariable" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238405961337">
                              <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1238405961338" />
                              <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1238405961339">
                                <link role="property" roleId="tp25.1138056395725" targetNodeId="tpck.1169194664001" resolveInfo="name" />
                              </node>
                            </node>
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1238405961340">
                              <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1238405961341" />
                              <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1238405961342">
                                <link role="property" roleId="tp25.1138056395725" targetNodeId="j1at.8431776905956790240" resolveInfo="antName" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1234876264327">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1234876265882" />
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1234876262904">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1234876246175" resolveInfo="output" />
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1233931161358">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1234876246186">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1234876246175" resolveInfo="output" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.TemplateFragment" typeId="tpf8.1095672379244" id="1233936265637" />
        </node>
      </node>
      <node role="configuration" roleId="tps4.1204115898932" type="tps4.Configuration" typeId="tps4.1204115658627" id="1233926062534">
        <property name="name" nameId="tpck.1169194664001" value="default" />
      </node>
      <node role="baseDirectory" roleId="tps4.1226493152214" type="tps4.BaseDirPath" typeId="tps4.1226494304686" id="1233926062540">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1233926062541">
          <property name="name" nameId="tps4.1220976068141" value="mps_home" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1233926062542" />
      </node>
      <node role="variable" roleId="tps4.1205335538326" type="tps4.Variable" typeId="tps4.1205335290326" id="1233926066007">
        <property name="antName" nameId="tps4.1205335307578" value="some.var" />
        <property name="name" nameId="tpck.1169194664001" value="some.var" />
      </node>
      <node role="deployDirectory" roleId="tps4.462257719548209895" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548545633">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="462257719548545634">
          <property name="name" nameId="tps4.1220976068141" value="basedir" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548545635" />
      </node>
      <node role="scriptsDirectory" roleId="tps4.462257719548209896" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548547155">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="462257719548547156">
          <property name="name" nameId="tps4.1220976068141" value="basedir" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548547157" />
      </node>
    </node>
  </root>
  <root id="1233931547920">
    <node role="contentNode" roleId="tpf8.1092060348987" type="tps4.Layout" typeId="tps4.1202916958754" id="1233931547926">
      <property name="name" nameId="tpck.1169194664001" value="some" />
      <node role="configuration" roleId="tps4.1204115898932" type="tps4.Configuration" typeId="tps4.1204115658627" id="1233931547927">
        <property name="name" nameId="tpck.1169194664001" value="default" />
      </node>
      <node role="baseDirectory" roleId="tps4.1226493152214" type="tps4.BaseDirPath" typeId="tps4.1226494304686" id="1233931547933">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1233931547934">
          <property name="name" nameId="tps4.1220976068141" value="mps_home" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1233931547935" />
      </node>
      <node role="variable" roleId="tps4.1205335538326" type="tps4.Variable" typeId="tps4.1205335290326" id="1233931557583">
        <property name="antName" nameId="tps4.1205335307578" value="var.ant.name" />
        <property name="name" nameId="tpck.1169194664001" value="var.name" />
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.TemplateFragment" typeId="tpf8.1095672379244" id="1233931574101" />
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="1233931574104">
          <property name="propertyName" nameId="tpck.1757699476691236117" value="antName" />
          <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="1233931574105">
            <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1233931574106">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1233931578359">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1233931578419">
                  <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1233931578360" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1233938622197">
                    <link role="property" roleId="tp25.1138056395725" targetNodeId="j1at.8431776905956790240" resolveInfo="antName" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="1233931591541">
          <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
          <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="1233931591542">
            <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1233931591543">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1234961680999">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234961684095">
                  <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1234961684096" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1234961690834">
                    <link role="property" roleId="tp25.1138056395725" targetNodeId="tpck.1169194664001" resolveInfo="name" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="deployDirectory" roleId="tps4.462257719548209895" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548545618">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="462257719548545619">
          <property name="name" nameId="tps4.1220976068141" value="basedir" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548545620" />
      </node>
      <node role="scriptsDirectory" roleId="tps4.462257719548209896" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548547140">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="462257719548547141">
          <property name="name" nameId="tps4.1220976068141" value="basedir" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548547142" />
      </node>
    </node>
  </root>
  <root id="1234779587495">
    <node role="systemSpecificConfig" roleId="60oz.1230207493185" type="60oz.UniversalConfig" typeId="60oz.1230292331281" id="1234780843439" />
    <node role="systemSpecificConfig" roleId="60oz.1230207493185" type="60oz.UnixConfig" typeId="60oz.1241440443288" id="1241441472522" />
    <node role="systemSpecificConfig" roleId="60oz.1230207493185" type="60oz.MacConfig" typeId="60oz.1233939045984" id="1234780843440">
      <node role="association" roleId="60oz.1234544418896" type="60oz.MacOsFileAssociation" typeId="60oz.1234544102398" id="1234780843466">
        <property name="extensions" nameId="60oz.1234544065816" value="mpr" />
        <property name="name" nameId="tpck.1169194664001" value="JetBrains MPS Project" />
        <node role="role" roleId="60oz.1234544190921" type="60oz.Role" typeId="60oz.1234544143490" id="1234780843467">
          <property name="name" nameId="tpck.1169194664001" value="Editor" />
        </node>
        <node role="icon" roleId="60oz.1234543961966" type="tps4.Path" typeId="tps4.1220973916698" id="1239975455644">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1239975455645">
            <property name="name" nameId="tps4.1220976068141" value="build_tools" />
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="4738159245302641891">
              <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
              <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="4738159245302641892">
                <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4738159245302641893">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4738159245302641894">
                    <node role="expression" roleId="tpee.1068580123156" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="4738159245302641895">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.4738159245302641872" resolveInfo="getUnpackBuildToolsPropertyName" />
                      <link role="concept" roleId="tp25.1206019820684" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1239975455646">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1239975465441">
              <property name="path" nameId="tps4.1220974398640" value="resources" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1239975469534">
              <property name="path" nameId="tps4.1220974398640" value="mps.icns" />
            </node>
          </node>
        </node>
      </node>
      <node role="javaApplicationStubPath" roleId="60oz.1234535772720" type="tps4.Path" typeId="tps4.1220973916698" id="1234894088288">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1234894088289">
          <property name="name" nameId="tps4.1220976068141" value="build_tools" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="4738159245302641881">
            <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
            <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="4738159245302641882">
              <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4738159245302641883">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4738159245302641884">
                  <node role="expression" roleId="tpee.1068580123156" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="4738159245302641885">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.4738159245302641872" resolveInfo="getUnpackBuildToolsPropertyName" />
                    <link role="concept" roleId="tp25.1206019820684" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1234894088290">
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1234894101997">
            <property name="path" nameId="tps4.1220974398640" value="resources" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1234894156432">
            <property name="path" nameId="tps4.1220974398640" value="mps" />
          </node>
        </node>
      </node>
      <node role="iconPath" roleId="60oz.1234512917007" type="tps4.Path" typeId="tps4.1220973916698" id="1234894159534">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1234894159535">
          <property name="name" nameId="tps4.1220976068141" value="build_tools" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="4738159245302641886">
            <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
            <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="4738159245302641887">
              <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4738159245302641888">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4738159245302641889">
                  <node role="expression" roleId="tpee.1068580123156" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="4738159245302641890">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.4738159245302641872" resolveInfo="getUnpackBuildToolsPropertyName" />
                    <link role="concept" roleId="tp25.1206019820684" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1234894159536">
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1234894173732">
            <property name="path" nameId="tps4.1220974398640" value="resources" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1234894183381">
            <property name="path" nameId="tps4.1220974398640" value="mps.icns" />
          </node>
        </node>
      </node>
    </node>
    <node role="systemSpecificConfig" roleId="60oz.1230207493185" type="60oz.WindowsConfig" typeId="60oz.1230207753430" id="1234780843434">
      <node role="pathToNsisZipFile" roleId="60oz.1231848713325" type="tps4.Path" typeId="tps4.1220973916698" id="1234895047549">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1234895047550">
          <property name="name" nameId="tps4.1220976068141" value="build_tools" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="4738159245302641896">
            <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
            <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="4738159245302641897">
              <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4738159245302641898">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4738159245302641899">
                  <node role="expression" roleId="tpee.1068580123156" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="4738159245302641900">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.4738159245302641872" resolveInfo="getUnpackBuildToolsPropertyName" />
                    <link role="concept" roleId="tp25.1206019820684" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1234895047551">
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1234895072187">
            <property name="path" nameId="tps4.1220974398640" value="tools" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1234895073693">
            <property name="path" nameId="tps4.1220974398640" value="nsis.zip" />
          </node>
        </node>
      </node>
      <node role="applicationIcon" roleId="60oz.1234795184694" type="tps4.Path" typeId="tps4.1220973916698" id="1234895078096">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1234895078097">
          <property name="name" nameId="tps4.1220976068141" value="build_tools" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="4738159245302641906">
            <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
            <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="4738159245302641907">
              <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4738159245302641908">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4738159245302641909">
                  <node role="expression" roleId="tpee.1068580123156" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="4738159245302641910">
                    <link role="concept" roleId="tp25.1206019820684" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.4738159245302641872" resolveInfo="getUnpackBuildToolsPropertyName" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1234895078098">
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1234895093298">
            <property name="path" nameId="tps4.1220974398640" value="resources" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1234895098244">
            <property name="path" nameId="tps4.1220974398640" value="mps.ico" />
          </node>
        </node>
      </node>
      <node role="homepageIcon" roleId="60oz.1234795196738" type="tps4.Path" typeId="tps4.1220973916698" id="1234895104073">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1234895104074">
          <property name="name" nameId="tps4.1220976068141" value="build_tools" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="4738159245302641921">
            <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
            <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="4738159245302641922">
              <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4738159245302641923">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4738159245302641924">
                  <node role="expression" roleId="tpee.1068580123156" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="4738159245302641925">
                    <link role="concept" roleId="tp25.1206019820684" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.4738159245302641872" resolveInfo="getUnpackBuildToolsPropertyName" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1234895104075">
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1234895115678">
            <property name="path" nameId="tps4.1220974398640" value="resources" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1234895118304">
            <property name="path" nameId="tps4.1220974398640" value="homepage.ico" />
          </node>
        </node>
      </node>
      <node role="license" roleId="60oz.1234790749272" type="tps4.Path" typeId="tps4.1220973916698" id="1237898545544">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1237898545545">
          <property name="name" nameId="tps4.1220976068141" value="mps_home" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1237898545546">
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1237899770037">
            <property name="path" nameId="tps4.1220974398640" value="license" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1237899794649">
            <property name="path" nameId="tps4.1220974398640" value="mps_license.txt" />
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.IfMacro" typeId="tpf8.1118773211870" id="1237901321778">
          <node role="conditionFunction" roleId="tpf8.1167945861827" type="tpf8.IfMacro_Condition" typeId="tpf8.1167945743726" id="1237901321779">
            <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1237901321780">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1239988946703">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.NotExpression" typeId="tpee.1081516740877" id="1239988962138">
                  <node role="expression" roleId="tpee.1081516765348" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="1239988963084">
                    <link role="concept" roleId="tp25.1206019820684" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.1239995424995" resolveInfo="isInMPSBuild" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="alternativeConsequence" roleId="tpf8.1194989344771" type="tpf8.InlineTemplate_RuleConsequence" typeId="tpf8.1177093525992" id="1237901341611">
            <node role="templateNode" roleId="tpf8.1177093586806" type="tps4.Path" typeId="tps4.1220973916698" id="1237901347133">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1237901347134">
                <property name="name" nameId="tps4.1220976068141" value="basedir" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1237901347135" />
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.CopySrcNodeMacro" typeId="tpf8.1114706874351" id="1237901351778">
                <node role="sourceNodeQuery" roleId="tpf8.1168024447342" type="tpf8.SourceSubstituteMacro_SourceNodeQuery" typeId="tpf8.1168024337012" id="1237901351779">
                  <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1237901351780">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1237901363063">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1237901363176">
                        <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1237901363064" />
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8431776905956348989">
                          <link role="link" roleId="tp25.1138056516764" targetNodeId="j1at.2235195415637073458" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="signatureConfiguration" roleId="60oz.1231856017880" type="60oz.DigitalSignatureWindowsConfiguration" typeId="60oz.1231848405646" id="1238069370114">
        <node role="pathToExecutable" roleId="60oz.1231859196186" type="tps4.Path" typeId="tps4.1220973916698" id="1238069957553">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1238069957554">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1238069957555">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4738159245302641929">
              <property name="path" nameId="tps4.1220974398640" value="build" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4350419540517973572">
              <property name="path" nameId="tps4.1220974398640" value="sign" />
            </node>
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8575681287653609730">
              <property name="path" nameId="tps4.1220974398640" value="SignCode.exe" />
            </node>
          </node>
        </node>
        <node role="commandLine" roleId="60oz.1231859334762" type="60oz.StringCommandLinePart" typeId="60oz.1231859958652" id="1238070302929">
          <property name="text" nameId="60oz.1231861633100" value="-spc " />
        </node>
        <node role="commandLine" roleId="60oz.1231859334762" type="60oz.PathCommantLinePart" typeId="60oz.1238070714613" id="1238071102567">
          <node role="path" roleId="60oz.1238070735094" type="tps4.Path" typeId="tps4.1220973916698" id="1238071102568">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1238071102569">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1238071102570">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4738159245302641927">
                <property name="path" nameId="tps4.1220974398640" value="build" />
              </node>
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1238071242589">
                <property name="path" nameId="tps4.1220974398640" value="sign" />
              </node>
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2840917085334207164">
                <property name="path" nameId="tps4.1220974398640" value="cert_2009_cs.spc" />
              </node>
            </node>
          </node>
        </node>
        <node role="commandLine" roleId="60oz.1231859334762" type="60oz.StringCommandLinePart" typeId="60oz.1231859958652" id="1238071154195">
          <property name="text" nameId="60oz.1231861633100" value=" -v " />
        </node>
        <node role="commandLine" roleId="60oz.1231859334762" type="60oz.PathCommantLinePart" typeId="60oz.1238070714613" id="1238071194533">
          <node role="path" roleId="60oz.1238070735094" type="tps4.Path" typeId="tps4.1220973916698" id="1238071194534">
            <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1238071194535">
              <property name="name" nameId="tps4.1220976068141" value="mps_home" />
            </node>
            <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1238071194536">
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="4738159245302641931">
                <property name="path" nameId="tps4.1220974398640" value="build" />
              </node>
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1238071239067">
                <property name="path" nameId="tps4.1220974398640" value="sign" />
              </node>
              <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8575681287653609731">
                <property name="path" nameId="tps4.1220974398640" value="key_2009_cs_nocrypt.pvk" />
              </node>
            </node>
          </node>
        </node>
        <node role="commandLine" roleId="60oz.1231859334762" type="60oz.StringCommandLinePart" typeId="60oz.1231859958652" id="8235068106207366717">
          <property name="text" nameId="60oz.1231861633100" value=" " />
        </node>
        <node role="commandLine" roleId="60oz.1231859334762" type="60oz.ArtifactReferenceCommandLinePart" typeId="60oz.1231860019901" id="8235068106207260985" />
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.IfMacro" typeId="tpf8.1118773211870" id="1238071255690">
          <node role="conditionFunction" roleId="tpf8.1167945861827" type="tpf8.IfMacro_Condition" typeId="tpf8.1167945743726" id="1238071255691">
            <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1238071255692">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7675365865759885049">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.NotExpression" typeId="tpee.1081516740877" id="7675365865759887387">
                  <node role="expression" roleId="tpee.1081516765348" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="7675365865759885050">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.1239995424995" resolveInfo="isInMPSBuild" />
                    <link role="concept" roleId="tp25.1206019820684" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="embeddedJrePath" roleId="60oz.1238075486867" type="tps4.Path" typeId="tps4.1220973916698" id="1238075885041">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1238075885042">
          <property name="name" nameId="tps4.1220976068141" value="build_tools" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="4738159245302641901">
            <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
            <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="4738159245302641902">
              <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4738159245302641903">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4738159245302641904">
                  <node role="expression" roleId="tpee.1068580123156" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="4738159245302641905">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.4738159245302641872" resolveInfo="getUnpackBuildToolsPropertyName" />
                    <link role="concept" roleId="tp25.1206019820684" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1238075885043">
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1238075899156">
            <property name="path" nameId="tps4.1220974398640" value="tools" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1238075901189">
            <property name="path" nameId="tps4.1220974398640" value="jre.zip" />
          </node>
        </node>
      </node>
      <node role="installerIcon" roleId="60oz.1240556282503" type="tps4.Path" typeId="tps4.1220973916698" id="1240558468364">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1240558468365">
          <property name="name" nameId="tps4.1220976068141" value="build_tools" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="4738159245302641911">
            <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
            <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="4738159245302641912">
              <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4738159245302641913">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4738159245302641914">
                  <node role="expression" roleId="tpee.1068580123156" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="4738159245302641915">
                    <link role="concept" roleId="tp25.1206019820684" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.4738159245302641872" resolveInfo="getUnpackBuildToolsPropertyName" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1240558468366">
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1240558468379">
            <property name="path" nameId="tps4.1220974398640" value="resources" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1240558491432">
            <property name="path" nameId="tps4.1220974398640" value="mps.inst.ico" />
          </node>
        </node>
      </node>
      <node role="uninstallerIcon" roleId="60oz.1240556295367" type="tps4.Path" typeId="tps4.1220973916698" id="1240558476322">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1240558476323">
          <property name="name" nameId="tps4.1220976068141" value="build_tools" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="4738159245302641916">
            <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
            <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="4738159245302641917">
              <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4738159245302641918">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4738159245302641919">
                  <node role="expression" roleId="tpee.1068580123156" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="4738159245302641920">
                    <link role="concept" roleId="tp25.1206019820684" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.4738159245302641872" resolveInfo="getUnpackBuildToolsPropertyName" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1240558476324">
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1240558476337">
            <property name="path" nameId="tps4.1220974398640" value="resources" />
          </node>
          <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="1240558488119">
            <property name="path" nameId="tps4.1220974398640" value="mps.uninst.ico" />
          </node>
        </node>
      </node>
    </node>
    <node role="startupDirectory" roleId="60oz.1231848554347" type="60oz.SimplePath" typeId="60oz.1230059161514" id="1234780752550">
      <property name="path" nameId="60oz.1230059161515" value="bin" />
    </node>
    <node role="classPath" roleId="60oz.1230059446051" type="60oz.ClassPath" typeId="60oz.1230059161510" id="1234779587497">
      <node role="classPathItem" roleId="60oz.1230059161511" type="60oz.SimplePath" typeId="60oz.1230059161514" id="1234780786037">
        <property name="path" nameId="60oz.1230059161515" value="lib/branding.jar" />
      </node>
      <node role="classPathItem" roleId="60oz.1230059161511" type="60oz.SimplePath" typeId="60oz.1230059161514" id="2357139218799320973">
        <property name="path" nameId="60oz.1230059161515" value="lib/mpsboot.jar" />
      </node>
      <node role="classPathItem" roleId="60oz.1230059161511" type="60oz.SimplePath" typeId="60oz.1230059161514" id="1234780786088">
        <property name="path" nameId="60oz.1230059161515" value="lib/boot.jar" />
      </node>
      <node role="classPathItem" roleId="60oz.1230059161511" type="60oz.SimplePath" typeId="60oz.1230059161514" id="1234780786089">
        <property name="path" nameId="60oz.1230059161515" value="lib/bootstrap.jar" />
      </node>
      <node role="classPathItem" roleId="60oz.1230059161511" type="60oz.SimplePath" typeId="60oz.1230059161514" id="1234780786098">
        <property name="path" nameId="60oz.1230059161515" value="lib/util.jar" />
      </node>
      <node role="classPathItem" roleId="60oz.1230059161511" type="60oz.SimplePath" typeId="60oz.1230059161514" id="1234780786086">
        <property name="path" nameId="60oz.1230059161515" value="lib/jdom.jar" />
      </node>
      <node role="classPathItem" roleId="60oz.1230059161511" type="60oz.SimplePath" typeId="60oz.1230059161514" id="1234780786103">
        <property name="path" nameId="60oz.1230059161515" value="lib/log4j.jar" />
      </node>
      <node role="classPathItem" roleId="60oz.1230059161511" type="60oz.SimplePath" typeId="60oz.1230059161514" id="1234780786090">
        <property name="path" nameId="60oz.1230059161515" value="lib/extensions.jar" />
      </node>
      <node role="classPathItem" roleId="60oz.1230059161511" type="60oz.SimplePath" typeId="60oz.1230059161514" id="6118761843060259957">
        <property name="path" nameId="60oz.1230059161515" value="lib/trove4j.jar" />
      </node>
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.RootTemplateAnnotation" typeId="tpf8.1168619357332" id="1234779587499">
      <link role="applicableConcept" roleId="tpf8.1168619429071" targetNodeId="j1at.2235195415637073414" resolveInfo="MPSDistribution" />
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.ReferenceMacro" typeId="tpf8.1088761943574" id="1234780240996">
      <property name="linkRole" nameId="tpck.1757699476691236116" value="buildScriptConfiguration" />
      <node role="referentFunction" roleId="tpf8.1167770376702" type="tpf8.ReferenceMacro_GetReferent" typeId="tpf8.1167770111131" id="1234780240997">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1234780240998">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1234780263110">
            <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234780270015">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234780265478">
                <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1234780265409" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="1234800469287">
                  <link role="link" roleId="tp25.1138056546658" targetNodeId="tps4.1204116468206" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.IsNotEmptyOperation" typeId="tp2q.1176501494711" id="1234780375166" />
            </node>
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1234780263112">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1234780377340">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234800619018">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234780383608">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234780379583">
                      <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1234780459258" />
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="1234800471629">
                        <link role="link" roleId="tp25.1138056546658" targetNodeId="tps4.1204116468206" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetFirstOperation" typeId="tp2q.1165525191778" id="1234780469147" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1234800621893">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="tps4.1204115847973" />
                  </node>
                </node>
              </node>
            </node>
            <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="1234780479733">
              <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="1234780479734">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1234780483356">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234780594767">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234780588603">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234780558673">
                        <node role="operand" roleId="tpee.1197027771414" type="tpf3.TemplateFunctionParameter_generationContext" typeId="tpf3.1216860049635" id="1234780557519" />
                        <node role="operation" roleId="tpee.1197027833540" type="tpf3.GenerationContextOp_GetCopiedOutputByInput" typeId="tpf3.1217884725453" id="1234780577477">
                          <node role="inputNode" roleId="tpf3.1217884725459" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234780578729">
                            <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1234780578730" />
                            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="1234780578731">
                              <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="1234780578732">
                                <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1234780578733">
                                  <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tps4.1202916958754" resolveInfo="Layout" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="1234780593521">
                        <link role="link" roleId="tp25.1138056546658" targetNodeId="tps4.1204115898932" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetFirstOperation" typeId="tp2q.1165525191778" id="1234780596801" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.ReferenceMacro" typeId="tpf8.1088761943574" id="1234780362596">
      <property name="linkRole" nameId="tpck.1757699476691236116" value="projectFolder" />
      <node role="referentFunction" roleId="tpf8.1167770376702" type="tpf8.ReferenceMacro_GetReferent" typeId="tpf8.1167770111131" id="1234780362598">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1234780362599">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4543034158214463312">
            <node role="expression" roleId="tpee.1068580123156" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="4543034158214463342">
              <link role="concept" roleId="tp25.1140138128738" targetNodeId="tps4.1203598512427" resolveInfo="Folder" />
              <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4543034158214463319">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4543034158214463314">
                  <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="4543034158214463313" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="4543034158214463318">
                    <link role="link" roleId="tp25.1138056546658" targetNodeId="tps4.1203617897549" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.FindFirstOperation" typeId="tp2q.1225727723840" id="4543034158214463324">
                  <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="4543034158214463325">
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="4543034158214463326">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4543034158214463329">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4543034158214463334">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4543034158214463330">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4543034158214463327" resolveInfo="it" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="4543034158214463338">
                            <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="4543034158214463340">
                              <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tps4.1203598512427" resolveInfo="Folder" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="4543034158214463327">
                      <property name="name" nameId="tpck.1169194664001" value="it" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490586" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="vmOptionsDir" roleId="60oz.1231848671127" type="60oz.SimplePath" typeId="60oz.1230059161514" id="1234780816683">
      <property name="path" nameId="60oz.1230059161515" value="bin" />
    </node>
    <node role="webSite" roleId="60oz.1234787338210" type="tps4.SimpleString" typeId="tps4.1205339044029" id="1234787623084">
      <property name="name" nameId="tps4.1223641503366" value="http://www.jetbrains.com/mps" />
    </node>
    <node role="longName" roleId="60oz.1234784294876" type="tps4.CompositeString" typeId="tps4.1205342812422" id="1234787771749">
      <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="1234787771753">
        <node role="right" roleId="tps4.1205342834160" type="j1at.UndeclaredVariableReference" typeId="j1at.8431776905956790237" id="1234787781924">
          <property name="antName" nameId="j1at.8431776905956790240" value="version" />
          <property name="name" nameId="j1at.8431776905956790241" value="version" />
        </node>
        <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="1234787771755">
          <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="1234787771756" />
          <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="1234787771757">
            <property name="name" nameId="tps4.1223641503366" value="MPS" />
          </node>
        </node>
      </node>
      <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="1234787771766">
        <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="1234787771767" />
        <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="1234787771768">
          <property name="name" nameId="tps4.1223641503366" value="JetBrains" />
        </node>
      </node>
    </node>
    <node role="shortName" roleId="60oz.1234784278747" type="tps4.SimpleString" typeId="tps4.1205339044029" id="1234787799288">
      <property name="name" nameId="tps4.1223641503366" value="MPS" />
    </node>
    <node role="company" roleId="60oz.1234786563468" type="tps4.SimpleString" typeId="tps4.1205339044029" id="1234787810905">
      <property name="name" nameId="tps4.1223641503366" value="JetBrains" />
    </node>
    <node role="buildVersion" roleId="60oz.1234784309457" type="j1at.UndeclaredVariableReference" typeId="j1at.8431776905956790237" id="1234787836926">
      <property name="name" nameId="j1at.8431776905956790241" value="build" />
      <property name="antName" nameId="j1at.8431776905956790240" value="build.number" />
    </node>
    <node role="releaseVersion" roleId="60oz.1234784329127" type="j1at.UndeclaredVariableReference" typeId="j1at.8431776905956790237" id="1234787850632">
      <property name="name" nameId="j1at.8431776905956790241" value="version" />
      <property name="antName" nameId="j1at.8431776905956790240" value="version" />
    </node>
  </root>
  <root id="1234891595846">
    <node role="contentNode" roleId="tpf8.1092060348987" type="60oz.ExternalVariableReference" typeId="60oz.1234515156408" id="1234891642705">
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.TemplateFragment" typeId="tpf8.1095672379244" id="1234891647530" />
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.ReferenceMacro" typeId="tpf8.1088761943574" id="1234891647533">
        <property name="linkRole" nameId="tpck.1757699476691236116" value="variable" />
        <node role="referentFunction" roleId="tpf8.1167770376702" type="tpf8.ReferenceMacro_GetReferent" typeId="tpf8.1167770111131" id="1234891647534">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1234891647535">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1234891649623">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1234891649624">
                <property name="name" nameId="tpck.1169194664001" value="output" />
                <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1234891649625">
                  <link role="concept" roleId="tp25.1138405853777" targetNodeId="tps4.1205335290326" resolveInfo="Variable" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234891649626">
                  <node role="operand" roleId="tpee.1197027771414" type="tpf3.TemplateFunctionParameter_generationContext" typeId="tpf3.1216860049635" id="1234891649627" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpf3.GenerationContextOp_GetOutputByLabelAndInput" typeId="tpf3.1216860049627" id="1234891649628">
                    <link role="label" roleId="tpf3.1216860049628" targetNodeId="1233931087363" resolveInfo="UndeclaredVariableReferenceToVariable" />
                    <node role="inputNode" roleId="tpf3.1216860049632" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1234891649629" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1234891649630">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1234891649631">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1234891649632">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234891649633">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234891649634">
                      <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_outputNode" typeId="tpf8.1184690432998" id="1234891649635" />
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetAncestorOperation" typeId="tp25.1171407110247" id="1234891649636">
                        <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="1234891649637">
                          <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="1234891649638">
                            <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tps4.1234864659795" resolveInfo="IVariableHolder" />
                          </node>
                        </node>
                        <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Inclusion" typeId="tp25.1144100932627" id="1234891649639" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="1234891649640">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpsf.1234876428215" resolveInfo="findVariable" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234891649641">
                        <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1234891649642" />
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1234891649643">
                          <link role="property" roleId="tp25.1138056395725" targetNodeId="tpck.1169194664001" resolveInfo="name" />
                        </node>
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1234891649644">
                        <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="1234891649645" />
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1234891649646">
                          <link role="property" roleId="tp25.1138056395725" targetNodeId="j1at.8431776905956790240" resolveInfo="antName" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1234891649647">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1234891649648" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1234891649649">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1234891649624" resolveInfo="output" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1234891649650">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1234891649651">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1234891649624" resolveInfo="output" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="1236881017235">
    <node role="contentNode" roleId="tpf8.1092060348987" type="tps4.Layout" typeId="tps4.1202916958754" id="1236881042717">
      <node role="component" roleId="tps4.1203599325709" type="tps4.Antcall" typeId="tps4.1210777529562" id="6128676491055272265">
        <property name="excludes" nameId="tps4.1204107522064" value="" />
        <link role="project" roleId="tps4.1210777812278" targetNodeId="8716889635481488580" resolveInfo="help-build" />
        <link role="targetDeclaration" roleId="tps4.1224178284812" targetNodeId="8716889635481488766" resolveInfo="unpack.buildtools.zip" />
        <node role="delete" roleId="tps4.1210852534988" type="tps4.Delete" typeId="tps4.1204122781510" id="6128676491055272266" />
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.TemplateFragment" typeId="tpf8.1095672379244" id="6128676491055272267" />
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.ReferenceMacro" typeId="tpf8.1088761943574" id="6128676491055272268">
          <property name="linkRole" nameId="tpck.1757699476691236116" value="targetDeclaration" />
          <node role="referentFunction" roleId="tpf8.1167770376702" type="tpf8.ReferenceMacro_GetReferent" typeId="tpf8.1167770111131" id="6128676491055272269">
            <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6128676491055272270">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6128676491055272271">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6128676491055272272">
                  <node role="operand" roleId="tpee.1197027771414" type="tpf3.TemplateFunctionParameter_generationContext" typeId="tpf3.1216860049635" id="6128676491055272273" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpf3.GenerationContextOp_GetOutputByLabelAndInput" typeId="tpf3.1216860049627" id="6128676491055272274">
                    <link role="label" roleId="tpf3.1216860049628" targetNodeId="1237295614240" resolveInfo="CustomMPSBuildToUnpackZipAntcall" />
                    <node role="inputNode" roleId="tpf3.1216860049632" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="6128676491055272275" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="configuration" roleId="tps4.1204115898932" type="tps4.Configuration" typeId="tps4.1204115658627" id="1236881042718">
        <property name="name" nameId="tpck.1169194664001" value="default" />
      </node>
      <node role="baseDirectory" roleId="tps4.1226493152214" type="tps4.BaseDirPath" typeId="tps4.1226494304686" id="1236881042724">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1236881042725">
          <property name="name" nameId="tps4.1220976068141" value="mps_home" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1236881042726" />
      </node>
      <node role="deployDirectory" roleId="tps4.462257719548209895" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548545630">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="462257719548545631">
          <property name="name" nameId="tps4.1220976068141" value="basedir" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548545632" />
      </node>
      <node role="scriptsDirectory" roleId="tps4.462257719548209896" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548547152">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="462257719548547153">
          <property name="name" nameId="tps4.1220976068141" value="basedir" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548547154" />
      </node>
    </node>
  </root>
  <root id="1240396556348">
    <node role="contentNode" roleId="tpf8.1092060348987" type="tps4.Layout" typeId="tps4.1202916958754" id="1240396593402">
      <node role="configuration" roleId="tps4.1204115898932" type="tps4.Configuration" typeId="tps4.1204115658627" id="1240396593403">
        <property name="name" nameId="tpck.1169194664001" value="default" />
      </node>
      <node role="baseDirectory" roleId="tps4.1226493152214" type="tps4.BaseDirPath" typeId="tps4.1226494304686" id="1240396593409">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="1240396593410">
          <property name="name" nameId="tps4.1220976068141" value="mps_home" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="1240396593411" />
      </node>
      <node role="propertyFile" roleId="tps4.1240395872155" type="tps4.PropertyFileImport" typeId="tps4.2372113960322848948" id="8148924375507135190">
        <node role="file" roleId="tps4.2372113960322848949" type="tps4.Path" typeId="tps4.1220973916698" id="8148924375507135194">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="8148924375507135195">
            <property name="name" nameId="tps4.1220976068141" value="mps_home" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="8148924375507135196">
            <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="8148924375507135197">
              <property name="path" nameId="tps4.1220974398640" value="build.number" />
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.TemplateFragment" typeId="tpf8.1095672379244" id="8148924375507135199" />
      </node>
      <node role="deployDirectory" roleId="tps4.462257719548209895" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548545621">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="462257719548545622">
          <property name="name" nameId="tps4.1220976068141" value="basedir" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548545623" />
      </node>
      <node role="scriptsDirectory" roleId="tps4.462257719548209896" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548547143">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="462257719548547144">
          <property name="name" nameId="tps4.1220976068141" value="basedir" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548547145" />
      </node>
    </node>
  </root>
  <root id="2521628527372173250">
    <node role="contentNode" roleId="tpf8.1092060348987" type="tps4.Layout" typeId="tps4.1202916958754" id="2521628527372173251">
      <property name="name" nameId="tpck.1169194664001" value="MPSBuildStructure" />
      <node role="component" roleId="tps4.1203599325709" type="j1at.MPSDistribution" typeId="j1at.2235195415637073414" id="2235195415637077170">
        <property name="excludes" nameId="tps4.1204107522064" value="" />
        <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637077175">
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="2235195415637077176">
            <property name="name" nameId="tpck.1169194664001" value="" />
            <property name="excludes" nameId="tps4.1204107538752" value="samples/**, build/**, **/MPS-buildTools.zip" />
            <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077177">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077178">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077179" />
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637077180">
            <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077181">
              <property name="name" nameId="tps4.1223641503366" value="lib" />
            </node>
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.IfMacro" typeId="tpf8.1118773211870" id="2235195415637077182">
              <node role="conditionFunction" roleId="tpf8.1167945861827" type="tpf8.IfMacro_Condition" typeId="tpf8.1167945743726" id="2235195415637077183">
                <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637077184">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637077185">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077186">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077187">
                        <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637077188" />
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetDescendantsOperation" typeId="tp25.1171305280644" id="2235195415637077189">
                          <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="2235195415637077190">
                            <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2235195415637077191">
                              <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="j1at.1233679247700" resolveInfo="LibraryFolder" />
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp2q.IsNotEmptyOperation" typeId="tp2q.1176501494711" id="2235195415637077192" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="entry" roleId="tps4.1203617897549" type="tps4.Antcall" typeId="tps4.1210777529562" id="6128676491055266631">
              <property name="excludes" nameId="tps4.1204107522064" value="" />
              <link role="project" roleId="tps4.1210777812278" targetNodeId="8716889635481488580" resolveInfo="help-build" />
              <link role="targetDeclaration" roleId="tps4.1224178284812" targetNodeId="8716889635481488835" resolveInfo="add.libraries" />
              <node role="entry" roleId="tps4.1203617897549" type="tps4.Copy" typeId="tps4.1204015075559" id="6128676491055266633">
                <property name="name" nameId="tpck.1169194664001" value="" />
                <property name="excludes" nameId="tps4.1204107538752" value="" />
                <node role="sourcePath" roleId="tps4.1220974847213" type="tps4.Path" typeId="tps4.1220973916698" id="6128676491055266634">
                  <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="6128676491055266635">
                    <property name="name" nameId="tps4.1220976068141" value="mps_home" />
                  </node>
                  <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="6128676491055266636">
                    <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="6128676491055266637">
                      <property name="path" nameId="tps4.1220974398640" value="lib" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="delete" roleId="tps4.1210852534988" type="tps4.Delete" typeId="tps4.1204122781510" id="6128676491055266632" />
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637077201">
            <node role="entry" roleId="tps4.1203617897549" type="tps4.File" typeId="tps4.1203598322527" id="2235195415637077202">
              <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077203">
                <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077204">
                  <property name="name" nameId="tps4.1220976068141" value="basedir" />
                </node>
                <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077205" />
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.CopySrcNodeMacro" typeId="tpf8.1114706874351" id="2235195415637077206">
                  <node role="sourceNodeQuery" roleId="tpf8.1168024447342" type="tpf8.SourceSubstituteMacro_SourceNodeQuery" typeId="tpf8.1168024337012" id="2235195415637077207">
                    <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637077208">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637077209">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077210">
                          <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637077211" />
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2235195415637077212">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="j1at.1237897943794" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.IfMacro" typeId="tpf8.1118773211870" id="2235195415637077213">
                <node role="conditionFunction" roleId="tpf8.1167945861827" type="tpf8.IfMacro_Condition" typeId="tpf8.1167945743726" id="2235195415637077214">
                  <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637077215">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637077216">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077217">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077218">
                          <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637077219" />
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2235195415637077220">
                            <link role="link" roleId="tp25.1138056516764" targetNodeId="j1at.1237897943794" />
                          </node>
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="2235195415637077221" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077222">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077223">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077224">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637077225">
                  <property name="path" nameId="tps4.1220974398640" value="license" />
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Antcall" typeId="tps4.1210777529562" id="6128676491055266639">
            <property name="excludes" nameId="tps4.1204107522064" value="" />
            <link role="project" roleId="tps4.1210777812278" targetNodeId="8716889635481488580" resolveInfo="help-build" />
            <link role="targetDeclaration" roleId="tps4.1224178284812" targetNodeId="8716889635481488614" resolveInfo="append.mps.version" />
            <node role="entry" roleId="tps4.1203617897549" type="tps4.Echo" typeId="tps4.1205331422635" id="6128676491055266641">
              <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="6128676491055266642">
                <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="6128676491055266643">
                  <property name="name" nameId="tps4.1220976068141" value="basedir" />
                </node>
                <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="6128676491055266644" />
              </node>
              <node role="message" roleId="tps4.1205340508811" type="tps4.CompositeString" typeId="tps4.1205342812422" id="6128676491055266645">
                <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="6128676491055266646">
                  <property name="name" nameId="tps4.1223641503366" value="date=" />
                </node>
                <node role="right" roleId="tps4.1205342834160" type="tps4.VariableReference" typeId="tps4.1205339464939" id="6128676491055266647">
                  <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551661" resolveInfo="date" />
                </node>
              </node>
              <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="6128676491055266648">
                <property name="name" nameId="tps4.1223641503366" value="build.number" />
              </node>
            </node>
            <node role="delete" roleId="tps4.1210852534988" type="tps4.Delete" typeId="tps4.1204122781510" id="6128676491055266640" />
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.File" typeId="tps4.1203598322527" id="2235195415637077245">
            <property name="name" nameId="tpck.1169194664001" value="readme.mps.txt" />
            <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077246">
              <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077247">
                <property name="name" nameId="tps4.1220976068141" value="mps_home" />
              </node>
              <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077248">
                <node role="pathComponent" roleId="tps4.1220978161990" type="tps4.PathComponent" typeId="tps4.1220973955905" id="2235195415637077249">
                  <property name="path" nameId="tps4.1220974398640" value="readme.txt" />
                </node>
              </node>
            </node>
            <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077250">
              <property name="name" nameId="tps4.1223641503366" value="readme.mps.txt" />
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.ComponentsList" typeId="tps4.1240562872025" id="2235195415637077251">
            <node role="entry" roleId="tps4.1240563011522" type="tps4.Echo" typeId="tps4.1205331422635" id="2235195415637077252">
              <property name="append" nameId="tps4.1240852090407" value="true" />
              <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077253">
                <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077254">
                  <property name="name" nameId="tps4.1220976068141" value="basedir" />
                </node>
                <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077255" />
              </node>
              <node role="message" roleId="tps4.1205340508811" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077256">
                <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077257">
                  <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077258">
                    <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077259">
                      <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077260">
                        <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077261">
                          <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077262">
                            <node role="right" roleId="tps4.1205342834160" type="tps4.VariableReference" typeId="tps4.1205339464939" id="2235195415637077263">
                              <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551662" resolveInfo="\n" />
                            </node>
                            <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077264">
                              <property name="name" nameId="tps4.1223641503366" value="libraries:" />
                            </node>
                          </node>
                          <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077265">
                            <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077266" />
                            <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077267">
                              <property name="name" nameId="tps4.1223641503366" value="with" />
                            </node>
                          </node>
                        </node>
                        <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077268">
                          <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077269" />
                          <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077270">
                            <node role="right" roleId="tps4.1205342834160" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077271">
                              <property name="name" nameId="tps4.1223641503366" value="packaged" />
                            </node>
                            <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077272">
                              <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077273" />
                              <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077274">
                                <node role="right" roleId="tps4.1205342834160" type="j1at.UndeclaredVariableReference" typeId="j1at.8431776905956790237" id="2235195415637077275">
                                  <property name="name" nameId="j1at.8431776905956790241" value="version" />
                                  <property name="antName" nameId="j1at.8431776905956790240" value="version" />
                                </node>
                                <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077276">
                                  <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077277" />
                                  <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077278">
                                    <property name="name" nameId="tps4.1223641503366" value="MPS" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077279">
                        <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077280" />
                        <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077281">
                          <property name="name" nameId="tps4.1223641503366" value="JetBrains" />
                        </node>
                      </node>
                    </node>
                    <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077282">
                      <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077283" />
                      <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077284">
                        <property name="name" nameId="tps4.1223641503366" value="contains" />
                      </node>
                    </node>
                  </node>
                  <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077285">
                    <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077286" />
                    <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077287">
                      <property name="name" nameId="tps4.1223641503366" value="package" />
                    </node>
                  </node>
                </node>
                <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077288">
                  <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077289">
                    <property name="name" nameId="tps4.1223641503366" value="This" />
                  </node>
                  <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077290" />
                </node>
              </node>
              <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077291">
                <property name="name" nameId="tps4.1223641503366" value="readme.txt" />
              </node>
            </node>
            <node role="entry" roleId="tps4.1240563011522" type="tps4.Echo" typeId="tps4.1205331422635" id="2235195415637077292">
              <property name="append" nameId="tps4.1240852090407" value="true" />
              <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077293">
                <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077294">
                  <property name="name" nameId="tps4.1220976068141" value="basedir" />
                </node>
                <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077295" />
              </node>
              <node role="message" roleId="tps4.1205340508811" type="tps4.VariableReference" typeId="tps4.1205339464939" id="2235195415637077296">
                <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551662" resolveInfo="\n" />
              </node>
              <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077297">
                <property name="name" nameId="tps4.1223641503366" value="readme.txt" />
              </node>
            </node>
            <node role="entry" roleId="tps4.1240563011522" type="tps4.ComponentsList" typeId="tps4.1240562872025" id="2235195415637077298">
              <node role="entry" roleId="tps4.1240563011522" type="tps4.Echo" typeId="tps4.1205331422635" id="2235195415637077299">
                <property name="append" nameId="tps4.1240852090407" value="true" />
                <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077300">
                  <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077301">
                    <property name="name" nameId="tps4.1220976068141" value="basedir" />
                  </node>
                  <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077302" />
                </node>
                <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077303">
                  <property name="name" nameId="tps4.1223641503366" value="readme.txt" />
                </node>
                <node role="message" roleId="tps4.1205340508811" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077304">
                  <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077305">
                    <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077306" />
                    <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077307">
                      <property name="name" nameId="tps4.1223641503366" value="library" />
                    </node>
                  </node>
                  <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077308">
                    <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077309">
                      <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077310">
                        <node role="right" roleId="tps4.1205342834160" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077311">
                          <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077312">
                            <property name="name" nameId="tps4.1223641503366" value="folder.path" />
                            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="2235195415637077313">
                              <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
                              <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="2235195415637077314">
                                <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637077315">
                                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637077316">
                                    <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077317">
                                      <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637077318" />
                                      <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="2235195415637077319">
                                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.1240408519032" resolveInfo="getLibraryPathRelativeToMPSBuild" />
                                      </node>
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                          <node role="right" roleId="tps4.1205342834160" type="tps4.VariableReference" typeId="tps4.1205339464939" id="2235195415637077320">
                            <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551662" resolveInfo="\n" />
                          </node>
                        </node>
                        <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077321">
                          <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077322" />
                          <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077323">
                            <property name="name" nameId="tps4.1223641503366" value="folder" />
                          </node>
                        </node>
                      </node>
                      <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077324">
                        <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077325" />
                        <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077326">
                          <property name="name" nameId="tps4.1223641503366" value="in" />
                        </node>
                      </node>
                    </node>
                    <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077327">
                      <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077328" />
                      <node role="left" roleId="tps4.1205342829799" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077329">
                        <property name="name" nameId="tps4.1223641503366" value="library.name" />
                        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="2235195415637077330">
                          <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
                          <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="2235195415637077331">
                            <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637077332">
                              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637077333">
                                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077334">
                                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077335">
                                    <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637077336" />
                                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2235195415637077337">
                                      <link role="link" roleId="tp25.1138056516764" targetNodeId="j1at.1233679274643" />
                                    </node>
                                  </node>
                                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="2235195415637077338">
                                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpsf.1213877173054" resolveInfo="getValue" />
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="entry" roleId="tps4.1240563011522" type="tps4.Echo" typeId="tps4.1205331422635" id="2235195415637077339">
                <property name="append" nameId="tps4.1240852090407" value="true" />
                <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077340">
                  <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077341">
                    <property name="name" nameId="tps4.1220976068141" value="basedir" />
                  </node>
                  <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077342" />
                </node>
                <node role="message" roleId="tps4.1205340508811" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077343">
                  <node role="right" roleId="tps4.1205342834160" type="tps4.VariableReference" typeId="tps4.1205339464939" id="2235195415637077344">
                    <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551662" resolveInfo="\n" />
                  </node>
                  <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077345">
                    <node role="right" roleId="tps4.1205342834160" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077346">
                      <property name="name" nameId="tps4.1223641503366" value="module.name" />
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="2235195415637077347">
                        <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
                        <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="2235195415637077348">
                          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637077349">
                            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637077350">
                              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077351">
                                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077352">
                                  <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637077353" />
                                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="2235195415637077354">
                                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpsf.1213877515148" resolveInfo="getModule" />
                                  </node>
                                </node>
                                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2235195415637077355">
                                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="afxk.~IModule%dgetModuleFqName()%cjava%dlang%dString" resolveInfo="getModuleFqName" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077356">
                      <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077357" />
                      <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077358">
                        <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077359" />
                        <node role="left" roleId="tps4.1205342829799" type="tps4.CompositeString" typeId="tps4.1205342812422" id="2235195415637077360">
                          <node role="right" roleId="tps4.1205342834160" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077361" />
                          <node role="left" roleId="tps4.1205342829799" type="tps4.Space" typeId="tps4.1234531699390" id="2235195415637077362" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077363">
                  <property name="name" nameId="tps4.1223641503366" value="readme.txt" />
                </node>
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.LoopMacro" typeId="tpf8.1118786554307" id="2235195415637077364">
                  <node role="sourceNodesQuery" roleId="tpf8.1167952069335" type="tpf8.SourceSubstituteMacro_SourceNodesQuery" typeId="tpf8.1167951910403" id="2235195415637077365">
                    <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637077366">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637077367">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077368">
                          <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637077369" />
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetDescendantsOperation" typeId="tp25.1171305280644" id="2235195415637077370">
                            <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="2235195415637077371">
                              <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2235195415637077372">
                                <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tps4.1203599702327" resolveInfo="Module" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="entry" roleId="tps4.1240563011522" type="tps4.Echo" typeId="tps4.1205331422635" id="2235195415637077373">
                <property name="append" nameId="tps4.1240852090407" value="true" />
                <node role="sourcePath" roleId="tps4.1220981955937" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077374">
                  <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077375">
                    <property name="name" nameId="tps4.1220976068141" value="basedir" />
                  </node>
                  <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077376" />
                </node>
                <node role="message" roleId="tps4.1205340508811" type="tps4.VariableReference" typeId="tps4.1205339464939" id="2235195415637077377">
                  <link role="variable" roleId="tps4.1205339484191" targetNodeId="nqc9.5558646027962551662" resolveInfo="\n" />
                </node>
                <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077378">
                  <property name="name" nameId="tps4.1223641503366" value="readme.txt" />
                </node>
              </node>
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.LoopMacro" typeId="tpf8.1118786554307" id="2235195415637077379">
                <node role="sourceNodesQuery" roleId="tpf8.1167952069335" type="tpf8.SourceSubstituteMacro_SourceNodesQuery" typeId="tpf8.1167951910403" id="2235195415637077380">
                  <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637077381">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637077382">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077383">
                        <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637077384" />
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetDescendantsOperation" typeId="tp25.1171305280644" id="2235195415637077385">
                          <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="2235195415637077386">
                            <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2235195415637077387">
                              <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="j1at.1233679247700" resolveInfo="LibraryFolder" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="entry" roleId="tps4.1203617897549" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637077388">
            <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077389">
              <property name="name" nameId="tps4.1223641503366" value="entry" />
            </node>
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.LoopMacro" typeId="tpf8.1118786554307" id="2235195415637077390">
              <node role="sourceNodesQuery" roleId="tpf8.1167952069335" type="tpf8.SourceSubstituteMacro_SourceNodesQuery" typeId="tpf8.1167951910403" id="2235195415637077391">
                <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637077392">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637077393">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077394">
                      <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637077395" />
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="2235195415637077396">
                        <link role="link" roleId="tp25.1138056546658" targetNodeId="tps4.1203617897549" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.CopySrcNodeMacro" typeId="tpf8.1114706874351" id="2235195415637077397">
              <node role="sourceNodeQuery" roleId="tpf8.1168024447342" type="tpf8.SourceSubstituteMacro_SourceNodeQuery" typeId="tpf8.1168024337012" id="2235195415637077398">
                <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637077399">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637077400">
                    <node role="expression" roleId="tpee.1068580123156" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637077401" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637077402">
            <property name="name" nameId="tps4.1223641503366" value="MPS" />
          </node>
          <node role="configuration" roleId="tps4.1204116468206" type="tps4.ConfigurationReference" typeId="tps4.1204115822363" id="2235195415637077403">
            <link role="configuration" roleId="tps4.1204115847973" targetNodeId="1233926062534" resolveInfo="default" />
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.CopySrcListMacro" typeId="tpf8.1114729360583" id="2235195415637077404">
              <node role="sourceNodesQuery" roleId="tpf8.1168278589236" type="tpf8.SourceSubstituteMacro_SourceNodesQuery" typeId="tpf8.1167951910403" id="2235195415637077405">
                <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637077406">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637077407">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637077408">
                      <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637077409" />
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="2235195415637077410">
                        <link role="link" roleId="tp25.1138056546658" targetNodeId="tps4.1204116468206" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="pathToBuildToolsZip" roleId="j1at.2235195415637073457" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637077171">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637077172">
            <property name="name" nameId="tps4.1220976068141" value="basedir" />
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.CopySrcNodeMacro" typeId="tpf8.1114706874351" id="2235195415637091991">
              <node role="sourceNodeQuery" roleId="tpf8.1168024447342" type="tpf8.SourceSubstituteMacro_SourceNodeQuery" typeId="tpf8.1168024337012" id="2235195415637091992">
                <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637091993">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637091994">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="144296692409079118">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637091996">
                        <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637091995" />
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="144296692409079117">
                          <link role="link" roleId="tp25.1138056516764" targetNodeId="j1at.1234290845440" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="144296692409079122">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="tps4.1220976095387" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637077173">
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.CopySrcNodeMacro" typeId="tpf8.1114706874351" id="144296692409079124">
              <node role="sourceNodeQuery" roleId="tpf8.1168024447342" type="tpf8.SourceSubstituteMacro_SourceNodeQuery" typeId="tpf8.1168024337012" id="144296692409079125">
                <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="144296692409079126">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="144296692409079127">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="144296692409079134">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="144296692409079129">
                        <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="144296692409079128" />
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="144296692409079133">
                          <link role="link" roleId="tp25.1138056516764" targetNodeId="j1at.1234290845440" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="144296692409079139">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="tps4.1220974249696" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.TemplateFragment" typeId="tpf8.1095672379244" id="2235195415637077174" />
        <node role="licencePath" roleId="j1at.2235195415637073458" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637082606">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637082607">
            <property name="name" nameId="tps4.1220976068141" value="basedir" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637082608" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.CopySrcNodeMacro" typeId="tpf8.1114706874351" id="2235195415637082610">
            <node role="sourceNodeQuery" roleId="tpf8.1168024447342" type="tpf8.SourceSubstituteMacro_SourceNodeQuery" typeId="tpf8.1168024337012" id="2235195415637082611">
              <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637082612">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637082613">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637082615">
                    <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637082614" />
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2235195415637082619">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="j1at.1237897943794" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="configuration" roleId="tps4.1204115898932" type="tps4.Configuration" typeId="tps4.1204115658627" id="2521628527372173376">
        <property name="name" nameId="tpck.1169194664001" value="default" />
      </node>
      <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2521628527372173377">
        <property name="name" nameId="tpck.1169194664001" value=":" />
        <property name="antName" nameId="tps4.1205335307578" value="path.separator" />
      </node>
      <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2521628527372173378">
        <property name="name" nameId="tpck.1169194664001" value="basedir" />
        <property name="antName" nameId="tps4.1205335307578" value="basedir" />
      </node>
      <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2521628527372173379">
        <property name="name" nameId="tpck.1169194664001" value="date" />
        <property name="antName" nameId="tps4.1205335307578" value="DSTAMP" />
      </node>
      <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2521628527372173380">
        <property name="name" nameId="tpck.1169194664001" value="\n" />
        <property name="antName" nameId="tps4.1205335307578" value="line.separator" />
      </node>
      <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2521628527372173381">
        <property name="name" nameId="tpck.1169194664001" value="/" />
        <property name="antName" nameId="tps4.1205335307578" value="file.separator" />
      </node>
      <node role="baseDirectory" roleId="tps4.1226493152214" type="tps4.BaseDirPath" typeId="tps4.1226494304686" id="2521628527372173382">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2521628527372173383">
          <property name="name" nameId="tps4.1220976068141" value="mps_home" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2521628527372173384" />
      </node>
      <node role="deployDirectory" roleId="tps4.462257719548209895" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548545627">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="462257719548545628">
          <property name="name" nameId="tps4.1220976068141" value="basedir" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548545629" />
      </node>
      <node role="scriptsDirectory" roleId="tps4.462257719548209896" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548547149">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="462257719548547150">
          <property name="name" nameId="tps4.1220976068141" value="basedir" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548547151" />
      </node>
    </node>
  </root>
  <root id="8716889635481488580">
    <node role="property" roleId="tpsk.1200425668297" type="tpsk.ExternalPropertyDeclaration" typeId="tpsk.1219147669362" id="8716889635481488581">
      <property name="name" nameId="tpck.1169194664001" value="input.dir" />
      <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="8716889635481488582" />
    </node>
    <node role="property" roleId="tpsk.1200425668297" type="tpsk.ExternalPropertyDeclaration" typeId="tpsk.1219147669362" id="8716889635481488583">
      <property name="name" nameId="tpck.1169194664001" value="output.dir" />
      <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="8716889635481488584" />
    </node>
    <node role="property" roleId="tpsk.1200425668297" type="tpsk.ExternalPropertyDeclaration" typeId="tpsk.1219147669362" id="8716889635481488587">
      <property name="name" nameId="tpck.1169194664001" value="version" />
      <node role="type" roleId="tpsk.1196870993204" type="tpsk.StringType" typeId="tpsk.1196870403099" id="8716889635481488588" />
    </node>
    <node role="property" roleId="tpsk.1200425668297" type="tpsk.PropertyDeclaration" typeId="tpsk.1196851107341" id="8716889635481488591">
      <property name="name" nameId="tpck.1169194664001" value="executable.dir" />
      <node role="type" roleId="tpsk.1196870993204" type="tpsk.StringType" typeId="tpsk.1196870403099" id="8716889635481488592" />
      <node role="propertyValue" roleId="tpsk.1196851904859" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488593">
        <property name="value" nameId="tpsk.1196861024475" value="/executable" />
      </node>
    </node>
    <node role="property" roleId="tpsk.1200425668297" type="tpsk.PropertyDeclaration" typeId="tpsk.1196851107341" id="8716889635481488594">
      <property name="name" nameId="tpck.1169194664001" value="data.dir" />
      <node role="type" roleId="tpsk.1196870993204" type="tpsk.StringType" typeId="tpsk.1196870403099" id="8716889635481488595" />
      <node role="propertyValue" roleId="tpsk.1196851904859" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488596">
        <property name="value" nameId="tpsk.1196861024475" value="/data" />
      </node>
    </node>
    <node role="target" roleId="tpsk.1196851079482" type="tpsk.TargetDeclaration" typeId="tpsk.1196851099544" id="8716889635481488614">
      <property name="name" nameId="tpck.1169194664001" value="append.mps.version" />
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488615">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802814059" resolveInfo="loadfile" />
        <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488616">
          <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802813211" resolveInfo="filterchain" />
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488617">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802814719" resolveInfo="prefixlines" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488618">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814722" resolveInfo="prefix" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488619">
                <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488642" resolveInfo="prefix" />
              </node>
            </node>
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488620">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814060" resolveInfo="srcfile" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.FileName" typeId="tpsk.1199031681512" id="8716889635481488621">
            <node role="value" roleId="tpsk.1199031757132" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="8716889635481488622">
              <node role="left" roleId="tpsk.1197107855106" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488623">
                <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488645" resolveInfo="mps_home" />
              </node>
              <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488624">
                <property name="value" nameId="tpsk.1196861024475" value="/build.number" />
              </node>
            </node>
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488625">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814088" resolveInfo="property" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488626">
            <property name="value" nameId="tpsk.1196861024475" value="mps.buildinfo" />
          </node>
        </node>
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488627">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802812872" resolveInfo="echo" />
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488628">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802812878" resolveInfo="file" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488629">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488636" resolveInfo="build.number.file" />
          </node>
        </node>
        <node role="internalText" roleId="tpsk.1197724814674" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488630">
          <property name="value" nameId="tpsk.1196861024475" value="${mps.buildinfo}" />
        </node>
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488631">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802812427" resolveInfo="copy" />
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488632">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802812435" resolveInfo="file" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488633">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488636" resolveInfo="build.number.file" />
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488634">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802812455" resolveInfo="todir" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488635">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488583" resolveInfo="output.dir" />
          </node>
        </node>
      </node>
      <node role="propertyList" roleId="tpsk.1200425580778" type="tpsk.PropertyDeclaration" typeId="tpsk.1196851107341" id="8716889635481488636">
        <property name="name" nameId="tpck.1169194664001" value="build.number.file" />
        <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="8716889635481488637" />
        <node role="propertyValue" roleId="tpsk.1196851904859" type="tpsk.FileName" typeId="tpsk.1199031681512" id="8716889635481488638">
          <node role="value" roleId="tpsk.1199031757132" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="8716889635481488639">
            <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488640">
              <property name="value" nameId="tpsk.1196861024475" value="/build.number" />
            </node>
            <node role="left" roleId="tpsk.1197107855106" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488641">
              <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488581" resolveInfo="input.dir" />
            </node>
          </node>
        </node>
      </node>
      <node role="propertyList" roleId="tpsk.1200425580778" type="tpsk.PropertyDeclaration" typeId="tpsk.1196851107341" id="8716889635481488642">
        <property name="name" nameId="tpck.1169194664001" value="prefix" />
        <node role="type" roleId="tpsk.1196870993204" type="tpsk.StringType" typeId="tpsk.1196870403099" id="8716889635481488643" />
        <node role="propertyValue" roleId="tpsk.1196851904859" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488644">
          <property name="value" nameId="tpsk.1196861024475" value="jetbrains.mps." />
        </node>
      </node>
      <node role="propertyList" roleId="tpsk.1200425580778" type="tpsk.ExternalPropertyDeclaration" typeId="tpsk.1219147669362" id="8716889635481488645">
        <property name="name" nameId="tpck.1169194664001" value="mps_home" />
        <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="8716889635481488646" />
      </node>
    </node>
    <node role="target" roleId="tpsk.1196851079482" type="tpsk.TargetDeclaration" typeId="tpsk.1196851099544" id="8716889635481488766">
      <property name="name" nameId="tpck.1169194664001" value="unpack.buildtools.zip" />
      <node role="propertyList" roleId="tpsk.1200425580778" type="tpsk.ExternalPropertyDeclaration" typeId="tpsk.1219147669362" id="8716889635481488767">
        <property name="name" nameId="tpck.1169194664001" value="mps_home" />
        <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="8716889635481488768" />
      </node>
      <node role="propertyList" roleId="tpsk.1200425580778" type="tpsk.PropertyDeclaration" typeId="tpsk.1196851107341" id="4738159245302641847">
        <property name="name" nameId="tpck.1169194664001" value="build.tools.dir" />
        <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="4738159245302641853" />
        <node role="propertyValue" roleId="tpsk.1196851904859" type="tpsk.FileName" typeId="tpsk.1199031681512" id="4738159245302641854">
          <node role="value" roleId="tpsk.1199031757132" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="4738159245302641855">
            <node role="left" roleId="tpsk.1197107855106" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="4738159245302641856">
              <property name="value" nameId="tpsk.1196861024475" value="${" />
            </node>
            <node role="right" roleId="tpsk.1197107881958" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="4738159245302641857">
              <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="4738159245302641858">
                <property name="value" nameId="tpsk.1196861024475" value="}" />
              </node>
              <node role="left" roleId="tpsk.1197107855106" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="4738159245302641859">
                <property name="value" nameId="tpsk.1196861024475" value="scripts.folder" />
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="4738159245302641860">
                  <property name="propertyName" nameId="tpck.1757699476691236117" value="value" />
                  <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="4738159245302641861">
                    <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4738159245302641862">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4738159245302641863">
                        <node role="expression" roleId="tpee.1068580123156" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="4738159245302641864">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpsf.462257719548547202" resolveInfo="getScriptsDirName" />
                          <link role="concept" roleId="tp25.1206019820684" targetNodeId="tps4.1202916958754" resolveInfo="Layout" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="4738159245302641866">
          <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
          <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="4738159245302641867">
            <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4738159245302641868">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4738159245302641869">
                <node role="expression" roleId="tpee.1068580123156" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="4738159245302641879">
                  <link role="concept" roleId="tp25.1206019820684" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.4738159245302641872" resolveInfo="getUnpackBuildToolsPropertyName" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488769">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802814434" resolveInfo="mkdir" />
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488770">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814435" resolveInfo="dir" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.FileName" typeId="tpsk.1199031681512" id="8716889635481488771">
            <node role="value" roleId="tpsk.1199031757132" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="4738159245302510174">
              <node role="left" roleId="tpsk.1197107855106" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="4738159245302510177">
                <property name="value" nameId="tpsk.1196861024475" value="${" />
              </node>
              <node role="right" roleId="tpsk.1197107881958" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="4738159245302510178">
                <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="4738159245302510181">
                  <property name="value" nameId="tpsk.1196861024475" value="}" />
                </node>
                <node role="left" roleId="tpsk.1197107855106" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="1234517927657">
                  <property name="value" nameId="tpsk.1196861024475" value="scripts.folder" />
                  <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="1234517927658">
                    <property name="propertyName" nameId="tpck.1757699476691236117" value="value" />
                    <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="1234517927659">
                      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1234517927660">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4738159245302510182">
                          <node role="expression" roleId="tpee.1068580123156" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="4738159245302510184">
                            <link role="concept" roleId="tp25.1206019820684" targetNodeId="tps4.1202916958754" resolveInfo="Layout" />
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpsf.462257719548547202" resolveInfo="getScriptsDirName" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488784">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802815734" resolveInfo="unzip" />
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488785">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802815741" resolveInfo="src" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.FileName" typeId="tpsk.1199031681512" id="8716889635481488786">
            <node role="value" roleId="tpsk.1199031757132" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488787">
              <property name="value" nameId="tpsk.1196861024475" value="" />
            </node>
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.CopySrcNodeMacro" typeId="tpf8.1114706874351" id="8716889635481488788">
              <node role="sourceNodeQuery" roleId="tpf8.1168024447342" type="tpf8.SourceSubstituteMacro_SourceNodeQuery" typeId="tpf8.1168024337012" id="8716889635481488789">
                <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8716889635481488790">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8716889635481488791">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488792">
                      <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="8716889635481488793" />
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8716889635481488794">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="j1at.1234290845440" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488795">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802815735" resolveInfo="dest" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.FileName" typeId="tpsk.1199031681512" id="8716889635481488796">
            <node role="value" roleId="tpsk.1199031757132" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="4738159245302535280">
              <node role="left" roleId="tpsk.1197107855106" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="4738159245302535281">
                <property name="value" nameId="tpsk.1196861024475" value="${" />
              </node>
              <node role="right" roleId="tpsk.1197107881958" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="4738159245302535282">
                <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="4738159245302535283">
                  <property name="value" nameId="tpsk.1196861024475" value="}" />
                </node>
                <node role="left" roleId="tpsk.1197107855106" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="4738159245302535284">
                  <property name="value" nameId="tpsk.1196861024475" value="scripts.folder" />
                  <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="4738159245302535285">
                    <property name="propertyName" nameId="tpck.1757699476691236117" value="value" />
                    <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="4738159245302535286">
                      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4738159245302535287">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4738159245302535288">
                          <node role="expression" roleId="tpee.1068580123156" type="tp25.StaticConceptMethodCall" typeId="tp25.1206019730951" id="4738159245302535289">
                            <link role="concept" roleId="tp25.1206019820684" targetNodeId="tps4.1202916958754" resolveInfo="Layout" />
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpsf.462257719548547202" resolveInfo="getScriptsDirName" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.LoopMacro" typeId="tpf8.1118786554307" id="8716889635481488809">
        <node role="sourceNodesQuery" roleId="tpf8.1167952069335" type="tpf8.SourceSubstituteMacro_SourceNodesQuery" typeId="tpf8.1167951910403" id="8716889635481488810">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8716889635481488811">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8716889635481488812">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488813">
                <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="8716889635481488814" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetDescendantsOperation" typeId="tp25.1171305280644" id="8716889635481488815">
                  <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="8716889635481488816">
                    <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="8716889635481488817">
                      <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="8716889635481488818">
        <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
        <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="8716889635481488819">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8716889635481488820">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8716889635481488821">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488822">
                <node role="operand" roleId="tpee.1197027771414" type="tpf3.TemplateFunctionParameter_generationContext" typeId="tpf3.1216860049635" id="8716889635481488823" />
                <node role="operation" roleId="tpee.1197027833540" type="tpf3.GenerationContextOp_CreateUniqueName" typeId="tpf3.1218047638031" id="8716889635481488824">
                  <node role="baseName" roleId="tpf3.1218047638032" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8716889635481488825">
                    <property name="value" nameId="tpee.1070475926801" value="unpack.buildtools.zip" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.IfMacro" typeId="tpf8.1118773211870" id="8716889635481488826">
        <link role="mappingLabel" roleId="tpf8.1200912223215" targetNodeId="1237295614240" resolveInfo="CustomMPSBuildToUnpackZipAntcall" />
        <node role="conditionFunction" roleId="tpf8.1167945861827" type="tpf8.IfMacro_Condition" typeId="tpf8.1167945743726" id="8716889635481488827">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8716889635481488828">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8716889635481488829">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488830">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488831">
                  <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="8716889635481488832" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8716889635481488833">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="j1at.1234290845440" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="8716889635481488834" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="target" roleId="tpsk.1196851079482" type="tpsk.TargetDeclaration" typeId="tpsk.1196851099544" id="8716889635481488835">
      <property name="name" nameId="tpck.1169194664001" value="add.libraries" />
      <node role="propertyList" roleId="tpsk.1200425580778" type="tpsk.PropertyDeclaration" typeId="tpsk.1196851107341" id="8716889635481488836">
        <property name="name" nameId="tpck.1169194664001" value="mps.jar" />
        <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="8716889635481488837" />
        <node role="propertyValue" roleId="tpsk.1196851904859" type="tpsk.FileName" typeId="tpsk.1199031681512" id="8716889635481488838">
          <node role="value" roleId="tpsk.1199031757132" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="8716889635481488839">
            <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488840">
              <property name="value" nameId="tpsk.1196861024475" value="/mps.jar" />
            </node>
            <node role="left" roleId="tpsk.1197107855106" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488841">
              <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488581" resolveInfo="input.dir" />
            </node>
          </node>
        </node>
      </node>
      <node role="propertyList" roleId="tpsk.1200425580778" type="tpsk.PropertyDeclaration" typeId="tpsk.1196851107341" id="8716889635481488842">
        <property name="name" nameId="tpck.1169194664001" value="extracted.mps.jar" />
        <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="8716889635481488843" />
        <node role="propertyValue" roleId="tpsk.1196851904859" type="tpsk.FileName" typeId="tpsk.1199031681512" id="8716889635481488844">
          <node role="value" roleId="tpsk.1199031757132" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="8716889635481488845">
            <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488846">
              <property name="value" nameId="tpsk.1196861024475" value="/mpsjar" />
            </node>
            <node role="left" roleId="tpsk.1197107855106" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488847">
              <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488581" resolveInfo="input.dir" />
            </node>
          </node>
        </node>
      </node>
      <node role="propertyList" roleId="tpsk.1200425580778" type="tpsk.ExternalPropertyDeclaration" typeId="tpsk.1219147669362" id="8716889635481488848">
        <property name="name" nameId="tpck.1169194664001" value="mps_home" />
        <node role="type" roleId="tpsk.1196870993204" type="tpsk.FileType" typeId="tpsk.1199032398223" id="8716889635481488849" />
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488850">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802815734" resolveInfo="unzip" />
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488851">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802815741" resolveInfo="src" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488852">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488836" resolveInfo="mps.jar" />
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488853">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802815735" resolveInfo="dest" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488854">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488842" resolveInfo="extracted.mps.jar" />
          </node>
        </node>
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488855">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802813567" resolveInfo="java" />
        <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488856">
          <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802813641" resolveInfo="classpath" />
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488857">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802814683" resolveInfo="pathelement" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488858">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814684" resolveInfo="location" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488859">
                <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488836" resolveInfo="mps.jar" />
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488860">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802814683" resolveInfo="pathelement" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488861">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814684" resolveInfo="location" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.FileName" typeId="tpsk.1199031681512" id="8716889635481488862">
                <node role="value" roleId="tpsk.1199031757132" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="8716889635481488863">
                  <node role="left" roleId="tpsk.1197107855106" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488864">
                    <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488848" resolveInfo="mps_home" />
                  </node>
                  <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488865">
                    <property name="value" nameId="tpsk.1196861024475" value="/lib/jdom.jar" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488866">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802814683" resolveInfo="pathelement" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488867">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814684" resolveInfo="location" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.FileName" typeId="tpsk.1199031681512" id="8716889635481488868">
                <node role="value" roleId="tpsk.1199031757132" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="8716889635481488869">
                  <node role="left" roleId="tpsk.1197107855106" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488870">
                    <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488848" resolveInfo="mps_home" />
                  </node>
                  <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488871">
                    <property name="value" nameId="tpsk.1196861024475" value="/lib/log4j.jar" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488872">
          <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802813634" resolveInfo="arg" />
          <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488873">
            <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802811893" resolveInfo="value" />
            <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488874">
              <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488842" resolveInfo="extracted.mps.jar" />
            </node>
          </node>
        </node>
        <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488875">
          <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802813634" resolveInfo="arg" />
          <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488876">
            <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802811893" resolveInfo="value" />
            <node role="value" roleId="ddum.353793545802643468" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="8716889635481488877">
              <node role="right" roleId="tpsk.1197107881958" type="tpsk.PlusOperation" typeId="tpsk.1197108973325" id="8716889635481488878">
                <node role="right" roleId="tpsk.1197107881958" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488879">
                  <property name="value" nameId="tpsk.1196861024475" value="library.path" />
                  <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="8716889635481488880">
                    <property name="propertyName" nameId="tpck.1757699476691236117" value="value" />
                    <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="8716889635481488881">
                      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8716889635481488882">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="8716889635481488883">
                          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488884">
                            <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="8716889635481488885" />
                            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="8716889635481488886">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="zmlh.1240408519032" resolveInfo="getLibraryPathRelativeToMPSBuild" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="left" roleId="tpsk.1197107855106" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488887">
                  <property name="value" nameId="tpsk.1196861024475" value="=" />
                </node>
              </node>
              <node role="left" roleId="tpsk.1197107855106" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488888">
                <property name="value" nameId="tpsk.1196861024475" value="library.name" />
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="8716889635481488889">
                  <property name="propertyName" nameId="tpck.1757699476691236117" value="value" />
                  <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="8716889635481488890">
                    <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8716889635481488891">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8716889635481488892">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488893">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488894">
                            <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="8716889635481488895" />
                            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8716889635481488896">
                              <link role="link" roleId="tp25.1138056516764" targetNodeId="j1at.1233679274643" />
                            </node>
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="8716889635481488897">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpsf.1213877173054" resolveInfo="getValue" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.LoopMacro" typeId="tpf8.1118786554307" id="8716889635481488898">
            <node role="sourceNodesQuery" roleId="tpf8.1167952069335" type="tpf8.SourceSubstituteMacro_SourceNodesQuery" typeId="tpf8.1167951910403" id="8716889635481488899">
              <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8716889635481488900">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8716889635481488901">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488902">
                    <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="8716889635481488903" />
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetDescendantsOperation" typeId="tp25.1171305280644" id="8716889635481488904">
                      <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="8716889635481488905">
                        <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="8716889635481488906">
                          <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="j1at.1233679247700" resolveInfo="LibraryFolder" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488907">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802813573" resolveInfo="classname" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488908">
            <property name="value" nameId="tpsk.1196861024475" value="jetbrains.mps.library.BuiltInLibrariesIO" />
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="8716889635481488909">
              <property name="propertyName" nameId="tpck.1757699476691236117" value="value" />
              <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="8716889635481488910">
                <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8716889635481488911">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8716889635481488912">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488913">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ClassifierClassExpression" typeId="tpee.1116615150612" id="8716889635481488914">
                        <link role="classifier" roleId="tpee.1116615189566" targetNodeId="eh1m.~BuiltInLibrariesIO" resolveInfo="BuiltInLibrariesIO" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8716889635481488915">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Class%dgetName()%cjava%dlang%dString" resolveInfo="getName" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488916">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802813582" resolveInfo="dir" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488917">
            <property name="value" nameId="tpsk.1196861024475" value="${basedir}" />
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488918">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802813590" resolveInfo="fork" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.BooleanLiteral" typeId="tpsk.1196865966685" id="8716889635481488919">
            <property name="value" nameId="tpsk.1196866040780" value="true" />
          </node>
        </node>
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488920">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802813521" resolveInfo="jar" />
        <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488921">
          <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802813175" resolveInfo="fileset" />
          <node role="nested" roleId="tpsk.1196858559206" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488922">
            <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802811556" resolveInfo="include" />
            <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488923">
              <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802814494" resolveInfo="name" />
              <node role="value" roleId="ddum.353793545802643468" type="tpsk.StringLiteral" typeId="tpsk.1196861005114" id="8716889635481488924">
                <property name="value" nameId="tpsk.1196861024475" value="library.configuration.file.name" />
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="8716889635481488925">
                  <property name="propertyName" nameId="tpck.1757699476691236117" value="value" />
                  <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="8716889635481488926">
                    <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8716889635481488927">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8716889635481488928">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488929">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="8716889635481488930">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="eh1m.~BuiltInLibrariesIO%dgetModifiedConfigurationFile()%cjava%dlang%dString" resolveInfo="getModifiedConfigurationFile" />
                            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="eh1m.~BuiltInLibrariesIO" resolveInfo="BuiltInLibrariesIO" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8716889635481488931">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dreplace(java%dlang%dCharSequence,java%dlang%dCharSequence)%cjava%dlang%dString" resolveInfo="replace" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="8716889635481488932">
                              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="fxg7.~File" resolveInfo="File" />
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="fxg7.~File%dseparator" resolveInfo="separator" />
                            </node>
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8716889635481488933">
                              <property name="value" nameId="tpee.1070475926801" value="/" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488934">
            <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802811531" resolveInfo="dir" />
            <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488935">
              <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488842" resolveInfo="extracted.mps.jar" />
            </node>
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488936">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802815899" resolveInfo="destfile" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488937">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488836" resolveInfo="mps.jar" />
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488938">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802815921" resolveInfo="update" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.BooleanLiteral" typeId="tpsk.1196865966685" id="8716889635481488939">
            <property name="value" nameId="tpsk.1196866040780" value="true" />
          </node>
        </node>
      </node>
      <node role="taskCall" roleId="tpsk.1196851542249" type="ddum.TaskCall" typeId="ddum.353793545802643477" id="8716889635481488940">
        <link role="declaration" roleId="ddum.353793545802643478" targetNodeId="adh8.353793545802814485" resolveInfo="move" />
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488941">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802812435" resolveInfo="file" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488942">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488836" resolveInfo="mps.jar" />
          </node>
        </node>
        <node role="atributes" roleId="ddum.353793545802643479" type="ddum.Attribute" typeId="ddum.353793545802643466" id="8716889635481488943">
          <link role="attributeDeclaration" roleId="ddum.353793545802643467" targetNodeId="adh8.353793545802812455" resolveInfo="todir" />
          <node role="value" roleId="ddum.353793545802643468" type="tpsk.PropertyReference" typeId="tpsk.1196853662806" id="8716889635481488944">
            <link role="propertyDeclaration" roleId="tpsk.1196853671400" targetNodeId="8716889635481488583" resolveInfo="output.dir" />
          </node>
        </node>
      </node>
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.LoopMacro" typeId="tpf8.1118786554307" id="8716889635481488945">
        <node role="sourceNodesQuery" roleId="tpf8.1167952069335" type="tpf8.SourceSubstituteMacro_SourceNodesQuery" typeId="tpf8.1167951910403" id="8716889635481488946">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8716889635481488947">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8716889635481488948">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488949">
                <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="8716889635481488950" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetDescendantsOperation" typeId="tp25.1171305280644" id="8716889635481488951">
                  <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="8716889635481488952">
                    <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="8716889635481488953">
                      <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="j1at.1233149592028" resolveInfo="MPSBuild" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.PropertyMacro" typeId="tpf8.1087833241328" id="8716889635481488954">
        <property name="propertyName" nameId="tpck.1757699476691236117" value="name" />
        <node role="propertyValueFunction" roleId="tpf8.1167756362303" type="tpf8.PropertyMacro_GetPropertyValue" typeId="tpf8.1167756080639" id="8716889635481488955">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8716889635481488956">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8716889635481488957">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488958">
                <node role="operand" roleId="tpee.1197027771414" type="tpf3.TemplateFunctionParameter_generationContext" typeId="tpf3.1216860049635" id="8716889635481488959" />
                <node role="operation" roleId="tpee.1197027833540" type="tpf3.GenerationContextOp_CreateUniqueName" typeId="tpf3.1218047638031" id="8716889635481488960">
                  <node role="baseName" roleId="tpf3.1218047638032" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8716889635481488961">
                    <property name="value" nameId="tpee.1070475926801" value="add.libraries" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.IfMacro" typeId="tpf8.1118773211870" id="8716889635481488962">
        <link role="mappingLabel" roleId="tpf8.1200912223215" targetNodeId="1233671018495" resolveInfo="CustomMPSBuildToTargetDeclaration" />
        <node role="conditionFunction" roleId="tpf8.1167945861827" type="tpf8.IfMacro_Condition" typeId="tpf8.1167945743726" id="8716889635481488963">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8716889635481488964">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8716889635481488965">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488966">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8716889635481488967">
                  <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="8716889635481488968" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetDescendantsOperation" typeId="tp25.1171305280644" id="8716889635481488969">
                    <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="8716889635481488970">
                      <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="8716889635481488971">
                        <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="j1at.1233679247700" resolveInfo="LibraryFolder" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.IsNotEmptyOperation" typeId="tp2q.1176501494711" id="8716889635481488972" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.RootTemplateAnnotation" typeId="tpf8.1168619357332" id="8716889635481488974">
      <link role="applicableConcept" roleId="tpf8.1168619429071" targetNodeId="tps4.1202916958754" resolveInfo="Layout" />
    </node>
  </root>
  <root id="2235195415637079240">
    <node role="contentNode" roleId="tpf8.1092060348987" type="tps4.Layout" typeId="tps4.1202916958754" id="2235195415637079242">
      <property name="name" nameId="tpck.1169194664001" value="MPSDist" />
      <node role="component" roleId="tps4.1203599325709" type="tps4.Folder" typeId="tps4.1203598512427" id="2235195415637079253">
        <property name="excludes" nameId="tps4.1204107522064" value="" />
        <node role="sourcePath" roleId="tps4.1220982054961" type="tps4.Path" typeId="tps4.1220973916698" id="2235195415637079254">
          <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637079255">
            <property name="name" nameId="tps4.1220976068141" value="basedir" />
          </node>
          <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637079256" />
        </node>
        <node role="title" roleId="tps4.1205340441197" type="tps4.SimpleString" typeId="tps4.1205339044029" id="2235195415637079258">
          <property name="name" nameId="tps4.1223641503366" value="internalFolder" />
        </node>
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.TemplateFragment" typeId="tpf8.1095672379244" id="2235195415637079259" />
        <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tpf8.CopySrcNodeMacro" typeId="tpf8.1114706874351" id="2235195415637079261">
          <node role="sourceNodeQuery" roleId="tpf8.1168024447342" type="tpf8.SourceSubstituteMacro_SourceNodeQuery" typeId="tpf8.1168024337012" id="2235195415637079262">
            <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2235195415637079263">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2235195415637082593">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637082600">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2235195415637082595">
                    <node role="operand" roleId="tpee.1197027771414" type="tpf8.TemplateFunctionParameter_sourceNode" typeId="tpf8.1167169188348" id="2235195415637082594" />
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="2235195415637082599">
                      <link role="link" roleId="tp25.1138056546658" targetNodeId="tps4.1203617897549" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetFirstOperation" typeId="tp2q.1165525191778" id="2235195415637082604" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="configuration" roleId="tps4.1204115898932" type="tps4.Configuration" typeId="tps4.1204115658627" id="2235195415637079243">
        <property name="name" nameId="tpck.1169194664001" value="default" />
      </node>
      <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637079244">
        <property name="name" nameId="tpck.1169194664001" value=":" />
        <property name="antName" nameId="tps4.1205335307578" value="path.separator" />
      </node>
      <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637079245">
        <property name="name" nameId="tpck.1169194664001" value="basedir" />
        <property name="antName" nameId="tps4.1205335307578" value="basedir" />
      </node>
      <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637079246">
        <property name="name" nameId="tpck.1169194664001" value="date" />
        <property name="antName" nameId="tps4.1205335307578" value="DSTAMP" />
      </node>
      <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637079247">
        <property name="name" nameId="tpck.1169194664001" value="\n" />
        <property name="antName" nameId="tps4.1205335307578" value="line.separator" />
      </node>
      <node role="builtInVariable" roleId="tps4.1205337304382" type="tps4.Variable" typeId="tps4.1205335290326" id="2235195415637079248">
        <property name="name" nameId="tpck.1169194664001" value="/" />
        <property name="antName" nameId="tps4.1205335307578" value="file.separator" />
      </node>
      <node role="baseDirectory" roleId="tps4.1226493152214" type="tps4.BaseDirPath" typeId="tps4.1226494304686" id="2235195415637079249">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="2235195415637079250">
          <property name="name" nameId="tps4.1220976068141" value="mps_home" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="2235195415637079251" />
      </node>
      <node role="deployDirectory" roleId="tps4.462257719548209895" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548545636">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="462257719548545637">
          <property name="name" nameId="tps4.1220976068141" value="basedir" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548545638" />
      </node>
      <node role="scriptsDirectory" roleId="tps4.462257719548209896" type="tps4.Path" typeId="tps4.1220973916698" id="462257719548547158">
        <node role="macro" roleId="tps4.1220976095387" type="tps4.MacroReference" typeId="tps4.1220976052975" id="462257719548547159">
          <property name="name" nameId="tps4.1220976068141" value="basedir" />
        </node>
        <node role="compositePathComponent" roleId="tps4.1220974249696" type="tps4.CompositePathComponent" typeId="tps4.1220973992845" id="462257719548547160" />
      </node>
    </node>
  </root>
</model>

