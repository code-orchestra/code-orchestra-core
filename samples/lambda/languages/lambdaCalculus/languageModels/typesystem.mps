<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:8c01d5e0-82c3-43e7-9986-af954df6cb8b(jetbrains.mps.samples.lambdaCalculus.typesystem)">
  <persistence version="7" />
  <language namespace="7c9e2807-94ad-4afc-adf0-aaee45eb2895(jetbrains.mps.samples.lambdaCalculus)" />
  <language namespace="7a5dda62-9140-4668-ab76-d5ed1746f2b2(jetbrains.mps.lang.typesystem)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="3f4bc5f5-c6c1-4a28-8b10-c83066ffa4a1(jetbrains.mps.lang.constraints)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="3a13115c-633c-4c5c-bbcc-75c4219e9555(jetbrains.mps.lang.quotation)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="qjd" modelUID="r:d30b7004-00fd-4d3e-bdd6-6ae5346d9b86(jetbrains.mps.samples.lambdaCalculus.structure)" version="1" />
  <import index="tpd4" modelUID="r:00000000-0000-4000-0000-011c895902b4(jetbrains.mps.lang.typesystem.structure)" version="3" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tp3r" modelUID="r:00000000-0000-4000-0000-011c8959034b(jetbrains.mps.lang.quotation.structure)" version="0" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <roots>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6645816968628516758">
      <property name="name" nameId="tpck.1169194664001" value="typeof_BinaryOperation" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6645816968628542130">
      <property name="name" nameId="tpck.1169194664001" value="typeof_LambdaAbstraction" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="4530871765544527018">
      <property name="name" nameId="tpck.1169194664001" value="typeof_NumericConstant" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="4530871765544527021">
      <property name="name" nameId="tpck.1169194664001" value="typeof_StringConstant" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="4530871765544543935">
      <property name="name" nameId="tpck.1169194664001" value="typeof_LambdaApplication" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="3777111214477754429">
      <property name="name" nameId="tpck.1169194664001" value="typeof_MultipleExpression" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="1888188276221754553">
      <property name="name" nameId="tpck.1169194664001" value="typeof_BinaryNumericOperation" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="1888188276221891147">
      <property name="name" nameId="tpck.1169194664001" value="typeof_BinaryStringOperation" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="926857988255560016">
      <property name="name" nameId="tpck.1169194664001" value="typeof_LetRef" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="926857988255581396">
      <property name="name" nameId="tpck.1169194664001" value="typeof_LetExpression" />
    </node>
    <node type="tpd4.DependentComputationItem" typeId="tpd4.8058965347377019242" id="926857988255646368">
      <property name="name" nameId="tpck.1169194664001" value="LetReferenceTypeComputation" />
      <link role="applicableConcept" roleId="tpd4.8058965347377019243" targetNodeId="qjd.4939219901992083820" resolveInfo="LetRef" />
      <link role="blockingNodeConcept" roleId="tpd4.3036516800121956503" targetNodeId="qjd.4022026349914659049" resolveInfo="LambdaExpression" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="8899433705215952414">
      <property name="name" nameId="tpck.1169194664001" value="typeof_ParenthesisExpression" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="6997567109318694516">
      <property name="name" nameId="tpck.1169194664001" value="typeof_AbstractionVarRef" />
    </node>
  </roots>
  <root id="6645816968628516758">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6645816968628516759">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="6645816968628541097">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6645816968628541100">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6645816968628541093">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6645816968628541094">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6645816968628541095">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6645816968628516761" resolveInfo="binaryOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="6645816968628541096">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.1934341835352312156" />
              </node>
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1888188276221891128">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1888188276221891129">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1888188276221891131">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1888188276221891132">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6645816968628516761" resolveInfo="binaryOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1888188276221891133">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.1934341835352312157" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="4530871765544565313">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4530871765544565316">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="4530871765544565317">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4530871765544565319">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6645816968628516761" resolveInfo="binaryOperation" />
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1888188276221891134">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1888188276221891135">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1888188276221891136">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1888188276221891137">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6645816968628516761" resolveInfo="binaryOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1888188276221891138">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.1934341835352312157" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6645816968628516761">
      <property name="name" nameId="tpck.1169194664001" value="binaryOperation" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="qjd.1934341835352312155" resolveInfo="BinaryOperation" />
    </node>
  </root>
  <root id="6645816968628542130">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6645816968628542131">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.TypeVarDeclaration" typeId="tpd4.1174665551739" id="627759474950188093">
        <property name="name" nameId="tpck.1169194664001" value="R" />
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="627759474950193612">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="627759474950193613">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="627759474950193614">
            <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="627759474950188093" resolveInfo="R" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="627759474950193615">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="627759474950193616">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="627759474950193617">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="627759474950193618">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6645816968628542133" resolveInfo="lambdaAbstraction" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="627759474950193619">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.4022026349914762693" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="627759474950193488">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="627759474950193489">
          <property name="name" nameId="tpck.1169194664001" value="result" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="627759474950193490" />
          <node role="initializer" roleId="tpee.1068431790190" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="627759474950193624">
            <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="627759474950188093" resolveInfo="R" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6997567109318329761">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6997567109318329762">
          <property name="name" nameId="tpck.1169194664001" value="reversedNodes" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="6997567109318329763">
            <link role="elementConcept" roleId="tp25.1145383142433" targetNodeId="qjd.4022026349914673025" resolveInfo="AbstractionVariable" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6997567109318355544">
            <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeListCreator" typeId="tp25.1145567426890" id="6997567109318355545">
              <node role="createdType" roleId="tp25.1145567471833" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="6997567109318355546">
                <link role="elementConcept" roleId="tp25.1145383142433" targetNodeId="qjd.4022026349914673025" resolveInfo="AbstractionVariable" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6997567109318334060">
        <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6997567109318334061">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6997567109318355510">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6997567109318355511">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6997567109318355512">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6997567109318329762" resolveInfo="reversedNodes" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddFirstElementOperation" typeId="tp2q.1227022159410" id="6997567109318507664">
                <node role="argument" roleId="tp2q.1227022622978" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6997567109318507670">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6997567109318334064" resolveInfo="node" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="iterable" roleId="tpee.1144226360166" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6997567109318334084">
          <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6997567109318334079">
            <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6645816968628542133" resolveInfo="lambdaAbstraction" />
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="8981808925914833029">
            <link role="link" roleId="tp25.1138056546658" targetNodeId="qjd.4022026349914762681" />
          </node>
        </node>
        <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6997567109318334064">
          <property name="name" nameId="tpck.1169194664001" value="node" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="6997567109318334074">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="qjd.4022026349914673025" resolveInfo="AbstractionVariable" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="627759474950185098">
        <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="627759474950185099">
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.TypeVarDeclaration" typeId="tpd4.1174665551739" id="6115593414628019700">
            <property name="name" nameId="tpck.1169194664001" value="D" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="627759474950193423">
            <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="627759474950193501">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="627759474950193502">
                <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="6115593414628019700" resolveInfo="D" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="627759474950193433">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="627759474950193434">
                <node role="term" roleId="tpd4.1174657509053" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="627759474950193494">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="627759474950185102" resolveInfo="node" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6997567109318355518">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6997567109318355519">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6997567109318355520">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="627759474950193489" resolveInfo="result" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="6997567109318355521">
                <node role="quotedNode" roleId="tp3r.1196350785114" type="qjd.FunctionType" typeId="qjd.4530871765544139496" id="6997567109318355522">
                  <node role="domain" roleId="qjd.4530871765544139497" type="qjd.LambdaType" typeId="qjd.4530871765544139480" id="6997567109318355523">
                    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="6997567109318355524">
                      <node role="expression" roleId="tp3r.1196350785111" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="6997567109318355529">
                        <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="6115593414628019700" resolveInfo="D" />
                      </node>
                    </node>
                  </node>
                  <node role="range" roleId="qjd.4530871765544139498" type="qjd.LambdaType" typeId="qjd.4530871765544139480" id="6997567109318355526">
                    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="6997567109318355527">
                      <node role="expression" roleId="tp3r.1196350785111" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6997567109318355530">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="627759474950193489" resolveInfo="result" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6997567109318355492">
          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6997567109318329762" resolveInfo="reversedNodes" />
        </node>
        <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="627759474950185102">
          <property name="name" nameId="tpck.1169194664001" value="node" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="627759474950185106">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="qjd.4022026349914673025" resolveInfo="AbstractionVariable" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="6115593414628019716">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="627759474950193531">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="627759474950193532">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="627759474950193489" resolveInfo="result" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6115593414628019726">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6115593414628019727">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6115593414628019733">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6645816968628542133" resolveInfo="lambdaAbstraction" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6645816968628542133">
      <property name="name" nameId="tpck.1169194664001" value="lambdaAbstraction" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="qjd.4022026349914673024" resolveInfo="LambdaAbstraction" />
    </node>
  </root>
  <root id="4530871765544527018">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="4530871765544527019">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="4530871765544543924">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4530871765544543927">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="4530871765544543928">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4530871765544543930">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4530871765544527020" resolveInfo="numericConstant" />
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4530871765544543931">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="4530871765544543932">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="qjd.NumberType" typeId="qjd.4530871765544139482" id="4530871765544543934" />
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="4530871765544527020">
      <property name="name" nameId="tpck.1169194664001" value="numericConstant" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="qjd.4022026349914762709" resolveInfo="NumericConstant" />
    </node>
  </root>
  <root id="4530871765544527021">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="4530871765544527022">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="4530871765544529988">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4530871765544529991">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="4530871765544529992">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4530871765544543919">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4530871765544527023" resolveInfo="stringConstant" />
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4530871765544543920">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="4530871765544543921">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="qjd.StringType" typeId="qjd.4530871765544139489" id="4530871765544543923" />
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="4530871765544527023">
      <property name="name" nameId="tpck.1169194664001" value="stringConstant" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="qjd.4022026349914762696" resolveInfo="StringConstant" />
    </node>
  </root>
  <root id="4530871765544543935">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="4530871765544543936">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.TypeVarDeclaration" typeId="tpd4.1174665551739" id="247065157659474768">
        <property name="name" nameId="tpck.1169194664001" value="R" />
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="247065157659474769">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="247065157659474770">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="247065157659474771">
            <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="247065157659474768" resolveInfo="R" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="247065157659474772">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="247065157659474773">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="247065157659474842">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4530871765544543937" resolveInfo="lambdaApplication" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="247065157659474777">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="247065157659474778">
          <property name="name" nameId="tpck.1169194664001" value="result" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="247065157659474779" />
          <node role="initializer" roleId="tpee.1068431790190" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="247065157659474780">
            <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="247065157659474768" resolveInfo="R" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="247065157659474785">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="247065157659474786">
          <property name="name" nameId="tpck.1169194664001" value="reversedNodes" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="247065157659474787">
            <link role="elementConcept" roleId="tp25.1145383142433" targetNodeId="qjd.4022026349914659049" resolveInfo="LambdaExpression" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="247065157659474788">
            <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeListCreator" typeId="tp25.1145567426890" id="247065157659474789">
              <node role="createdType" roleId="tp25.1145567471833" type="tp25.SNodeListType" typeId="tp25.1145383075378" id="247065157659474790">
                <link role="elementConcept" roleId="tp25.1145383142433" targetNodeId="qjd.4022026349914659049" resolveInfo="LambdaExpression" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="247065157659474791">
        <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="247065157659474792">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="247065157659474793">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="247065157659474794">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="247065157659474795">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="247065157659474786" resolveInfo="reversedNodes" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.AddFirstElementOperation" typeId="tp2q.1227022159410" id="247065157659474796">
                <node role="argument" roleId="tp2q.1227022622978" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="247065157659474797">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="247065157659474801" resolveInfo="node" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="iterable" roleId="tpee.1144226360166" type="tpee.DotExpression" typeId="tpee.1197027756228" id="247065157659474798">
          <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="247065157659474843">
            <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4530871765544543937" resolveInfo="lambdaApplication" />
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="247065157659496211">
            <link role="link" roleId="tp25.1138056546658" targetNodeId="qjd.4022026349914762721" />
          </node>
        </node>
        <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="247065157659474801">
          <property name="name" nameId="tpck.1169194664001" value="node" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="247065157659474802">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="qjd.4022026349914659049" resolveInfo="LambdaExpression" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="247065157659474803">
        <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="247065157659474804">
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.TypeVarDeclaration" typeId="tpd4.1174665551739" id="247065157659474805">
            <property name="name" nameId="tpck.1169194664001" value="D" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="247065157659474806">
            <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="247065157659474807">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="247065157659474808">
                <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="247065157659474805" resolveInfo="D" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="247065157659474809">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="247065157659474810">
                <node role="term" roleId="tpd4.1174657509053" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="247065157659474811">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="247065157659474824" resolveInfo="node" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="247065157659474812">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="247065157659474813">
              <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="247065157659474814">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="247065157659474778" resolveInfo="result" />
              </node>
              <node role="rValue" roleId="tpee.1068498886297" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="247065157659474815">
                <node role="quotedNode" roleId="tp3r.1196350785114" type="qjd.FunctionType" typeId="qjd.4530871765544139496" id="247065157659474816">
                  <node role="domain" roleId="qjd.4530871765544139497" type="qjd.LambdaType" typeId="qjd.4530871765544139480" id="247065157659474817">
                    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="247065157659474818">
                      <node role="expression" roleId="tp3r.1196350785111" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="247065157659474819">
                        <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="247065157659474805" resolveInfo="D" />
                      </node>
                    </node>
                  </node>
                  <node role="range" roleId="qjd.4530871765544139498" type="qjd.LambdaType" typeId="qjd.4530871765544139480" id="247065157659474820">
                    <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="247065157659474821">
                      <node role="expression" roleId="tp3r.1196350785111" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="247065157659474822">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="247065157659474778" resolveInfo="result" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="247065157659474823">
          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="247065157659474786" resolveInfo="reversedNodes" />
        </node>
        <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="247065157659474824">
          <property name="name" nameId="tpck.1169194664001" value="node" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="247065157659474825">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="qjd.4022026349914659049" resolveInfo="LambdaExpression" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="247065157659474826">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="247065157659474827">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="247065157659474828">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="247065157659474778" resolveInfo="result" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="247065157659474829">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="247065157659474830">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="247065157659496244">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="247065157659496243">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4530871765544543937" resolveInfo="lambdaApplication" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="247065157659496248">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.4022026349914762720" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="4530871765544543937">
      <property name="name" nameId="tpck.1169194664001" value="lambdaApplication" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="qjd.4022026349914762717" resolveInfo="LambdaApplication" />
    </node>
  </root>
  <root id="3777111214477754429">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="3777111214477754430">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="3777111214477757400">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3777111214477757404">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="3777111214477757405">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3777111214477849116">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3777111214477757408">
                <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="3777111214477757407">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3777111214477754431" resolveInfo="multipleExpression" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="3777111214477778772">
                  <link role="link" roleId="tp25.1138056546658" targetNodeId="qjd.1564819815921013156" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetLastOperation" typeId="tp2q.1165595910856" id="3777111214477849132" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3777111214477757403">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="3777111214477754433">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="3777111214477757399">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3777111214477754431" resolveInfo="multipleExpression" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="3777111214477754431">
      <property name="name" nameId="tpck.1169194664001" value="multipleExpression" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="qjd.1564819815921013155" resolveInfo="MultipleExpression" />
    </node>
  </root>
  <root id="1888188276221754553">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="1888188276221754554">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="1888188276221891124">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1888188276221891127">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1888188276221891115">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1888188276221891117">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1888188276221891116">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1888188276221869743" resolveInfo="binaryNumericOperation" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1888188276221891121">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.1934341835352312156" />
              </node>
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1888188276221891143">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1888188276221891144">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="qjd.NumberType" typeId="qjd.4530871765544139482" id="1888188276221891146" />
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1888188276221869743">
      <property name="name" nameId="tpck.1169194664001" value="binaryNumericOperation" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="qjd.1888188276221754548" resolveInfo="BinaryNumericOperation" />
    </node>
  </root>
  <root id="1888188276221891147">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="1888188276221891148">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="1888188276221891155">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1888188276221891159">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1888188276221891160">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="qjd.StringType" typeId="qjd.4530871765544139489" id="1888188276221891162" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1888188276221891158">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1888188276221891152">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1888188276221891154">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1888188276221891150" resolveInfo="binaryStringOperation" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1888188276221891150">
      <property name="name" nameId="tpck.1169194664001" value="binaryStringOperation" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="qjd.1888188276221754550" resolveInfo="BinaryStringOperation" />
    </node>
  </root>
  <root id="926857988255560016">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="926857988255560017">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="926857988255646367" />
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="926857988255721981">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="926857988255721984">
          <property name="name" nameId="tpck.1169194664001" value="type" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="926857988255721986" />
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="926857988255646354">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="926857988255646351">
              <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="464844656889912499">
                <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="464844656889912495">
                  <link role="concept" roleId="tp25.1140138128738" targetNodeId="qjd.4939219901991602079" resolveInfo="LetExpression" />
                  <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.DotExpression" typeId="tpee.1197027756228" id="464844656889912488">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="926857988255721960">
                      <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="926857988255646353">
                        <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="926857988255560018" resolveInfo="letRef" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3100399657864839971">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.8981808925914862844" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="464844656889912493" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="464844656889912504">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.4939219901991602080" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_CopyOperation" typeId="tp25.1144146199828" id="926857988255646358" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="926857988255722006">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="926857988255722007">
          <property name="name" nameId="tpck.1169194664001" value="map" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp2q.MapType" typeId="tp2q.1197683403723" id="926857988255722008">
            <node role="keyType" roleId="tp2q.1197683466920" type="tpee.StringType" typeId="tpee.1225271177708" id="199058371937604877" />
            <node role="valueType" roleId="tp2q.1197683475734" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1028109749174459407">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpd4.1185281562363" resolveInfo="RuntimeTypeVariable" />
            </node>
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="926857988255724991">
            <node role="creator" roleId="tpee.1145553007750" type="tp2q.HashMapCreator" typeId="tp2q.1197686869805" id="926857988255724992">
              <node role="keyType" roleId="tp2q.1197687026896" type="tpee.StringType" typeId="tpee.1225271177708" id="199058371937604878" />
              <node role="valueType" roleId="tp2q.1197687035757" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1028109749174459456">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpd4.1185281562363" resolveInfo="RuntimeTypeVariable" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="403206377113602940">
        <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="403206377113602941">
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.TypeVarDeclaration" typeId="tpd4.1174665551739" id="464844656889754475">
            <property name="name" nameId="tpck.1169194664001" value="v" />
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="464844656889778878">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="464844656889778879">
              <property name="name" nameId="tpck.1169194664001" value="varNode" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="464844656889778880" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="464844656889778882">
                <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="464844656889754475" resolveInfo="v" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="464844656889754476">
            <node role="condition" roleId="tpee.1068580123160" type="tpee.NotExpression" typeId="tpee.1081516740877" id="464844656889754477">
              <node role="expression" roleId="tpee.1081516765348" type="tpee.DotExpression" typeId="tpee.1197027756228" id="464844656889754478">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="464844656889754479">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="926857988255722007" resolveInfo="map" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.ContainsKeyOperation" typeId="tp2q.1201306600024" id="464844656889754480">
                  <node role="key" roleId="tp2q.1201654602639" type="tpee.DotExpression" typeId="tpee.1197027756228" id="464844656889754481">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="464844656889754482">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="403206377113602944" resolveInfo="t" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="464844656889754483">
                      <link role="property" roleId="tp25.1138056395725" targetNodeId="tpck.1169194664001" resolveInfo="name" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="464844656889754484">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="464844656889754485">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="464844656889754486">
                  <node role="rValue" roleId="tpee.1068498886297" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="464844656889754487">
                    <link role="concept" roleId="tp25.1140138128738" targetNodeId="tpd4.1185281562363" resolveInfo="RuntimeTypeVariable" />
                    <node role="leftExpression" roleId="tp25.1140138123956" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="464844656889754488">
                      <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="464844656889754475" resolveInfo="v" />
                    </node>
                  </node>
                  <node role="lValue" roleId="tpee.1068498886295" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="464844656889754489">
                    <node role="key" roleId="tp2q.1197932525128" type="tpee.DotExpression" typeId="tpee.1197027756228" id="464844656889754490">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="464844656889754491">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="403206377113602944" resolveInfo="t" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="464844656889754492">
                        <link role="property" roleId="tp25.1138056395725" targetNodeId="tpck.1169194664001" resolveInfo="name" />
                      </node>
                    </node>
                    <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="464844656889754493">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="926857988255722007" resolveInfo="map" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="464844656889778886">
              <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="464844656889778887">
                <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="464844656889754494">
                  <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="464844656889754495">
                    <node role="normalType" roleId="tpd4.1185788644032" type="tp2q.MapElement" typeId="tp2q.1197932370469" id="464844656889754496">
                      <node role="map" roleId="tp2q.1197932505799" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="464844656889754497">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="926857988255722007" resolveInfo="map" />
                      </node>
                      <node role="key" roleId="tp2q.1197932525128" type="tpee.DotExpression" typeId="tpee.1197027756228" id="464844656889754498">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="464844656889754499">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="403206377113602944" resolveInfo="t" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="464844656889754500">
                          <link role="property" roleId="tp25.1138056395725" targetNodeId="tpck.1169194664001" resolveInfo="name" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="464844656889754501">
                    <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeVarReference" typeId="tpd4.1174666260556" id="464844656889754502">
                      <link role="typeVarDeclaration" roleId="tpd4.1174666276259" targetNodeId="464844656889754475" resolveInfo="v" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="464844656889754539">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="464844656889754541">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="464844656889757509">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="403206377113602944" resolveInfo="t" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_ReplaceWithAnotherOperation" typeId="tp25.1140131837776" id="464844656889778872">
                <node role="replacementNode" roleId="tp25.1140131861877" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="464844656889778883">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="464844656889778879" resolveInfo="varNode" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="403206377113602944">
          <property name="name" nameId="tpck.1169194664001" value="t" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="403206377113602950">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpd4.1185281562363" resolveInfo="RuntimeTypeVariable" />
          </node>
        </node>
        <node role="iterable" roleId="tpee.1144226360166" type="tpee.DotExpression" typeId="tpee.1197027756228" id="403206377113602955">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="403206377113602956">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="926857988255721984" resolveInfo="type" />
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetDescendantsOperation" typeId="tp25.1171305280644" id="403206377113602957">
            <node role="parameter" roleId="tp25.1144104376918" type="tp25.OperationParm_Concept" typeId="tp25.1144101972840" id="403206377113602958">
              <node role="conceptArgument" roleId="tp25.1207343664468" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="403206377113602959">
                <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="tpd4.1185281562363" resolveInfo="RuntimeTypeVariable" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="403206377113910078">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="403206377113910082">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="403206377113910083">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="926857988255721984" resolveInfo="type" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="403206377113910081">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="403206377113910075">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="403206377113910077">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="926857988255560018" resolveInfo="letRef" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="926857988255560018">
      <property name="name" nameId="tpck.1169194664001" value="letRef" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="qjd.4939219901992083820" resolveInfo="LetRef" />
    </node>
  </root>
  <root id="926857988255581396">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="926857988255581397">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="8648463567088576075">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8648463567088576079">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="8648463567088576080">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8648463567088576083">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8648463567088576082">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="926857988255581398" resolveInfo="letExpression" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8648463567088576087">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.4939219901991602080" />
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8648463567088576078">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="8648463567088554707">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8648463567088554710">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8648463567088554709">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="926857988255581398" resolveInfo="letExpression" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8981808925914833037">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.8360767178776358704" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="2952945671068962366">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2952945671068962370">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2952945671068962371">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2952945671068962374">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2952945671068962373">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="926857988255581398" resolveInfo="letExpression" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2952945671068983709">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.4939219901991602081" />
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2952945671068962369">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2952945671068962363">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2952945671068962365">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="926857988255581398" resolveInfo="letExpression" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="926857988255581398">
      <property name="name" nameId="tpck.1169194664001" value="letExpression" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="qjd.4939219901991602079" resolveInfo="LetExpression" />
    </node>
  </root>
  <root id="926857988255646368">
    <node role="findMasterBlock" roleId="tpd4.8058965347377049978" type="tpd4.DependentComputationItem_FindMasterBlock" typeId="tpd4.8058965347377049973" id="926857988255646369">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="926857988255646370">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="926857988255721940">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="926857988255721955">
            <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="926857988255721953">
              <link role="concept" roleId="tp25.1140138128738" targetNodeId="qjd.4939219901991602079" resolveInfo="LetExpression" />
              <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.DotExpression" typeId="tpee.1197027756228" id="926857988255721947">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="926857988255721942">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ConceptFunctionParameter_DependentComputationNode" typeId="tpd4.8058965347377019245" id="926857988255721941" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="199058371937604563">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.8981808925914862844" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="926857988255721951" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="926857988255721959">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.4939219901991602080" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="isBlockingBlock" roleId="tpd4.3000845361816457072" type="tpd4.DependentComputationItem_BlockingBlock" typeId="tpd4.7884032992241804516" id="926857988255646371">
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="926857988255646372">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="926857988255721921">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="926857988255721922">
            <property name="name" nameId="tpck.1169194664001" value="parent" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="926857988255721923" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="926857988255721924">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ConceptFunctionParameter_BlockingComputationNode" typeId="tpd4.7884032992241804520" id="926857988255721925" />
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="926857988255721926" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="926857988255721904">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AndExpression" typeId="tpee.1080120340718" id="926857988255721918">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="926857988255721936">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpd4.ConceptFunctionParameter_BlockingComputationNode" typeId="tpd4.7884032992241804520" id="926857988255721939" />
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="926857988255721931">
                <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="926857988255721929">
                  <link role="concept" roleId="tp25.1140138128738" targetNodeId="qjd.4939219901991602079" resolveInfo="LetExpression" />
                  <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="926857988255721928">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="926857988255721922" resolveInfo="parent" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="926857988255721935">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.4939219901991602080" />
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="926857988255721911">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="926857988255721927">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="926857988255721922" resolveInfo="parent" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="926857988255721915">
                <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="926857988255721917">
                  <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="qjd.4939219901991602079" resolveInfo="LetExpression" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="8899433705215952414">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="8899433705215952415">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="8899433705215955377">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8899433705215955381">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="8899433705215955382">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8899433705215955385">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8899433705215955384">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8899433705215952416" resolveInfo="parenthesisExpression" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="8899433705215976720">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.3978364766705449818" />
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8899433705215955380">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="8899433705215952418">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8899433705215955376">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8899433705215952416" resolveInfo="parenthesisExpression" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="8899433705215952416">
      <property name="name" nameId="tpck.1169194664001" value="parenthesisExpression" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="qjd.3978364766705449817" resolveInfo="ParenthesisExpression" />
    </node>
  </root>
  <root id="6997567109318694516">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="6997567109318694517">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="6997567109318694523">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6997567109318694527">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6997567109318694528">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6997567109318694531">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6997567109318694530">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6997567109318694518" resolveInfo="abstractionVarRef" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3100399657864839949">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="qjd.8981808925914862845" />
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="6997567109318694526">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="6997567109318694520">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="6997567109318694522">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="6997567109318694518" resolveInfo="abstractionVarRef" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="6997567109318694518">
      <property name="name" nameId="tpck.1169194664001" value="abstractionVarRef" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="qjd.4022026349915821199" resolveInfo="AbstractionVarRef" />
    </node>
  </root>
</model>

