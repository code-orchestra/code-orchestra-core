<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:b11ed8aa-3bfd-4e32-9f42-fbe92f0be58c(jetbrains.mps.smodel.persistence.def.v7)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="760a0a8c-eabb-4521-8bfd-65db761a9ba3(jetbrains.mps.baseLanguage.logging)" />
  <language namespace="a8fdde77-2e6c-41f6-ac79-8e9b6449c271(jetbrains.mps.xmlQuery)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <import index="t77w" modelUID="r:2cdd9596-2ed5-4152-b387-8144a1963c4c(jetbrains.mps.smodel.persistence.def.v5)" version="-1" />
  <import index="ufjo" modelUID="r:d2766b06-4f01-4d0c-929f-9fe2b1a7c0dc(jetbrains.mps.refactoring)" version="-1" />
  <import index="lkfb" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.smodel(jetbrains.mps.smodel@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(java.lang@java_stub)" version="-1" />
  <import index="6p08" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.smodel.nodeidmap(jetbrains.mps.smodel.nodeidmap@java_stub)" version="-1" />
  <import index="ho7a" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.project.structure.modules(jetbrains.mps.project.structure.modules@java_stub)" version="-1" />
  <import index="fmpa" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#org.xml.sax(org.xml.sax@java_stub)" version="-1" />
  <import index="vz3d" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.smodel.persistence.lines(jetbrains.mps.smodel.persistence.lines@java_stub)" version="-1" />
  <import index="r27b" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#org.jetbrains.annotations(org.jetbrains.annotations@java_stub)" version="-1" />
  <import index="7a2w" modelUID="r:10bf3684-5fb2-4fa0-9dd9-1d05589df2e9(jetbrains.mps.xmlQuery.runtime)" version="-1" />
  <import index="p4ns" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.smodel.persistence(MPS.Classpath/jetbrains.mps.smodel.persistence@java_stub)" version="-1" />
  <import index="30pf" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.util(MPS.Classpath/jetbrains.mps.util@java_stub)" version="-1" />
  <import index="tpib" modelUID="r:00000000-0000-4000-0000-011c8959057f(jetbrains.mps.baseLanguage.logging.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="mlj4" modelUID="r:bd6e2c7d-3a5d-4eed-9ff9-27f23ecb34e2(jetbrains.mps.xmlQuery.structure)" version="4" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="mlj4.XMLSAXParser" typeId="mlj4.4635390255047863050" id="286176397450364062">
      <property name="name" nameId="tpck.1169194664001" value="ModelReader7" />
      <link role="root" roleId="mlj4.4635390255047981684" targetNodeId="286176397450364075" resolveInfo="model" />
    </node>
    <node type="mlj4.XMLSAXParser" typeId="mlj4.4635390255047863050" id="5797832288566425370">
      <property name="name" nameId="tpck.1169194664001" value="LineToContentMapReader7" />
      <link role="root" roleId="mlj4.4635390255047981684" targetNodeId="5797832288566425387" resolveInfo="model" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="4362914091961459500">
      <property name="name" nameId="tpck.1169194664001" value="WriteHelper" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="4362914091961475519">
      <property name="name" nameId="tpck.1169194664001" value="ReadHelper" />
    </node>
  </roots>
  <root id="286176397450364062">
    <node role="parameters" roleId="mlj4.2824634917103291789" type="mlj4.XMLSAXFieldDeclaration" typeId="mlj4.7707758858785994411" id="2824634917103356431">
      <property name="name" nameId="tpck.1169194664001" value="toState" />
      <node role="type" roleId="mlj4.7707758858785994413" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6960946895180696705">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~ModelLoadingState" resolveInfo="ModelLoadingState" />
      </node>
    </node>
    <node role="parameters" roleId="mlj4.2824634917103291789" type="mlj4.XMLSAXFieldDeclaration" typeId="mlj4.7707758858785994411" id="7623696721876392190">
      <property name="name" nameId="tpck.1169194664001" value="header" />
      <node role="type" roleId="mlj4.7707758858785994413" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7623696721876392192">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelHeader" resolveInfo="SModelHeader" />
      </node>
    </node>
    <node role="fields" roleId="mlj4.7707758858785994425" type="mlj4.XMLSAXFieldDeclaration" typeId="mlj4.7707758858785994411" id="286176397450364063">
      <property name="name" nameId="tpck.1169194664001" value="model" />
      <node role="type" roleId="mlj4.7707758858785994413" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="286176397450364064">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModel" resolveInfo="SModel" />
      </node>
    </node>
    <node role="fields" roleId="mlj4.7707758858785994425" type="mlj4.XMLSAXFieldDeclaration" typeId="mlj4.7707758858785994411" id="286176397450364065">
      <property name="name" nameId="tpck.1169194664001" value="helper" />
      <node role="type" roleId="mlj4.7707758858785994413" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961524782">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="4362914091961475519" resolveInfo="ReadHelper" />
      </node>
    </node>
    <node role="fields" roleId="mlj4.7707758858785994425" type="mlj4.XMLSAXFieldDeclaration" typeId="mlj4.7707758858785994411" id="3585302731854930547">
      <property name="name" nameId="tpck.1169194664001" value="linkMap" />
      <node role="type" roleId="mlj4.7707758858785994413" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3585302731854937037">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ufjo.5817662974489429544" resolveInfo="ModelLinkMap" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="286176397450364075">
      <property name="name" nameId="tpck.1169194664001" value="model" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="model" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364076">
        <property name="name" nameId="tpck.1169194664001" value="modelUID" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="1789533337779209039">
        <property name="name" nameId="tpck.1169194664001" value="version" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="7392088165331554842">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7392088165331554843">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7392088165331554844">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7392088165331554845">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7392088165331554846">
                  <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7392088165331554847">
                    <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7392088165331554848">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dgetSModelHeader()%cjetbrains%dmps%dsmodel%dSModelHeader" resolveInfo="getSModelHeader" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7392088165331554849">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelHeader%dsetVersion(int)%cvoid" resolveInfo="setVersion" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7392088165331554850">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7a2w.108366216419412870" resolveInfo="integerWithDefault" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="7a2w.2603967516254988460" resolveInfo="AttributeUtils" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="7392088165331554853" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="7392088165331554852">
                      <property name="value" nameId="tpee.1068580320021" value="-1" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="1789533337779209040">
        <property name="name" nameId="tpck.1169194664001" value="doNotGenerate" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="7392088165331554857">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7392088165331554858">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7392088165331554859">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7392088165331554860">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7392088165331554861">
                  <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7392088165331554862">
                    <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7392088165331554863">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dgetSModelHeader()%cjetbrains%dmps%dsmodel%dSModelHeader" resolveInfo="getSModelHeader" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7392088165331554864">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelHeader%dsetDoNotGenerate(boolean)%cvoid" resolveInfo="setDoNotGenerate" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7392088165331554868">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7a2w.108366216419412843" resolveInfo="booleanWithDefault" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="7a2w.2603967516254988460" resolveInfo="AttributeUtils" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="7392088165331554869" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="7392088165331554872">
                      <property name="value" nameId="tpee.1068580123138" value="false" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="286176397450364077">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="286176397450364215" resolveInfo="persistence" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="286176397450364078">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="language" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="286176397450364231" resolveInfo="module_reference" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="286176397450364079">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364080">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364081">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364082">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="6960946895180689795">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364086">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%daddLanguage(jetbrains%dmps%dproject%dstructure%dmodules%dModuleReference)%cvoid" resolveInfo="addLanguage" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="5205257170095246589" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="286176397450364089">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="language-engaged-on-generation" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="286176397450364231" resolveInfo="module_reference" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="286176397450364090">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364091">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364092">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364093">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="6960946895180689797">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364097">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%daddEngagedOnGenerationLanguage(jetbrains%dmps%dproject%dstructure%dmodules%dModuleReference)%cvoid" resolveInfo="addEngagedOnGenerationLanguage" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="5205257170095246591" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="286176397450364100">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="devkit" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="286176397450364231" resolveInfo="module_reference" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="286176397450364101">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364102">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364103">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364104">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="6960946895180689799">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364108">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%daddDevKit(jetbrains%dmps%dproject%dstructure%dmodules%dModuleReference)%cvoid" resolveInfo="addDevKit" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="5205257170095246593" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="286176397450364111">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="286176397450364238" resolveInfo="import" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="286176397450364112">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364113">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364114">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364115">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="286176397450364116">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364065" resolveInfo="helper" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364117">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961475589" resolveInfo="addImportToModel" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="286176397450364118">
                    <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="286176397450364119">
                    <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="286176397450364120">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                    <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="286176397450364121" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="286176397450364122">
                    <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="286176397450364123">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                    <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="286176397450364124" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="286176397450364125">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dparseInt(java%dlang%dString)%cint" resolveInfo="parseInt" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="286176397450364126">
                      <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="286176397450364127">
                        <property name="value" nameId="tpee.1068580320021" value="2" />
                      </node>
                      <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="286176397450364128" />
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="286176397450364129">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="286176397450364130" />
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="286176397450364131">
                      <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="286176397450364132">
                        <property name="value" nameId="tpee.1068580320021" value="3" />
                      </node>
                      <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="286176397450364133" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2301870845769287142">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2301870845769287143" resolveInfo="roots" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="2824634917103356434">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2824634917103356435">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2824634917103356436">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="6023647286769159468">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="6960946895180696706">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="2824634917103356439">
                    <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="2824634917103356431" resolveInfo="toState" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6960946895180696710">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="lkfb.~ModelLoadingState%dROOTS_LOADED" resolveInfo="ROOTS_LOADED" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="lkfb.~ModelLoadingState" resolveInfo="ModelLoadingState" />
                  </node>
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NotExpression" typeId="tpee.1081516740877" id="6023647286769159471">
                  <node role="expression" roleId="tpee.1081516765348" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6023647286769159473">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="ufjo.9051163691968353666" resolveInfo="StructureModificationProcessor" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ufjo.9051163691968353847" resolveInfo="hasRefactoringsToPlay" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="6023647286769159474">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2824634917103356443">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6023647286769159476">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6023647286769159478">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="6023647286769159477" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6023647286769159482">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~BaseSModelDescriptor$ModelLoadResult%dsetState(jetbrains%dmps%dsmodel%dModelLoadingState)%cvoid" resolveInfo="setState" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6023647286769159496">
                        <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="lkfb.~ModelLoadingState%dROOTS_LOADED" resolveInfo="ROOTS_LOADED" />
                        <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="lkfb.~ModelLoadingState" resolveInfo="ModelLoadingState" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4751353328907737958">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4751353328907737960">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4751353328907737959">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4751353328907738501">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dsetLoading(boolean)%cboolean" resolveInfo="setLoading" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="4751353328907738502">
                        <property name="value" nameId="tpee.1068580123138" value="false" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="mlj4.XMLSAXBreakStatement" typeId="mlj4.8666712036582994511" id="8109134543120517912" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2301870845769311899">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="2301870845769311879" resolveInfo="rootContent" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="286176397450364149">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364150">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364167">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="286176397450364168">
              <node role="lValue" roleId="tpee.1068498886295" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="286176397450364169">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="286176397450364170">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="286176397450364171">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSModelReference,jetbrains%dmps%dsmodel%dnodeidmap%dINodeIdToNodeMap)" resolveInfo="SModel" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="286176397450364172">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelReference%dfromString(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="fromString" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="286176397450364173">
                      <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="286176397450364076" resolveInfo="modelUID" />
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="9203855509699861002">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="9203855509699861004">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6p08.~RegularNodeIdMap%d&lt;init&gt;()" resolveInfo="RegularNodeIdMap" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364174">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364175">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="286176397450364176">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364177">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dsetPersistenceVersion(int)%cvoid" resolveInfo="setPersistenceVersion" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="286176397450364875">
                  <property name="value" nameId="tpee.1068580320021" value="7" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7623696721876392194">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7623696721876392201">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7623696721876392196">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7623696721876392195">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7623696721876392200">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dgetSModelHeader()%cjetbrains%dmps%dsmodel%dSModelHeader" resolveInfo="getSModelHeader" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7623696721876392205">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelHeader%dupdateDefaults(jetbrains%dmps%dsmodel%dSModelHeader)%cvoid" resolveInfo="updateDefaults" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7623696721876392206">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="7623696721876392190" resolveInfo="header" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364179">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364180">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="286176397450364181">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364182">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dsetLoading(boolean)%cboolean" resolveInfo="setLoading" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="286176397450364183">
                  <property name="value" nameId="tpee.1068580123138" value="true" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364184">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="286176397450364185">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="286176397450364186">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="286176397450364187">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961475553" resolveInfo="ReadHelper" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364188">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="286176397450364189">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364190">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dgetSModelReference()%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="getSModelReference" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="286176397450364191">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364065" resolveInfo="helper" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1780009424517040909">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1780009424517040911">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1780009424517040914">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1780009424517121195">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ufjo.5817662974489429911" resolveInfo="ModelLinkMap" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="1780009424517121196">
                    <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                  </node>
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="1780009424517040910">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="3585302731854930547" resolveInfo="linkMap" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="286176397450364192">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4813471910141065061">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="4813471910141065063">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~BaseSModelDescriptor$ModelLoadResult%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSModel,jetbrains%dmps%dsmodel%dModelLoadingState)" resolveInfo="BaseSModelDescriptor.ModelLoadResult" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4813471910141065064">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6023647286769159484">
                  <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="lkfb.~ModelLoadingState%dNOT_LOADED" resolveInfo="NOT_LOADED" />
                  <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="lkfb.~ModelLoadingState" resolveInfo="ModelLoadingState" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="validator" roleId="mlj4.3444414697307356525" type="mlj4.XMLSAXNodeValidator" typeId="mlj4.3444414697307355268" id="286176397450364200">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364201">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3585302731854937038">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3585302731854937043">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3585302731854937039">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3585302731854937041">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ufjo.9051163691968353673" resolveInfo="StructureModificationProcessor" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="3585302731854937042">
                    <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="3585302731854930547" resolveInfo="linkMap" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8035425343761257736">
                    <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3585302731854937047">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ufjo.9051163691968380095" resolveInfo="updateModelOnLoad" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="980809437931347616">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="980809437931347618">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="980809437931347617">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="3585302731854930547" resolveInfo="linkMap" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="980809437931347622">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ufjo.980809437931330620" resolveInfo="fillRoleIdsComponent" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6023647286769159486">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6023647286769159488">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="6023647286769159487" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6023647286769159492">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~BaseSModelDescriptor$ModelLoadResult%dsetState(jetbrains%dmps%dsmodel%dModelLoadingState)%cvoid" resolveInfo="setState" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6023647286769159494">
                  <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="lkfb.~ModelLoadingState%dFULLY_LOADED" resolveInfo="FULLY_LOADED" />
                  <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="lkfb.~ModelLoadingState" resolveInfo="ModelLoadingState" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364202">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364203">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="6960946895180689801">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364207">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dsetLoading(boolean)%cboolean" resolveInfo="setLoading" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="286176397450364208">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="286176397450364209">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="286176397450364210">
              <property name="value" nameId="tpee.1068580123138" value="true" />
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4813471910141065060">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~BaseSModelDescriptor$ModelLoadResult" resolveInfo="BaseSModelDescriptor.ModelLoadResult" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="286176397450364215">
      <property name="name" nameId="tpck.1169194664001" value="persistence" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="persistence" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364216">
        <property name="name" nameId="tpck.1169194664001" value="version" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="286176397450364217">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364218">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364219">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="286176397450364220">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dparseInt(java%dlang%dString)%cint" resolveInfo="parseInt" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="286176397450364221">
                <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="286176397450364216" resolveInfo="version" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="286176397450364222">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="286176397450364231">
      <property name="name" nameId="tpck.1169194664001" value="module_reference" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364232">
        <property name="name" nameId="tpck.1169194664001" value="namespace" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5205257170095246584">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ho7a.~ModuleReference" resolveInfo="ModuleReference" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="286176397450364234">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364235">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364236">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5205257170095246586">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ho7a.~ModuleReference%dfromString(java%dlang%dString)%cjetbrains%dmps%dproject%dstructure%dmodules%dModuleReference" resolveInfo="fromString" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="ho7a.~ModuleReference" resolveInfo="ModuleReference" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="5205257170095246587">
                <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="286176397450364232" resolveInfo="namespace" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="286176397450364238">
      <property name="name" nameId="tpck.1169194664001" value="import" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="import" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364239">
        <property name="name" nameId="tpck.1169194664001" value="index" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364240">
        <property name="name" nameId="tpck.1169194664001" value="version" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364241">
        <property name="name" nameId="tpck.1169194664001" value="modelUID" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364242">
        <property name="name" nameId="tpck.1169194664001" value="implicit" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="286176397450364243">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364244">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364245">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="286176397450364246">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="286176397450364247">
                  <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="286176397450364248" />
                  <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="286176397450364249">
                    <property name="value" nameId="tpee.1068580320021" value="3" />
                  </node>
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="286176397450364250" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="286176397450364251">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364252">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364253">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="286176397450364254">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="286176397450364255">
                <node role="componentType" roleId="tpee.1154542793668" type="tpee.StringType" typeId="tpee.1225271177708" id="286176397450364256" />
                <node role="initValue" roleId="tpee.1154542803372" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="286176397450364257">
                  <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="286176397450364239" resolveInfo="index" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="286176397450364258">
                  <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="286176397450364241" resolveInfo="modelUID" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="286176397450364259">
                  <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="286176397450364240" resolveInfo="version" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="286176397450364260" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ArrayType" typeId="tpee.1070534760951" id="286176397450364261">
        <node role="componentType" roleId="tpee.1070534760952" type="tpee.StringType" typeId="tpee.1225271177708" id="286176397450364262" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="2301870845769287143">
      <property name="name" nameId="tpck.1169194664001" value="roots" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="roots" />
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2301870845769311855">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="286176397450364263" resolveInfo="node" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="2301870845769311858">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301870845769311859">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2301870845769311860">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="2301870845769311864">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="2301870845769311867" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2301870845769311863" />
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301870845769311862">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301870845769311868">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301870845769311870">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="2301870845769311869">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2301870845769311874">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%daddRoot(jetbrains%dmps%dsmodel%dSNode)%cvoid" resolveInfo="addRoot" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2301870845769311875" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2301870845769318854">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="2301870845769311879">
      <property name="name" nameId="tpck.1169194664001" value="rootContent" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="root" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="2301870845769311919">
        <property name="name" nameId="tpck.1169194664001" value="id" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="2301870845769311881">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="286176397450364263" resolveInfo="node" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="2301870845769311882">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301870845769311883">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2301870845769311884">
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="2301870845769311885">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="2301870845769311886" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2301870845769311887" />
              </node>
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301870845769311888">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301870845769311889">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301870845769311890">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="2824634917103381269" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2301870845769311894">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%daddChild(java%dlang%dString,jetbrains%dmps%dsmodel%dSNode)%cvoid" resolveInfo="addChild" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301870845769311933">
                        <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2301870845769311934" />
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2301870845769311935">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dgetRole_()%cjava%dlang%dString" resolveInfo="getRole_" />
                        </node>
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="2301870845769311895" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="2301870845769311920">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="2301870845769311921">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2301870845769311922">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2301870845769311924">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="2301870845769311925">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2301870845769311926">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dgetNodeById(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSNode" resolveInfo="getNodeById" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="2301870845769311927">
                  <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="2301870845769311919" resolveInfo="id" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2824634917103381270">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNode" resolveInfo="SNode" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="286176397450364263">
      <property name="name" nameId="tpck.1169194664001" value="node" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="node" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="false" />
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="286176397450364264">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="286176397450364398" resolveInfo="property" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="286176397450364265">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364266">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="286176397450364267">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364268">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364269">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364270">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="286176397450364271" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364272">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dsetProperty(java%dlang%dString,java%dlang%dString,boolean)%cvoid" resolveInfo="setProperty" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364273">
                        <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="286176397450364274">
                          <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364065" resolveInfo="helper" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364275">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961476139" resolveInfo="readName" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="286176397450364276">
                            <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="286176397450364277">
                              <property name="value" nameId="tpee.1068580320021" value="0" />
                            </node>
                            <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="286176397450364278" />
                          </node>
                        </node>
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="286176397450364279">
                        <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="286176397450364280">
                          <property name="value" nameId="tpee.1068580320021" value="1" />
                        </node>
                        <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="286176397450364281" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="8666712036583229541">
                        <property name="value" nameId="tpee.1068580123138" value="false" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8763149886003449820">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8763149886003449822">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8763149886003449821">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="3585302731854930547" resolveInfo="linkMap" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8763149886003449826">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ufjo.5817662974489429642" resolveInfo="addNameLocation" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8763149886003449828">
                        <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8763149886003449827">
                          <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364065" resolveInfo="helper" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8763149886003449832">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961475758" resolveInfo="readLinkId" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8763149886003449834">
                            <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8763149886003449837">
                              <property name="value" nameId="tpee.1068580320021" value="2" />
                            </node>
                            <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="8763149886003449833" />
                          </node>
                        </node>
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="8763149886003449839" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8763149886003449842">
                        <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8763149886003449845">
                          <property name="value" nameId="tpee.1068580320021" value="0" />
                        </node>
                        <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="8763149886003449841" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="286176397450364282">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="286176397450364283">
                  <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="286176397450364284">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                  <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="286176397450364285" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="286176397450364286" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="286176397450364287">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="286176397450364419" resolveInfo="link" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="286176397450364288">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364289">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4703487121563635901">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4703487121563635902">
                <property name="name" nameId="tpck.1169194664001" value="pptr" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4703487121563635903">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="30pf.~Pair" resolveInfo="Pair" />
                  <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4703487121563635905">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" resolveInfo="Boolean" />
                  </node>
                  <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4703487121563635907">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodePointer" resolveInfo="SNodePointer" />
                  </node>
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4703487121563635910">
                  <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="4703487121563635909">
                    <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364065" resolveInfo="helper" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4703487121563635914">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1121566508702404714" resolveInfo="readLink_internal" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="4703487121563635916">
                      <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4703487121563635919">
                        <property name="value" nameId="tpee.1068580320021" value="1" />
                      </node>
                      <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="4703487121563635915" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5132159629682542705">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5132159629682542706">
                <property name="name" nameId="tpck.1169194664001" value="ptr" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5132159629682542707">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodePointer" resolveInfo="SNodePointer" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4703487121563635922">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4703487121563635921">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4703487121563635902" resolveInfo="pptr" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4703487121563635926">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="30pf.~Pair%do2" resolveInfo="o2" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="5132159629682542728">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="5132159629682542729">
                <node role="statement" roleId="tpee.1068581517665" type="tpib.LogStatement" typeId="tpib.1167227138527" id="5132159629682542730">
                  <property name="severity" nameId="tpib.1167245565795" value="error" />
                  <node role="logExpression" roleId="tpib.1167227463056" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="5132159629682546197">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="5132159629682542731">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="5132159629682542732">
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="5132159629682542733">
                          <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5132159629682542734">
                            <property name="value" nameId="tpee.1068580320021" value="0" />
                          </node>
                          <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="5132159629682542735" />
                        </node>
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5132159629682542736">
                          <property name="value" nameId="tpee.1070475926801" value="couldn't create reference '" />
                        </node>
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5132159629682542737">
                        <property name="value" nameId="tpee.1070475926801" value="' from " />
                      </node>
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="5132159629682546201">
                      <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5132159629682546204">
                        <property name="value" nameId="tpee.1068580320021" value="1" />
                      </node>
                      <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="5132159629682546200" />
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5132159629682542738" />
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.OrExpression" typeId="tpee.1080223426719" id="5132159629682542748">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="5132159629682542757">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5132159629682542752">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5132159629682542751">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542706" resolveInfo="ptr" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5132159629682542756">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodePointer%dgetModelReference()%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="getModelReference" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5132159629682542761" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="5132159629682542739">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5132159629682542745">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542706" resolveInfo="ptr" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5132159629682542740" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.CommentedStatementsBlock" typeId="tpee.1177326519037" id="5894223094860018756">
              <node role="statement" roleId="tpee.1177326540772" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5132159629682542771">
                <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5132159629682542772">
                  <property name="name" nameId="tpck.1169194664001" value="ref" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5132159629682542773">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SReference" resolveInfo="SReference" />
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1177326540772" type="tpee.IfStatement" typeId="tpee.1068580123159" id="5132159629682546207">
                <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="5132159629682546208">
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5132159629682546221">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5132159629682546223">
                      <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5132159629682546226">
                        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="5132159629682546228">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~DynamicReference%d&lt;init&gt;(java%dlang%dString,jetbrains%dmps%dsmodel%dSNode,jetbrains%dmps%dsmodel%dSModelReference,java%dlang%dString)" resolveInfo="DynamicReference" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5132159629682546946">
                            <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="5132159629682546945">
                              <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364065" resolveInfo="helper" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5132159629682546950">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961476129" resolveInfo="readRole" />
                              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="5132159629682546952">
                                <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5132159629682546955">
                                  <property name="value" nameId="tpee.1068580320021" value="0" />
                                </node>
                                <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="5132159629682546951" />
                              </node>
                            </node>
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="5132159629682546240" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5132159629682546243">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5132159629682546242">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542706" resolveInfo="ptr" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5132159629682546247">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodePointer%dgetModelReference()%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="getModelReference" />
                            </node>
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="5132159629682546250">
                            <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5132159629682546253">
                              <property name="value" nameId="tpee.1068580320021" value="2" />
                            </node>
                            <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="5132159629682546249" />
                          </node>
                        </node>
                      </node>
                      <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5132159629682546222">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542772" resolveInfo="ref" />
                      </node>
                    </node>
                  </node>
                  <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8763149886003449859">
                    <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8763149886003449861">
                      <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8763149886003449860">
                        <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="3585302731854930547" resolveInfo="linkMap" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8763149886003449865">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ufjo.5817662974489429659" resolveInfo="addDynamicReference" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8763149886003449868">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8763149886003449866">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542706" resolveInfo="ptr" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8763149886003449872">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodePointer%dgetModelReference()%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="getModelReference" />
                          </node>
                        </node>
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8763149886003449908">
                          <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8763149886003451862">
                            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~DynamicReference" resolveInfo="DynamicReference" />
                          </node>
                          <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8763149886003449874">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542772" resolveInfo="ref" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4703487121563635929">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4703487121563635928">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4703487121563635902" resolveInfo="pptr" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4703487121563635933">
                    <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="30pf.~Pair%do1" resolveInfo="o1" />
                  </node>
                </node>
                <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="5132159629682546254">
                  <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="5132159629682546255">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5132159629682546256">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5132159629682546258">
                        <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5132159629682546261">
                          <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="5132159629682546938">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~StaticReference%d&lt;init&gt;(java%dlang%dString,jetbrains%dmps%dsmodel%dSNode,jetbrains%dmps%dsmodel%dSModelReference,jetbrains%dmps%dsmodel%dSNodeId,java%dlang%dString)" resolveInfo="StaticReference" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5132159629682546958">
                              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="5132159629682546957">
                                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364065" resolveInfo="helper" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5132159629682546962">
                                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961476129" resolveInfo="readRole" />
                                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="5132159629682546964">
                                  <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5132159629682546967">
                                    <property name="value" nameId="tpee.1068580320021" value="0" />
                                  </node>
                                  <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="5132159629682546963" />
                                </node>
                              </node>
                            </node>
                            <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="5132159629682546969" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5132159629682546972">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5132159629682546971">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542706" resolveInfo="ptr" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5132159629682546976">
                                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodePointer%dgetModelReference()%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="getModelReference" />
                              </node>
                            </node>
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5132159629682546979">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5132159629682546978">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542706" resolveInfo="ptr" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5132159629682546983">
                                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodePointer%dgetNodeId()%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="getNodeId" />
                              </node>
                            </node>
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="5132159629682546986">
                              <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5132159629682546989">
                                <property name="value" nameId="tpee.1068580320021" value="2" />
                              </node>
                              <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="5132159629682546985" />
                            </node>
                          </node>
                        </node>
                        <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5132159629682546257">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542772" resolveInfo="ref" />
                        </node>
                      </node>
                    </node>
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8763149886003449848">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8763149886003449850">
                        <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8763149886003449849">
                          <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="3585302731854930547" resolveInfo="linkMap" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8763149886003449854">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ufjo.5817662974489429600" resolveInfo="addTargetLocation" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8763149886003449855">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542706" resolveInfo="ptr" />
                          </node>
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.CastExpression" typeId="tpee.1070534934090" id="8763149886003451863">
                            <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8763149886003451866">
                              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~StaticReference" resolveInfo="StaticReference" />
                            </node>
                            <node role="expression" roleId="tpee.1070534934092" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8763149886003449857">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542772" resolveInfo="ref" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5894223094860018760">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5894223094860018761">
                <property name="name" nameId="tpck.1169194664001" value="ref" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5894223094860018762">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~StaticReference" resolveInfo="StaticReference" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5894223094860018764">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="5894223094860018765">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~StaticReference%d&lt;init&gt;(java%dlang%dString,jetbrains%dmps%dsmodel%dSNode,jetbrains%dmps%dsmodel%dSModelReference,jetbrains%dmps%dsmodel%dSNodeId,java%dlang%dString)" resolveInfo="StaticReference" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5894223094860018766">
                      <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="5894223094860018767">
                        <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364065" resolveInfo="helper" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5894223094860018768">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961476129" resolveInfo="readRole" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="5894223094860018769">
                          <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5894223094860018770">
                            <property name="value" nameId="tpee.1068580320021" value="0" />
                          </node>
                          <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="5894223094860018771" />
                        </node>
                      </node>
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="5894223094860018772" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5894223094860018773">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5894223094860018774">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542706" resolveInfo="ptr" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5894223094860018775">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodePointer%dgetModelReference()%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="getModelReference" />
                      </node>
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5894223094860018776">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5894223094860018777">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542706" resolveInfo="ptr" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5894223094860018778">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodePointer%dgetNodeId()%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="getNodeId" />
                      </node>
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="5894223094860018779">
                      <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5894223094860018780">
                        <property name="value" nameId="tpee.1068580320021" value="2" />
                      </node>
                      <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="5894223094860018781" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5894223094860018783">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5894223094860018784">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="5894223094860018785">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="3585302731854930547" resolveInfo="linkMap" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5894223094860018786">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ufjo.5817662974489429600" resolveInfo="addTargetLocation" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5894223094860018787">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5132159629682542706" resolveInfo="ptr" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5894223094860018790">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5894223094860018761" resolveInfo="ref" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="5894223094860018793" />
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364324">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364325">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="286176397450364326" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364327">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%daddReference(jetbrains%dmps%dsmodel%dSReference)%cvoid" resolveInfo="addReference" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5894223094860018791">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5894223094860018761" resolveInfo="ref" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8763149886003449876">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8763149886003449878">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8763149886003449877">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="3585302731854930547" resolveInfo="linkMap" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8763149886003449882">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ufjo.5817662974489429614" resolveInfo="addRoleLocation" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8763149886003449884">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8763149886003449883">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364065" resolveInfo="helper" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8763149886003449888">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961475758" resolveInfo="readLinkId" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8763149886003449890">
                        <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8763149886003449893">
                          <property name="value" nameId="tpee.1068580320021" value="3" />
                        </node>
                        <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="8763149886003449889" />
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5894223094860018792">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5894223094860018761" resolveInfo="ref" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="286176397450364332">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="286176397450364263" resolveInfo="node" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="286176397450364333">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364334">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364335">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364336">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="286176397450364337" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364338">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%daddChild(java%dlang%dString,jetbrains%dmps%dsmodel%dSNode)%cvoid" resolveInfo="addChild" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364339">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="286176397450364340" />
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364341">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dgetRole_()%cjava%dlang%dString" resolveInfo="getRole_" />
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="286176397450364342" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364347">
        <property name="name" nameId="tpck.1169194664001" value="type" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="8666712036583229500">
        <property name="name" nameId="tpck.1169194664001" value="typeId" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="8666712036583229502">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8666712036583229503">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8763149886003446165">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8763149886003446167">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8763149886003446166">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="3585302731854930547" resolveInfo="linkMap" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8763149886003446171">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ufjo.5817662974489429586" resolveInfo="addTypeLocation" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8763149886003449796">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8763149886003449795">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364065" resolveInfo="helper" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8763149886003449800">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961475758" resolveInfo="readLinkId" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="8763149886003449801" />
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="8763149886003446174" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364348">
        <property name="name" nameId="tpck.1169194664001" value="role" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="286176397450364349">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364350">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364351">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364352">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="286176397450364353" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364354">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dsetRoleInParent(java%dlang%dString)%cvoid" resolveInfo="setRoleInParent" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364355">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="286176397450364356">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364065" resolveInfo="helper" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364357">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961476129" resolveInfo="readRole" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="286176397450364358" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="8666712036583229507">
        <property name="name" nameId="tpck.1169194664001" value="roleId" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="8666712036583229509">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8666712036583229510">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8763149886003449803">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8763149886003449805">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8763149886003449804">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="3585302731854930547" resolveInfo="linkMap" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8763149886003449809">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ufjo.5817662974489429628" resolveInfo="addRoleLocation" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8763149886003449811">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8763149886003449810">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364065" resolveInfo="helper" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8763149886003449815">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961475758" resolveInfo="readLinkId" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="8763149886003449816" />
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="8763149886003449818" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364359">
        <property name="name" nameId="tpck.1169194664001" value="id" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="286176397450364360">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364361">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="286176397450364362">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="286176397450364363">
                <property name="name" nameId="tpck.1169194664001" value="id" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="286176397450364364">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="286176397450364365">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodeId%dfromString(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="fromString" />
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="286176397450364366" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="286176397450364367">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364368">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="286176397450364369">
                  <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="286176397450364370">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="286176397450364371">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fmpa.~SAXParseException%d&lt;init&gt;(java%dlang%dString,org%dxml%dsax%dLocator)" resolveInfo="SAXParseException" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="286176397450364372">
                        <property name="value" nameId="tpee.1070475926801" value="bad node ID" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="286176397450364373" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="286176397450364374">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="286176397450364375" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="286176397450364376">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="286176397450364363" resolveInfo="id" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364382">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364383">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="286176397450364384" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364385">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dsetId(jetbrains%dmps%dsmodel%dSNodeId)%cvoid" resolveInfo="setId" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="286176397450364386">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="286176397450364363" resolveInfo="id" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="286176397450364387">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNode" resolveInfo="SNode" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="286176397450364388">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364389">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364390">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="286176397450364391">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="286176397450364392">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSModel,java%dlang%dString)" resolveInfo="SNode" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="286176397450364393">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364063" resolveInfo="model" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="286176397450364394">
                  <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="286176397450364395">
                    <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="286176397450364065" resolveInfo="helper" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="286176397450364396">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961475946" resolveInfo="readType" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="286176397450364397">
                      <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="286176397450364347" resolveInfo="type" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="286176397450364398">
      <property name="name" nameId="tpck.1169194664001" value="property" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="property" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364399">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="8666712036583229513">
        <property name="name" nameId="tpck.1169194664001" value="nameId" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="8666712036583229515">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8666712036583229516">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8763149886003449896">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="8763149886003449902">
                <node role="rValue" roleId="tpee.1068498886297" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="8763149886003449905" />
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="8763149886003449898">
                  <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8763149886003449901">
                    <property name="value" nameId="tpee.1068580320021" value="2" />
                  </node>
                  <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="8763149886003449897" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364400">
        <property name="name" nameId="tpck.1169194664001" value="value" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="286176397450364401">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364402">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364403">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="286176397450364404">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="286176397450364405">
                  <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="286176397450364406">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                  <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="286176397450364407" />
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="286176397450364408" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ArrayType" typeId="tpee.1070534760951" id="286176397450364409">
        <node role="componentType" roleId="tpee.1070534760952" type="tpee.StringType" typeId="tpee.1225271177708" id="286176397450364410" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="286176397450364411">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364412">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364413">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="286176397450364414">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="286176397450364415">
                <node role="componentType" roleId="tpee.1154542793668" type="tpee.StringType" typeId="tpee.1225271177708" id="286176397450364416" />
                <node role="initValue" roleId="tpee.1154542803372" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="286176397450364417">
                  <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="286176397450364399" resolveInfo="name" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="286176397450364418" />
                <node role="initValue" roleId="tpee.1154542803372" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="8763149886003449907" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="286176397450364419">
      <property name="name" nameId="tpck.1169194664001" value="link" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="link" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364420">
        <property name="name" nameId="tpck.1169194664001" value="role" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="8666712036583229520">
        <property name="name" nameId="tpck.1169194664001" value="roleId" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="8666712036583229521">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8666712036583229522">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5132159629682546999">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5132159629682547005">
                <node role="rValue" roleId="tpee.1068498886297" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="5132159629682547008" />
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="5132159629682547001">
                  <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5132159629682547004">
                    <property name="value" nameId="tpee.1068580320021" value="3" />
                  </node>
                  <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="5132159629682547000" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364438">
        <property name="name" nameId="tpck.1169194664001" value="targetNodeId" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="286176397450364429">
        <property name="name" nameId="tpck.1169194664001" value="resolveInfo" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="286176397450364430">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364431">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364432">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="286176397450364433">
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.ArrayAccessExpression" typeId="tpee.1173175405605" id="286176397450364434">
                  <node role="array" roleId="tpee.1173175590490" type="mlj4.XMLSAXHandler_resultObject" typeId="mlj4.4635390255048098081" id="286176397450364436" />
                  <node role="index" roleId="tpee.1173175577737" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5132159629682546996">
                    <property name="value" nameId="tpee.1068580320021" value="2" />
                  </node>
                </node>
                <node role="rValue" roleId="tpee.1068498886297" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="286176397450364437" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ArrayType" typeId="tpee.1070534760951" id="286176397450364447">
        <node role="componentType" roleId="tpee.1070534760952" type="tpee.StringType" typeId="tpee.1225271177708" id="286176397450364448" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="286176397450364449">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="286176397450364450">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="286176397450364451">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="286176397450364452">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="286176397450364453">
                <node role="componentType" roleId="tpee.1154542793668" type="tpee.StringType" typeId="tpee.1225271177708" id="286176397450364454" />
                <node role="initValue" roleId="tpee.1154542803372" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="5132159629682546994">
                  <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="286176397450364420" resolveInfo="role" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="5132159629682546995">
                  <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="286176397450364438" resolveInfo="targetNodeId" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="286176397450364457" />
                <node role="initValue" roleId="tpee.1154542803372" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5132159629682546998" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="5797832288566425370">
    <node role="fields" roleId="mlj4.7707758858785994425" type="mlj4.XMLSAXFieldDeclaration" typeId="mlj4.7707758858785994411" id="8837498651724313958">
      <property name="name" nameId="tpck.1169194664001" value="accumulator" />
      <node role="type" roleId="mlj4.7707758858785994413" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8837498651724313960">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="t77w.8837498651724313880" resolveInfo="LineContentAccumulator" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="5797832288566425387">
      <property name="name" nameId="tpck.1169194664001" value="model" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="model" />
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="3273910061385723451">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="persistence" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="3273910061385729303" resolveInfo="null" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="3273910061385723454">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="language" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="3273910061385729303" resolveInfo="null" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="3273910061385723462">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="language-engaged-on-generation" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="3273910061385729303" resolveInfo="null" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="3273910061385723470">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="devkit" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="3273910061385729303" resolveInfo="null" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="3273910061385723478">
        <property name="tagName" nameId="mlj4.8640335038346803777" value="import" />
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="3273910061385729303" resolveInfo="null" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="5797832288566425440">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="5797832288566425572" resolveInfo="roots" />
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="5797832288566425456">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="5797832288566425595" resolveInfo="rootContent" />
      </node>
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="5797832288566425457">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5797832288566425458">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724313962">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="8837498651724313964">
              <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="8837498651724313967">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="8837498651724313968">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t77w.8837498651724313945" resolveInfo="LineContentAccumulator" />
                </node>
              </node>
              <node role="lValue" roleId="tpee.1068498886295" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8837498651724313963">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="8837498651724313958" resolveInfo="accumulator" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5797832288566425511">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724378177">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8837498651724378176">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="8837498651724313958" resolveInfo="accumulator" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8837498651724378181">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t77w.8837498651724313951" resolveInfo="getLineToContentMap" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tp2q.ListType" typeId="tp2q.1151688443754" id="5797832288566425868">
        <node role="elementType" roleId="tp2q.1151688676805" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="130405662258133758">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="vz3d.~LineContent" resolveInfo="LineContent" />
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="5797832288566425572">
      <property name="name" nameId="tpck.1169194664001" value="roots" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="roots" />
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="5797832288566425573">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="5797832288566425625" resolveInfo="node" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="5797832288566425574">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5797832288566425575">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7606567306781636842">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7606567306781636843">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7606567306781636844">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="8837498651724313958" resolveInfo="accumulator" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7606567306781636845">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t77w.8837498651724313892" resolveInfo="popNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="7606567306781654142" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5797832288566425594">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Object" resolveInfo="Object" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="5797832288566425595">
      <property name="name" nameId="tpck.1169194664001" value="rootContent" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="root" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="7606567306781641488">
        <property name="name" nameId="tpck.1169194664001" value="id" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="7606567306781641490">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7606567306781641491">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7606567306781641492">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7606567306781641493">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7606567306781641494">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="8837498651724313958" resolveInfo="accumulator" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7606567306781641495">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t77w.8837498651724313881" resolveInfo="pushNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7606567306781641496">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodeId%dfromString(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="fromString" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="7606567306781641497" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="7606567306781654153" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="5797832288566425597">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="5797832288566425625" resolveInfo="node" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="5797832288566425598">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5797832288566425599">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7606567306781636833">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7606567306781636834">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="7606567306781636835">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="8837498651724313958" resolveInfo="accumulator" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7606567306781636836">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t77w.8837498651724313892" resolveInfo="popNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="7606567306781654141" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5797832288566425624">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNode" resolveInfo="SNode" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="5797832288566425625">
      <property name="name" nameId="tpck.1169194664001" value="node" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="node" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="false" />
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="5797832288566425626">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="5797832288566425760" resolveInfo="property" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="5797832288566425627">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5797832288566425628">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="5797832288566425629">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="5797832288566425630">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724331908">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724352107">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8837498651724331909">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="8837498651724313958" resolveInfo="accumulator" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8837498651724352111">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t77w.8837498651724313906" resolveInfo="saveProperty" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="8837498651724352112" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="8837498651724352114" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="5797832288566425644">
                <node role="leftExpression" roleId="tpee.1081773367580" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="5797832288566425647" />
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5797832288566425648" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="5797832288566425649">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="5797832288566425781" resolveInfo="link" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="5797832288566425650">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5797832288566425651">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="5797832288566450332">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="5797832288566450333">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724352117">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724352119">
                    <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8837498651724352118">
                      <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="8837498651724313958" resolveInfo="accumulator" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8837498651724352123">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t77w.8837498651724313914" resolveInfo="saveReference" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="8837498651724352124" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="8837498651724352126" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="5797832288566450337">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5797832288566450340" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="mlj4.XMLSAXChildHandler_childObject" typeId="mlj4.8640335038346803753" id="5797832288566450336" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="children" roleId="mlj4.8640335038346828085" type="mlj4.XMLSAXChildRule" typeId="mlj4.8640335038346803749" id="5797832288566425694">
        <link role="rule" roleId="mlj4.8640335038346803761" targetNodeId="5797832288566425625" resolveInfo="node" />
        <node role="handler" roleId="mlj4.8640335038346803781" type="mlj4.XMLSAXChildHandler" typeId="mlj4.8640335038346803750" id="5797832288566425695">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5797832288566425696">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724352127">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724352129">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8837498651724352128">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="8837498651724313958" resolveInfo="accumulator" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8837498651724352133">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t77w.8837498651724313892" resolveInfo="popNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="7606567306781654140" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="5797832288566425721">
        <property name="name" nameId="tpck.1169194664001" value="id" />
        <node role="handler" roleId="mlj4.4635390255048070858" type="mlj4.XMLSAXAttributeHandler" typeId="mlj4.4635390255048069776" id="5797832288566425722">
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5797832288566425723">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724331897">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724331899">
                <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8837498651724331898">
                  <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="8837498651724313958" resolveInfo="accumulator" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8837498651724331903">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t77w.8837498651724313881" resolveInfo="pushNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="8837498651724331904">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodeId%dfromString(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="fromString" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXAttributeHandler_value" typeId="mlj4.4635390255048078244" id="8837498651724331905" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="7606567306781654151" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5797832288566425749">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNode" resolveInfo="SNode" />
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="5797832288566425760">
      <property name="name" nameId="tpck.1169194664001" value="property" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="property" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="5797832288566425761">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.StringType" typeId="tpee.1225271177708" id="5797832288566425772" />
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="5797832288566425773">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5797832288566425774">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5797832288566428223">
            <node role="expression" roleId="tpee.1068580123156" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="5797832288566428224">
              <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="5797832288566425761" resolveInfo="name" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="5797832288566425781">
      <property name="name" nameId="tpck.1169194664001" value="link" />
      <property name="tagName" nameId="mlj4.4635390255047870170" value="link" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
      <node role="attrs" roleId="mlj4.4635390255047981704" type="mlj4.XMLSAXAttributeRule" typeId="mlj4.4635390255047981693" id="5797832288566425782">
        <property name="name" nameId="tpck.1169194664001" value="role" />
        <property name="isRequired" nameId="mlj4.2268737274629028866" value="true" />
      </node>
      <node role="type" roleId="mlj4.4635390255047981675" type="tpee.StringType" typeId="tpee.1225271177708" id="5797832288566428227" />
      <node role="creator" roleId="mlj4.2268737274628969583" type="mlj4.XMLSAXNodeCreator" typeId="mlj4.2268737274628897541" id="5797832288566425811">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5797832288566425812">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5797832288566428229">
            <node role="expression" roleId="tpee.1068581517676" type="mlj4.XMLSAXAttributeReference" typeId="mlj4.2286463592495220221" id="5797832288566428245">
              <link role="attribute" roleId="mlj4.2286463592495220222" targetNodeId="5797832288566425782" resolveInfo="role" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="nodes" roleId="mlj4.4635390255047870146" type="mlj4.XMLSAXNodeRule" typeId="mlj4.4635390255047863051" id="3273910061385729303">
      <property name="name" nameId="tpck.1169194664001" value="null" />
      <property name="isCompact" nameId="mlj4.2286463592495362657" value="true" />
    </node>
    <node role="globalText" roleId="mlj4.4120841425052674327" type="mlj4.XMLSAXTextRule" typeId="mlj4.4635390255048097272" id="5797832288566425820">
      <node role="handler" roleId="mlj4.4635390255048098137" type="mlj4.XMLSAXTextHandler" typeId="mlj4.4635390255048097273" id="5797832288566425821">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5797832288566425822">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8837498651724352144">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8837498651724352146">
              <node role="operand" roleId="tpee.1197027771414" type="mlj4.XMLSAXFieldReference" typeId="mlj4.7707758858785994426" id="8837498651724352145">
                <link role="declaration" roleId="mlj4.7707758858785994427" targetNodeId="8837498651724313958" resolveInfo="accumulator" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8837498651724352150">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t77w.8837498651724313922" resolveInfo="processText" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXTextHandler_value" typeId="mlj4.4635390255048098132" id="8837498651724352151" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="mlj4.XMLSAXLocatorExpression" typeId="mlj4.7459083455229529757" id="8837498651724352153" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="4362914091961459500">
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="4362914091961470132">
      <property name="name" nameId="tpck.1169194664001" value="encode" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961470136" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961470134" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961470135">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961470141">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961470160">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961470152">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961470144">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961470143">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470137" resolveInfo="s" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961470148">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dreplace(java%dlang%dCharSequence,java%dlang%dCharSequence)%cjava%dlang%dString" resolveInfo="replace" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470149">
                    <property name="value" nameId="tpee.1070475926801" value="%" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470151">
                    <property name="value" nameId="tpee.1070475926801" value="%p" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961470156">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dreplace(java%dlang%dCharSequence,java%dlang%dCharSequence)%cjava%dlang%dString" resolveInfo="replace" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470157">
                  <property name="value" nameId="tpee.1070475926801" value=":" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470159">
                  <property name="value" nameId="tpee.1070475926801" value="%c" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961470164">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dreplace(java%dlang%dCharSequence,java%dlang%dCharSequence)%cjava%dlang%dString" resolveInfo="replace" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470165">
                <property name="value" nameId="tpee.1070475926801" value="." />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470167">
                <property name="value" nameId="tpee.1070475926801" value="%d" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961470137">
        <property name="name" nameId="tpck.1169194664001" value="s" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961470138" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="4362914091961470168">
      <property name="name" nameId="tpck.1169194664001" value="decode" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961470172" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961470170" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961470171">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961470175">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961470194">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961470186">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961470178">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961470177">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470173" resolveInfo="s" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961470182">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dreplace(java%dlang%dCharSequence,java%dlang%dCharSequence)%cjava%dlang%dString" resolveInfo="replace" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470183">
                    <property name="value" nameId="tpee.1070475926801" value="%d" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470185">
                    <property name="value" nameId="tpee.1070475926801" value="." />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961470190">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dreplace(java%dlang%dCharSequence,java%dlang%dCharSequence)%cjava%dlang%dString" resolveInfo="replace" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470191">
                  <property name="value" nameId="tpee.1070475926801" value="%c" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470193">
                  <property name="value" nameId="tpee.1070475926801" value=":" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961470198">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dreplace(java%dlang%dCharSequence,java%dlang%dCharSequence)%cjava%dlang%dString" resolveInfo="replace" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470199">
                <property name="value" nameId="tpee.1070475926801" value="%p" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470201">
                <property name="value" nameId="tpee.1070475926801" value="%" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961470173">
        <property name="name" nameId="tpck.1169194664001" value="s" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961470174" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961469988">
      <property name="name" nameId="tpck.1169194664001" value="addModelReference" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4362914091961469989" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961469990" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961469991">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6145405523187768680">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6145405523187768681">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6145405523187768699" />
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6145405523187768692">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6145405523187768684">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464820" resolveInfo="myModelIndex" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.ContainsKeyOperation" typeId="tp2q.1201306600024" id="6145405523187768696">
              <node role="key" roleId="tp2q.1201654602639" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6145405523187768698">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961469992" resolveInfo="model" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4362914091961469997">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4362914091961469998">
            <property name="name" nameId="tpck.1169194664001" value="hash" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4362914091961469999" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.RemExpression" typeId="tpee.1153422105332" id="4362914091961470017">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="4362914091961470020">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464847" resolveInfo="HASH_SIZE" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="4362914091961470001">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961470013">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="4362914091961470016">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464847" resolveInfo="HASH_SIZE" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.RemExpression" typeId="tpee.1153422105332" id="4362914091961470009">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961470004">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961470003">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961469992" resolveInfo="model" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961470008">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelReference%dhashCode()%cint" resolveInfo="hashCode" />
                      </node>
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="4362914091961470012">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464847" resolveInfo="HASH_SIZE" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.WhileStatement" typeId="tpee.1076505808687" id="4362914091961470022">
          <node role="condition" roleId="tpee.1076505808688" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961470026">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961470025">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464829" resolveInfo="myUsedIndexes" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.ContainsOperation" typeId="tp2q.1172254888721" id="4362914091961470030">
              <node role="argument" roleId="tp2q.1172256416782" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961470032">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961469998" resolveInfo="hash" />
              </node>
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961470024">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4362914091961470033">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4362914091961470035">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.RemExpression" typeId="tpee.1153422105332" id="4362914091961470045">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="4362914091961470048">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464847" resolveInfo="HASH_SIZE" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="4362914091961470038">
                    <node role="expression" roleId="tpee.1079359253376" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961470041">
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4362914091961470044">
                        <property name="value" nameId="tpee.1068580320021" value="1" />
                      </node>
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961470040">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961469998" resolveInfo="hash" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961470034">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961469998" resolveInfo="hash" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4362914091961470050">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961470052">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961470051">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464829" resolveInfo="myUsedIndexes" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddSetElementOperation" typeId="tp2q.1226566855640" id="4362914091961470056">
              <node role="argument" roleId="tp2q.1226567214363" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961470058">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961469998" resolveInfo="hash" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4362914091961470060">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4362914091961470066">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4362914091961470072">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Integer" resolveInfo="Integer" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Integer%dtoString(int,int)%cjava%dlang%dString" resolveInfo="toString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961470073">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961469998" resolveInfo="hash" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="4362914091961470075">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464837" resolveInfo="HASH_BASE" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="4362914091961470062">
              <node role="key" roleId="tp2q.1197932525128" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961470069">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961469992" resolveInfo="model" />
              </node>
              <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961470061">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464820" resolveInfo="myModelIndex" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5437197702624226129">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5437197702624226147">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5437197702624226150">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961469992" resolveInfo="model" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="5437197702624226131">
              <node role="key" roleId="tp2q.1197932525128" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5437197702624226135">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5437197702624226134">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961469992" resolveInfo="model" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5437197702624226146">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelReference%dgetLongName()%cjava%dlang%dString" resolveInfo="getLongName" />
                </node>
              </node>
              <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5437197702624226130">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5437197702624226114" resolveInfo="myModelFqNameToReference" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961469992">
        <property name="name" nameId="tpck.1169194664001" value="model" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961469993">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
        </node>
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961470213">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961470118">
      <property name="name" nameId="tpck.1169194664001" value="getImportIndex" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961470122" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961470120" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961470121">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961470125">
          <node role="expression" roleId="tpee.1068581517676" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="4362914091961470128">
            <node role="key" roleId="tp2q.1197932525128" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961470131">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470123" resolveInfo="model" />
            </node>
            <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961470127">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464820" resolveInfo="myModelIndex" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961470123">
        <property name="name" nameId="tpck.1169194664001" value="model" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961470124">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
        </node>
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961470214">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961470202">
      <property name="name" nameId="tpck.1169194664001" value="genReferenceString" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961470206" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4362914091961474760" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961470205">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="7677978454736941185">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="7677978454736941186">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7677978454736941206">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="7677978454736941207">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961470132" resolveInfo="encode" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7677978454736941208">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470209" resolveInfo="text" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7677978454736941196">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7677978454736941197">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470207" resolveInfo="ref" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7677978454736941198">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelReference%dequals(java%dlang%dObject)%cboolean" resolveInfo="equals" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="7677978454736941199">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464808" resolveInfo="myModelRef" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4362914091961470218">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4362914091961470219">
            <property name="name" nameId="tpck.1169194664001" value="index" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961470220" />
            <node role="initializer" roleId="tpee.1068431790190" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="4362914091961470223">
              <node role="key" roleId="tp2q.1197932525128" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961470226">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470207" resolveInfo="ref" />
              </node>
              <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961470222">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464820" resolveInfo="myModelIndex" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4362914091961470228">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961470229">
            <node role="statement" roleId="tpee.1068581517665" type="tpib.LogStatement" typeId="tpib.1167227138527" id="4362914091961470251">
              <property name="severity" nameId="tpib.1167245565795" value="error" />
              <node role="logExpression" roleId="tpib.1167227463056" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961470257">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470260">
                  <property name="value" nameId="tpee.1070475926801" value=" not found in index" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961470253">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961470252">
                    <property name="value" nameId="tpee.1070475926801" value="model " />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961470256">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470207" resolveInfo="ref" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961470262">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="4362914091961470264">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961470132" resolveInfo="encode" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961470265">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470209" resolveInfo="text" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="4362914091961470247">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4362914091961470250" />
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961470242">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470219" resolveInfo="index" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7677978454736941210">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7677978454736941234">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7677978454736941227">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7677978454736941221">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7677978454736941215">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7677978454736941212">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="7677978454736941214">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%d&lt;init&gt;()" resolveInfo="StringBuilder" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7677978454736941219">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%dappend(java%dlang%dString)%cjava%dlang%dStringBuilder" resolveInfo="append" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7677978454736941220">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470219" resolveInfo="index" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7677978454736941225">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%dappend(char)%cjava%dlang%dStringBuilder" resolveInfo="append" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="7677978454736941226">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464872" resolveInfo="MODEL_SEPARATOR_CHAR" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7677978454736941231">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%dappend(java%dlang%dString)%cjava%dlang%dStringBuilder" resolveInfo="append" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="7677978454736941232">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961470132" resolveInfo="encode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7677978454736941233">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470209" resolveInfo="text" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7677978454736941238">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%dtoString()%cjava%dlang%dString" resolveInfo="toString" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961470207">
        <property name="name" nameId="tpck.1169194664001" value="ref" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961470208">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
        </node>
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961470215">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961470209">
        <property name="name" nameId="tpck.1169194664001" value="text" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961470211" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961470216">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961470217">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961470320">
      <property name="name" nameId="tpck.1169194664001" value="genConceptReferenceString" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961470324" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4362914091961474758" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961470323">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="4362914091961470331">
          <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="4362914091961470332">
            <property name="text" nameId="tpee.6329021646629104958" value="return fqName prefixed with &quot;.&quot; if we can't find model or name of concept" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4362914091961471573">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4362914091961471574">
            <property name="name" nameId="tpck.1169194664001" value="name" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961471575" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961471578">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961471577">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470326" resolveInfo="concept" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="4362914091961471582">
                <link role="property" roleId="tp25.1138056395725" targetNodeId="tpck.1169194664001" resolveInfo="name" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4362914091961470334">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961470335">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961470344">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961470347">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961470350">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470328" resolveInfo="fqName" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="5427614427235890079">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464872" resolveInfo="MODEL_SEPARATOR_CHAR" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="4362914091961470443">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961471584">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961471574" resolveInfo="name" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4362914091961470446" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4362914091961472233">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4362914091961472234">
            <property name="name" nameId="tpck.1169194664001" value="index" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961472235" />
            <node role="initializer" roleId="tpee.1068431790190" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="4362914091961472236">
              <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961472237">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464820" resolveInfo="myModelIndex" />
              </node>
              <node role="key" roleId="tp2q.1197932525128" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961472238">
                <node role="operand" roleId="tpee.1197027771414" type="tp25.SemanticDowncastExpression" typeId="tp25.1145404486709" id="4362914091961472239">
                  <node role="leftExpression" roleId="tp25.1145404616321" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961472240">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961472241">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470326" resolveInfo="concept" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetModelOperation" typeId="tp25.1143234257716" id="4362914091961472242" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961472243">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dgetSModelReference()%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="getSModelReference" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4362914091961472244">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961472245">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961472246">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961472247">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961472248">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961470328" resolveInfo="fqName" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="5427614427235890080">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464872" resolveInfo="MODEL_SEPARATOR_CHAR" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="4362914091961472251">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4362914091961472252" />
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961472253">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961472234" resolveInfo="index" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961470376">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961470404">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961470398">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961470392">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961470381">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4362914091961470378">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="4362914091961470380">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%d&lt;init&gt;()" resolveInfo="StringBuilder" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961470385">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%dappend(java%dlang%dString)%cjava%dlang%dStringBuilder" resolveInfo="append" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961470421">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961472234" resolveInfo="index" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961470396">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%dappend(char)%cjava%dlang%dStringBuilder" resolveInfo="append" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="5427614427235890081">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464872" resolveInfo="MODEL_SEPARATOR_CHAR" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961470402">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%dappend(java%dlang%dString)%cjava%dlang%dStringBuilder" resolveInfo="append" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961471594">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961471574" resolveInfo="name" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961470408">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuilder%dtoString()%cjava%dlang%dString" resolveInfo="toString" />
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961470325">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961470326">
        <property name="name" nameId="tpck.1169194664001" value="concept" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SConceptType" typeId="tp25.1172420572800" id="4362914091961470430" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961472225">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~Nullable" resolveInfo="Nullable" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961470328">
        <property name="name" nameId="tpck.1169194664001" value="fqName" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961470330" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961472258">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961474224">
      <property name="name" nameId="tpck.1169194664001" value="genReferenceId" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961474229" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961474226" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961474227">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961474237">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4362914091961474239">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961470202" resolveInfo="genReferenceString" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961474240">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474230" resolveInfo="ref" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961474243">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961474242">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474233" resolveInfo="nodeId" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961474247">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Object%dtoString()%cjava%dlang%dString" resolveInfo="toString" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961474228">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961474230">
        <property name="name" nameId="tpck.1169194664001" value="ref" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961474231">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
        </node>
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961474232">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961474233">
        <property name="name" nameId="tpck.1169194664001" value="nodeId" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961474235">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
        </node>
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961474236">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961472259">
      <property name="name" nameId="tpck.1169194664001" value="genReferenceId" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961472263" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961472261" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961472262">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961472268">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4362914091961472270">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961474224" resolveInfo="genReferenceId" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961472283">
              <node role="operand" roleId="tpee.1197027771414" type="tp25.SemanticDowncastExpression" typeId="tp25.1145404486709" id="4362914091961472281">
                <node role="leftExpression" roleId="tp25.1145404616321" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961472272">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961472271">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961472265" resolveInfo="node" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetModelOperation" typeId="tp25.1143234257716" id="4362914091961472276" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961472287">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dgetSModelReference()%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="getSModelReference" />
              </node>
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961472296">
              <node role="operand" roleId="tpee.1197027771414" type="tp25.SemanticDowncastExpression" typeId="tp25.1145404486709" id="4362914091961472294">
                <node role="leftExpression" roleId="tp25.1145404616321" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961472289">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961472265" resolveInfo="node" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961474219">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dgetSNodeId()%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="getSNodeId" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961472265">
        <property name="name" nameId="tpck.1169194664001" value="node" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="4362914091961472266" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="1603552250726493376">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="1603552250726493378">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961474281">
      <property name="name" nameId="tpck.1169194664001" value="genType" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961474285" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961474283" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961474284">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="5427614427235890090">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="5427614427235890091">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="3436588812410759314">
              <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="3436588812410759315">
                <property name="text" nameId="tpee.6329021646629104958" value="return fqName prefixed with &quot;.&quot; if we can't find model or name of concept" />
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3436588812410792021">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3436588812410792022">
                <property name="name" nameId="tpck.1169194664001" value="fqName" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="3436588812410792028" />
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3436588812410792024">
                  <node role="operand" roleId="tpee.1197027771414" type="tp25.SemanticDowncastExpression" typeId="tp25.1145404486709" id="3436588812410792025">
                    <node role="leftExpression" roleId="tp25.1145404616321" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3436588812410792026">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474286" resolveInfo="node" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3436588812410792027">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dgetConceptFqName()%cjava%dlang%dString" resolveInfo="getConceptFqName" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3436588812410759332">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3436588812410759333">
                <property name="name" nameId="tpck.1169194664001" value="index" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="3436588812410759334" />
                <node role="initializer" roleId="tpee.1068431790190" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="3436588812410792045">
                  <node role="key" roleId="tp2q.1197932525128" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="3436588812410792070">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5437197702624233346" resolveInfo="getModelReferenceForConcept" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3436588812410792071">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474286" resolveInfo="node" />
                    </node>
                  </node>
                  <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="3436588812410759336">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464820" resolveInfo="myModelIndex" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="3436588812410759343">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="3436588812410759344">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="3436588812410759345">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="3436588812410759346">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3436588812410792030">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3436588812410792022" resolveInfo="fqName" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="3436588812410759352">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464872" resolveInfo="MODEL_SEPARATOR_CHAR" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="3436588812410759349">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="3436588812410759350" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3436588812410759351">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3436588812410759333" resolveInfo="index" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="3436588812410792073">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="3436588812410812749">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3436588812410812758">
                  <node role="operand" roleId="tpee.1197027771414" type="tp25.SemanticDowncastExpression" typeId="tp25.1145404486709" id="3436588812410812759">
                    <node role="leftExpression" roleId="tp25.1145404616321" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3436588812410812760">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474286" resolveInfo="node" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3436588812410812761">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dgetConceptShortName()%cjava%dlang%dString" resolveInfo="getConceptShortName" />
                  </node>
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="3436588812410792078">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3436588812410792077">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3436588812410759333" resolveInfo="index" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="3436588812410812748">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464872" resolveInfo="MODEL_SEPARATOR_CHAR" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5427614427235890104">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="p4ns.~RoleIdsComponent" resolveInfo="RoleIdsComponent" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="p4ns.~RoleIdsComponent%disEnabled()%cboolean" resolveInfo="isEnabled" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961474289">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4362914091961474291">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961470320" resolveInfo="genConceptReferenceString" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961474293">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961474292">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474286" resolveInfo="node" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetConceptOperation" typeId="tp25.1172323065820" id="4362914091961474297" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961474311">
              <node role="operand" roleId="tpee.1197027771414" type="tp25.SemanticDowncastExpression" typeId="tp25.1145404486709" id="4362914091961474308">
                <node role="leftExpression" roleId="tp25.1145404616321" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961474301">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474286" resolveInfo="node" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961474316">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dgetConceptFqName()%cjava%dlang%dString" resolveInfo="getConceptFqName" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961474286">
        <property name="name" nameId="tpck.1169194664001" value="node" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="4362914091961474287" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961474288">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961474746">
      <property name="name" nameId="tpck.1169194664001" value="genTypeId" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961474751" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961474748" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961474749">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2472791738395988991">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2472791738395988992">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6031791847596807212">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6031791847596807213">
                <property name="name" nameId="tpck.1169194664001" value="conceptId" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6031791847596807214">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5332772916083672144">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5332772916083672142">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="p4ns.~RoleIdsComponent%dgetConceptPointer(jetbrains%dmps%dsmodel%dSNode)%cjetbrains%dmps%dsmodel%dSNodePointer" resolveInfo="getConceptPointer" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="p4ns.~RoleIdsComponent" resolveInfo="RoleIdsComponent" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5332772916083672143">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474753" resolveInfo="node" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5332772916083672148">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodePointer%dgetNodeId()%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="getNodeId" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6031791847596807227">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6031791847596807229">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961474224" resolveInfo="genReferenceId" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6031791847596807230">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5437197702624233346" resolveInfo="getModelReferenceForConcept" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6031791847596807231">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474753" resolveInfo="node" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6031791847596807237">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6031791847596807213" resolveInfo="conceptId" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2472791738395988996">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="p4ns.~RoleIdsComponent%disEnabled()%cboolean" resolveInfo="isEnabled" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="p4ns.~RoleIdsComponent" resolveInfo="RoleIdsComponent" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4362914091961474762">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4362914091961474763">
            <property name="name" nameId="tpck.1169194664001" value="concept" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SConceptType" typeId="tp25.1172420572800" id="4362914091961474764" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961474769">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961474768">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474753" resolveInfo="node" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetConceptOperation" typeId="tp25.1172323065820" id="4362914091961474774" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961474779">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="4362914091961474796">
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4362914091961474801" />
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4362914091961474803">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961472259" resolveInfo="genReferenceId" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961474805">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474763" resolveInfo="concept" />
              </node>
            </node>
            <node role="condition" roleId="tpee.1163668914799" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961474786">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961474783">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474763" resolveInfo="concept" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNullOperation" typeId="tp25.1171999116870" id="4362914091961474793" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961474753">
        <property name="name" nameId="tpck.1169194664001" value="node" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="4362914091961474754" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961474756">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961474809">
      <property name="name" nameId="tpck.1169194664001" value="genRole" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961474815" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961474811" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961474812">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961474824">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961474838">
            <node role="operand" roleId="tpee.1197027771414" type="tp25.SemanticDowncastExpression" typeId="tp25.1145404486709" id="4362914091961474835">
              <node role="leftExpression" roleId="tp25.1145404616321" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961474828">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474818" resolveInfo="node" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961474843">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dgetRole_()%cjava%dlang%dString" resolveInfo="getRole_" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961474818">
        <property name="name" nameId="tpck.1169194664001" value="node" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="4362914091961474819" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961474822">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961474845">
      <property name="name" nameId="tpck.1169194664001" value="genRole" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961474851" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961474847" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961474848">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961474870">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961474871">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961474872">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474854" resolveInfo="ref" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Reference_GetRoleOperation" typeId="tp25.5692182839349412519" id="4362914091961474873" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961474854">
        <property name="name" nameId="tpck.1169194664001" value="ref" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SReferenceType" typeId="tp25.8758390115029295477" id="4362914091961474855" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961474859">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961474876">
      <property name="name" nameId="tpck.1169194664001" value="genRoleId" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961474882" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961474878" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961474879">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="5437197702624234048">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="5437197702624234049">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5437197702624234062">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5437197702624234064" />
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="5437197702624234058">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5437197702624234061" />
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5437197702624234053">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5437197702624234052">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474885" resolveInfo="node" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="4653378063118824935" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2472791738395988984">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2472791738395988985">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4653378063118824917">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4653378063118824918">
                <property name="name" nameId="tpck.1169194664001" value="roleId" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4653378063118824919">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5332772916083672167">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5332772916083672165">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="p4ns.~RoleIdsComponent%dgetNodeRolePointer(jetbrains%dmps%dsmodel%dSNode)%cjetbrains%dmps%dsmodel%dSNodePointer" resolveInfo="getNodeRolePointer" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="p4ns.~RoleIdsComponent" resolveInfo="RoleIdsComponent" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5332772916083672166">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474885" resolveInfo="node" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5332772916083672171">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodePointer%dgetNodeId()%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="getNodeId" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4653378063118824995">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4653378063118824997">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961474224" resolveInfo="genReferenceId" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4653378063118824998">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5437197702624233346" resolveInfo="getModelReferenceForConcept" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4653378063118824999">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4653378063118825000">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474885" resolveInfo="node" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="4653378063118825001" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4653378063118825003">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4653378063118824918" resolveInfo="roleId" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2472791738395988989">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="p4ns.~RoleIdsComponent%disEnabled()%cboolean" resolveInfo="isEnabled" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="p4ns.~RoleIdsComponent" resolveInfo="RoleIdsComponent" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3312703791210489040">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3312703791210489041">
            <property name="name" nameId="tpck.1169194664001" value="linkDecl" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1603552250726493347" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5437197702624226099">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="3312703791210489045">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961474885" resolveInfo="node" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetContainingLinkOperation" typeId="tp25.5820409030208923287" id="5437197702624226103" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961474891">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="3312703791210496311">
            <node role="condition" roleId="tpee.1163668914799" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1603552250726493349">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3312703791210496303">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3312703791210489041" resolveInfo="linkDecl" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNullOperation" typeId="tp25.1171999116870" id="1603552250726493354" />
            </node>
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1603552250726493363" />
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="1603552250726493358">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961472259" resolveInfo="genReferenceId" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1603552250726493359">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3312703791210489041" resolveInfo="linkDecl" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961474885">
        <property name="name" nameId="tpck.1169194664001" value="node" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="4362914091961474886" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961474889">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961475176">
      <property name="name" nameId="tpck.1169194664001" value="genRoleId" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475182" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961475178" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475179">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2472791738395988973">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2472791738395988974">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4653378063118825011">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4653378063118825012">
                <property name="name" nameId="tpck.1169194664001" value="roleId" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4653378063118825013">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5332772916083672192">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5332772916083672181">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="p4ns.~RoleIdsComponent%dgetReferenceRolePointer(jetbrains%dmps%dsmodel%dSReference)%cjetbrains%dmps%dsmodel%dSNodePointer" resolveInfo="getReferenceRolePointer" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="p4ns.~RoleIdsComponent" resolveInfo="RoleIdsComponent" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5332772916083672182">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475185" resolveInfo="ref" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5332772916083672196">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodePointer%dgetNodeId()%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="getNodeId" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4653378063118825036">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4653378063118825038">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961474224" resolveInfo="genReferenceId" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4653378063118825039">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5437197702624233346" resolveInfo="getModelReferenceForConcept" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4653378063118825049">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4653378063118825040">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475185" resolveInfo="ref" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4653378063118825053">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SReference%dgetSourceNode()%cjetbrains%dmps%dsmodel%dSNode" resolveInfo="getSourceNode" />
                    </node>
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4653378063118825055">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4653378063118825012" resolveInfo="roleId" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2472791738395988978">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="p4ns.~RoleIdsComponent%disEnabled()%cboolean" resolveInfo="isEnabled" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="p4ns.~RoleIdsComponent" resolveInfo="RoleIdsComponent" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1603552250726493285">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1603552250726493286">
            <property name="name" nameId="tpck.1169194664001" value="linkDecl" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1603552250726493289" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1603552250726493294">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1603552250726493295">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475185" resolveInfo="ref" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Reference_GetLinkDeclarationOperation" typeId="tp25.1547759872598425067" id="5437197702624226113" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1603552250726493323">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="1603552250726493336">
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1603552250726493341" />
            <node role="condition" roleId="tpee.1163668914799" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1603552250726493329">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1603552250726493327">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1603552250726493286" resolveInfo="linkDecl" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNullOperation" typeId="tp25.1171999116870" id="1603552250726493334" />
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="1603552250726493343">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961472259" resolveInfo="genReferenceId" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1603552250726493344">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1603552250726493286" resolveInfo="linkDecl" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475185">
        <property name="name" nameId="tpck.1169194664001" value="ref" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SReferenceType" typeId="tp25.8758390115029295477" id="4362914091961475186" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961475189">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961475223">
      <property name="name" nameId="tpck.1169194664001" value="genName" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475229" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961475225" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475226">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961475246">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475250">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475236" resolveInfo="prop" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475232">
        <property name="name" nameId="tpck.1169194664001" value="node" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="4362914091961475233" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961475242">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475236">
        <property name="name" nameId="tpck.1169194664001" value="prop" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475240" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961475244">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961475252">
      <property name="name" nameId="tpck.1169194664001" value="genNameId" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475258" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961475254" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475255">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2472791738395988998">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2472791738395988999">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4653378063118825063">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4653378063118825064">
                <property name="name" nameId="tpck.1169194664001" value="propertyId" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4653378063118825065">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5332772916083672200">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5332772916083672197">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="p4ns.~RoleIdsComponent%dgetPropertyNamePointer(jetbrains%dmps%dsmodel%dSNode,java%dlang%dString)%cjetbrains%dmps%dsmodel%dSNodePointer" resolveInfo="getPropertyNamePointer" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="p4ns.~RoleIdsComponent" resolveInfo="RoleIdsComponent" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5332772916083672198">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475261" resolveInfo="node" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5332772916083672199">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475267" resolveInfo="prop" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5332772916083672204">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodePointer%dgetNodeId()%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="getNodeId" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4653378063118825079">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4653378063118825081">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961474224" resolveInfo="genReferenceId" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4653378063118884809">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5437197702624233346" resolveInfo="getModelReferenceForConcept" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4653378063118884810">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475261" resolveInfo="node" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4653378063118884807">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4653378063118825064" resolveInfo="propertyId" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2472791738395989003">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="p4ns.~RoleIdsComponent%disEnabled()%cboolean" resolveInfo="isEnabled" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="p4ns.~RoleIdsComponent" resolveInfo="RoleIdsComponent" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5559459764377705970">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5559459764377705971">
            <property name="name" nameId="tpck.1169194664001" value="propDecl" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1603552250726493365" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5559459764377705980">
              <node role="operand" roleId="tpee.1197027771414" type="tp25.SemanticDowncastExpression" typeId="tp25.1145404486709" id="5559459764377705981">
                <node role="leftExpression" roleId="tp25.1145404616321" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5559459764377705982">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475261" resolveInfo="node" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5559459764377705983">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dgetPropertyDeclaration(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSNode" resolveInfo="getPropertyDeclaration" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5559459764377705984">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475267" resolveInfo="prop" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5559459764377705992">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="5559459764377706003">
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5559459764377706008" />
            <node role="condition" roleId="tpee.1163668914799" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1603552250726493367">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5559459764377705995">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5559459764377705971" resolveInfo="propDecl" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNullOperation" typeId="tp25.1171999116870" id="1603552250726493372" />
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="5559459764377706010">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961472259" resolveInfo="genReferenceId" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="5559459764377706011">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5559459764377705971" resolveInfo="propDecl" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475261">
        <property name="name" nameId="tpck.1169194664001" value="node" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="4362914091961475262" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961475265">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475267">
        <property name="name" nameId="tpck.1169194664001" value="prop" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475271" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961475273">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961475312">
      <property name="name" nameId="tpck.1169194664001" value="genTarget" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475318" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961475314" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475315">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4362914091961475379">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4362914091961475380">
            <property name="name" nameId="tpck.1169194664001" value="target" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475381" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="4362914091961475397">
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4362914091961475503">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dvalueOf(java%dlang%dObject)%cjava%dlang%dString" resolveInfo="valueOf" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~String" resolveInfo="String" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961475505">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475506">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475321" resolveInfo="ref" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961475507">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SReference%dgetTargetNodeId()%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="getTargetNodeId" />
                  </node>
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="2742566862758577576">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2742566862758553171" resolveInfo="DYNAMIC_REFERENCE_ID" />
              </node>
              <node role="condition" roleId="tpee.1163668914799" type="tpee.InstanceOfExpression" typeId="tpee.1081256982272" id="4362914091961475387">
                <node role="classType" roleId="tpee.1081256993305" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961475391">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~StaticReference" resolveInfo="StaticReference" />
                </node>
                <node role="leftExpression" roleId="tpee.1081256993304" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475385">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475321" resolveInfo="ref" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4362914091961475437">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4362914091961475438">
            <property name="name" nameId="tpck.1169194664001" value="targetModel" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961475439">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961475445">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475443">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475321" resolveInfo="ref" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961475450">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SReference%dgetTargetSModelReference()%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="getTargetSModelReference" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961475454">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="4362914091961475466">
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961475471">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475380" resolveInfo="target" />
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4362914091961475473">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961470202" resolveInfo="genReferenceString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961475475">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475438" resolveInfo="targetModel" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961475479">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475380" resolveInfo="target" />
              </node>
            </node>
            <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="4362914091961475460">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4362914091961475464" />
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961475458">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475438" resolveInfo="targetModel" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475321">
        <property name="name" nameId="tpck.1169194664001" value="ref" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961475325">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961475492">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SReference" resolveInfo="SReference" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7737674227882221698">
      <property name="name" nameId="tpck.1169194664001" value="genResolveInfo" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="7737674227882221703" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7737674227882221700">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7737674227882221746">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7737674227882221747">
            <property name="name" nameId="tpck.1169194664001" value="target" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="7737674227882221748" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="5309057879020557827">
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4903981222749811825">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5309057879020557837">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7737674227882221704" resolveInfo="ref" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4903981222749811829">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SReference%dgetTargetNode()%cjetbrains%dmps%dsmodel%dSNode" resolveInfo="getTargetNode" />
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="5309057879020557839" />
              <node role="condition" roleId="tpee.1163668914799" type="tpee.InstanceOfExpression" typeId="tpee.1081256982272" id="5309057879020557833">
                <node role="classType" roleId="tpee.1081256993305" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5309057879020557834">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~StaticReference" resolveInfo="StaticReference" />
                </node>
                <node role="leftExpression" roleId="tpee.1081256993304" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5309057879020557835">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7737674227882221704" resolveInfo="ref" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="7737674227882221757">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="7737674227882221758">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7737674227882221767">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7737674227882221768">
                <property name="name" nameId="tpck.1169194664001" value="resolveInfo" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="7737674227882221769" />
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7737674227882221785">
                  <node role="operand" roleId="tpee.1197027771414" type="tp25.SemanticDowncastExpression" typeId="tp25.1145404486709" id="7737674227882221783">
                    <node role="leftExpression" roleId="tp25.1145404616321" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7737674227882221771">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7737674227882221747" resolveInfo="target" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7737674227882221789">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dgetResolveInfo()%cjava%dlang%dString" resolveInfo="getResolveInfo" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="7737674227882221791">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="7737674227882221792">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7737674227882221800">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7737674227882221802">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7737674227882221768" resolveInfo="resolveInfo" />
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="7737674227882221796">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="7737674227882221799" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7737674227882221795">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7737674227882221768" resolveInfo="resolveInfo" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7737674227882221762">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7737674227882221761">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7737674227882221747" resolveInfo="target" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="7737674227882221766" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7737674227882221804">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7737674227882221807">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7737674227882221806">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7737674227882221704" resolveInfo="ref" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4903981222749811830">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SReference%dgetResolveInfo()%cjava%dlang%dString" resolveInfo="getResolveInfo" />
            </node>
          </node>
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7737674227882221702" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7737674227882221704">
        <property name="name" nameId="tpck.1169194664001" value="ref" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="7737674227882221706">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5309057879020557822">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SReference" resolveInfo="SReference" />
        </node>
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="4362914091961464872">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="MODEL_SEPARATOR_CHAR" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961475793" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.CharType" typeId="tpee.1070534555686" id="4362914091961464875" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.CharConstant" typeId="tpee.1200397529627" id="4362914091961521746">
        <property name="charConstant" nameId="tpee.1200397540847" value="." />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="4362914091961464868">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="VERSION_SEPARATOR_CHAR" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961475795" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.CharType" typeId="tpee.1070534555686" id="4362914091961464871" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.CharConstant" typeId="tpee.1200397529627" id="4362914091961521755">
        <property name="charConstant" nameId="tpee.1200397540847" value=":" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="2742566862758553171">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="DYNAMIC_REFERENCE_ID" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2742566862758554938" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="2742566862758554936" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2742566862758554942">
        <property name="value" nameId="tpee.1070475926801" value="^" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="4362914091961464837">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="HASH_BASE" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4362914091961464838" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4362914091961464840" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961464843">
        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4362914091961464846">
          <property name="value" nameId="tpee.1068580320021" value="26" />
        </node>
        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4362914091961464842">
          <property name="value" nameId="tpee.1068580320021" value="10" />
        </node>
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="4362914091961464847">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="HASH_SIZE" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4362914091961464848" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4362914091961464850" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.MulExpression" typeId="tpee.1092119917967" id="4362914091961464864">
        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="4362914091961464867">
          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464837" resolveInfo="HASH_BASE" />
        </node>
        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MulExpression" typeId="tpee.1092119917967" id="4362914091961464859">
          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MulExpression" typeId="tpee.1092119917967" id="4362914091961464854">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="4362914091961464853">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464837" resolveInfo="HASH_BASE" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="4362914091961464858">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464837" resolveInfo="HASH_BASE" />
            </node>
          </node>
          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="4362914091961464863">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464837" resolveInfo="HASH_BASE" />
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="4362914091961464808">
      <property name="name" nameId="tpck.1169194664001" value="myModelRef" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4362914091961464809" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961464811">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="5437197702624226114">
      <property name="name" nameId="tpck.1169194664001" value="myModelFqNameToReference" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="5437197702624226115" />
      <node role="type" roleId="tpee.5680397130376446158" type="tp2q.MapType" typeId="tp2q.1197683403723" id="5437197702624226118">
        <node role="keyType" roleId="tp2q.1197683466920" type="tpee.StringType" typeId="tpee.1225271177708" id="5437197702624226124" />
        <node role="valueType" roleId="tp2q.1197683475734" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5437197702624226126">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="4362914091961464820">
      <property name="name" nameId="tpck.1169194664001" value="myModelIndex" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4362914091961464821" />
      <node role="type" roleId="tpee.5680397130376446158" type="tp2q.MapType" typeId="tp2q.1197683403723" id="4362914091961464823">
        <node role="keyType" roleId="tp2q.1197683466920" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961464826">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
        </node>
        <node role="valueType" roleId="tp2q.1197683475734" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961464827" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="4362914091961464829">
      <property name="name" nameId="tpck.1169194664001" value="myUsedIndexes" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4362914091961464830" />
      <node role="type" roleId="tpee.5680397130376446158" type="tp2q.SetType" typeId="tp2q.1226511727824" id="4362914091961464832">
        <node role="elementType" roleId="tp2q.1226511765987" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4362914091961464834" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961459501" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="4362914091961459502">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4362914091961459503" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961459504" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961459505">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5437197702624226153">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="5437197702624226155">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5437197702624226158">
              <node role="creator" roleId="tpee.1145553007750" type="tp2q.HashMapCreator" typeId="tp2q.1197686869805" id="5437197702624226159">
                <node role="keyType" roleId="tp2q.1197687026896" type="tpee.StringType" typeId="tpee.1225271177708" id="5437197702624226160" />
                <node role="valueType" roleId="tp2q.1197687035757" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5437197702624226161">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5437197702624226154">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5437197702624226114" resolveInfo="myModelFqNameToReference" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4362914091961465696">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4362914091961465699">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4362914091961465702">
              <node role="creator" roleId="tpee.1145553007750" type="tp2q.HashMapCreator" typeId="tp2q.1197686869805" id="4362914091961465703">
                <node role="keyType" roleId="tp2q.1197687026896" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961465704">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
                </node>
                <node role="valueType" roleId="tp2q.1197687035757" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961465705" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961465698">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464820" resolveInfo="myModelIndex" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4362914091961465724">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4362914091961465726">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4362914091961465729">
              <node role="creator" roleId="tpee.1145553007750" type="tp2q.HashSetCreator" typeId="tp2q.1226516258405" id="4362914091961465730">
                <node role="elementType" roleId="tp2q.1237721435807" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4362914091961465731" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961465725">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464829" resolveInfo="myUsedIndexes" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4362914091961470109">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4362914091961470110">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961470112">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464806" resolveInfo="modelRef" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961470114">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464808" resolveInfo="myModelRef" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961464806">
        <property name="name" nameId="tpck.1169194664001" value="modelRef" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961524784">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="5437197702624233346">
      <property name="name" nameId="tpck.1169194664001" value="getModelReferenceForConcept" />
      <property name="isFinal" nameId="tpee.1181808852946" value="false" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4653378063118824965">
        <property name="name" nameId="tpck.1169194664001" value="node" />
        <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="5427614427235894854" />
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5437197702624226168">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5437197702624226165">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="5437197702624233352">
          <node role="expression" roleId="tpee.1068581517676" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="5437197702624233355">
            <node role="key" roleId="tp2q.1197932525128" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="5427614427235894841">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="30pf.~NameUtil%dnamespaceFromLongName(java%dlang%dString)%cjava%dlang%dString" resolveInfo="namespaceFromLongName" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="30pf.~NameUtil" resolveInfo="NameUtil" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5427614427235894843">
                <node role="operand" roleId="tpee.1197027771414" type="tp25.SemanticDowncastExpression" typeId="tp25.1145404486709" id="5427614427235894856">
                  <node role="leftExpression" roleId="tp25.1145404616321" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="5427614427235894844">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4653378063118824965" resolveInfo="node" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5427614427235894845">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNode%dgetConceptFqName()%cjava%dlang%dString" resolveInfo="getConceptFqName" />
                </node>
              </node>
            </node>
            <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="5437197702624233354">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="5437197702624226114" resolveInfo="myModelFqNameToReference" />
            </node>
          </node>
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="5437197702624226167" />
    </node>
  </root>
  <root id="4362914091961475519">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961475567">
      <property name="name" nameId="tpck.1169194664001" value="addModelRef" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4362914091961475568" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961475569" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475570">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4362914091961475579">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4362914091961475585">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475588">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475576" resolveInfo="modelRef" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="4362914091961475581">
              <node role="key" roleId="tp2q.1197932525128" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475584">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475571" resolveInfo="index" />
              </node>
              <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961475580">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475526" resolveInfo="myModelByIx" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475571">
        <property name="name" nameId="tpck.1169194664001" value="index" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475572" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475576">
        <property name="name" nameId="tpck.1169194664001" value="modelRef" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961475578">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961475589">
      <property name="name" nameId="tpck.1169194664001" value="addImportToModel" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4362914091961475590" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961475591" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475592">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4362914091961475607">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="4362914091961475611">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4362914091961475614" />
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475610">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475598" resolveInfo="modelUID" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475609">
            <node role="statement" roleId="tpee.1068581517665" type="tpib.LogStatement" typeId="tpib.1167227138527" id="4362914091961475615">
              <property name="severity" nameId="tpib.1167245565795" value="error" />
              <node role="logExpression" roleId="tpib.1167227463056" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961475625">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961475628">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475535" resolveInfo="myModelRef" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961475621">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961475617">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961475616">
                      <property name="value" nameId="tpee.1070475926801" value="Error loading import element for index " />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475620">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475595" resolveInfo="index" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961475624">
                    <property name="value" nameId="tpee.1070475926801" value=" in " />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961475630" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4362914091961475634">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4362914091961475635">
            <property name="name" nameId="tpck.1169194664001" value="modelRef" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961475636">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4362914091961475639">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="t77w.2286463592495498127" resolveInfo="upgradeModelUID" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="t77w.2286463592495498121" resolveInfo="ModelUtil" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="4362914091961475641">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelReference%dfromString(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSModelReference" resolveInfo="fromString" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475642">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475598" resolveInfo="modelUID" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4362914091961475647">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4362914091961475648">
            <property name="name" nameId="tpck.1169194664001" value="elem" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961475649">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModel$ImportElement" resolveInfo="SModel.ImportElement" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4362914091961475651">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="4362914091961475653">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel$ImportElement%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSModelReference,int,int)" resolveInfo="SModel.ImportElement" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961475654">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475635" resolveInfo="modelRef" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PrefixIncrementExpression" typeId="tpee.1239709250944" id="4362914091961475695">
                  <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961475697">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475689" resolveInfo="myMaxImportIndex" />
                  </node>
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475658">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475601" resolveInfo="version" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4362914091961475699">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961475701">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475700">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475593" resolveInfo="model" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961475705">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%dsetMaxImportIndex(int)%cvoid" resolveInfo="setMaxImportIndex" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961475706">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475689" resolveInfo="myMaxImportIndex" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4362914091961475660">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475661">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4362914091961475665">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961475673">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475672">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475593" resolveInfo="model" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961475677">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%daddAdditionalModelVersion(jetbrains%dmps%dsmodel%dSModel$ImportElement)%cvoid" resolveInfo="addAdditionalModelVersion" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961475678">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475648" resolveInfo="elem" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475664">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475604" resolveInfo="implicit" />
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="4362914091961475679">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475680">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4362914091961475681">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961475683">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475682">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475593" resolveInfo="model" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961475687">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModel%daddModelImport(jetbrains%dmps%dsmodel%dSModel$ImportElement)%cvoid" resolveInfo="addModelImport" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961475688">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475648" resolveInfo="elem" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4362914091961475708">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4362914091961475709">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961475567" resolveInfo="addModelRef" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475710">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475595" resolveInfo="index" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961475712">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475635" resolveInfo="modelRef" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475593">
        <property name="name" nameId="tpck.1169194664001" value="model" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961475671">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModel" resolveInfo="SModel" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475595">
        <property name="name" nameId="tpck.1169194664001" value="index" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475597" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475598">
        <property name="name" nameId="tpck.1169194664001" value="modelUID" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475600" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475601">
        <property name="name" nameId="tpck.1169194664001" value="version" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4362914091961475603" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475604">
        <property name="name" nameId="tpck.1169194664001" value="implicit" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="4362914091961475606" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961475713">
      <property name="name" nameId="tpck.1169194664001" value="getSModelReference" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961475717">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961475715" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475716">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961475749">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="4362914091961475750">
            <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961475751">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475535" resolveInfo="myModelRef" />
            </node>
            <node role="ifFalse" roleId="tpee.1163668934364" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="4362914091961475752">
              <node role="key" roleId="tp2q.1197932525128" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475753">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475718" resolveInfo="ix" />
              </node>
              <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961475754">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475526" resolveInfo="myModelByIx" />
              </node>
            </node>
            <node role="condition" roleId="tpee.1163668914799" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961475755">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475756">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475718" resolveInfo="ix" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.IsEmptyOperation" typeId="tpee.1225271369338" id="4362914091961475757" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475718">
        <property name="name" nameId="tpck.1169194664001" value="ix" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475719" />
        <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4362914091961475721">
          <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1121566508702404714">
      <property name="name" nameId="tpck.1169194664001" value="readLink_internal" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1121566508702404716" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1121566508702404717">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="1121566508702404870">
          <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="1121566508702404872">
            <property name="text" nameId="tpee.6329021646629104958" value="returns &lt;true, xxx&gt; - if src is Dynamic Reference" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="1121566508702404725">
          <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="1121566508702404726">
            <property name="text" nameId="tpee.6329021646629104958" value="[modelID.]nodeID[:version] | [modelID.]^[:version]" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1121566508702404809">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1121566508702404810">
            <property name="name" nameId="tpck.1169194664001" value="result" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1121566508702404811">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="30pf.~Pair" resolveInfo="Pair" />
              <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1121566508702404813">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" resolveInfo="Boolean" />
              </node>
              <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1121566508702404815">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodePointer" resolveInfo="SNodePointer" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1121566508702404817">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1121566508702404818">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="30pf.~Pair%d&lt;init&gt;(java%dlang%dObject,java%dlang%dObject)" resolveInfo="Pair" />
                <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1121566508702404819">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" resolveInfo="Boolean" />
                </node>
                <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1121566508702404820">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodePointer" resolveInfo="SNodePointer" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1121566508702404821">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1121566508702404822" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1121566508702404727">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1121566508702404728">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1121566508702404729">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404824">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404810" resolveInfo="result" />
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1121566508702404731">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1121566508702404732" />
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1121566508702404733">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404723" resolveInfo="src" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1121566508702404734">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1121566508702404735">
            <property name="name" nameId="tpck.1169194664001" value="i0" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1121566508702404736" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1121566508702404737">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1121566508702404738">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404723" resolveInfo="src" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1121566508702404739">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dindexOf(int)%cint" resolveInfo="indexOf" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1121566508702404740">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464872" resolveInfo="MODEL_SEPARATOR_CHAR" />
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="4362914091961459500" resolveInfo="WriteHelper" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1121566508702404741">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1121566508702404742">
            <property name="name" nameId="tpck.1169194664001" value="i1" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1121566508702404743" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1121566508702404744">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1121566508702404745">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404723" resolveInfo="src" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1121566508702404746">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dlastIndexOf(int)%cint" resolveInfo="lastIndexOf" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1121566508702404747">
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="4362914091961459500" resolveInfo="WriteHelper" />
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464868" resolveInfo="VERSION_SEPARATOR_CHAR" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1121566508702404748">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1121566508702404749">
            <property name="name" nameId="tpck.1169194664001" value="text" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1121566508702404750" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1121566508702404751">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961470168" resolveInfo="decode" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="4362914091961459500" resolveInfo="WriteHelper" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1121566508702404752">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1121566508702404753">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404723" resolveInfo="src" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1121566508702404754">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dsubstring(int,int)%cjava%dlang%dString" resolveInfo="substring" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1121566508702404755">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1121566508702404756">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404757">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404735" resolveInfo="i0" />
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="1121566508702404758">
                    <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1121566508702404759">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1121566508702404760">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404723" resolveInfo="src" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1121566508702404761">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dlength()%cint" resolveInfo="length" />
                      </node>
                    </node>
                    <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404762">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404742" resolveInfo="i1" />
                    </node>
                    <node role="condition" roleId="tpee.1163668914799" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="1121566508702404763">
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1121566508702404764">
                        <property name="value" nameId="tpee.1068580320021" value="0" />
                      </node>
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404765">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404742" resolveInfo="i1" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1121566508702404826">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1121566508702404838">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1121566508702404833">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404827">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404810" resolveInfo="result" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1121566508702404837">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="30pf.~Pair%do1" resolveInfo="o1" />
              </node>
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1121566508702404841">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1121566508702404842">
                <link role="classifier" roleId="tpee.1144433057691" targetNodeId="4362914091961459500" resolveInfo="WriteHelper" />
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2742566862758553171" resolveInfo="DYNAMIC_REFERENCE_ID" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1121566508702404843">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dequals(java%dlang%dObject)%cboolean" resolveInfo="equals" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404844">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404749" resolveInfo="text" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1121566508702404766">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1121566508702404767">
            <property name="name" nameId="tpck.1169194664001" value="modelRef" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1121566508702404768">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="1121566508702404769">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961475713" resolveInfo="getSModelReference" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="1121566508702404770">
                <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1121566508702404771">
                  <property name="value" nameId="tpee.1070475926801" value="" />
                </node>
                <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1121566508702404772">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1121566508702404773">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404723" resolveInfo="src" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1121566508702404774">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dsubstring(int,int)%cjava%dlang%dString" resolveInfo="substring" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1121566508702404775">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404776">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404735" resolveInfo="i0" />
                    </node>
                  </node>
                </node>
                <node role="condition" roleId="tpee.1163668914799" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="1121566508702404777">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1121566508702404778">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404779">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404735" resolveInfo="i0" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1121566508702404780">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1121566508702404781">
            <property name="name" nameId="tpck.1169194664001" value="nodeId" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1121566508702404782">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="1121566508702404783">
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1121566508702404784" />
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1121566508702404785">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="lkfb.~SNodeId" resolveInfo="SNodeId" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodeId%dfromString(java%dlang%dString)%cjetbrains%dmps%dsmodel%dSNodeId" resolveInfo="fromString" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404786">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404749" resolveInfo="text" />
                </node>
              </node>
              <node role="condition" roleId="tpee.1163668914799" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1121566508702404847">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404846">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404810" resolveInfo="result" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1121566508702404851">
                  <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="30pf.~Pair%do1" resolveInfo="o1" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1121566508702404853">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1121566508702404860">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1121566508702404855">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404854">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404810" resolveInfo="result" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="1121566508702404859">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="30pf.~Pair%do2" resolveInfo="o2" />
              </node>
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1121566508702404863">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1121566508702404864">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SNodePointer%d&lt;init&gt;(jetbrains%dmps%dsmodel%dSModelReference,jetbrains%dmps%dsmodel%dSNodeId)" resolveInfo="SNodePointer" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404865">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404767" resolveInfo="modelRef" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404866">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404781" resolveInfo="nodeId" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1121566508702404791">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1121566508702404868">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1121566508702404810" resolveInfo="result" />
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1121566508702404718">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="30pf.~Pair" resolveInfo="Pair" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1121566508702404720">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Boolean" resolveInfo="Boolean" />
        </node>
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1121566508702404722">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodePointer" resolveInfo="SNodePointer" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1121566508702404723">
        <property name="name" nameId="tpck.1169194664001" value="src" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1121566508702404724" />
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="4703487121563635950">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="r27b.~NotNull" resolveInfo="NotNull" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961475758">
      <property name="name" nameId="tpck.1169194664001" value="readLinkId" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961475762">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SNodePointer" resolveInfo="SNodePointer" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961475760" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475761">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="4362914091961475765">
          <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="4362914091961475766">
            <property name="text" nameId="tpee.6329021646629104958" value="[modelID.]nodeID[:version] | [modelID.]^[:version]" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4703487121563610229">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4703487121563610230">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4703487121563610231">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1121566508702404714" resolveInfo="readLink_internal" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4703487121563610232">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475763" resolveInfo="src" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="4703487121563610233">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="30pf.~Pair%do2" resolveInfo="o2" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475763">
        <property name="name" nameId="tpck.1169194664001" value="src" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475764" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961475946">
      <property name="name" nameId="tpck.1169194664001" value="readType" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961475948" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475949">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4362914091961475953">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4362914091961475954">
            <property name="name" nameId="tpck.1169194664001" value="ix" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4362914091961475955" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961475958">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475957">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475951" resolveInfo="s" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961475962">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dindexOf(int)%cint" resolveInfo="indexOf" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="4362914091961475963">
                  <link role="classifier" roleId="tpee.1144433057691" targetNodeId="4362914091961459500" resolveInfo="WriteHelper" />
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961464872" resolveInfo="MODEL_SEPARATOR_CHAR" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4362914091961475965">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475966">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="4362914091961476017">
              <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="4362914091961476018">
                <property name="text" nameId="tpee.6329021646629104958" value="no model ID - fqName is here" />
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961475974">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961476006">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961476005">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475951" resolveInfo="s" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961476010">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dsubstring(int)%cjava%dlang%dString" resolveInfo="substring" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961476012">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4362914091961476015">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961476011">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475954" resolveInfo="ix" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.LessThanOrEqualsExpression" typeId="tpee.1153422305557" id="4362914091961475970">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4362914091961475973">
              <property name="value" nameId="tpee.1068580320021" value="0" />
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961475969">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475954" resolveInfo="ix" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4362914091961476022">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4362914091961476023">
            <property name="name" nameId="tpck.1169194664001" value="modelRef" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961476024">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="4362914091961476026">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="4362914091961475713" resolveInfo="getSModelReference" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961476028">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961476027">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475951" resolveInfo="s" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961476032">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dsubstring(int,int)%cjava%dlang%dString" resolveInfo="substring" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4362914091961476033">
                    <property name="value" nameId="tpee.1068580320021" value="0" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961476035">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475954" resolveInfo="ix" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4362914091961476037">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961476038">
            <node role="statement" roleId="tpee.1068581517665" type="tpib.LogStatement" typeId="tpib.1167227138527" id="4362914091961476046">
              <property name="severity" nameId="tpib.1167245565795" value="error" />
              <node role="logExpression" roleId="tpib.1167227463056" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961476078">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961476081">
                  <property name="value" nameId="tpee.1070475926801" value="] not found" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961476066">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961476062">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961476048">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961476047">
                        <property name="value" nameId="tpee.1070475926801" value="couldn't create node '" />
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961476052">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961476051">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475951" resolveInfo="s" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961476056">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dsubstring(int)%cjava%dlang%dString" resolveInfo="substring" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961476058">
                            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4362914091961476061">
                              <property name="value" nameId="tpee.1068580320021" value="1" />
                            </node>
                            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961476057">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475954" resolveInfo="ix" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961476065">
                      <property name="value" nameId="tpee.1070475926801" value="' : import for index [" />
                    </node>
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961476070">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961476069">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475951" resolveInfo="s" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961476074">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dsubstring(int,int)%cjava%dlang%dString" resolveInfo="substring" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4362914091961476075">
                        <property name="value" nameId="tpee.1068580320021" value="0" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961476077">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475954" resolveInfo="ix" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961476083">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961476086">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961476085">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475951" resolveInfo="s" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961476090">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dsubstring(int)%cjava%dlang%dString" resolveInfo="substring" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961476092">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4362914091961476095">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961476091">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475954" resolveInfo="ix" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="4362914091961476042">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4362914091961476045" />
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961476041">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961476023" resolveInfo="modelRef" />
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="4362914091961476096">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961476097">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961476098">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961476115">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961476119">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961476118">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475951" resolveInfo="s" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961476123">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dsubstring(int)%cjava%dlang%dString" resolveInfo="substring" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961476125">
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4362914091961476128">
                          <property name="value" nameId="tpee.1068580320021" value="1" />
                        </node>
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961476124">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475954" resolveInfo="ix" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="4362914091961476111">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961476106">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4362914091961476101">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4362914091961476100">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961476023" resolveInfo="modelRef" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961476105">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelReference%dgetSModelFqName()%cjetbrains%dmps%dsmodel%dSModelFqName" resolveInfo="getSModelFqName" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4362914091961476110">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lkfb.~SModelFqName%dgetLongName()%cjava%dlang%dString" resolveInfo="getLongName" />
                      </node>
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4362914091961476114">
                      <property name="value" nameId="tpee.1070475926801" value="." />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475950" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475951">
        <property name="name" nameId="tpck.1169194664001" value="s" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475952" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961476129">
      <property name="name" nameId="tpck.1169194664001" value="readRole" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961476133" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961476131" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961476132">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961476136">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961476138">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961476134" resolveInfo="s" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961476134">
        <property name="name" nameId="tpck.1169194664001" value="s" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961476135" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="4362914091961476139">
      <property name="name" nameId="tpck.1169194664001" value="readName" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961476143" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961476141" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961476142">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="4362914091961476146">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961476148">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961476144" resolveInfo="s" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961476144">
        <property name="name" nameId="tpck.1169194664001" value="s" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961476145" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="4362914091961475535">
      <property name="name" nameId="tpck.1169194664001" value="myModelRef" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4362914091961475536" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961475538">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="4362914091961475526">
      <property name="name" nameId="tpck.1169194664001" value="myModelByIx" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4362914091961475527" />
      <node role="type" roleId="tpee.5680397130376446158" type="tp2q.MapType" typeId="tp2q.1197683403723" id="4362914091961475529">
        <node role="keyType" roleId="tp2q.1197683466920" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475532" />
        <node role="valueType" roleId="tp2q.1197683475734" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961475533">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="4362914091961475689">
      <property name="name" nameId="tpck.1169194664001" value="myMaxImportIndex" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="4362914091961475690" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4362914091961475692" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4362914091961475694">
        <property name="value" nameId="tpee.1068580320021" value="0" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961475520" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="4362914091961475553">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4362914091961475554" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4362914091961475555" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4362914091961475556">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4362914091961475540">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4362914091961475542">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961475541">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475526" resolveInfo="myModelByIx" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="4362914091961475546">
              <node role="creator" roleId="tpee.1145553007750" type="tp2q.HashMapCreator" typeId="tp2q.1197686869805" id="4362914091961475548">
                <node role="keyType" roleId="tp2q.1197687026896" type="tpee.StringType" typeId="tpee.1225271177708" id="4362914091961475551" />
                <node role="valueType" roleId="tp2q.1197687035757" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961475552">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4362914091961475561">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4362914091961475563">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="4362914091961475566">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475557" resolveInfo="modelRef" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="4362914091961475562">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4362914091961475535" resolveInfo="myModelRef" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="4362914091961475557">
        <property name="name" nameId="tpck.1169194664001" value="modelRef" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="4362914091961475558">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lkfb.~SModelReference" resolveInfo="SModelReference" />
        </node>
      </node>
    </node>
  </root>
</model>

