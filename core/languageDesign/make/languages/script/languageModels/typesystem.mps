<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:b90ae0cf-6b91-458a-92d0-e5bf2ada7de4(jetbrains.mps.make.script.typesystem)">
  <persistence version="7" />
  <language namespace="7a5dda62-9140-4668-ab76-d5ed1746f2b2(jetbrains.mps.lang.typesystem)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="95f8a3e6-f994-4ca0-a65e-763c9bae2d3b(jetbrains.mps.make.script)" />
  <language namespace="d4615e3b-d671-4ba9-af01-2b78369b0ba7(jetbrains.mps.lang.pattern)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="3a13115c-633c-4c5c-bbcc-75c4219e9555(jetbrains.mps.lang.quotation)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="q9ra" modelUID="r:308041c6-80bc-4e26-b4b1-473fd45c9339(jetbrains.mps.make.script.structure)" version="-1" />
  <import index="yo81" modelUID="r:4ea5a78b-cb8a-4831-b227-f7860a22491d(jetbrains.mps.make.resources)" version="-1" />
  <import index="tpd4" modelUID="r:00000000-0000-4000-0000-011c895902b4(jetbrains.mps.lang.typesystem.structure)" version="3" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp3t" modelUID="r:00000000-0000-4000-0000-011c89590345(jetbrains.mps.lang.pattern.structure)" version="0" implicit="yes" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="tp3r" modelUID="r:00000000-0000-4000-0000-011c8959034b(jetbrains.mps.lang.quotation.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpd4.ComparisonRule" typeId="tpd4.1188811367543" id="2360002718792535571">
      <property name="name" nameId="tpck.1169194664001" value="ResourceType_comparableWith_IResource" />
      <property name="isWeak" nameId="tpd4.1175607673137" value="true" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="job" />
    </node>
    <node type="tpd4.SubtypingRule" typeId="tpd4.1175147670730" id="2360002718792583537">
      <property name="name" nameId="tpck.1169194664001" value="ResourceType_subtypeOf_IResource" />
      <property name="isWeak" nameId="tpd4.1175607673137" value="true" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="job" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="2360002718792622204">
      <property name="name" nameId="tpck.1169194664001" value="typeof_OutputResources" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="job" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="505095865854557931">
      <property name="name" nameId="tpck.1169194664001" value="typeof_OptionExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="query" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="1977954644795311537">
      <property name="name" nameId="tpck.1169194664001" value="typeof_RelayQueryExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="query" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="187226666892735701">
      <property name="name" nameId="tpck.1169194664001" value="typeof_DoneWorkStatement" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="job.progress" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="187226666892740072">
      <property name="name" nameId="tpck.1169194664001" value="typeof_BeginWorkStatement" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="job.progress" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="3297237684108627666">
      <property name="name" nameId="tpck.1169194664001" value="typeof_AllWorkLeftExpression" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="job.progress" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="8170824575195246249">
      <property name="name" nameId="tpck.1169194664001" value="typeof_PropertiesAccessorParameter" />
      <property name="virtualPackage" nameId="tpck.1193676396447" value="job" />
    </node>
  </roots>
  <root id="2360002718792535571">
    <node role="anotherNode" roleId="tpd4.1188820750135" type="tpd4.PatternCondition" typeId="tpd4.1174642900584" id="2360002718792535575">
      <property name="name" nameId="tpck.1169194664001" value="res" />
      <node role="pattern" roleId="tpd4.1174642936809" type="tp3t.PatternExpression" typeId="tp3t.1136720037777" id="2360002718792535576">
        <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2385767983320939532">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yo81.6168415856807657256" resolveInfo="IResource" />
        </node>
      </node>
    </node>
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="2360002718792535573">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2360002718792583534">
        <node role="expression" roleId="tpee.1068581517676" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="2360002718792583536">
          <property name="value" nameId="tpee.1068580123138" value="true" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2360002718792535574">
      <property name="name" nameId="tpck.1169194664001" value="rt" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="q9ra.2360002718792446594" resolveInfo="ResourceType" />
    </node>
  </root>
  <root id="2360002718792583537">
    <node role="body" roleId="tpd4.1175147624276" type="tpee.StatementList" typeId="tpee.1068580123136" id="2360002718792583538">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="2360002718792583542">
        <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="2360002718792583544">
          <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="2360002718792614833">
            <node role="elementType" roleId="tp2q.1237721435807" type="tp25.SNodeType" typeId="tp25.1138055754698" id="2360002718792614836" />
            <node role="initValue" roleId="tp2q.1237721435808" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2360002718792614838">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="2360002718792614841">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yo81.6168415856807657256" resolveInfo="IResource" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2360002718792583539">
      <property name="name" nameId="tpck.1169194664001" value="rt" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="q9ra.2360002718792446594" resolveInfo="ResourceType" />
    </node>
  </root>
  <root id="2360002718792622204">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="2360002718792622205">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="2360002718792622216">
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2360002718792622220">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2360002718792622208">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2360002718792622211">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2360002718792622210">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="2360002718792622206" resolveInfo="or" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="2360002718792622215">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="q9ra.2360002718792622193" />
              </node>
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2360002718792622221">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="2360002718792622222">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpd4.JoinType" typeId="tpd4.1179479408386" id="2360002718792622224">
              <node role="argument" roleId="tpd4.1179479418730" type="q9ra.ResourceType" typeId="q9ra.2360002718792446594" id="2360002718792622226" />
              <node role="argument" roleId="tpd4.1179479418730" type="tp2q.SequenceType" typeId="tp2q.1151689724996" id="2360002718792622228">
                <node role="elementType" roleId="tp2q.1151689745422" type="q9ra.ResourceType" typeId="q9ra.2360002718792446594" id="2360002718792622231" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="2360002718792622206">
      <property name="name" nameId="tpck.1169194664001" value="or" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="q9ra.2360002718792622184" resolveInfo="OutputResources" />
    </node>
  </root>
  <root id="505095865854557931">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="505095865854557932">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="505095865854557938">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="505095865854557943">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="505095865854557944">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="q9ra.OptionType" typeId="q9ra.505095865854384053" id="505095865854557946">
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="505095865854557947">
                <property name="linkRole" nameId="tpck.1757699476691236116" value="expectedOption" />
                <node role="expression" roleId="tp3r.1196350785111" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="505095865854557960">
                  <link role="concept" roleId="tp25.1140138128738" targetNodeId="q9ra.505095865854384059" resolveInfo="ExpectedOption" />
                  <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.DotExpression" typeId="tpee.1197027756228" id="505095865854557955">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="505095865854557950">
                      <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="505095865854557949">
                        <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="505095865854557933" resolveInfo="oe" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="505095865854557954">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="q9ra.505095865854384051" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="505095865854557959" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="505095865854557941">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="505095865854557935">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="505095865854557937">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="505095865854557933" resolveInfo="oe" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="505095865854557933">
      <property name="name" nameId="tpck.1169194664001" value="oe" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="q9ra.505095865854384050" resolveInfo="OptionExpression" />
    </node>
  </root>
  <root id="1977954644795311537">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="1977954644795311538">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="1977954644795311540">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1977954644795311541">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1977954644795311542">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="q9ra.OptionType" typeId="q9ra.505095865854384053" id="1977954644795311543">
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="1977954644795311544">
                <property name="linkRole" nameId="tpck.1757699476691236116" value="expectedOption" />
                <node role="expression" roleId="tp3r.1196350785111" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="1977954644795311545">
                  <property name="asCast" nameId="tp25.1238684351431" value="true" />
                  <link role="concept" roleId="tp25.1140138128738" targetNodeId="q9ra.505095865854384059" resolveInfo="ExpectedOption" />
                  <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1977954644795311546">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1977954644795311547">
                      <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1977954644795311548">
                        <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1977954644795311539" resolveInfo="rqe" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1977954644795311554">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="q9ra.1977954644795311522" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1977954644795311550">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="q9ra.505095865854384068" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1977954644795311551">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1977954644795311552">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1977954644795311553">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="1977954644795311539" resolveInfo="rqe" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="1977954644795311539">
      <property name="name" nameId="tpck.1169194664001" value="rqe" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="q9ra.1977954644795311519" resolveInfo="RelayQueryExpression" />
    </node>
  </root>
  <root id="187226666892735701">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="187226666892735702">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="187226666892740048">
        <property name="checkOnly" nameId="tpd4.1206359757216" value="true" />
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="187226666892740053">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="187226666892740054">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.IntegerType" typeId="tpee.1070534370425" id="187226666892740056" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="187226666892740052">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="187226666892740040">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="187226666892740043">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="187226666892740042">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="187226666892735703" resolveInfo="dws" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="187226666892740047">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="q9ra.187226666892735700" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1906791586424054379">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1906791586424054380">
          <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="1906791586424054403">
            <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
            <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1906791586424054408">
              <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1906791586424054409">
                <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.StringType" typeId="tpee.1225271177708" id="1906791586424054412" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="1906791586424054407">
              <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="1906791586424054395">
                <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1906791586424054398">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1906791586424054397">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="187226666892735703" resolveInfo="dws" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1906791586424054402">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="q9ra.1906791586424011776" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1906791586424054389">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1906791586424054384">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="1906791586424054383">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="187226666892735703" resolveInfo="dws" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1906791586424054388">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="q9ra.1906791586424011776" />
            </node>
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsNotNullOperation" typeId="tp25.1172008320231" id="1906791586424054393" />
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="187226666892735703">
      <property name="name" nameId="tpck.1169194664001" value="dws" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="q9ra.187226666892683652" resolveInfo="AdvanceWorkStatement" />
    </node>
  </root>
  <root id="187226666892740072">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="187226666892740073">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="187226666892740075">
        <property name="checkOnly" nameId="tpd4.1206359757216" value="true" />
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="187226666892740077">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="187226666892740078">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.IntegerType" typeId="tpee.1070534370425" id="187226666892740079" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="187226666892740080">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="187226666892740081">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="187226666892740082">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="187226666892740085">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="187226666892740074" resolveInfo="bws" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="187226666892740086">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="q9ra.187226666892740070" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateLessThanInequationStatement" typeId="tpd4.1174663118805" id="187226666892740088">
        <property name="checkOnly" nameId="tpd4.1206359757216" value="true" />
        <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="187226666892740090">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="187226666892740091">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.IntegerType" typeId="tpee.1070534370425" id="187226666892740092" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="187226666892740093">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="187226666892740094">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="187226666892740095">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="187226666892740098">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="187226666892740074" resolveInfo="bws" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="187226666892740099">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="q9ra.187226666892740071" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="187226666892740074">
      <property name="name" nameId="tpck.1169194664001" value="bws" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="q9ra.187226666892683650" resolveInfo="BeginWorkStatement" />
    </node>
  </root>
  <root id="3297237684108627666">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="3297237684108627667">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="3297237684108627674">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3297237684108627678">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="3297237684108627679">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.IntegerType" typeId="tpee.1070534370425" id="3297237684108627681" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3297237684108627677">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="3297237684108627671">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="3297237684108627673">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3297237684108627668" resolveInfo="awl" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="3297237684108627668">
      <property name="name" nameId="tpck.1169194664001" value="awl" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="q9ra.3297237684108627658" resolveInfo="AllWorkLeftExpression" />
    </node>
  </root>
  <root id="8170824575195246249">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="8170824575195246250">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="8170824575195246257">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8170824575195246261">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="8170824575195246262">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8170824575195246265">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="yo81.3353120829256410483" resolveInfo="IPropertiesAccessor" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="8170824575195246260">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="8170824575195246253">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="8170824575195246256">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="8170824575195246251" resolveInfo="pap" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="8170824575195246251">
      <property name="name" nameId="tpck.1169194664001" value="pap" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="q9ra.8170824575195231721" resolveInfo="PropertiesAccessorParameter" />
    </node>
  </root>
</model>

