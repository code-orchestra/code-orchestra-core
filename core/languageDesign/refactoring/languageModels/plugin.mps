<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c89590317(jetbrains.mps.lang.refactoring.plugin)">
  <persistence version="7" />
  <language namespace="28f9e497-3b42-4291-aeba-0a1039153ab1(jetbrains.mps.lang.plugin)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="443f4c36-fcf5-4eb6-9500-8d06ed259e3e(jetbrains.mps.baseLanguage.classifiers)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="jeyo" modelUID="f:java_stub#java.lang(java.lang@java_stub)" version="-1" />
  <import index="ik8z" modelUID="f:java_stub#jetbrains.mps.smodel(jetbrains.mps.smodel@java_stub)" version="-1" />
  <import index="z8ui" modelUID="f:java_stub#com.intellij.openapi.actionSystem(com.intellij.openapi.actionSystem@java_stub)" version="-1" />
  <import index="7ij6" modelUID="f:java_stub#jetbrains.mps.workbench(jetbrains.mps.workbench@java_stub)" version="-1" />
  <import index="a360" modelUID="f:java_stub#jetbrains.mps.ide.refactoring(jetbrains.mps.ide.refactoring@java_stub)" version="-1" />
  <import index="2tgk" modelUID="f:java_stub#java.util(java.util@java_stub)" version="-1" />
  <import index="49xb" modelUID="f:java_stub#jetbrains.mps.workbench.action(jetbrains.mps.workbench.action@java_stub)" version="-1" />
  <import index="6m4m" modelUID="f:java_stub#org.jetbrains.annotations(org.jetbrains.annotations@java_stub)" version="-1" />
  <import index="fxfs" modelUID="f:java_stub#jetbrains.mps.project(jetbrains.mps.project@java_stub)" version="-1" />
  <import index="y116" modelUID="f:java_stub#jetbrains.mps.refactoring.framework(jetbrains.mps.refactoring.framework@java_stub)" version="-1" />
  <import index="tp4k" modelUID="r:00000000-0000-4000-0000-011c89590368(jetbrains.mps.lang.plugin.structure)" version="23" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tprs" modelUID="r:00000000-0000-4000-0000-011c895904a4(jetbrains.mps.ide.actions)" version="-1" implicit="yes" />
  <import index="tp4f" modelUID="r:00000000-0000-4000-0000-011c89590373(jetbrains.mps.baseLanguage.classifiers.structure)" version="0" implicit="yes" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" implicit="yes" />
  <import index="tpcn" modelUID="r:00000000-0000-4000-0000-011c8959028b(jetbrains.mps.lang.structure.behavior)" version="-1" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tpc0" modelUID="r:00000000-0000-4000-0000-011c8959029c(jetbrains.mps.lang.editor.plugin)" version="-1" implicit="yes" />
  <import index="tpcc" modelUID="r:00000000-0000-4000-0000-011c89590290(jetbrains.mps.lang.structure.plugin)" version="-1" implicit="yes" />
  <import index="tp1z" modelUID="r:00000000-0000-4000-0000-011c8959030b(jetbrains.mps.lang.constraints.plugin)" version="-1" implicit="yes" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" implicit="yes" />
  <import index="7d1q" modelUID="r:1ed054af-f407-4447-a858-616e33563f48(jetbrains.mps.lang.behavior.plugin)" version="-1" implicit="yes" />
  <import index="c9j3" modelUID="r:a71ce2a2-9289-4a18-8d08-efffe620ea7a(jetbrains.mps.lang.actions.plugin)" version="-1" implicit="yes" />
  <import index="tpdb" modelUID="r:00000000-0000-4000-0000-011c895902b3(jetbrains.mps.lang.typesystem.plugin)" version="-1" implicit="yes" />
  <roots>
    <node type="tp4k.ActionGroupDeclaration" typeId="tp4k.1203087890642" id="1229259662341">
      <property name="name" nameId="tpck.1169194664001" value="NodeRefactoring" />
      <property name="isPopup" nameId="tp4k.1213283637680" value="true" />
      <property name="caption" nameId="tp4k.1204991940915" value="Refactoring" />
      <property name="isInvisibleWhenDisabled" nameId="tp4k.1217005992861" value="false" />
      <property name="mnemonic" nameId="tp4k.1205160812895" value="r" />
    </node>
    <node type="tp4k.ActionGroupDeclaration" typeId="tp4k.1203087890642" id="8880521689750912043">
      <property name="name" nameId="tpck.1169194664001" value="ModelRefactorings" />
      <property name="isInvisibleWhenDisabled" nameId="tp4k.1217005992861" value="false" />
    </node>
    <node type="tp4k.ActionDeclaration" typeId="tp4k.1203071646776" id="1106479162954038584">
      <property name="name" nameId="tpck.1169194664001" value="GenericRefactoringAction" />
      <property name="outsideCommandExecution" nameId="tp4k.1211298967294" value="true" />
      <property name="caption" nameId="tp4k.1205250923097" value="&lt;caption&gt;" />
      <property name="isAlwaysVisible" nameId="tp4k.1207149998849" value="true" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="1106479162954058963">
      <property name="name" nameId="tpck.1169194664001" value="GenericRefactoringHelper" />
    </node>
    <node type="tp4k.KeymapChangesDeclaration" typeId="tp4k.1562714432501166197" id="1106479162954059190">
      <property name="name" nameId="tpck.1169194664001" value="Default" />
    </node>
    <node type="tp4k.EditorTab" typeId="tp4k.3743831881070611759" id="3911341278723465020">
      <property name="name" nameId="tpck.1169194664001" value="Refactorings" />
      <property name="shortcutChar" nameId="tp4k.3743831881070611767" value="R" />
      <property name="commandOnCreate" nameId="tp4k.8204570419206313935" value="true" />
      <link role="baseNodeConcept" roleId="tp4k.3743831881070611760" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
    </node>
  </roots>
  <root id="1229259662341">
    <node role="modifier" roleId="tp4k.1204991552650" type="tp4k.ModificationStatement" typeId="tp4k.1203092361741" id="1229259747550">
      <link role="modifiedGroup" roleId="tp4k.1203092736097" targetNodeId="tprs.1587195459761469116" resolveInfo="FindUsages" />
      <link role="point" roleId="tp4k.1204992316090" targetNodeId="tprs.1587195459761469122" resolveInfo="refactoring" />
    </node>
    <node role="contents" roleId="tp4k.1207145245948" type="tp4k.BuildGroupBlock" typeId="tp4k.1207145360364" id="5003188907306244655">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="5003188907306244656">
        <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="5003188907306244657">
          <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="5003188907306244658">
            <property name="name" nameId="tpck.1169194664001" value="refactoring" />
          </node>
          <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1909926480506228492">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="y116.~RefactoringUtil" resolveInfo="RefactoringUtil" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringUtil%dgetAllRefactorings()%cjava%dutil%dList" resolveInfo="getAllRefactorings" />
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="5003188907306244662">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="278927758244366461">
              <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="278927758244366840">
                <property name="text" nameId="tpee.6329021646629104958" value="@hack" />
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="7163273296928998114">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="7163273296928998115">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="278927758244377645">
                  <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="278927758244377646">
                    <property name="name" nameId="tpck.1169194664001" value="old" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tp2q.ListType" typeId="tp2q.1151688443754" id="278927758244377647">
                      <node role="elementType" roleId="tp2q.1151688676805" type="tpee.StringType" typeId="tpee.1225271177708" id="278927758244377648" />
                    </node>
                    <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="278927758244377649">
                      <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="278927758244377650">
                        <node role="elementType" roleId="tp2q.1237721435807" type="tpee.StringType" typeId="tpee.1225271177708" id="278927758244377651" />
                        <node role="initValue" roleId="tp2q.1237721435808" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="278927758244377652">
                          <property name="value" nameId="tpee.1070475926801" value="jetbrains.mps.lang.core.scripts.Rename" />
                        </node>
                        <node role="initValue" roleId="tp2q.1237721435808" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="278927758244377653">
                          <property name="value" nameId="tpee.1070475926801" value="jetbrains.mps.lang.structure.scripts.RenameConcept" />
                        </node>
                        <node role="initValue" roleId="tp2q.1237721435808" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="278927758244377654">
                          <property name="value" nameId="tpee.1070475926801" value="jetbrains.mps.lang.structure.scripts.RenameLink" />
                        </node>
                        <node role="initValue" roleId="tp2q.1237721435808" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="278927758244377655">
                          <property name="value" nameId="tpee.1070475926801" value="jetbrains.mps.lang.structure.scripts.RenameProperty" />
                        </node>
                        <node role="initValue" roleId="tp2q.1237721435808" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3068114543318336407">
                          <property name="value" nameId="tpee.1070475926801" value="jetbrains.mps.lang.core.scripts.MoveNodes" />
                        </node>
                        <node role="initValue" roleId="tp2q.1237721435808" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3068114543318336409">
                          <property name="value" nameId="tpee.1070475926801" value="jetbrains.mps.lang.structure.scripts.MoveConcepts" />
                        </node>
                        <node role="initValue" roleId="tp2q.1237721435808" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3068114543318336411">
                          <property name="value" nameId="tpee.1070475926801" value="jetbrains.mps.lang.structure.scripts.MoveLinkUp" />
                        </node>
                        <node role="initValue" roleId="tp2q.1237721435808" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3068114543318336413">
                          <property name="value" nameId="tpee.1070475926801" value="jetbrains.mps.lang.structure.scripts.MovePropertyUp" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="278927758244377639">
                  <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="278927758244377640">
                    <property name="name" nameId="tpck.1169194664001" value="name" />
                  </node>
                  <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="278927758244377642">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="278927758244377659">
                      <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="278927758244377660">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ContinueStatement" typeId="tpee.1082113931046" id="278927758244377697">
                          <node role="loopLabelReference" roleId="tpee.9056323058805226429" type="tpee.LoopLabelReference" typeId="tpee.363746191845183785" id="278927758244377698">
                            <link role="loopLabel" roleId="tpee.363746191845183786" targetNodeId="278927758244377691" resolveInfo="outer" />
                          </node>
                        </node>
                      </node>
                      <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="278927758244377662">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="278927758244377663">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="278927758244377664">
                            <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="278927758244377665">
                              <node role="expression" roleId="tpee.1070534934092" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="278927758244377666">
                                <link role="variable" roleId="tp2q.1153944258490" targetNodeId="5003188907306244658" resolveInfo="refactoring" />
                              </node>
                              <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="278927758244377667">
                                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="y116.~OldRefactoringAdapter" resolveInfo="OldRefactoringAdapter" />
                              </node>
                            </node>
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="278927758244377668">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~OldRefactoringAdapter%dgetRefactoringClassName()%cjava%dlang%dString" resolveInfo="getRefactoringClassName" />
                          </node>
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="278927758244377669">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="jeyo.~String%dequals(java%dlang%dObject)%cboolean" resolveInfo="equals" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="8949646146181242315">
                            <link role="variable" roleId="tp2q.1153944258490" targetNodeId="278927758244377640" resolveInfo="name" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="278927758244377656">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="278927758244377646" resolveInfo="old" />
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.InstanceOfExpression" typeId="tpee.1081256982272" id="7163273296928998127">
                <node role="classType" roleId="tpee.1081256993305" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7163273296928998131">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="y116.~OldRefactoringAdapter" resolveInfo="OldRefactoringAdapter" />
                </node>
                <node role="leftExpression" roleId="tpee.1081256993304" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="7163273296928998118">
                  <link role="variable" roleId="tp2q.1153944258490" targetNodeId="5003188907306244658" resolveInfo="refactoring" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1909926480506229857">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1909926480506229858">
                <node role="statement" roleId="tpee.1068581517665" type="tp4k.AddStatement" typeId="tp4k.1227013049127" id="1106479162954059186">
                  <node role="item" roleId="tp4k.1227013166210" type="tp4k.ActionInstance" typeId="tp4k.1203088046679" id="1106479162954059188">
                    <link role="action" roleId="tp4k.1203088061055" targetNodeId="1106479162954038584" resolveInfo="GenericRefactoringAction" />
                    <node role="actualParameter" roleId="tp4k.1227011543811" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1106479162954059189">
                      <link role="variable" roleId="tp2q.1153944258490" targetNodeId="5003188907306244658" resolveInfo="refactoring" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1909926480506229885">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="3455061244568757621">
                  <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="y116.~IRefactoringTarget$TargetType%dNODE" resolveInfo="NODE" />
                  <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="y116.~IRefactoringTarget$TargetType" resolveInfo="IRefactoringTarget.TargetType" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1909926480506229874">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1909926480506229864">
                    <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1909926480506229861">
                      <link role="variable" roleId="tp2q.1153944258490" targetNodeId="5003188907306244658" resolveInfo="refactoring" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1909926480506229870">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~IRefactoring%dgetRefactoringTarget()%cjetbrains%dmps%drefactoring%dframework%dIRefactoringTarget" resolveInfo="getRefactoringTarget" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1909926480506229881">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~IRefactoringTarget%dgetTarget()%cjetbrains%dmps%drefactoring%dframework%dIRefactoringTarget$TargetType" resolveInfo="getTarget" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="loopLabel" roleId="tpee.363746191845183793" type="tpee.LoopLabel" typeId="tpee.363746191845175146" id="278927758244377691">
            <property name="name" nameId="tpck.1169194664001" value="outer" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="8880521689750912043">
    <node role="modifier" roleId="tp4k.1204991552650" type="tp4k.ModificationStatement" typeId="tp4k.1203092361741" id="8880521689750912044">
      <link role="modifiedGroup" roleId="tp4k.1203092736097" targetNodeId="tprs.1222173496701" resolveInfo="ModelRefactoring" />
    </node>
    <node role="contents" roleId="tp4k.1207145245948" type="tp4k.BuildGroupBlock" typeId="tp4k.1207145360364" id="8880521689750912046">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="8880521689750912047">
        <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="8880521689750912048">
          <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="8880521689750912049">
            <property name="name" nameId="tpck.1169194664001" value="refactoring" />
          </node>
          <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="8880521689750912050">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="y116.~RefactoringUtil" resolveInfo="RefactoringUtil" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringUtil%dgetAllRefactorings()%cjava%dutil%dList" resolveInfo="getAllRefactorings" />
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="8880521689750912051">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="8880521689750912091">
              <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="8880521689750912092">
                <node role="statement" roleId="tpee.1068581517665" type="tp4k.AddStatement" typeId="tp4k.1227013049127" id="1106479162954059181">
                  <node role="item" roleId="tp4k.1227013166210" type="tp4k.ActionInstance" typeId="tp4k.1203088046679" id="1106479162954059183">
                    <link role="action" roleId="tp4k.1203088061055" targetNodeId="1106479162954038584" resolveInfo="GenericRefactoringAction" />
                    <node role="actualParameter" roleId="tp4k.1227011543811" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1106479162954059184">
                      <link role="variable" roleId="tp2q.1153944258490" targetNodeId="8880521689750912049" resolveInfo="refactoring" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="8880521689750912096">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="3455061244568757620">
                  <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="y116.~IRefactoringTarget$TargetType%dMODEL" resolveInfo="MODEL" />
                  <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="y116.~IRefactoringTarget$TargetType" resolveInfo="IRefactoringTarget.TargetType" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8880521689750912098">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8880521689750912099">
                    <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="8880521689750912100">
                      <link role="variable" roleId="tp2q.1153944258490" targetNodeId="8880521689750912049" resolveInfo="refactoring" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8880521689750912101">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~IRefactoring%dgetRefactoringTarget()%cjetbrains%dmps%drefactoring%dframework%dIRefactoringTarget" resolveInfo="getRefactoringTarget" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8880521689750912102">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~IRefactoringTarget%dgetTarget()%cjetbrains%dmps%drefactoring%dframework%dIRefactoringTarget$TargetType" resolveInfo="getTarget" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="1106479162954038584">
    <node role="constructionParameter" roleId="tp4k.1227008813498" type="tp4k.ActionConstructionParameterDeclaration" typeId="tp4k.1227008846812" id="1106479162954038587">
      <property name="name" nameId="tpck.1169194664001" value="refactoring" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="1106479162954038588" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954040125">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="y116.~IRefactoring" resolveInfo="IRefactoring" />
      </node>
      <node role="toStringFunction" roleId="tp4k.1227019158144" type="tp4k.ToStringConceptFunction" typeId="tp4k.1227019068586" id="1106479162954040126">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954040127">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954042713">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1106479162954061458">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059009" resolveInfo="getRefactoringClassName" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1106479162954058963" resolveInfo="GenericRefactoringHelper" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ToStringParameter" typeId="tp4k.1227019310584" id="1106479162954061460" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="executeFunction" roleId="tp4k.1203083461638" type="tp4k.ExecuteBlock" typeId="tp4k.1203083511112" id="1106479162954038585">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954038586">
        <node role="statement" roleId="tpee.1068581517665" type="tp4k.ExecuteWriteActionStatement" typeId="tp4k.1225441380935" id="1106479162954057372">
          <node role="commandClosureLiteral" roleId="tp4k.1225441160167" type="tp4k.CommandClosureLiteral" typeId="tp4k.1225441216717" id="1106479162954057373">
            <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954057374">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954057375">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057376">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1106479162954057377">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="ik8z.~SModelRepository" resolveInfo="SModelRepository" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ik8z.~SModelRepository%dgetInstance()%cjetbrains%dmps%dsmodel%dSModelRepository" resolveInfo="getInstance" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057378">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="ik8z.~SModelRepository%dsaveAll()%cvoid" resolveInfo="saveAll" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1106479162954057270">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1106479162954057271">
            <property name="name" nameId="tpck.1169194664001" value="isOneTarget" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1106479162954057272" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.NotExpression" typeId="tpee.1081516740877" id="1106479162954057273">
              <node role="expression" roleId="tpee.1081516765348" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057274">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057275">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954058817">
                    <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1106479162954058818" />
                    <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1106479162954058819">
                      <link role="member" roleId="tp4f.1205756909548" targetNodeId="1106479162954038587" resolveInfo="refactoring" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057277">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~IRefactoring%dgetRefactoringTarget()%cjetbrains%dmps%drefactoring%dframework%dIRefactoringTarget" resolveInfo="getRefactoringTarget" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057278">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~IRefactoringTarget%dallowMultipleTargets()%cboolean" resolveInfo="allowMultipleTargets" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1106479162954057279">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1106479162954057280">
            <property name="name" nameId="tpck.1169194664001" value="context" />
            <property name="isFinal" nameId="tpee.1176718929932" value="true" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954057281">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="y116.~RefactoringContext" resolveInfo="RefactoringContext" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1106479162954057282">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1106479162954057283">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringContext%d&lt;init&gt;(jetbrains%dmps%drefactoring%dframework%dIRefactoring)" resolveInfo="RefactoringContext" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954058820">
                  <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1106479162954058821" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1106479162954058822">
                    <link role="member" roleId="tp4f.1205756909548" targetNodeId="1106479162954038587" resolveInfo="refactoring" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954057285">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057286">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954057287">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057280" resolveInfo="context" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057288">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringContext%dsetCurrentOperationContext(jetbrains%dmps%dsmodel%dIOperationContext)%cvoid" resolveInfo="setCurrentOperationContext" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057289">
                <node role="operand" roleId="tpee.1197027771414" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954058827" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057291">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="z8ui.~AnActionEvent%dgetData(com%dintellij%dopenapi%dactionSystem%dDataKey)%cjava%dlang%dObject" resolveInfo="getData" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1106479162954057292">
                    <link role="classifier" roleId="tpee.1144433057691" targetNodeId="7ij6.~MPSDataKeys" resolveInfo="MPSDataKeys" />
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7ij6.~MPSDataKeys%dOPERATION_CONTEXT" resolveInfo="OPERATION_CONTEXT" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954057293">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057294">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954057295">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057280" resolveInfo="context" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057296">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringContext%dsetSelectedNode(jetbrains%dmps%dsmodel%dSNode)%cvoid" resolveInfo="setSelectedNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057297">
                <node role="operand" roleId="tpee.1197027771414" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954058828" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057299">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="z8ui.~AnActionEvent%dgetData(com%dintellij%dopenapi%dactionSystem%dDataKey)%cjava%dlang%dObject" resolveInfo="getData" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1106479162954057300">
                    <link role="classifier" roleId="tpee.1144433057691" targetNodeId="7ij6.~MPSDataKeys" resolveInfo="MPSDataKeys" />
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7ij6.~MPSDataKeys%dNODE" resolveInfo="NODE" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954057301">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057302">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954057303">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057280" resolveInfo="context" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057304">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringContext%dsetSelectedNodes(java%dutil%dList)%cvoid" resolveInfo="setSelectedNodes" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1106479162954060048">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059722" resolveInfo="getNodes" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1106479162954058963" resolveInfo="GenericRefactoringHelper" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954060049" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954060050">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057271" resolveInfo="isOneTarget" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954057308">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057309">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954057310">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057280" resolveInfo="context" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057311">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringContext%dsetSelectedModel(jetbrains%dmps%dsmodel%dSModelDescriptor)%cvoid" resolveInfo="setSelectedModel" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057312">
                <node role="operand" roleId="tpee.1197027771414" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954058829" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057314">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="z8ui.~AnActionEvent%dgetData(com%dintellij%dopenapi%dactionSystem%dDataKey)%cjava%dlang%dObject" resolveInfo="getData" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1106479162954057315">
                    <link role="classifier" roleId="tpee.1144433057691" targetNodeId="7ij6.~MPSDataKeys" resolveInfo="MPSDataKeys" />
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7ij6.~MPSDataKeys%dCONTEXT_MODEL" resolveInfo="CONTEXT_MODEL" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954057316">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057317">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954057318">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057280" resolveInfo="context" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057319">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringContext%dsetSelectedModels(java%dutil%dList)%cvoid" resolveInfo="setSelectedModels" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1106479162954060053">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059726" resolveInfo="getModels" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1106479162954058963" resolveInfo="GenericRefactoringHelper" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954060054" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954060055">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057271" resolveInfo="isOneTarget" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954057323">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057324">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954057325">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057280" resolveInfo="context" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057326">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringContext%dsetSelectedModule(jetbrains%dmps%dproject%dIModule)%cvoid" resolveInfo="setSelectedModule" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057327">
                <node role="operand" roleId="tpee.1197027771414" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954058833" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057329">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="z8ui.~AnActionEvent%dgetData(com%dintellij%dopenapi%dactionSystem%dDataKey)%cjava%dlang%dObject" resolveInfo="getData" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1106479162954057330">
                    <link role="classifier" roleId="tpee.1144433057691" targetNodeId="7ij6.~MPSDataKeys" resolveInfo="MPSDataKeys" />
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7ij6.~MPSDataKeys%dMODULE" resolveInfo="MODULE" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954057331">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057332">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954057333">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057280" resolveInfo="context" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057334">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringContext%dsetSelectedModules(java%dutil%dList)%cvoid" resolveInfo="setSelectedModules" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1106479162954060058">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059730" resolveInfo="getModules" />
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1106479162954058963" resolveInfo="GenericRefactoringHelper" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954060059" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954060060">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057271" resolveInfo="isOneTarget" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954057338">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057339">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954057340">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057280" resolveInfo="context" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057341">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringContext%dsetSelectedProject(com%dintellij%dopenapi%dproject%dProject)%cvoid" resolveInfo="setSelectedProject" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057342">
                <node role="operand" roleId="tpee.1197027771414" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954058834" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057344">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="z8ui.~AnActionEvent%dgetData(com%dintellij%dopenapi%dactionSystem%dDataKey)%cjava%dlang%dObject" resolveInfo="getData" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1106479162954057345">
                    <link role="classifier" roleId="tpee.1144433057691" targetNodeId="z8ui.~PlatformDataKeys" resolveInfo="PlatformDataKeys" />
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="z8ui.~PlatformDataKeys%dPROJECT" resolveInfo="PROJECT" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954057346">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057347">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954057348">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057280" resolveInfo="context" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057349">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringContext%dsetCurrentScope(jetbrains%dmps%dsmodel%dIScope)%cvoid" resolveInfo="setCurrentScope" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057350">
                <node role="operand" roleId="tpee.1197027771414" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954058835" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057352">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="z8ui.~AnActionEvent%dgetData(com%dintellij%dopenapi%dactionSystem%dDataKey)%cjava%dlang%dObject" resolveInfo="getData" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1106479162954057353">
                    <link role="classifier" roleId="tpee.1144433057691" targetNodeId="7ij6.~MPSDataKeys" resolveInfo="MPSDataKeys" />
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7ij6.~MPSDataKeys%dSCOPE" resolveInfo="SCOPE" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954057354">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057355">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1106479162954057356">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="1106479162954057357">
                <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="1106479162954057358">
                  <property name="name" nameId="tpck.1169194664001" value="" />
                  <link role="classifier" roleId="tpee.1170346070688" targetNodeId="jeyo.~Thread" resolveInfo="Thread" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="jeyo.~Thread%d&lt;init&gt;()" resolveInfo="Thread" />
                  <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1106479162954057359">
                    <property name="name" nameId="tpck.1169194664001" value="run" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1106479162954057360" />
                    <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1106479162954057361" />
                    <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954057362">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954057363">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057364">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1106479162954057365">
                            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1106479162954057366">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a360.~RefactoringFacade%d&lt;init&gt;()" resolveInfo="RefactoringFacade" />
                            </node>
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057367">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="a360.~RefactoringFacade%dexecute(jetbrains%dmps%drefactoring%dframework%dIRefactoring,jetbrains%dmps%drefactoring%dframework%dRefactoringContext)%cvoid" resolveInfo="execute" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954058836">
                              <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1106479162954058837">
                                <link role="classifier" roleId="tp4f.1218736638915" targetNodeId="1106479162954038584" resolveInfo="GenericRefactoringAction" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1106479162954058838">
                                <link role="member" roleId="tp4f.1205756909548" targetNodeId="1106479162954038587" resolveInfo="refactoring" />
                              </node>
                            </node>
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954057369">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057280" resolveInfo="context" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057370">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="jeyo.~Thread%dstart()%cvoid" resolveInfo="start" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="updateBlock" roleId="tp4k.1203083196627" type="tp4k.DoUpdateBlock" typeId="tp4k.1203082695294" id="1106479162954057196">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954057197">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1106479162954057225">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1106479162954057226">
            <property name="name" nameId="tpck.1169194664001" value="text" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954057227">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="jeyo.~String" resolveInfo="String" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="1106479162954057228">
              <node role="condition" roleId="tpee.1163668914799" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057229">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1106479162954057230">
                  <property name="value" nameId="tpee.1070475926801" value="" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057231">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="jeyo.~String%dequals(java%dlang%dObject)%cboolean" resolveInfo="equals" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057232">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057244">
                      <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1106479162954057245" />
                      <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1106479162954057246">
                        <link role="member" roleId="tp4f.1205756909548" targetNodeId="1106479162954038587" resolveInfo="refactoring" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057234">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~IRefactoring%dgetUserFriendlyName()%cjava%dlang%dString" resolveInfo="getUserFriendlyName" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057235">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057236">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057247">
                    <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1106479162954057248" />
                    <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1106479162954057249">
                      <link role="member" roleId="tp4f.1205756909548" targetNodeId="1106479162954038587" resolveInfo="refactoring" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057238">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="jeyo.~Object%dgetClass()%cjava%dlang%dClass" resolveInfo="getClass" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057239">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="jeyo.~Class%dgetName()%cjava%dlang%dString" resolveInfo="getName" />
                </node>
              </node>
              <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057240">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057250">
                  <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1106479162954057251" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1106479162954057252">
                    <link role="member" roleId="tp4f.1205756909548" targetNodeId="1106479162954038587" resolveInfo="refactoring" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057242">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~IRefactoring%dgetUserFriendlyName()%cjava%dlang%dString" resolveInfo="getUserFriendlyName" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954057198">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057205">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954057200">
              <node role="operand" roleId="tpee.1197027771414" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954057199" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057204">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="z8ui.~AnActionEvent%dgetPresentation()%ccom%dintellij%dopenapi%dactionSystem%dPresentation" resolveInfo="getPresentation" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954057209">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="z8ui.~Presentation%dsetText(java%dlang%dString)%cvoid" resolveInfo="setText" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954057243">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954057226" resolveInfo="text" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="1106479162954058847" />
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1106479162954058849">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1106479162954058850">
            <property name="name" nameId="tpck.1169194664001" value="refTarget" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954058851">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="y116.~IRefactoringTarget" resolveInfo="IRefactoringTarget" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954058852">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954058932">
                <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1106479162954058933" />
                <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1106479162954058934">
                  <link role="member" roleId="tp4f.1205756909548" targetNodeId="1106479162954038587" resolveInfo="refactoring" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954058854">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~IRefactoring%dgetRefactoringTarget()%cjetbrains%dmps%drefactoring%dframework%dIRefactoringTarget" resolveInfo="getRefactoringTarget" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1106479162954058855">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1106479162954058856">
            <property name="name" nameId="tpck.1169194664001" value="oneEntity" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1106479162954058857" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.NotExpression" typeId="tpee.1081516740877" id="1106479162954058858">
              <node role="expression" roleId="tpee.1081516765348" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954058859">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954058860">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058850" resolveInfo="refTarget" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954058861">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~IRefactoringTarget%dallowMultipleTargets()%cboolean" resolveInfo="allowMultipleTargets" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1106479162954058862">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1106479162954058863">
            <property name="name" nameId="tpck.1169194664001" value="entities" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954058864">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2tgk.~List" resolveInfo="List" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SwitchStatement" typeId="tpee.1163670490218" id="1106479162954058865">
          <node role="expression" roleId="tpee.1163670766145" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954058866">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954058867">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058850" resolveInfo="refTarget" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954058868">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~IRefactoringTarget%dgetTarget()%cjetbrains%dmps%drefactoring%dframework%dIRefactoringTarget$TargetType" resolveInfo="getTarget" />
            </node>
          </node>
          <node role="defaultBlock" roleId="tpee.1163670592366" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954058869">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ThrowStatement" typeId="tpee.1164991038168" id="1106479162954058870">
              <node role="throwable" roleId="tpee.1164991057263" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1106479162954058871">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1106479162954058872">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="jeyo.~IllegalArgumentException%d&lt;init&gt;(java%dlang%dString)" resolveInfo="IllegalArgumentException" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1106479162954058873">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1106479162954058874">
                      <property name="value" nameId="tpee.1070475926801" value="Wrong refactoring type " />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954058875">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954058876">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954058877">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954058878">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058850" resolveInfo="refTarget" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954058879">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~IRefactoringTarget%dgetTarget()%cjetbrains%dmps%drefactoring%dframework%dIRefactoringTarget$TargetType" resolveInfo="getTarget" />
                          </node>
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954058880">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="jeyo.~Object%dgetClass()%cjava%dlang%dClass" resolveInfo="getClass" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954058881">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="jeyo.~Class%dgetName()%cjava%dlang%dString" resolveInfo="getName" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1106479162954058882">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="1106479162954058883">
              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="y116.~IRefactoringTarget$TargetType" resolveInfo="IRefactoringTarget.TargetType" />
              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="y116.~IRefactoringTarget$TargetType%dNODE" resolveInfo="NODE" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954058884">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954058885">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1106479162954058886">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954058887">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058863" resolveInfo="entities" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1106479162954059972">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059722" resolveInfo="getNodes" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1106479162954058963" resolveInfo="GenericRefactoringHelper" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954059973" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059974">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058856" resolveInfo="oneEntity" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.BreakStatement" typeId="tpee.1081855346303" id="1106479162954058891" />
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1106479162954058892">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="1106479162954058893">
              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="y116.~IRefactoringTarget$TargetType" resolveInfo="IRefactoringTarget.TargetType" />
              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="y116.~IRefactoringTarget$TargetType%dMODEL" resolveInfo="MODEL" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954058894">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954058895">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1106479162954058896">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954058897">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058863" resolveInfo="entities" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1106479162954059977">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059726" resolveInfo="getModels" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1106479162954058963" resolveInfo="GenericRefactoringHelper" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954059978" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059979">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058856" resolveInfo="oneEntity" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.BreakStatement" typeId="tpee.1081855346303" id="1106479162954058901" />
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="1106479162954058902">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="1106479162954058903">
              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="y116.~IRefactoringTarget$TargetType" resolveInfo="IRefactoringTarget.TargetType" />
              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="y116.~IRefactoringTarget$TargetType%dMODULE" resolveInfo="MODULE" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954058904">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954058905">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1106479162954058906">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954058907">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058863" resolveInfo="entities" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1106479162954059963">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059730" resolveInfo="getModules" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1106479162954058963" resolveInfo="GenericRefactoringHelper" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954059964" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059965">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058856" resolveInfo="oneEntity" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.BreakStatement" typeId="tpee.1081855346303" id="1106479162954058911" />
            </node>
          </node>
          <node role="case" roleId="tpee.1163670772911" type="tpee.SwitchCase" typeId="tpee.1163670641947" id="229911729819517852">
            <node role="expression" roleId="tpee.1163670677455" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="229911729819518359">
              <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="y116.~IRefactoringTarget$TargetType%dANY" resolveInfo="ANY" />
              <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="y116.~IRefactoringTarget$TargetType" resolveInfo="IRefactoringTarget.TargetType" />
            </node>
            <node role="body" roleId="tpee.1163670683720" type="tpee.StatementList" typeId="tpee.1068580123136" id="229911729819517854">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="229911729819518360">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="229911729819518362">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="229911729819518361">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058863" resolveInfo="entities" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="229911729819518365">
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1106479162954058963" resolveInfo="GenericRefactoringHelper" />
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059722" resolveInfo="getNodes" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="229911729819518366" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="229911729819518367">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058856" resolveInfo="oneEntity" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="229911729819518381">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="229911729819518383">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="229911729819518382">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058863" resolveInfo="entities" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="229911729819518387">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2tgk.~List%daddAll(java%dutil%dCollection)%cboolean" resolveInfo="addAll" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="229911729819518388">
                      <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1106479162954058963" resolveInfo="GenericRefactoringHelper" />
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059726" resolveInfo="getModels" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="229911729819518389" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="229911729819518390">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058856" resolveInfo="oneEntity" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="229911729819518392">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="229911729819518394">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="229911729819518393">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058863" resolveInfo="entities" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="229911729819518398">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2tgk.~List%daddAll(java%dutil%dCollection)%cboolean" resolveInfo="addAll" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="229911729819518399">
                      <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1106479162954058963" resolveInfo="GenericRefactoringHelper" />
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059730" resolveInfo="getModules" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="229911729819518400" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="229911729819518401">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058856" resolveInfo="oneEntity" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.BreakStatement" typeId="tpee.1081855346303" id="229911729819518379" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1106479162954058912">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1106479162954058913">
            <property name="name" nameId="tpck.1169194664001" value="disabled" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1106479162954058914" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.OrExpression" typeId="tpee.1080223426719" id="1106479162954058915">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954058916">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954058917">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058863" resolveInfo="entities" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954058918">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2tgk.~List%disEmpty()%cboolean" resolveInfo="isEmpty" />
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954058919">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1106479162954058920">
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="y116.~RefactoringUtil" resolveInfo="RefactoringUtil" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringUtil%dgetApplicability(jetbrains%dmps%drefactoring%dframework%dIRefactoring,java%dutil%dCollection)%cjetbrains%dmps%drefactoring%dframework%dRefactoringUtil$Applicability" resolveInfo="getApplicability" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954058938">
                    <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1106479162954058939" />
                    <node role="operation" roleId="tpee.1197027833540" type="tp4f.DefaultClassifierFieldAccessOperation" typeId="tp4f.1213999117680" id="1106479162954058940">
                      <link role="member" roleId="tp4f.1205756909548" targetNodeId="1106479162954038587" resolveInfo="refactoring" />
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954058922">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058863" resolveInfo="entities" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954058923">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~RefactoringUtil$Applicability%dlessThan(jetbrains%dmps%drefactoring%dframework%dRefactoringUtil$Applicability)%cboolean" resolveInfo="lessThan" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1106479162954059982">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059734" resolveInfo="getMinApplicabilityLevel" />
                    <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1106479162954058963" resolveInfo="GenericRefactoringHelper" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="1106479162954059983" />
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954059985">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954060036">
            <node role="operand" roleId="tpee.1197027771414" type="tp4f.ThisClassifierExpression" typeId="tp4f.1205752633985" id="1106479162954059986" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954060040">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="49xb.~BaseAction%dsetEnabledState(com%dintellij%dopenapi%dactionSystem%dPresentation,boolean)%cvoid" resolveInfo="setEnabledState" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954060041">
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954060042">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="z8ui.~AnActionEvent%dgetPresentation()%ccom%dintellij%dopenapi%dactionSystem%dPresentation" resolveInfo="getPresentation" />
                </node>
                <node role="operand" roleId="tpee.1197027771414" type="tp4k.ConceptFunctionParameter_AnActionEvent" typeId="tp4k.1203082903663" id="1106479162954060043" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.NotExpression" typeId="tpee.1081516740877" id="1106479162954060044">
                <node role="expression" roleId="tpee.1081516765348" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954060045">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954058913" resolveInfo="disabled" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="1106479162954058963">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1106479162954058964" />
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1106479162954059009">
      <property name="name" nameId="tpck.1169194664001" value="getRefactoringClassName" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1106479162954059969" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059011">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="jeyo.~String" resolveInfo="String" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1106479162954059012">
        <property name="name" nameId="tpck.1169194664001" value="refactoring" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059013">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="y116.~IRefactoring" resolveInfo="IRefactoring" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954059014">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1106479162954059015">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.InstanceOfExpression" typeId="tpee.1081256982272" id="1106479162954059016">
            <node role="leftExpression" roleId="tpee.1081256993304" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059017">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059012" resolveInfo="refactoring" />
            </node>
            <node role="classType" roleId="tpee.1081256993305" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059018">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="y116.~OldRefactoringAdapter" resolveInfo="OldRefactoringAdapter" />
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="1106479162954059019">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954059020">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1106479162954059021">
                <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954059022">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954059023">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059024">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059012" resolveInfo="refactoring" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954059025">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="jeyo.~Object%dgetClass()%cjava%dlang%dClass" resolveInfo="getClass" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954059026">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="jeyo.~Class%dgetName()%cjava%dlang%dString" resolveInfo="getName" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954059027">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1106479162954059028">
              <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954059029">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1106479162954059030">
                  <node role="expression" roleId="tpee.1079359253376" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1106479162954059031">
                    <node role="expression" roleId="tpee.1070534934092" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059032">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059012" resolveInfo="refactoring" />
                    </node>
                    <node role="type" roleId="tpee.1070534934091" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059033">
                      <link role="classifier" roleId="tpee.1107535924139" targetNodeId="y116.~OldRefactoringAdapter" resolveInfo="OldRefactoringAdapter" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954059034">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~OldRefactoringAdapter%dgetRefactoringClassName()%cjava%dlang%dString" resolveInfo="getRefactoringClassName" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1106479162954059516">
      <property name="name" nameId="tpck.1169194664001" value="getEntities" />
      <property name="isFinal" nameId="tpee.1181808852946" value="false" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059038">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2tgk.~List" resolveInfo="List" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="1106479162954059875">
          <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="1106479162954059863" resolveInfo="T" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1106479162954059040">
        <property name="name" nameId="tpck.1169194664001" value="e" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059041">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="z8ui.~AnActionEvent" resolveInfo="AnActionEvent" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1106479162954059042">
        <property name="name" nameId="tpck.1169194664001" value="oneEntity" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1106479162954059043" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1106479162954059044">
        <property name="name" nameId="tpck.1169194664001" value="keySingle" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059045">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="z8ui.~DataKey" resolveInfo="DataKey" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="1106479162954059046">
            <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="1106479162954059863" resolveInfo="T" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1106479162954059047">
        <property name="name" nameId="tpck.1169194664001" value="keyList" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059048">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="z8ui.~DataKey" resolveInfo="DataKey" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059049">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2tgk.~List" resolveInfo="List" />
            <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="1106479162954059876">
              <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="1106479162954059863" resolveInfo="T" />
            </node>
          </node>
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954059051">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1106479162954059052">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1106479162954059053">
            <property name="name" nameId="tpck.1169194664001" value="single" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="1106479162954059054">
              <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="1106479162954059863" resolveInfo="T" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954059055">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059056">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059040" resolveInfo="e" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954059057">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="z8ui.~AnActionEvent%dgetData(com%dintellij%dopenapi%dactionSystem%dDataKey)%cjava%dlang%dObject" resolveInfo="getData" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059058">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059044" resolveInfo="keySingle" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1106479162954059059">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1106479162954059060">
            <property name="name" nameId="tpck.1169194664001" value="list" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059061">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2tgk.~List" resolveInfo="List" />
              <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="1106479162954059062">
                <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="1106479162954059863" resolveInfo="T" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954059063">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059064">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059040" resolveInfo="e" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954059065">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="z8ui.~AnActionEvent%dgetData(com%dintellij%dopenapi%dactionSystem%dDataKey)%cjava%dlang%dObject" resolveInfo="getData" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059066">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059047" resolveInfo="keyList" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1106479162954059067">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1106479162954059068">
            <property name="name" nameId="tpck.1169194664001" value="res" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059069">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2tgk.~List" resolveInfo="List" />
              <node role="parameter" roleId="tpee.1109201940907" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="1106479162954059070">
                <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="1106479162954059863" resolveInfo="T" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1106479162954059071">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1106479162954059072">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2tgk.~ArrayList%d&lt;init&gt;(int)" resolveInfo="ArrayList" />
                <node role="typeParameter" roleId="tpee.1212687122400" type="tpee.TypeVariableReference" typeId="tpee.1109283449304" id="1106479162954059073">
                  <link role="typeVariableDeclaration" roleId="tpee.1109283546497" targetNodeId="1106479162954059863" resolveInfo="T" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="1106479162954059074">
                  <node role="condition" roleId="tpee.1163668914799" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1106479162954059075">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059076">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059060" resolveInfo="list" />
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1106479162954059077" />
                  </node>
                  <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1106479162954059078">
                    <property name="value" nameId="tpee.1068580320021" value="1" />
                  </node>
                  <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1106479162954059079">
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954059080">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059081">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059060" resolveInfo="list" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954059082">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2tgk.~List%dsize()%cint" resolveInfo="size" />
                      </node>
                    </node>
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1106479162954059083">
                      <property name="value" nameId="tpee.1068580320021" value="1" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1106479162954059084">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="1106479162954059085">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059086">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059060" resolveInfo="list" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1106479162954059087" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954059088">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954059089">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954059090">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059091">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059068" resolveInfo="res" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954059092">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2tgk.~List%daddAll(java%dutil%dCollection)%cboolean" resolveInfo="addAll" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059093">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059060" resolveInfo="list" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1106479162954059094">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1106479162954059095">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="1106479162954059096">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059097">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059053" resolveInfo="single" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1106479162954059098" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NotExpression" typeId="tpee.1081516740877" id="1106479162954059099">
              <node role="expression" roleId="tpee.1081516765348" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954059100">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059101">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059068" resolveInfo="res" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954059102">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2tgk.~List%dcontains(java%dlang%dObject)%cboolean" resolveInfo="contains" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059103">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059053" resolveInfo="single" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954059104">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954059105">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954059106">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059107">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059068" resolveInfo="res" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954059108">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2tgk.~List%dadd(java%dlang%dObject)%cboolean" resolveInfo="add" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059109">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059053" resolveInfo="single" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1106479162954059110">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="1106479162954059111">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059112">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059042" resolveInfo="oneEntity" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.GreaterThanExpression" typeId="tpee.1081506762703" id="1106479162954059113">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954059114">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059115">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059068" resolveInfo="res" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954059116">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2tgk.~List%dsize()%cint" resolveInfo="size" />
                </node>
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1106479162954059117">
                <property name="value" nameId="tpee.1068580320021" value="1" />
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954059118">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954059119">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1106479162954059120">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059121">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059068" resolveInfo="res" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1106479162954059122">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2tgk.~List%dclear()%cvoid" resolveInfo="clear" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1106479162954059123">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1106479162954059124">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059068" resolveInfo="res" />
          </node>
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="1106479162954059036" />
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="1106479162954059125">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="6m4m.~NotNull" resolveInfo="NotNull" />
      </node>
      <node role="typeVariableDeclaration" roleId="tpee.1109279881614" type="tpee.TypeVariableDeclaration" typeId="tpee.1109279763828" id="1106479162954059863">
        <property name="name" nameId="tpck.1169194664001" value="T" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1106479162954059722">
      <property name="name" nameId="tpck.1169194664001" value="getNodes" />
      <property name="isFinal" nameId="tpee.1181808852946" value="false" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059128">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2tgk.~List" resolveInfo="List" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059129">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ik8z.~SNode" resolveInfo="SNode" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1106479162954059130">
        <property name="name" nameId="tpck.1169194664001" value="e" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059131">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="z8ui.~AnActionEvent" resolveInfo="AnActionEvent" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1106479162954059132">
        <property name="name" nameId="tpck.1169194664001" value="oneEntity" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1106479162954059133" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954059134">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954059739">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="1106479162954059740">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059516" resolveInfo="getEntities" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059743">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059130" resolveInfo="e" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059744">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059132" resolveInfo="oneEntity" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1106479162954059745">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="7ij6.~MPSDataKeys" resolveInfo="MPSDataKeys" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7ij6.~MPSDataKeys%dNODE" resolveInfo="NODE" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1106479162954059746">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="7ij6.~MPSDataKeys" resolveInfo="MPSDataKeys" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7ij6.~MPSDataKeys%dNODES" resolveInfo="NODES" />
            </node>
          </node>
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1106479162954059967" />
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="1106479162954059141">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="6m4m.~NotNull" resolveInfo="NotNull" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1106479162954059726">
      <property name="name" nameId="tpck.1169194664001" value="getModels" />
      <property name="isFinal" nameId="tpee.1181808852946" value="false" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059144">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2tgk.~List" resolveInfo="List" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059145">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="ik8z.~SModelDescriptor" resolveInfo="SModelDescriptor" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1106479162954059146">
        <property name="name" nameId="tpck.1169194664001" value="e" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059147">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="z8ui.~AnActionEvent" resolveInfo="AnActionEvent" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1106479162954059148">
        <property name="name" nameId="tpck.1169194664001" value="oneEntity" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1106479162954059149" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954059150">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954059757">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="1106479162954059758">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059516" resolveInfo="getEntities" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059759">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059146" resolveInfo="e" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059760">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059148" resolveInfo="oneEntity" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1106479162954059761">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="7ij6.~MPSDataKeys" resolveInfo="MPSDataKeys" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7ij6.~MPSDataKeys%dCONTEXT_MODEL" resolveInfo="CONTEXT_MODEL" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1106479162954059762">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="7ij6.~MPSDataKeys" resolveInfo="MPSDataKeys" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7ij6.~MPSDataKeys%dMODELS" resolveInfo="MODELS" />
            </node>
          </node>
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1106479162954059966" />
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="1106479162954059157">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="6m4m.~NotNull" resolveInfo="NotNull" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1106479162954059730">
      <property name="name" nameId="tpck.1169194664001" value="getModules" />
      <property name="isFinal" nameId="tpee.1181808852946" value="false" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059160">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="2tgk.~List" resolveInfo="List" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059161">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxfs.~IModule" resolveInfo="IModule" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1106479162954059162">
        <property name="name" nameId="tpck.1169194664001" value="e" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059163">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="z8ui.~AnActionEvent" resolveInfo="AnActionEvent" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1106479162954059164">
        <property name="name" nameId="tpck.1169194664001" value="oneEntity" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1106479162954059165" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954059166">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1106479162954059800">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalStaticMethodCall" typeId="tpee.1172058436953" id="1106479162954059801">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1106479162954059516" resolveInfo="getEntities" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059802">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059162" resolveInfo="e" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1106479162954059803">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954059164" resolveInfo="oneEntity" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1106479162954059804">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="7ij6.~MPSDataKeys" resolveInfo="MPSDataKeys" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7ij6.~MPSDataKeys%dMODULE" resolveInfo="MODULE" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1106479162954059805">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="7ij6.~MPSDataKeys" resolveInfo="MPSDataKeys" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7ij6.~MPSDataKeys%dMODULES" resolveInfo="MODULES" />
            </node>
          </node>
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1106479162954059962" />
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="1106479162954059173">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="6m4m.~NotNull" resolveInfo="NotNull" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1106479162954059734">
      <property name="name" nameId="tpck.1169194664001" value="getMinApplicabilityLevel" />
      <property name="isFinal" nameId="tpee.1181808852946" value="false" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1106479162954059176">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="y116.~RefactoringUtil$Applicability" resolveInfo="RefactoringUtil.Applicability" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954059177">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1106479162954059178">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="1106479162954059179">
            <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="y116.~RefactoringUtil$Applicability" resolveInfo="RefactoringUtil.Applicability" />
            <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="y116.~RefactoringUtil$Applicability%dAPPLICABLE" resolveInfo="APPLICABLE" />
          </node>
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1106479162954059968" />
    </node>
  </root>
  <root id="1106479162954059190">
    <node role="shortcutChange" roleId="tp4k.1562714432501166199" type="tp4k.ParameterizedShortcutChange" typeId="tp4k.6193305307616734266" id="1106479162954059192">
      <link role="action" roleId="tp4k.6193305307616734326" targetNodeId="1106479162954038584" resolveInfo="GenericRefactoringAction" />
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1106479162954059193">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4419653827035140868">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4419653827035140869">
            <property name="name" nameId="tpck.1169194664001" value="keyStroke" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4419653827035140870" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4419653827035140871">
              <node role="operand" roleId="tpee.1197027771414" type="tp4k.ActionParameterReference" typeId="tp4k.1821622352985038318" id="4419653827035140872">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1106479162954038587" resolveInfo="refactoring" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="4419653827035140873">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="y116.~IRefactoring%dgetKeyStroke()%cjava%dlang%dString" resolveInfo="getKeyStroke" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4419653827035140876">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4419653827035140877">
            <node role="statement" roleId="tpee.1068581517665" type="tp4k.AddKeystrokeStatement" typeId="tp4k.8131292300541727132" id="4419653827035140885">
              <node role="stroke" roleId="tp4k.8131292300541905245" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4419653827035140886">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4419653827035140869" resolveInfo="keyStroke" />
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1511345777278262457">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4419653827035140880">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4419653827035140869" resolveInfo="keyStroke" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.IsNotEmptyOperation" typeId="tpee.1225271408483" id="1511345777278263971" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="3911341278723465020">
    <node role="baseNodeBlock" roleId="tp4k.3743831881070611762" type="tp4k.BaseNodeBlock" typeId="tp4k.3743831881070657672" id="3911341278723465021">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3911341278723465022">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3911341278723465023">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3911341278723465024">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="tpcc.3552608880959246745" resolveInfo="ConceptEditorOpenHelper" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpcc.3552608880959246967" resolveInfo="getBaseNode" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_node" typeId="tp4k.1203853034639" id="3911341278723465025" />
          </node>
        </node>
      </node>
    </node>
    <node role="isApplicableBlock" roleId="tp4k.3743831881070657666" type="tp4k.IsApplicableTabBlock" typeId="tp4k.3743831881070613135" id="3911341278723465026">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3911341278723465027">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3911341278723465028">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3911341278723465029">
            <node role="operand" roleId="tpee.1197027771414" type="tp4k.ConceptFunctionParameter_node" typeId="tp4k.1203853034639" id="3911341278723465030" />
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="3911341278723465031">
              <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="3911341278723465032">
                <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="listenBlock" roleId="tp4k.3743831881070613134" type="tp4k.ListenBlock" typeId="tp4k.3743831881070657680" id="3911341278723465033">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3911341278723465034" />
    </node>
    <node role="nodesBlock" roleId="tp4k.3743831881070612960" type="tp4k.GetNodesBlock" typeId="tp4k.1203852029150" id="3911341278723465048">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3911341278723465049">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3911341278723465050">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3911341278723465051">
            <node role="operand" roleId="tpee.1197027771414" type="tp4k.ConceptFunctionParameter_node" typeId="tp4k.1203853034639" id="3911341278723465052" />
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ConceptMethodCall" typeId="tp25.1179409122411" id="3911341278723465053">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpcn.1567570417158062208" resolveInfo="findConceptAspectCollection" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="3911341278723465054">
                <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="ik8z.~LanguageAspect" resolveInfo="LanguageAspect" />
                <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="ik8z.~LanguageAspect%dREFACTORINGS" resolveInfo="REFACTORINGS" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="order" roleId="tp4k.3743831881070613126" type="tp4k.Order" typeId="tp4k.2450897840534683975" id="3911341278723465055">
      <node role="tab" roleId="tp4k.2450897840534683977" type="tp4k.EditorTabReference" typeId="tp4k.2450897840534683979" id="3911341278723465056">
        <link role="editorTab" roleId="tp4k.2450897840534683980" targetNodeId="tpcc.2542706524531725660" resolveInfo="Structure" />
      </node>
      <node role="tab" roleId="tp4k.2450897840534683977" type="tp4k.EditorTabReference" typeId="tp4k.2450897840534683979" id="3911341278723465057">
        <link role="editorTab" roleId="tp4k.2450897840534683980" targetNodeId="tpc0.7157723551789028023" resolveInfo="Editor" />
      </node>
      <node role="tab" roleId="tp4k.2450897840534683977" type="tp4k.EditorTabReference" typeId="tp4k.2450897840534683979" id="3911341278723465058">
        <link role="editorTab" roleId="tp4k.2450897840534683980" targetNodeId="tp1z.7157723551789065859" resolveInfo="Constraints" />
      </node>
      <node role="tab" roleId="tp4k.2450897840534683977" type="tp4k.EditorTabReference" typeId="tp4k.2450897840534683979" id="3911341278723465059">
        <link role="editorTab" roleId="tp4k.2450897840534683980" targetNodeId="7d1q.7157723551789059564" resolveInfo="Behavior" />
      </node>
      <node role="tab" roleId="tp4k.2450897840534683977" type="tp4k.EditorTabReference" typeId="tp4k.2450897840534683979" id="3911341278723465060">
        <link role="editorTab" roleId="tp4k.2450897840534683980" targetNodeId="tpdb.7157723551789225032" resolveInfo="Typesystem" />
      </node>
      <node role="tab" roleId="tp4k.2450897840534683977" type="tp4k.EditorTabReference" typeId="tp4k.2450897840534683979" id="3911341278723465061">
        <link role="editorTab" roleId="tp4k.2450897840534683980" targetNodeId="c9j3.7157723551789228701" resolveInfo="Actions" />
      </node>
      <node role="tab" roleId="tp4k.2450897840534683977" type="tp4k.EditorTabReference" typeId="tp4k.2450897840534683979" id="3911341278723465062">
        <link role="editorTab" roleId="tp4k.2450897840534683980" targetNodeId="3911341278723465020" resolveInfo="Refactorings" />
      </node>
    </node>
    <node role="icon" roleId="tp4k.2386275659558598338" type="tp4k.IconResource" typeId="tp4k.2330114057060456691" id="3911341278723469244">
      <property name="path" nameId="tp4k.7855019336153226684" value="${language_descriptor}/icons/refactoring.png" />
    </node>
    <node role="createTabBlock" roleId="tp4k.1640281869714699888" type="tp4k.CreateTabBlock" typeId="tp4k.1640281869714699879" id="1640281869715076457">
      <property name="commandOnCreate" nameId="tp4k.1640281869714699886" value="true" />
      <node role="conceptsBlock" roleId="tp4k.1640281869714699882" type="tp4k.GetConceptsBlock" typeId="tp4k.7692832593197705758" id="3911341278723465042">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3911341278723465043">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3911341278723465044">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3911341278723465045">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpcc.6388164970935848820" resolveInfo="getAvailableConceptAspects" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="tpcc.6388164970935848749" resolveInfo="ConceptEditorHelper" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="3911341278723465046">
                <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="ik8z.~LanguageAspect" resolveInfo="LanguageAspect" />
                <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="ik8z.~LanguageAspect%dREFACTORINGS" resolveInfo="REFACTORINGS" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_node" typeId="tp4k.1203853034639" id="3911341278723465047" />
            </node>
          </node>
        </node>
      </node>
      <node role="createBlock" roleId="tp4k.1640281869714699884" type="tp4k.NewCreateBlock" typeId="tp4k.7692832593197710972" id="3911341278723465035">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="3911341278723465036">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3911341278723465037">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="3911341278723465038">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="tpcc.6388164970935848749" resolveInfo="ConceptEditorHelper" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="tpcc.6388164970935848891" resolveInfo="createNewConceptAspectInstance" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="3911341278723465039">
                <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="ik8z.~LanguageAspect" resolveInfo="LanguageAspect" />
                <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="ik8z.~LanguageAspect%dREFACTORINGS" resolveInfo="REFACTORINGS" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_node" typeId="tp4k.1203853034639" id="3911341278723465040" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tp4k.ConceptFunctionParameter_Concept" typeId="tp4k.7692832593197710975" id="3911341278723465041" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

