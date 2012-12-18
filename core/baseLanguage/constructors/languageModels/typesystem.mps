<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:c19fbfce-5c58-4528-8b93-60edfa062cac(jetbrains.mps.baseLanguage.constructors.typesystem)">
  <persistence version="7" />
  <language namespace="7a5dda62-9140-4668-ab76-d5ed1746f2b2(jetbrains.mps.lang.typesystem)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="0ae47ad3-5abd-486c-ac0f-298884f39393(jetbrains.mps.baseLanguage.constructors)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="3a13115c-633c-4c5c-bbcc-75c4219e9555(jetbrains.mps.lang.quotation)" />
  <devkit namespace="fbc25dd2-5da4-483a-8b19-70928e1b62d7(jetbrains.mps.devkit.general-purpose)" />
  <import index="fbxt" modelUID="r:bd4b8fd9-079b-4b11-a733-9c0bea3600f2(jetbrains.mps.baseLanguage.constructors.structure)" version="0" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(java.lang@java_stub)" version="-1" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" implicit="yes" />
  <import index="tpd4" modelUID="r:00000000-0000-4000-0000-011c895902b4(jetbrains.mps.lang.typesystem.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp3r" modelUID="r:00000000-0000-4000-0000-011c8959034b(jetbrains.mps.lang.quotation.structure)" version="0" implicit="yes" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <roots>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="3041831561922455919">
      <property name="name" nameId="tpck.1169194664001" value="typeof_CustomConstructorUsage" />
      <property name="overrides" nameId="tpd4.1195213689297" value="true" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="7085790726146865267">
      <property name="name" nameId="tpck.1169194664001" value="typeof_CustomConstructor" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="5379647004618398306">
      <property name="name" nameId="tpck.1169194664001" value="typeof_CustomConstructorParameter" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="5379647004618398324">
      <property name="name" nameId="tpck.1169194664001" value="typeof_CustomConstructorParameterReference" />
    </node>
    <node type="tpd4.NonTypesystemRule" typeId="tpd4.1195214364922" id="960932673514536096">
      <property name="name" nameId="tpck.1169194664001" value="checkNumberOfArgs" />
    </node>
    <node type="tpd4.InferenceRule" typeId="tpd4.1174643105530" id="4739047193854376701">
      <property name="name" nameId="tpck.1169194664001" value="typeof_ListCustomParameter" />
      <property name="overrides" nameId="tpd4.1195213689297" value="true" />
    </node>
  </roots>
  <root id="3041831561922455919">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="3041831561922455920">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="3041831561922455922">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3041831561922455923">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3041831561922455924">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="606143069297034868">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="3041831561922456536">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3041831561922455921" resolveInfo="element" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="606143069297034872">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fbxt.6820702584719569331" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3330196687714050069">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="fbxt.3330196687714050067" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="3041831561922455931">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="3041831561922455932">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="3041831561922456535">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3041831561922455921" resolveInfo="element" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="960932673514709839">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="960932673514709840">
          <property name="name" nameId="tpck.1169194664001" value="args" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="960932673514709841">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="fbxt.5379647004618176183" resolveInfo="ArgumentClause" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="960932673514709842">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="960932673514709843">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="960932673514709844">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3041831561922455921" resolveInfo="customConstructorUsage" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="960932673514709845">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fbxt.6820702584719569331" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="960932673514709846">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="fbxt.5379647004618201111" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2299894485109627432">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2299894485109627433">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2299894485109752726">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2299894485109752727">
              <property name="name" nameId="tpck.1169194664001" value="min" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2299894485109752728" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="2299894485109752731">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="e2lb.~Math" resolveInfo="Math" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Math%dmin(int,int)%cint" resolveInfo="min" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2299894485109774067">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2299894485109752732">
                    <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="2299894485109752733">
                      <link role="concept" roleId="tp25.1140138128738" targetNodeId="fbxt.5379647004618176186" resolveInfo="CustomArgumentClause" />
                      <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2299894485109752734">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="960932673514709840" resolveInfo="args" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="2299894485109752735">
                      <link role="link" roleId="tp25.1138056546658" targetNodeId="fbxt.5379647004618201121" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="2299894485109774071" />
                </node>
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2299894485109775382">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2299894485109774085">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="2299894485109774086">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3041831561922455921" resolveInfo="customConstructorUsage" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="2299894485109774087">
                      <link role="link" roleId="tp25.1138056546658" targetNodeId="fbxt.6820702584719569344" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="2299894485109775387" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="2299894485109775405">
            <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="2299894485109775406">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7155962213902745776">
                <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7155962213902745777">
                  <property name="name" nameId="tpck.1169194664001" value="actualParam" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="7155962213902745778">
                    <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1068431790191" resolveInfo="Expression" />
                  </node>
                  <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7155962213902745779">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7155962213902745780">
                      <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7155962213902745781">
                        <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="3041831561922455921" resolveInfo="customConstructorUsage" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="7155962213902745782">
                        <link role="link" roleId="tp25.1138056546658" targetNodeId="fbxt.6820702584719569344" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetElementOperation" typeId="tp2q.1162934736510" id="7155962213902745783">
                      <node role="argument" roleId="tp2q.1162934736511" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7155962213902745784">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2299894485109775408" resolveInfo="i" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateGreaterThanInequationStatement" typeId="tpd4.1174663239020" id="2299894485109903431">
                <property name="inequationPriority" nameId="tpd4.1212056105818" value="0" />
                <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2299894485109903432">
                  <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2299894485109903433">
                    <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2299894485109903434">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2299894485109903435">
                        <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="2299894485109903436">
                          <link role="concept" roleId="tp25.1140138128738" targetNodeId="fbxt.5379647004618176186" resolveInfo="CustomArgumentClause" />
                          <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2299894485109903437">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="960932673514709840" resolveInfo="args" />
                          </node>
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="2299894485109903438">
                          <link role="link" roleId="tp25.1138056546658" targetNodeId="fbxt.5379647004618201121" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetElementOperation" typeId="tp2q.1162934736510" id="2299894485109903439">
                        <node role="argument" roleId="tp2q.1162934736511" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2299894485109903440">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2299894485109775408" resolveInfo="i" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="2299894485109903441">
                  <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="2299894485109903442">
                    <node role="term" roleId="tpd4.1174657509053" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7155962213902745785">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7155962213902745777" resolveInfo="actualParam" />
                    </node>
                  </node>
                </node>
                <node role="nodeToCheck" roleId="tpd4.1174662598553" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7155962213902745796">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7155962213902745777" resolveInfo="actualParam" />
                </node>
              </node>
            </node>
            <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2299894485109775408">
              <property name="name" nameId="tpck.1169194664001" value="i" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2299894485109775410" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2299894485109775412">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
            <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="2299894485109775417">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2299894485109775416">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2299894485109775408" resolveInfo="i" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2299894485109775420">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2299894485109752727" resolveInfo="min" />
              </node>
            </node>
            <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="2299894485109775422">
              <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2299894485109775423">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2299894485109775408" resolveInfo="i" />
              </node>
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2299894485109627437">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2299894485109627436">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="960932673514709840" resolveInfo="args" />
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="2299894485109627441">
            <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="2299894485109627443">
              <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="fbxt.5379647004618176186" resolveInfo="CustomArgumentClause" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="3041831561922455921">
      <property name="name" nameId="tpck.1169194664001" value="customConstructorUsage" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fbxt.6820702584719416486" resolveInfo="CustomConstructorUsage" />
    </node>
  </root>
  <root id="7085790726146865267">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="7085790726146865268">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="7085790726146868032">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7085790726146868036">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7085790726146868038">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7085790726146868037">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7085790726146865270" resolveInfo="customConstructor" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="3330196687714068334">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="fbxt.3330196687714050067" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="7085790726146868035">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="7085790726146868029">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="7085790726146868031">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="7085790726146865270" resolveInfo="customConstructor" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="7085790726146865270">
      <property name="name" nameId="tpck.1169194664001" value="customConstructor" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fbxt.526936149311701954" resolveInfo="CustomConstructor" />
    </node>
  </root>
  <root id="5379647004618398306">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="5379647004618398307">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="5379647004618398313">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5379647004618398317">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5379647004618398319">
            <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5379647004618398318">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5379647004618398308" resolveInfo="customConstructorParameter" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="5379647004618398323">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="fbxt.5379647004618207272" />
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5379647004618398316">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5379647004618398310">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5379647004618398312">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5379647004618398308" resolveInfo="customConstructorParameter" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5379647004618398308">
      <property name="name" nameId="tpck.1169194664001" value="customConstructorParameter" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fbxt.5379647004618201113" resolveInfo="CustomConstructorParameter" />
    </node>
  </root>
  <root id="5379647004618398324">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="5379647004618398325">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="5379647004618398331">
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="5379647004618398334">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="5379647004618398328">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="5379647004618398330">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5379647004618398326" resolveInfo="customConstructorParameterReference" />
            </node>
          </node>
        </node>
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4563030478604909006">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="4563030478604909007">
            <node role="term" roleId="tpd4.1174657509053" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4563030478604909010">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4563030478604909009">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="5379647004618398326" resolveInfo="customConstructorParameterReference" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4563030478604931634">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fbxt.5379647004618378853" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="5379647004618398326">
      <property name="name" nameId="tpck.1169194664001" value="customConstructorParameterReference" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fbxt.5379647004618378852" resolveInfo="CustomConstructorParameterReference" />
    </node>
  </root>
  <root id="960932673514536096">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="960932673514536097">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="960932673514559333">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="960932673514559334">
          <property name="name" nameId="tpck.1169194664001" value="args" />
          <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="960932673514559335">
            <link role="concept" roleId="tp25.1138405853777" targetNodeId="fbxt.5379647004618176183" resolveInfo="ArgumentClause" />
          </node>
          <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="960932673514559336">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="960932673514559337">
              <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="960932673514559338">
                <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="960932673514536099" resolveInfo="customConstructorUsage" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="960932673514559339">
                <link role="link" roleId="tp25.1138056516764" targetNodeId="fbxt.6820702584719569331" />
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="960932673514559340">
              <link role="link" roleId="tp25.1138056516764" targetNodeId="fbxt.5379647004618201111" />
            </node>
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="960932673514559342">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="960932673514559343">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="960932673514559354">
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="960932673514559355">
              <node role="statement" roleId="tpee.1068581517665" type="tpd4.ReportErrorStatement" typeId="tpd4.1175517767210" id="960932673514559399">
                <node role="errorString" roleId="tpd4.1175517851849" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="960932673514559402">
                  <property name="value" nameId="tpee.1070475926801" value="Wrong number of arguments" />
                </node>
                <node role="nodeToReport" roleId="tpd4.1227096802790" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="960932673514562360">
                  <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="960932673514536099" resolveInfo="customConstructorUsage" />
                </node>
              </node>
            </node>
            <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="960932673514559378">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="960932673514559391">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="960932673514559384">
                  <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="960932673514559382">
                    <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="960932673514536099" resolveInfo="customConstructorUsage" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="960932673514559389">
                    <link role="link" roleId="tp25.1138056546658" targetNodeId="fbxt.6820702584719569344" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="960932673514559396" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="960932673514559370">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="960932673514559365">
                  <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="960932673514559363">
                    <link role="concept" roleId="tp25.1140138128738" targetNodeId="fbxt.5379647004618176186" resolveInfo="CustomArgumentClause" />
                    <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="960932673514559358">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="960932673514559334" resolveInfo="args" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="960932673514559369">
                    <link role="link" roleId="tp25.1138056546658" targetNodeId="fbxt.5379647004618201121" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetSizeOperation" typeId="tp2q.1162935959151" id="960932673514559374" />
              </node>
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tpee.DotExpression" typeId="tpee.1197027756228" id="960932673514559347">
          <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="960932673514559346">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="960932673514559334" resolveInfo="args" />
          </node>
          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_IsInstanceOfOperation" typeId="tp25.1139621453865" id="960932673514559351">
            <node role="conceptArgument" roleId="tp25.1177027386292" type="tp25.RefConcept_Reference" typeId="tp25.1177026924588" id="960932673514559353">
              <link role="conceptDeclaration" roleId="tp25.1177026940964" targetNodeId="fbxt.5379647004618176186" resolveInfo="CustomArgumentClause" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="960932673514536099">
      <property name="name" nameId="tpck.1169194664001" value="customConstructorUsage" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fbxt.6820702584719416486" resolveInfo="CustomConstructorUsage" />
    </node>
  </root>
  <root id="4739047193854376701">
    <node role="body" roleId="tpd4.1195213635060" type="tpee.StatementList" typeId="tpee.1068580123136" id="4739047193854376702">
      <node role="statement" roleId="tpee.1068581517665" type="tpd4.CreateEquationStatement" typeId="tpd4.1174658326157" id="4739047193854376705">
        <node role="rightExpression" roleId="tpd4.1174660783414" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4739047193854376706">
          <node role="normalType" roleId="tpd4.1185788644032" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="4739047193854376707">
            <node role="quotedNode" roleId="tp3r.1196350785114" type="tp2q.ListType" typeId="tp2q.1151688443754" id="4739047193854376708">
              <node role="elementType" roleId="tp2q.1151688676805" type="tpee.Type" typeId="tpee.1068431790189" id="4739047193854376709">
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="4739047193854376710">
                  <node role="expression" roleId="tp3r.1196350785111" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4739047193854376711">
                    <node role="operand" roleId="tpee.1197027771414" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4739047193854377319">
                      <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4739047193854376704" resolveInfo="listCustomParameter" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="4739047193854398651">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="fbxt.5379647004618207272" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="leftExpression" roleId="tpd4.1174660783413" type="tpd4.NormalTypeClause" typeId="tpd4.1185788614172" id="4739047193854376714">
          <node role="normalType" roleId="tpd4.1185788644032" type="tpd4.TypeOfExpression" typeId="tpd4.1174657487114" id="4739047193854376715">
            <node role="term" roleId="tpd4.1174657509053" type="tpd4.ApplicableNodeReference" typeId="tpd4.1174650418652" id="4739047193854377318">
              <link role="applicableNode" roleId="tpd4.1174650432090" targetNodeId="4739047193854376704" resolveInfo="listCustomParameter" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="applicableNode" roleId="tpd4.1174648101952" type="tpd4.ConceptReference" typeId="tpd4.1174642788531" id="4739047193854376704">
      <property name="name" nameId="tpck.1169194664001" value="listCustomParameter" />
      <link role="concept" roleId="tpd4.1174642800329" targetNodeId="fbxt.4739047193854376699" resolveInfo="ListCustomParameter" />
    </node>
  </root>
</model>

