<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:2cdd9596-2ed5-4152-b387-8144a1963c4c(jetbrains.mps.smodel.persistence.def.v5)">
  <persistence version="7" />
  <language namespace="a8fdde77-2e6c-41f6-ac79-8e9b6449c271(jetbrains.mps.xmlQuery)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="a247e09e-2435-45ba-b8d2-07e93feba96a(jetbrains.mps.baseLanguage.tuples)" />
  <import index="lkfb" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.smodel(jetbrains.mps.smodel@java_stub)" version="-1" />
  <import index="k7g3" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.util(java.util@java_stub)" version="-1" />
  <import index="fy7j" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.smodel.persistence.def(jetbrains.mps.smodel.persistence.def@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(java.lang@java_stub)" version="-1" />
  <import index="ho7a" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.project.structure.modules(jetbrains.mps.project.structure.modules@java_stub)" version="-1" />
  <import index="8jx9" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.smodel.persistence.def.v4(jetbrains.mps.smodel.persistence.def.v4@java_stub)" version="-1" />
  <import index="fmpa" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#org.xml.sax(org.xml.sax@java_stub)" version="-1" />
  <import index="vz3d" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.smodel.persistence.lines(jetbrains.mps.smodel.persistence.lines@java_stub)" version="-1" />
  <import index="mlj4" modelUID="r:bd6e2c7d-3a5d-4eed-9ff9-27f23ecb34e2(jetbrains.mps.xmlQuery.structure)" version="4" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <roots>
    <node type="mlj4.XMLSAXParser" typeId="mlj4.4635390255047863050" id="2286463592495096552">
      <property name="name" nameId="tpck.1169194664001" value="ModelReader5" />
      <link role="root" roleId="mlj4.4635390255047981684" targetNodeId="2286463592495096553" resolveInfo="model" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="2286463592495498121">
      <property name="name" nameId="tpck.1169194664001" value="ModelUtil" />
    </node>
    <node type="mlj4.XMLSAXParser" typeId="mlj4.4635390255047863050" id="651246788329828609">
      <property name="name" nameId="tpck.1169194664001" value="LineToContentMapReader5" />
      <link role="root" roleId="mlj4.4635390255047981684" targetNodeId="651246788329828627" resolveInfo="model" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="8837498651724313880">
      <property name="name" nameId="tpck.1169194664001" value="LineContentAccumulator" />
    </node>
  </roots>
  <root id="2286463592495096552">
    <node role="parameters" roleId="mlj4.2824634917103291789" type="mlj4.XMLSAXFieldDeclaration" typeId="mlj4.7707758858785994411" id="7623696721876393273">
      <property name="name" nameId="tpck.1169194664001" value="header" />
      <node role="type" roleId="mlj4.7707758858785994413" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7623696721876393274">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelHeader" resolveInfo="SModelHeader" />
      </node>
    </node>
    <node role="fields" roleId="mlj4.7707758858785994425" type="mlj4.XMLSAXFieldDeclaration" typeId="mlj4.7707758858785994411" id="7707758858786072112">
      <property name="name" nameId="tpck.1169194664001" value="versionsInfo" />
      <node role="type" roleId="mlj4.7707758858785994413" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7707758858786072114">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelVersionsInfo" resolveInfo="SModelVersionsInfo" />
      </node>
    </node>
    <node role="fields" roleId="mlj4.7707758858785994425" type="mlj4.XMLSAXFieldDeclaration" typeId="mlj4.7707758858785994411" id="7707758858786121942">
      <property name="name" nameId="tpck.1169194664001" value="referenceDescriptors" />
      <node role="type" roleId="mlj4.7707758858785994413" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7707758858786121945">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~ArrayList" resolveInfo="ArrayList" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7707758858786122427">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fy7j.~IReferencePersister" resolveInfo="IReferencePersister" />
        </node>
      </node>
    </node>
    <node role="fields" roleId="mlj4.7707758858785994425" type="mlj4.XMLSAXFieldDeclaration" typeId="mlj4.7707758858785994411" id="3912764103614069897">
      <property name="name" nameId="tpck.1169194664001" value="visibleModelElements" />
      <node role="type" roleId="mlj4.7707758858785994413" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3912764103614069899">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fy7j.~SAXVisibleModelElements" resolveInfo="SAXVisibleModelElements" />
      </node>
    </node>
    <node role="fields" roleId="mlj4.7707758858785994425" type="mlj4.XMLSAXFieldDeclaration" typeId="mlj4.7707758858785994411" id="4033117946318588975">
      <property name="name" nameId="tpck.1169194664001" value="model" />
      <node role="type" roleId="mlj4.7707758858785994413" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4033117946318588977">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModel" resolveInfo="SModel" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="2286463592495096553">
      <property name="name" nameId="tpck.1169194664001" value="model" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="model" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="2286463592495104480">
        <property name="name" nameId="tpck.1169194664001" value="modelUID" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2286463592495212621">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2286463592495104481" resolveInfo="persistence" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2286463592495362654">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2286463592495217826" resolveInfo="maxImportIndex" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="2286463592495498239">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498240">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2286463592495498372">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498373">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495498386">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495498387">
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495498389">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dsetMaxImportIndex(int)%cvoid" resolveInfo="setMaxImportIndex" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2286463592495498390" />
                    </node>
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141047992">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.GreaterThanExpression" typeId="tpee.1081506762703" id="2286463592495498377">
                <node role="leftExpression" roleId="tpee.1081773367580" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2286463592495498376" />
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495498381">
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495498385">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dgetMaxImportIndex()%cint" resolveInfo="getMaxImportIndex" />
                  </node>
                  <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141047991">
                    <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2286463592495498107">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2286463592495498085" resolveInfo="languageAspect" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="2286463592495498109">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498110">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2286463592495498206">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2286463592495498207">
                <property name="name" nameId="tpck.1169194664001" value="version" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2286463592495498208" />
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2286463592495498212">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dparseInt(java%dlang%dString)%cint" resolveInfo="parseInt" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="2286463592495498214">
                    <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2286463592495498217">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                    <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2286463592495498213" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495498114">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495498116">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495498120">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%daddAdditionalModelVersion(jetbrains%dmps%dsmodel%dSModelReference,int)%cvoid" resolveInfo="addAdditionalModelVersion" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2286463592495498203">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2286463592495498127" resolveInfo="upgradeModelUID" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2286463592495498121" resolveInfo="ModelUtil" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2286463592495498219">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelReference%dfromString(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="fromString" />
                      <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="2286463592495498221">
                        <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2286463592495498224">
                          <property name="value" nameId="tpee.1068580320021" value="0" />
                        </node>
                        <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2286463592495498220" />
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2286463592495498226">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2286463592495498207" resolveInfo="version" />
                  </node>
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141047993">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2286463592495498084">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="language" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2286463592495498250" resolveInfo="tag_with_namespace" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="2286463592495498227">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498228">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495498229">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495498231">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141047994">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495498235">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%daddLanguage(jetbrains%dmps%dproject%dstructure%dmodules%dModuleReference)%cvoid" resolveInfo="addLanguage" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2286463592495498237">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ho7a.~ModuleReference%dfromString(java%dlang%dString)%cjetbrains%dmps%dproject%dstructure%dmodules%dModuleReference" resolveInfo="fromString" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="ho7a.~ModuleReference" resolveInfo="ModuleReference" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2286463592495498238" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2286463592495498251">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="language-engaged-on-generation" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2286463592495498250" resolveInfo="language-engaged-on-generation" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="2286463592495498259">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498260">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495498261">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495498263">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141047995">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495498267">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%daddEngagedOnGenerationLanguage(jetbrains%dmps%dproject%dstructure%dmodules%dModuleReference)%cvoid" resolveInfo="addEngagedOnGenerationLanguage" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2286463592495498270">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ho7a.~ModuleReference%dfromString(java%dlang%dString)%cjetbrains%dmps%dproject%dstructure%dmodules%dModuleReference" resolveInfo="fromString" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="ho7a.~ModuleReference" resolveInfo="ModuleReference" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2286463592495498271" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2286463592495498274">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="devkit" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2286463592495498250" resolveInfo="tag_with_namespace" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="2286463592495498276">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498277">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495498278">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495498280">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141047996">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495498284">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%daddDevKit(jetbrains%dmps%dproject%dstructure%dmodules%dModuleReference)%cvoid" resolveInfo="addDevKit" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2286463592495498286">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ho7a.~ModuleReference%dfromString(java%dlang%dString)%cjetbrains%dmps%dproject%dstructure%dmodules%dModuleReference" resolveInfo="fromString" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="ho7a.~ModuleReference" resolveInfo="ModuleReference" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2286463592495498287" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2286463592495498329">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2286463592495498288" resolveInfo="import" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="2286463592495498335">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498336">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2286463592495498337">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498339">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495498357">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495498359">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141047998">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495498363">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dsetMaxImportIndex(int)%cvoid" resolveInfo="setMaxImportIndex" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495498365">
                        <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2286463592495498364" />
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495498369">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel$ImportElement%dgetReferenceID()%cint" resolveInfo="getReferenceID" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.GreaterThanExpression" typeId="tpee.1081506762703" id="2286463592495498348">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495498341">
                  <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2286463592495498340" />
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495498347">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel$ImportElement%dgetReferenceID()%cint" resolveInfo="getReferenceID" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495498352">
                  <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141047997">
                    <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495498356">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dgetMaxImportIndex()%cint" resolveInfo="getMaxImportIndex" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495513946">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495513948">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141047999">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495515686">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%daddModelImport(jetbrains%dmps%dsmodel%dSModel$ImportElement)%cvoid" resolveInfo="addModelImport" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2286463592495515687" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2286463592495498328">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2286463592495498325" resolveInfo="node" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="2286463592495515690">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495515691">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2286463592495515692">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="2286463592495515696">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="2286463592495515699" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2286463592495515695" />
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495515694">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495515700">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495515702">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141048000">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495515706">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%daddRoot(jetbrains%dmps%dsmodel%dSNode)%cvoid" resolveInfo="addRoot" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2286463592495515707" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="3912764103614069900">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="3912764103614069901" resolveInfo="visible" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="2286463592495214230">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495214231">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7707758858786107639">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7707758858786107640">
              <node role="lValue" roleId="tpee.1068498886295" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7707758858786107641">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7707758858786072112" resolveInfo="versionsInfo" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7707758858786107642">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7707758858786107643">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelVersionsInfo%d&lt;init&gt;()" resolveInfo="SModelVersionsInfo" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7707758858786147417">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7707758858786147419">
              <node role="lValue" roleId="tpee.1068498886295" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7707758858786147418">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7707758858786121942" resolveInfo="referenceDescriptors" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7707758858786147422">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7707758858786147424">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~ArrayList%d&lt;init&gt;()" resolveInfo="ArrayList" />
                  <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7707758858786147426">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fy7j.~IReferencePersister" resolveInfo="IReferencePersister" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3912764103614069940">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="3912764103614069942">
              <node role="lValue" roleId="tpee.1068498886295" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="3912764103614069941">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="3912764103614069897" resolveInfo="visibleModelElements" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3912764103614069945">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3912764103614069947">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fy7j.~SAXVisibleModelElements%d&lt;init&gt;()" resolveInfo="SAXVisibleModelElements" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4033117946318588979">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4033117946318588981">
              <node role="lValue" roleId="tpee.1068498886295" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4033117946318588980">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4033117946318588984">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="4033117946318588985">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSModelReference)" resolveInfo="SModel" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4033117946318588986">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelReference%dfromString(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="fromString" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="4033117946318588987">
                      <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="2286463592495104480" resolveInfo="modelUID" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4485356420335258673">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4485356420335258675">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4033117946318588988">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4485356420335258679">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dsetPersistenceVersion(int)%cvoid" resolveInfo="setPersistenceVersion" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4485356420335258680">
                  <property name="value" nameId="tpee.1068580320021" value="5" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7623696721876393276">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7623696721876393283">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7623696721876393278">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7623696721876393277">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7623696721876393282">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dgetSModelHeader()%cjetbrains%dmps%dsmodel%dSModelHeader" resolveInfo="getSModelHeader" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7623696721876393287">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelHeader%dupdateDefaults(jetbrains%dmps%dsmodel%dSModelHeader)%cvoid" resolveInfo="updateDefaults" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7623696721876393288">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7623696721876393273" resolveInfo="header" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495216640">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4485356420335258662">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4033117946318588989">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4485356420335258666">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dsetLoading(boolean)%cboolean" resolveInfo="setLoading" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="4485356420335258667">
                  <property name="value" nameId="tpee.1068580123138" value="true" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4485356420335258681">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4813471910141010697">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="4813471910141010699">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~BaseSModelDescriptor$ModelLoadResult%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSModel,jetbrains%dmps%dsmodel%dModelLoadingState)" resolveInfo="BaseSModelDescriptor.ModelLoadResult" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141047990">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="4813471910141010701">
                  <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="lkfb.~ModelLoadingState%dFULLY_LOADED" resolveInfo="FULLY_LOADED" />
                  <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="lkfb.~ModelLoadingState" resolveInfo="ModelLoadingState" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="validator" roleId="mlj4.3444414697307356525" type="mlj4.XMLSAXNodeValidator" typeId="mlj4.3444414697307355268" id="4525774333072921620">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4525774333072921621">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="3912764103614069948">
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3912764103614069949">
              <property name="name" nameId="tpck.1169194664001" value="referencePersister" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3912764103614069952">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fy7j.~IReferencePersister" resolveInfo="IReferencePersister" />
              </node>
            </node>
            <node role="iterable" roleId="tpee.1144226360166" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="3912764103614069953">
              <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7707758858786121942" resolveInfo="referenceDescriptors" />
            </node>
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="3912764103614069951">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3912764103614069954">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3912764103614069956">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3912764103614069955">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3912764103614069949" resolveInfo="referencePersister" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3912764103614069960">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fy7j.~IReferencePersister%dcreateReferenceInModel(jetbrains%dmps%dsmodel%dSModel,jetbrains%dmps%dsmodel%dpersistence%ddef%dVisibleModelElements)%cvoid" resolveInfo="createReferenceInModel" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141048001">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="3912764103614069963">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="3912764103614069897" resolveInfo="visibleModelElements" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3912764103614069965">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3912764103614069967">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141048002">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3912764103614069971">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dsetLoading(boolean)%cboolean" resolveInfo="setLoading" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="3912764103614069972">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="3912764103614074648">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="3912764103614069975">
              <property name="value" nameId="tpee.1068580123138" value="true" />
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4813471910141047988">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~BaseSModelDescriptor$ModelLoadResult" resolveInfo="BaseSModelDescriptor.ModelLoadResult" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="2286463592495104481">
      <property name="name" nameId="tpck.1169194664001" value="persistence" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="persistence" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="2286463592495104484">
        <property name="name" nameId="tpck.1169194664001" value="version" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="2286463592495214214">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495214215">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495341900">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2286463592495341902">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dparseInt(java%dlang%dString)%cint" resolveInfo="parseInt" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="2286463592495341903">
                <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="2286463592495104484" resolveInfo="version" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2286463592495341895">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="2286463592495217826">
      <property name="name" nameId="tpck.1169194664001" value="maxImportIndex" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="maxImportIndex" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="2286463592495342537">
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
        <property name="name" nameId="tpck.1169194664001" value="value" />
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2286463592495342536">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="2286463592495217831">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495217832">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495342539">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2286463592495342541">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dparseInt(java%dlang%dString)%cint" resolveInfo="parseInt" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="2286463592495342542">
                <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="2286463592495342537" resolveInfo="value" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="2286463592495498085">
      <property name="name" nameId="tpck.1169194664001" value="languageAspect" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="languageAspect" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="2286463592495498086">
        <property name="name" nameId="tpck.1169194664001" value="modelUID" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="2286463592495498089">
        <property name="name" nameId="tpck.1169194664001" value="version" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="2286463592495498090">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498091">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495498095">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2286463592495498096">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="2286463592495498102">
                <node role="componentType" roleId="tpee.1154542793668" type="tpee.StringType" typeId="tpee.1225271177708" id="2286463592495498101" />
                <node role="initValue" roleId="tpee.1154542803372" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="2286463592495498104">
                  <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="2286463592495498086" resolveInfo="modelUID" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="2286463592495498106">
                  <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="2286463592495498089" resolveInfo="version" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ArrayType" typeId="tpee.1070534760951" id="2286463592495498093">
        <node role="componentType" roleId="tpee.1070534760952" type="tpee.StringType" typeId="tpee.1225271177708" id="2286463592495498092" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="2286463592495498250">
      <property name="name" nameId="tpck.1169194664001" value="tag_with_namespace" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="2286463592495498253">
        <property name="name" nameId="tpck.1169194664001" value="namespace" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.StringType" typeId="tpee.1225271177708" id="2286463592495498252" />
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="2286463592495498254">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498255">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495498256">
            <node role="expression" roleId="tpee.1068580123156" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="2286463592495498257">
              <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="2286463592495498253" resolveInfo="namespace" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="2286463592495498288">
      <property name="name" nameId="tpck.1169194664001" value="import" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="import" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="2286463592495498289">
        <property name="name" nameId="tpck.1169194664001" value="index" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="2286463592495498291">
        <property name="name" nameId="tpck.1169194664001" value="version" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="2286463592495498290">
        <property name="name" nameId="tpck.1169194664001" value="modelUID" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="2286463592495498292">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498293">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2286463592495498295">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2286463592495498296">
              <property name="name" nameId="tpck.1169194664001" value="indexValue" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2286463592495498297" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2286463592495498300">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dparseInt(java%dlang%dString)%cint" resolveInfo="parseInt" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="2286463592495498301">
                  <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="2286463592495498289" resolveInfo="index" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2286463592495498303">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2286463592495498304">
              <property name="name" nameId="tpck.1169194664001" value="versionValue" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2286463592495498305" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2286463592495498308">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dparseInt(java%dlang%dString)%cint" resolveInfo="parseInt" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="2286463592495498309">
                  <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="2286463592495498291" resolveInfo="version" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2286463592495498312">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2286463592495498313">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2286463592495498315">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel$ImportElement%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSModelReference,int,int)" resolveInfo="SModel.ImportElement" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2286463592495498317">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2286463592495498127" resolveInfo="upgradeModelUID" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="2286463592495498121" resolveInfo="ModelUtil" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2286463592495498319">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelReference%dfromString(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="fromString" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="2286463592495498320">
                      <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="2286463592495498290" resolveInfo="modelUID" />
                    </node>
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2286463592495498322">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2286463592495498296" resolveInfo="indexValue" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2286463592495498324">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2286463592495498304" resolveInfo="version" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2286463592495498294">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModel$ImportElement" resolveInfo="SModel.ImportElement" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="2286463592495498325">
      <property name="name" nameId="tpck.1169194664001" value="node" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="node" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="false" />
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="7707758858786147468">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="7707758858786147469" resolveInfo="property" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="7707758858786147473">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7707758858786147474">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="7707758858786147504">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="7707758858786147506">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7707758858786147520">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7707758858786147522">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="7707758858786147521" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7707758858786147526">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dsetProperty(java%dlang%dString,java%dlang%dString)%cvoid" resolveInfo="setProperty" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="355506112072964442">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8jx9.~VersionUtil%dgetPropertyName(java%dlang%dString,jetbrains%dmps%dsmodel%dSNode,jetbrains%dmps%dsmodel%dSModelVersionsInfo)%cjava%dlang%dString" resolveInfo="getPropertyName" />
                        <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="8jx9.~VersionUtil" resolveInfo="VersionUtil" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="355506112072964444">
                          <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="355506112072964447">
                            <property name="value" nameId="tpee.1068580320021" value="0" />
                          </node>
                          <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="355506112072964443" />
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="355506112072964449" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="355506112072964451">
                          <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7707758858786072112" resolveInfo="versionsInfo" />
                        </node>
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="7707758858786147531">
                        <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7707758858786147534">
                          <property name="value" nameId="tpee.1068580320021" value="1" />
                        </node>
                        <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="7707758858786147530" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="7707758858786147516">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="7707758858786147512">
                  <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7707758858786147515">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                  <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="7707758858786147507" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="7707758858786147519" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="355506112072964452">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="355506112072964453" resolveInfo="link" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="355506112072964454">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="355506112072964455">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4525774333072921588">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4525774333072921589">
                <property name="name" nameId="tpck.1169194664001" value="rp" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4525774333072921590">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8jx9.~ReferencePersister4" resolveInfo="ReferencePersister4" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4525774333072921591">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="4525774333072921592">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8jx9.~ReferencePersister4%d&lt;init&gt;()" resolveInfo="ReferencePersister4" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4525774333072921593">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4525774333072921594">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4525774333072921595">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4525774333072921589" resolveInfo="rp" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4525774333072921596">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8jx9.~ReferencePersister4%dfillFields(java%dlang%dString,java%dlang%dString,java%dlang%dString,jetbrains%dmps%dsmodel%dSNode,boolean,jetbrains%dmps%dsmodel%dSModelVersionsInfo)%cvoid" resolveInfo="fillFields" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="4525774333072921604">
                    <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4525774333072921607">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                    <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="4525774333072921603" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="4525774333072921609">
                    <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4525774333072921612">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                    <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="4525774333072921608" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="4525774333072921614">
                    <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4525774333072921617">
                      <property name="value" nameId="tpee.1068580320021" value="2" />
                    </node>
                    <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="4525774333072921613" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="4525774333072921618" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="4525774333072921601">
                    <property name="value" nameId="tpee.1068580123138" value="false" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4525774333072921602">
                    <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7707758858786072112" resolveInfo="versionsInfo" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="355506112073081596">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="355506112073081598">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="355506112073081597">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7707758858786121942" resolveInfo="referenceDescriptors" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="355506112073081602">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~ArrayList%dadd(java%dlang%dObject)%cboolean" resolveInfo="add" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4525774333072921619">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4525774333072921589" resolveInfo="rp" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="7707758858785937647">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2286463592495498325" resolveInfo="node" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="7707758858785937650">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7707758858785937651">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7707758858785937652">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7707758858785937654">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="7707758858785937653" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7707758858785937658">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%daddChild(java%dlang%dString,jetbrains%dmps%dsmodel%dSNode)%cvoid" resolveInfo="addChild" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7707758858785937662">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="7707758858785937661" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7707758858785937666">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dgetRole_()%cjava%dlang%dString" resolveInfo="getRole_" />
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="7707758858785937668" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="2286463592495515708">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="7707758858785937660">
        <property name="name" nameId="tpck.1169194664001" value="role" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="3912764103614069978">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3912764103614069979">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3912764103614069980">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3912764103614069982">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="3912764103614069981" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3912764103614069986">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dsetRoleInParent(java%dlang%dString)%cvoid" resolveInfo="setRoleInParent" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3912764103614069989">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8jx9.~VersionUtil%dgetRole(java%dlang%dString)%cjava%dlang%dString" resolveInfo="getRole" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="8jx9.~VersionUtil" resolveInfo="VersionUtil" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="3912764103614069990" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3912764103614069997">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3912764103614069999">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8jx9.~VersionUtil%dfetchChildNodeRoleVersion(java%dlang%dString,jetbrains%dmps%dsmodel%dSNode,jetbrains%dmps%dsmodel%dSModelVersionsInfo)%cvoid" resolveInfo="fetchChildNodeRoleVersion" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="8jx9.~VersionUtil" resolveInfo="VersionUtil" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="3912764103614070000" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="3912764103614070002" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="3912764103614070004">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7707758858786072112" resolveInfo="versionsInfo" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="7707758858786147427">
        <property name="name" nameId="tpck.1169194664001" value="id" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="7707758858786147428">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7707758858786147429">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7707758858786147434">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7707758858786147435">
                <property name="name" nameId="tpck.1169194664001" value="id" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7707758858786147436">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7707758858786147437">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodeId%dfromString(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="fromString" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="7707758858786147438" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="7707758858786147440">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="7707758858786147441">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="7707758858786147449">
                  <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7707758858786147451">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7707758858786147453">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fmpa.~SAXParseException%d&lt;init&gt;(java%dlang%dString,org%dxml%dsax%dLocator)" resolveInfo="SAXParseException" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7707758858786147454">
                        <property name="value" nameId="tpee.1070475926801" value="bad node ID" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="7707758858786147457" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="7707758858786147445">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="7707758858786147448" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7707758858786147444">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7707758858786147435" resolveInfo="id" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7707758858786147459">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7707758858786147461">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="7707758858786147460" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7707758858786147465">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dsetId(jetbrains%dmps%dsmodel%dSNodeId)%cvoid" resolveInfo="setId" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7707758858786147466">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7707758858786147435" resolveInfo="id" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2286463592495498326">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNode" resolveInfo="SNode" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="2286463592495498330">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498331">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2286463592495515709">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2286463592495515710">
              <property name="name" nameId="tpck.1169194664001" value="rawFqName" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="2286463592495515711" />
              <node role="initializer" roleId="tpee.1068431790190" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="2286463592495515713">
                <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="2286463592495515708" resolveInfo="type" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7707758858785925449">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7707758858785925450">
              <property name="name" nameId="tpck.1169194664001" value="conceptFQName" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4168438976304910097" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7707758858785925452">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8jx9.~VersionUtil%dgetConceptFQName(java%dlang%dString)%cjava%dlang%dString" resolveInfo="getConceptFQName" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="8jx9.~VersionUtil" resolveInfo="VersionUtil" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7707758858785925453">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2286463592495515710" resolveInfo="rawFqName" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7707758858785925457">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7707758858785925458">
              <property name="name" nameId="tpck.1169194664001" value="node" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7707758858785925459">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNode" resolveInfo="SNode" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7707758858785925461">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7707758858785925463">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSModel,java%dlang%dString)" resolveInfo="SNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4033117946318588991">
                    <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="4033117946318588975" resolveInfo="model" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7707758858785925466">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7707758858785925450" resolveInfo="conceptFQName" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7707758858785925471">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7707758858785925473">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8jx9.~VersionUtil%dfetchConceptVersion(java%dlang%dString,jetbrains%dmps%dsmodel%dSNode,jetbrains%dmps%dsmodel%dSModelVersionsInfo)%cvoid" resolveInfo="fetchConceptVersion" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="8jx9.~VersionUtil" resolveInfo="VersionUtil" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7707758858785925474">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2286463592495515710" resolveInfo="rawFqName" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7707758858785925476">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7707758858785925458" resolveInfo="node" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7707758858786072116">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7707758858786072112" resolveInfo="versionsInfo" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7707758858785925468">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7707758858785925469">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7707758858785925458" resolveInfo="node" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="7707758858786147469">
      <property name="name" nameId="tpck.1169194664001" value="property" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="property" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="7707758858786147475">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="7707758858786147477">
        <property name="name" nameId="tpck.1169194664001" value="value" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="7707758858786147492">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7707758858786147493">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7707758858786147494">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7707758858786147500">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="7707758858786147496">
                  <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7707758858786147499">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                  <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="7707758858786147495" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="7707758858786147503" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ArrayType" typeId="tpee.1070534760951" id="7707758858786147471">
        <node role="componentType" roleId="tpee.1070534760952" type="tpee.StringType" typeId="tpee.1225271177708" id="7707758858786147470" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="7707758858786147478">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7707758858786147479">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7707758858786147480">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7707758858786147481">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="7707758858786147487">
                <node role="componentType" roleId="tpee.1154542793668" type="tpee.StringType" typeId="tpee.1225271177708" id="7707758858786147486" />
                <node role="initValue" roleId="tpee.1154542803372" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="7707758858786147489">
                  <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="7707758858786147475" resolveInfo="name" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="7707758858786147491" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="355506112072964453">
      <property name="name" nameId="tpck.1169194664001" value="link" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="link" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="4525774333072919124">
        <property name="name" nameId="tpck.1169194664001" value="role" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="4525774333072921551">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4525774333072921552">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4525774333072921553">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4525774333072921559">
                <node role="rValue" roleId="tpee.1068498886297" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="4525774333072921562" />
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="4525774333072921555">
                  <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4525774333072921558">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                  <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="4525774333072921554" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="4525774333072919125">
        <property name="name" nameId="tpck.1169194664001" value="resolveInfo" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="4525774333072921563">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4525774333072921564">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4525774333072921565">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4525774333072921571">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="4525774333072921567">
                  <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4525774333072921570">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                  <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="4525774333072921566" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="4525774333072921574" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="4525774333072919126">
        <property name="name" nameId="tpck.1169194664001" value="targetNodeId" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="4525774333072921575">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="4525774333072921576">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4525774333072921577">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4525774333072921583">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="4525774333072921579">
                  <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4525774333072921582">
                    <property name="value" nameId="tpee.1068580320021" value="2" />
                  </node>
                  <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="4525774333072921578" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="4525774333072921586" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ArrayType" typeId="tpee.1070534760951" id="4525774333072921534">
        <node role="componentType" roleId="tpee.1070534760952" type="tpee.StringType" typeId="tpee.1225271177708" id="4525774333072921530" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="355506112073013832">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="355506112073013833">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4525774333072921537">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4525774333072921538">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="4525774333072921544">
                <node role="componentType" roleId="tpee.1154542793668" type="tpee.StringType" typeId="tpee.1225271177708" id="4525774333072921543" />
                <node role="initValue" roleId="tpee.1154542803372" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4525774333072921546" />
                <node role="initValue" roleId="tpee.1154542803372" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4525774333072921548" />
                <node role="initValue" roleId="tpee.1154542803372" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4525774333072921550" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="3912764103614069901">
      <property name="name" nameId="tpck.1169194664001" value="visible" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="visible" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="3912764103614069905">
        <property name="name" nameId="tpck.1169194664001" value="index" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="3912764103614069908">
        <property name="name" nameId="tpck.1169194664001" value="modelUID" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="3912764103614069909">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3912764103614069910">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3912764103614069924">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3912764103614069926">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="3912764103614069925">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="3912764103614069897" resolveInfo="visibleModelElements" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3912764103614069930">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fy7j.~SAXVisibleModelElements%daddVisible(int,java%dlang%dString)%cvoid" resolveInfo="addVisible" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3912764103614069932">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dparseInt(java%dlang%dString)%cint" resolveInfo="parseInt" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="3912764103614069933">
                    <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="3912764103614069905" resolveInfo="index" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="3912764103614069935">
                  <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="3912764103614069908" resolveInfo="modelUID" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3912764103614069937">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="3912764103614069938" />
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3912764103614072971">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
      </node>
    </node>
  </root>
  <root id="2286463592495498121">
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2286463592495498162">
      <property name="name" nameId="tpck.1169194664001" value="upgradeStereotype" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="2286463592495498167" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2286463592495498164" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498165">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2286463592495498170">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498172">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2286463592495498180">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2286463592495498182">
                <link role="classifier" roleId="tpee.1144433057691" targetNodeId="lkfb.~SModelStereotype" resolveInfo="SModelStereotype" />
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="lkfb.~SModelStereotype%dGENERATOR" resolveInfo="GENERATOR" />
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495498174">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="2286463592495498173">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="lkfb.~SModelStereotype" resolveInfo="SModelStereotype" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="lkfb.~SModelStereotype%dTEMPLATES" resolveInfo="TEMPLATES" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495498178">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dequals(java%dlang%dObject)%cboolean" resolveInfo="equals" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2286463592495498179">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2286463592495498168" resolveInfo="stereotype" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2286463592495498184">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2286463592495498186">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2286463592495498168" resolveInfo="stereotype" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2286463592495498168">
        <property name="name" nameId="tpck.1169194664001" value="stereotype" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="2286463592495498169" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="2286463592495498127">
      <property name="name" nameId="tpck.1169194664001" value="upgradeModelUID" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2286463592495498140">
        <property name="name" nameId="tpck.1169194664001" value="modelReference" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2286463592495498142">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2286463592495498131">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2286463592495498129" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498130">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="9034052485202337810">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="9034052485202337811">
            <property name="name" nameId="tpck.1169194664001" value="newStereo" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="9034052485202337812" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="9034052485202337813">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2286463592495498162" resolveInfo="upgradeStereotype" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9034052485202337814">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="9034052485202337815">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2286463592495498140" resolveInfo="modelReference" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9034052485202337816">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelReference%dgetStereotype()%cjava%dlang%dString" resolveInfo="getStereotype" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2286463592495498143">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2286463592495498145">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="2286463592495498147">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelReference%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSModelFqName,jetbrains%dmps%dsmodel%dSModelId)" resolveInfo="SModelReference" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9034052485202358368">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="9034052485202358363">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="9034052485202358362">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2286463592495498140" resolveInfo="modelReference" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9034052485202358367">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelReference%dgetSModelFqName()%cjetbrains%dmps%dsmodel%dSModelFqName" resolveInfo="getSModelFqName" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="9034052485202358372">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelFqName%dwithStereotype(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSModelFqName" resolveInfo="withStereotype" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="9034052485202358373">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="9034052485202337811" resolveInfo="newStereo" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2286463592495498197">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2286463592495498196">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2286463592495498140" resolveInfo="modelReference" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2286463592495498201">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelReference%dgetSModelId()%cjetbrains%dmps%dsmodel%dSModelId" resolveInfo="getSModelId" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2286463592495498122" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="2286463592495498123">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2286463592495498124" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2286463592495498125" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2286463592495498126" />
    </node>
  </root>
  <root id="651246788329828609">
    <node role="fields" roleId="mlj4.7707758858785994425" type="mlj4.XMLSAXFieldDeclaration" typeId="mlj4.7707758858785994411" id="7606567306781655232">
      <property name="name" nameId="tpck.1169194664001" value="accumulator" />
      <node role="type" roleId="mlj4.7707758858785994413" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7606567306781655234">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="8837498651724313880" resolveInfo="LineContentAccumulator" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="651246788329828627">
      <property name="name" nameId="tpck.1169194664001" value="model" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="model" />
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="7606567306781657921">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="persistence" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="7606567306781655250" resolveInfo="null" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="7606567306781657923">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="maxImportIndex" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="7606567306781655250" resolveInfo="null" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="7606567306781657924">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="languageAspect" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="7606567306781655250" resolveInfo="null" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="7606567306781657925">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="language" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="7606567306781655250" resolveInfo="null" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="7606567306781657926">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="language-engaged-on-generation" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="7606567306781655250" resolveInfo="null" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="7606567306781657927">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="devkit" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="7606567306781655250" resolveInfo="null" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="7606567306781657928">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="import" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="7606567306781655250" resolveInfo="null" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="7606567306781657931">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="visible" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="7606567306781655250" resolveInfo="null" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="7606567306781657929">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="651246788329828898" resolveInfo="node" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="7606567306781657986">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7606567306781657987">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7606567306781657988">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7606567306781657989">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7606567306781657990">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7606567306781655232" resolveInfo="accumulator" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7606567306781657991">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724313892" resolveInfo="popNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="7606567306781657992" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="651246788329828750">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="651246788329828751">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7606567306781655236">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7606567306781655238">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7606567306781655241">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7606567306781655242">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724313945" resolveInfo="LineContentAccumulator" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7606567306781655237">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7606567306781655232" resolveInfo="accumulator" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="651246788329828801">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7606567306781655244">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7606567306781655243">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7606567306781655232" resolveInfo="accumulator" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7606567306781655248">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724313951" resolveInfo="getLineToContentMap" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tp2q.ListType" typeId="tp2q.1151688443754" id="651246788329829158">
        <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="130405662258201905">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="vz3d.~LineContent" resolveInfo="LineContent" />
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="651246788329828898">
      <property name="name" nameId="tpck.1169194664001" value="node" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="node" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="false" />
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="651246788329828899">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="651246788329829035" resolveInfo="property" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="651246788329828900">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="651246788329828901">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="651246788329828902">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="651246788329828903">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7606567306781657951">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7606567306781657958">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7606567306781657952">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7606567306781655232" resolveInfo="accumulator" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7606567306781657962">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724313906" resolveInfo="saveProperty" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="7606567306781657963" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="7606567306781657966" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="651246788329828917">
                <node role="leftExpression" roleId="tpee.1081773367580" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="651246788329828920" />
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="651246788329828921" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="651246788329828922">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="651246788329829056" resolveInfo="link" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="651246788329828923">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="651246788329828924">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="651246788329832370">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="651246788329832374">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="651246788329832377" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="651246788329832373" />
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="651246788329832372">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7606567306781657967">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7606567306781657969">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7606567306781657968">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7606567306781655232" resolveInfo="accumulator" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7606567306781657973">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724313906" resolveInfo="saveProperty" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="7606567306781657974" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="7606567306781657976" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="651246788329828951">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="651246788329828898" resolveInfo="node" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="651246788329828952">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="651246788329828953">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7606567306781657977">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7606567306781657979">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7606567306781657978">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7606567306781655232" resolveInfo="accumulator" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7606567306781657983">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724313892" resolveInfo="popNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="7606567306781657984" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="651246788329828966">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="651246788329828981">
        <property name="name" nameId="tpck.1169194664001" value="id" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="651246788329828982">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="651246788329828983">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7606567306781657934">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7606567306781657936">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7606567306781657935">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7606567306781655232" resolveInfo="accumulator" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7606567306781657940">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724313881" resolveInfo="pushNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7606567306781657941">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodeId%dfromString(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="fromString" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="7606567306781657942" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="7606567306781657946" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="651246788329837688">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="651246788329829035">
      <property name="name" nameId="tpck.1169194664001" value="property" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="property" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="651246788329829036">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.StringType" typeId="tpee.1225271177708" id="651246788329829047" />
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="651246788329829048">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="651246788329829049">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="651246788329832366">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1967473504308996498">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8jx9.~VersionUtil%dgetRole(java%dlang%dString)%cjava%dlang%dString" resolveInfo="getRole" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="8jx9.~VersionUtil" resolveInfo="VersionUtil" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="1967473504308996499">
                <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="651246788329829036" resolveInfo="name" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="651246788329829056">
      <property name="name" nameId="tpck.1169194664001" value="link" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="link" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="651246788329829057">
        <property name="name" nameId="tpck.1169194664001" value="role" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.StringType" typeId="tpee.1225271177708" id="651246788329829085" />
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="651246788329829086">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="651246788329829087">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1967473504308996501">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1967473504308996503">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8jx9.~VersionUtil%dgetRole(java%dlang%dString)%cjava%dlang%dString" resolveInfo="getRole" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="8jx9.~VersionUtil" resolveInfo="VersionUtil" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="1967473504308996504">
                <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="651246788329829057" resolveInfo="role" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="7606567306781655250">
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="null" />
    </node>
    <node role="globalText" roleId="mlj4.4120841425052674327" type="mlj4.XMLSAXTextRule" typeId="mlj4.4635390255048097272" id="651246788329829110">
      <node role="handler" roleId="mlj4.4635390255048098137" type="mlj4.XMLSAXTextHandler" typeId="mlj4.4635390255048097273" id="651246788329829111">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="651246788329829112">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7606567306781657993">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7606567306781658000">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7606567306781657994">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7606567306781655232" resolveInfo="accumulator" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7606567306781658004">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724313922" resolveInfo="processText" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXTextHandler_value" typeId="mlj4.4635390255048098132" id="7606567306781658005" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="7606567306781658007" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="8837498651724313880">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8837498651724313881">
      <property name="name" nameId="tpck.1169194664001" value="pushNode" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8837498651724313882" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8837498651724313883" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8837498651724313884">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724313885">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724313886">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8837498651724313887">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313937" resolveInfo="myNodeIdStack" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.PushOperation" typeId="tp2q.3358009230508699932" id="8837498651724313888">
              <node role="argument" roleId="tp2q.3358009230508990571" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8837498651724313889">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313890" resolveInfo="nodeId" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7606567306781654147">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="7606567306781654148">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724313900" resolveInfo="saveNode" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7606567306781654149">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7606567306781654143" resolveInfo="locator" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8837498651724313890">
        <property name="name" nameId="tpck.1169194664001" value="nodeId" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724313891">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7606567306781654143">
        <property name="name" nameId="tpck.1169194664001" value="locator" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7606567306781654145">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fmpa.~Locator" resolveInfo="Locator" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8837498651724313892">
      <property name="name" nameId="tpck.1169194664001" value="popNode" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8837498651724313893" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8837498651724313894" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8837498651724313895">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7606567306781654137">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="7606567306781654138">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724313900" resolveInfo="saveNode" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7606567306781654139">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7606567306781654134" resolveInfo="locator" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724313896">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724313897">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8837498651724313898">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313937" resolveInfo="myNodeIdStack" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.PopOperation" typeId="tp2q.3358009230508699637" id="8837498651724313899" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7606567306781654134">
        <property name="name" nameId="tpck.1169194664001" value="locator" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7606567306781654135">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fmpa.~Locator" resolveInfo="Locator" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8837498651724313980">
      <property name="name" nameId="tpck.1169194664001" value="saveElement" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8837498651724313981" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="8837498651724313984" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8837498651724313983">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.WhileStatement" typeId="tpee.1076505808687" id="8837498651724314020">
          <node role="condition" roleId="tpee.1076505808688" type="tpee.GreaterThanOrEqualsExpression" typeId="tpee.1153417849900" id="8837498651724314036">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8837498651724314037">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313985" resolveInfo="index" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724314038">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8837498651724314039">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313930" resolveInfo="myLineToContentMap" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="8837498651724314040" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="8837498651724314022">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724314041">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724314056">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8837498651724314042">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313930" resolveInfo="myLineToContentMap" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="8837498651724314060">
                  <node role="argument" roleId="tp2q.1160612519549" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="8837498651724314062" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724314064">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="8837498651724314070">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8837498651724314073">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313987" resolveInfo="lineContent" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tp2q.ListElementAccessExpression" typeId="tp2q.1225711141656" id="8837498651724314066">
              <node role="index" roleId="tp2q.1225711191269" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8837498651724314069">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313985" resolveInfo="index" />
              </node>
              <node role="list" roleId="tp2q.1225711182005" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8837498651724314065">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313930" resolveInfo="myLineToContentMap" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8837498651724313985">
        <property name="name" nameId="tpck.1169194664001" value="index" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="8837498651724313986" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8837498651724313987">
        <property name="name" nameId="tpck.1169194664001" value="lineContent" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724313990">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="vz3d.~LineContent" resolveInfo="LineContent" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8837498651724314074">
      <property name="name" nameId="tpck.1169194664001" value="saveElement" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8837498651724314075" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="8837498651724314078" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8837498651724314077">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724314088">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="8837498651724314089">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724313980" resolveInfo="saveElement" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="8837498651724314096">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8837498651724314099">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724314091">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8837498651724314090">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724314079" resolveInfo="locator" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8837498651724314095">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fmpa.~Locator%dgetLineNumber()%cint" resolveInfo="getLineNumber" />
                </node>
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8837498651724314101">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724314081" resolveInfo="lineContent" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8837498651724314079">
        <property name="name" nameId="tpck.1169194664001" value="locator" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724314080">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fmpa.~Locator" resolveInfo="Locator" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8837498651724314081">
        <property name="name" nameId="tpck.1169194664001" value="lineContent" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724314084">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="vz3d.~LineContent" resolveInfo="LineContent" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8837498651724313900">
      <property name="name" nameId="tpck.1169194664001" value="saveNode" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8837498651724313901" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="7606567306781654154" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8837498651724313903">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724313969">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="8837498651724313991">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724314074" resolveInfo="saveElement" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8837498651724313995">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313904" resolveInfo="locator" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8837498651724314005">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="8837498651724314007">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="vz3d.~NodeLineContent%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSNodeId)" resolveInfo="NodeLineContent" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724314008">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8837498651724314009">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313937" resolveInfo="myNodeIdStack" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.PeekOperation" typeId="tp2q.5784983078884872741" id="8837498651724314010" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8837498651724313904">
        <property name="name" nameId="tpck.1169194664001" value="locator" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724313905">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fmpa.~Locator" resolveInfo="Locator" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8837498651724313906">
      <property name="name" nameId="tpck.1169194664001" value="saveProperty" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8837498651724313907" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8837498651724313908" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8837498651724313909">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724314102">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="8837498651724314103">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724314074" resolveInfo="saveElement" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8837498651724314104">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313912" resolveInfo="locator" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8837498651724314106">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="8837498651724314108">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="vz3d.~PropertyLineContent%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSNodeId,java%dlang%dString)" resolveInfo="PropertyLineContent" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724314110">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8837498651724314109">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313937" resolveInfo="myNodeIdStack" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.PeekOperation" typeId="tp2q.5784983078884872741" id="8837498651724314114" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8837498651724314116">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313910" resolveInfo="name" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8837498651724313910">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="8837498651724313911" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8837498651724313912">
        <property name="name" nameId="tpck.1169194664001" value="locator" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724313913">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fmpa.~Locator" resolveInfo="Locator" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8837498651724313914">
      <property name="name" nameId="tpck.1169194664001" value="saveReference" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8837498651724313915" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8837498651724313916" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8837498651724313917">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724314117">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="8837498651724314118">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="8837498651724314074" resolveInfo="saveElement" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8837498651724314119">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313920" resolveInfo="locator" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8837498651724314120">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="8837498651724314121">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="vz3d.~ReferenceLineContent%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSNodeId,java%dlang%dString)" resolveInfo="ReferenceLineContent" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724314122">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8837498651724314123">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313937" resolveInfo="myNodeIdStack" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.PeekOperation" typeId="tp2q.5784983078884872741" id="8837498651724314124" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8837498651724314126">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313918" resolveInfo="role" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8837498651724313918">
        <property name="name" nameId="tpck.1169194664001" value="role" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="8837498651724313919" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8837498651724313920">
        <property name="name" nameId="tpck.1169194664001" value="locator" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724313921">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fmpa.~Locator" resolveInfo="Locator" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8837498651724313922">
      <property name="name" nameId="tpck.1169194664001" value="processText" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8837498651724313923" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8837498651724313924" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8837498651724313925">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8837498651724314165">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8837498651724314166">
            <property name="name" nameId="tpck.1169194664001" value="lineContent" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724314167">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="vz3d.~LineContent" resolveInfo="LineContent" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="8837498651724314169" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="8837498651724314171">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="8837498651724314172">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724314181">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="8837498651724314183">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8837498651724314186">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="8837498651724331874">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="vz3d.~NodeLineContent%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSNodeId)" resolveInfo="NodeLineContent" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724331876">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8837498651724331875">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313937" resolveInfo="myNodeIdStack" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp2q.PeekOperation" typeId="tp2q.5784983078884872741" id="8837498651724331880" />
                    </node>
                  </node>
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8837498651724314182">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724314166" resolveInfo="lineContent" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724314176">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8837498651724314175">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313937" resolveInfo="myNodeIdStack" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.IsNotEmptyOperation" typeId="tp2q.1176501494711" id="8837498651724314180" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.WhileStatement" typeId="tpee.1076505808687" id="8837498651724314127">
          <node role="condition" roleId="tpee.1076505808688" type="tpee.GreaterThanExpression" typeId="tpee.1081506762703" id="8837498651724331887">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="8837498651724331888">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8837498651724331889">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724331890">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="8837498651724331891">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313928" resolveInfo="locator" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8837498651724331892">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fmpa.~Locator%dgetLineNumber()%cint" resolveInfo="getLineNumber" />
                </node>
              </node>
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724331893">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8837498651724331894">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313930" resolveInfo="myLineToContentMap" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="8837498651724331895" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="8837498651724314133">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724314134">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724314135">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8837498651724314136">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313930" resolveInfo="myLineToContentMap" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddElementOperation" typeId="tp2q.1160612413312" id="8837498651724314137">
                  <node role="argument" roleId="tp2q.1160612519549" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8837498651724331881">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724314166" resolveInfo="lineContent" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8837498651724313926">
        <property name="name" nameId="tpck.1169194664001" value="text" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="8837498651724313927" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="8837498651724313928">
        <property name="name" nameId="tpck.1169194664001" value="locator" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724313929">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fmpa.~Locator" resolveInfo="Locator" />
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="8837498651724313930">
      <property name="name" nameId="tpck.1169194664001" value="myLineToContentMap" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="8837498651724313931" />
      <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="8837498651724313932">
        <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724313933">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="vz3d.~LineContent" resolveInfo="LineContent" />
        </node>
      </node>
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8837498651724313934">
        <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="8837498651724313935">
          <node role="elementType" roleId="tp2q.1237721435807" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724313936">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="vz3d.~LineContent" resolveInfo="LineContent" />
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="8837498651724313937">
      <property name="name" nameId="tpck.1169194664001" value="myNodeIdStack" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="8837498651724313938" />
      <node role="type" roleId="tpee.5680397130376446158" type="tp2q.StackType" typeId="tp2q.6801639034384703212" id="8837498651724313939">
        <node role="elementType" roleId="tp2q.5686963296372573084" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724313940">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
        </node>
      </node>
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8837498651724313941">
        <node role="creator" roleId="tpee.1145553007750" type="tp2q.LinkedListCreator" typeId="tp2q.1227008614712" id="8837498651724313942">
          <node role="elementType" roleId="tp2q.1237721435807" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724313943">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8837498651724313944" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="8837498651724313945">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8837498651724313946" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8837498651724313947" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8837498651724313948" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="8837498651724313951">
      <property name="name" nameId="tpck.1169194664001" value="getLineToContentMap" />
      <node role="returnType" roleId="tpee.1068580123133" type="tp2q.ListType" typeId="tp2q.1151688443754" id="8837498651724313952">
        <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724313953">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="vz3d.~LineContent" resolveInfo="LineContent" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8837498651724313954" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8837498651724313955">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724313956">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="8837498651724313957">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8837498651724313930" resolveInfo="myLineToContentMap" />
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

