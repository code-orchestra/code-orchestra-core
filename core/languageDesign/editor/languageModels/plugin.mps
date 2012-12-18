<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c8959029c(jetbrains.mps.lang.editor.plugin)">
  <persistence version="7" />
  <language namespace="28f9e497-3b42-4291-aeba-0a1039153ab1(jetbrains.mps.lang.plugin)" />
  <language namespace="443f4c36-fcf5-4eb6-9500-8d06ed259e3e(jetbrains.mps.baseLanguage.classifiers)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="tpcn" modelUID="r:00000000-0000-4000-0000-011c8959028b(jetbrains.mps.lang.structure.behavior)" version="-1" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" />
  <import index="lkfb" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.smodel(MPS.Classpath/jetbrains.mps.smodel@java_stub)" version="-1" />
  <import index="afxk" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.project(MPS.Classpath/jetbrains.mps.project@java_stub)" version="-1" />
  <import index="bw1v" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#com.intellij.openapi.components(MPS.Classpath/com.intellij.openapi.components@java_stub)" version="-1" />
  <import index="mztn" modelUID="r:66ce2b91-7b81-4bbb-b893-ddc7adce1336(jetbrains.mps.ide.resolve)" version="-1" />
  <import index="qxeo" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.nodeEditor(MPS.Classpath/jetbrains.mps.nodeEditor@java_stub)" version="-1" />
  <import index="tp4k" modelUID="r:00000000-0000-4000-0000-011c89590368(jetbrains.mps.lang.plugin.structure)" version="23" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpc2" modelUID="r:00000000-0000-4000-0000-011c8959029e(jetbrains.mps.lang.editor.structure)" version="32" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp4f" modelUID="r:00000000-0000-4000-0000-011c89590373(jetbrains.mps.baseLanguage.classifiers.structure)" version="0" implicit="yes" />
  <import index="tpcc" modelUID="r:00000000-0000-4000-0000-011c89590290(jetbrains.mps.lang.structure.plugin)" version="-1" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="rgbs" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.nodeEditor.checking(MPS.Classpath/jetbrains.mps.nodeEditor.checking@java_stub)" version="-1" implicit="yes" />
  <roots>
    <node type="tp4k.ProjectPluginDeclaration" typeId="tp4k.1206110063106" id="1207844373881">
      <property name="name" nameId="tpck.1169194664001" value="EditorLangPlugin" />
    </node>
    <node type="tp4k.EditorTab" typeId="tp4k.3743831881070611759" id="7157723551789028023">
      <property name="name" nameId="tpck.1169194664001" value="Editor" />
      <property name="shortcutChar" nameId="tp4k.3743831881070611767" value="E" />
      <property name="commandOnCreate" nameId="tp4k.8204570419206313935" value="true" />
      <link role="baseNodeConcept" roleId="tp4k.3743831881070611760" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
  </roots>
  <root id="1207844373881">
    <node role="fieldDeclaration" roleId="tp4k.1206112250032" type="tp4f.DefaultClassifierFieldDeclaration" typeId="tp4f.1213999088275" id="1215438685387">
      <property name="name" nameId="tpck.1169194664001" value="myAutoResolver" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="1215438685388" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2378204549815524517">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="mztn.2378204549815376618" resolveInfo="AutoResolver" />
      </node>
    </node>
    <node role="fieldDeclaration" roleId="tp4k.1206112250032" type="tp4f.DefaultClassifierFieldDeclaration" typeId="tp4f.1213999088275" id="1700208213243723076">
      <property name="name" nameId="tpck.1169194664001" value="myHighlighter" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="1700208213243723077" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1700208213243723079">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="qxeo.~Highlighter" resolveInfo="Highlighter" />
      </node>
    </node>
    <node role="initBlock" roleId="tp4k.1206110253508" type="tp4k.ProjectPluginInitBlock" typeId="tp4k.1206110093589" id="1207844406262">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1207844406263">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1700208213243723081">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1700208213243723085">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1700208213243723082">
              <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1700208213243723083" />
              <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1700208213243723084">
                <link role="member" roleId="tp4f.1205756909548" targetNodeId="1700208213243723076" resolveInfo="myHighlighter" />
              </node>
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1700208213243723088">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1700208213243723089">
                <node role="operand" roleId="tpee.1197027771414" type="tp4k.ConceptFunctionParameter_MPSProject" typeId="tp4k.1204478074808" id="1700208213243723090" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1700208213243723091">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="afxk.~MPSProject%dgetProject()%ccom%dintellij%dopenapi%dproject%dProject" resolveInfo="getProject" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1700208213243723092">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="bw1v.~ComponentManager%dgetComponent(java%dlang%dClass)%cjava%dlang%dObject" resolveInfo="getComponent" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ClassifierClassExpression" typeId="tpee.1116615150612" id="1700208213243723093">
                  <link role="classifier" roleId="tpee.1116615189566" targetNodeId="qxeo.~Highlighter" resolveInfo="Highlighter" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1207844522220">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1207844522221">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1700208213243723101">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1700208213243723102">
                <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1700208213243723103">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1700208213243723104">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="mztn.2378204549815376621" resolveInfo="AutoResolver" />
                  </node>
                </node>
                <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1700208213243723105">
                  <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1700208213243723106" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1700208213243723107">
                    <link role="member" roleId="tp4f.1205756909548" targetNodeId="1215438685387" resolveInfo="myAutoResolver" />
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1207844535198">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1207844536106">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1700208213243723097">
                  <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1700208213243723098" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1700208213243723099">
                    <link role="member" roleId="tp4f.1205756909548" targetNodeId="1700208213243723076" resolveInfo="myHighlighter" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1207844537077">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qxeo.~Highlighter%daddChecker(jetbrains%dmps%dnodeEditor%dchecking%dBaseEditorChecker)%cvoid" resolveInfo="addChecker" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1207844539359">
                    <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1207844539360" />
                    <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1215438699887">
                      <link role="member" roleId="tp4f.1205756909548" targetNodeId="1215438685387" resolveInfo="myAutoResolver" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="1207844524990">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1207844526837" />
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1700208213243723094">
              <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1700208213243723095" />
              <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1700208213243723096">
                <link role="member" roleId="tp4f.1205756909548" targetNodeId="1700208213243723076" resolveInfo="myHighlighter" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="disposeBlock" roleId="tp4k.1206110260441" type="tp4k.ProjectPluginDisposeBlock" typeId="tp4k.1206110108761" id="1207844548925">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1207844548926">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1207844554107">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1207844554108">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1207844554109">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1207844554110">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1700208213243723111">
                  <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1700208213243723112" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1700208213243723113">
                    <link role="member" roleId="tp4f.1205756909548" targetNodeId="1700208213243723076" resolveInfo="myHighlighter" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1207844554112">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qxeo.~Highlighter%dremoveChecker(jetbrains%dmps%dnodeEditor%dchecking%dBaseEditorChecker)%cvoid" resolveInfo="removeChecker" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1207844554113">
                    <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1207844554114" />
                    <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1215438702373">
                      <link role="member" roleId="tp4f.1205756909548" targetNodeId="1215438685387" resolveInfo="myAutoResolver" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1700208213243723115">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1700208213243723119">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1700208213243723116">
                  <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1700208213243723117" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1700208213243723118">
                    <link role="member" roleId="tp4f.1205756909548" targetNodeId="1215438685387" resolveInfo="myAutoResolver" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1700208213243723123">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="rgbs.~BaseEditorChecker%ddispose()%cvoid" resolveInfo="dispose" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="1207844554116">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1207844554117" />
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1700208213243723108">
              <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1700208213243723109" />
              <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1700208213243723110">
                <link role="member" roleId="tp4f.1205756909548" targetNodeId="1700208213243723076" resolveInfo="myHighlighter" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="7157723551789028023">
    <node role="baseNodeBlock" roleId="tp4k.3743831881070611762" type="tp4k.BaseNodeBlock" typeId="tp4k.3743831881070657672" id="7157723551789028024">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7157723551789028025">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7157723551789028026">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7157723551789028027">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpcc.3552608880959246967" resolveInfo="getBaseNode" />
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="tpcc.3552608880959246745" resolveInfo="ConceptEditorOpenHelper" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_node" typeId="tp4k.1203853034639" id="7157723551789028028" />
          </node>
        </node>
      </node>
    </node>
    <node role="isApplicableBlock" roleId="tp4k.3743831881070657666" type="tp4k.IsApplicableTabBlock" typeId="tp4k.3743831881070613135" id="7157723551789028029">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7157723551789028030">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7157723551789028031">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7157723551789028032">
            <node role="operand" roleId="tpee.1197027771414" type="tp4k.ConceptFunctionParameter_node" typeId="tp4k.1203853034639" id="7157723551789028033" />
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="7157723551789028034">
              <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="7157723551789028035">
                <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="listenBlock" roleId="tp4k.3743831881070613134" type="tp4k.ListenBlock" typeId="tp4k.3743831881070657680" id="7157723551789028036">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7157723551789028037" />
    </node>
    <node role="nodesBlock" roleId="tp4k.3743831881070612960" type="tp4k.GetNodesBlock" typeId="tp4k.1203852029150" id="7157723551789028051">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7157723551789028052">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7157723551789028053">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7157723551789028054">
            <property name="name" nameId="tpck.1169194664001" value="nodes" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="7157723551789028055" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7157723551789028056">
              <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeListCreator" typeId="tp25.1145567426890" id="7157723551789028057">
                <node role="createdType" roleId="tp25.1145567471833" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="7157723551789028058" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7157723551789028059">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7157723551789028060">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7157723551789028061">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7157723551789028054" resolveInfo="nodes" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddAllElementsOperation" typeId="tp2q.1160666733551" id="7157723551789028062">
              <node role="argument" roleId="tp2q.1160666822012" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7157723551789028063">
                <node role="operand" roleId="tpee.1197027771414" type="tp4k.ConceptFunctionParameter_node" typeId="tp4k.1203853034639" id="7157723551789028064" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="7157723551789028065">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpcn.1567570417158062208" resolveInfo="findConceptAspectCollection" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="7157723551789028066">
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="lkfb.~LanguageAspect" resolveInfo="LanguageAspect" />
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="lkfb.~LanguageAspect%dEDITOR" resolveInfo="EDITOR" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="7157723551789028067">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7157723551789028068">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="tpcc.6388164970935848749" resolveInfo="ConceptEditorHelper" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpcc.1214823353927923286" resolveInfo="sortRootsByConcept" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7157723551789028069">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7157723551789028054" resolveInfo="nodes" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="7157723551789028070">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ArrayCreatorWithInitializer" typeId="tpee.1154542696413" id="7157723551789028071">
                <node role="componentType" roleId="tpee.1154542793668" type="tp25.SConceptType" typeId="tp25.1172420572800" id="7157723551789028072" />
                <node role="initValue" roleId="tpee.1154542803372" type="tp25.ConceptRefExpression" typeId="tp25.1172424058054" id="7157723551789028073">
                  <link role="conceptDeclaration" roleId="tp25.1172424100906" targetNodeId="tpc2.1071666914219" resolveInfo="ConceptEditorDeclaration" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="tp25.ConceptRefExpression" typeId="tp25.1172424058054" id="7157723551789028074">
                  <link role="conceptDeclaration" roleId="tp25.1172424100906" targetNodeId="tpc2.1078938745671" resolveInfo="EditorComponentDeclaration" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="tp25.ConceptRefExpression" typeId="tp25.1172424058054" id="7157723551789028075">
                  <link role="conceptDeclaration" roleId="tp25.1172424100906" targetNodeId="tpc2.1081293058843" resolveInfo="CellKeyMapDeclaration" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="tp25.ConceptRefExpression" typeId="tp25.1172424058054" id="7157723551789028076">
                  <link role="conceptDeclaration" roleId="tp25.1172424100906" targetNodeId="tpc2.1139535219966" resolveInfo="CellActionMapDeclaration" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="tp25.ConceptRefExpression" typeId="tp25.1172424058054" id="7157723551789028077">
                  <link role="conceptDeclaration" roleId="tp25.1172424100906" targetNodeId="tpc2.1166040637528" resolveInfo="CellMenuComponent" />
                </node>
                <node role="initValue" roleId="tpee.1154542803372" type="tp25.ConceptRefExpression" typeId="tp25.1172424058054" id="7157723551789028078">
                  <link role="conceptDeclaration" roleId="tp25.1172424100906" targetNodeId="tpc2.1186402211651" resolveInfo="StyleSheet" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="icon" roleId="tp4k.2386275659558598338" type="tp4k.IconResource" typeId="tp4k.2330114057060456691" id="7157723551789059562">
      <property name="path" nameId="tp4k.7855019336153226684" value="${language_descriptor}/icons/editor.png" />
    </node>
    <node role="order" roleId="tp4k.3743831881070613126" type="tp4k.Order" typeId="tp4k.2450897840534683975" id="7157723551789225001">
      <node role="tab" roleId="tp4k.2450897840534683977" type="tp4k.EditorTabReference" typeId="tp4k.2450897840534683979" id="7157723551789225003">
        <link role="editorTab" roleId="tp4k.2450897840534683980" targetNodeId="tpcc.2542706524531725660" resolveInfo="Structure" />
      </node>
      <node role="tab" roleId="tp4k.2450897840534683977" type="tp4k.EditorTabReference" typeId="tp4k.2450897840534683979" id="7157723551789225005">
        <link role="editorTab" roleId="tp4k.2450897840534683980" targetNodeId="7157723551789028023" resolveInfo="Editor" />
      </node>
    </node>
    <node role="createTabBlock" roleId="tp4k.1640281869714699888" type="tp4k.CreateTabBlock" typeId="tp4k.1640281869714699879" id="1640281869715076463">
      <property name="commandOnCreate" nameId="tp4k.1640281869714699886" value="true" />
      <node role="conceptsBlock" roleId="tp4k.1640281869714699882" type="tp4k.GetConceptsBlock" typeId="tp4k.7692832593197705758" id="7157723551789028045">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7157723551789028046">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7157723551789028047">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7157723551789028048">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpcc.6388164970935848820" resolveInfo="getAvailableConceptAspects" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="tpcc.6388164970935848749" resolveInfo="ConceptEditorHelper" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="7157723551789028049">
                <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="lkfb.~LanguageAspect" resolveInfo="LanguageAspect" />
                <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="lkfb.~LanguageAspect%dEDITOR" resolveInfo="EDITOR" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_node" typeId="tp4k.1203853034639" id="7157723551789028050" />
            </node>
          </node>
        </node>
      </node>
      <node role="createBlock" roleId="tp4k.1640281869714699884" type="tp4k.NewCreateBlock" typeId="tp4k.7692832593197710972" id="7157723551789028038">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="7157723551789028039">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7157723551789028040">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="7157723551789028041">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpcc.6388164970935848891" resolveInfo="createNewConceptAspectInstance" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="tpcc.6388164970935848749" resolveInfo="ConceptEditorHelper" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="7157723551789028042">
                <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="lkfb.~LanguageAspect" resolveInfo="LanguageAspect" />
                <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="lkfb.~LanguageAspect%dEDITOR" resolveInfo="EDITOR" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_node" typeId="tp4k.1203853034639" id="7157723551789028043" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_Concept" typeId="tp4k.7692832593197710975" id="7157723551789028044" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

