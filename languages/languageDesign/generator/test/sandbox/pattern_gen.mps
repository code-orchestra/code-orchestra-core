<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:6e61c12a-3c0f-4223-98e2-5c8cbc39e9af(pattern_gen)">
  <persistence version="7" />
  <language namespace="157a9668-bf58-417b-893e-53d86388dc56(jetbrains.mps.transformation.test.outputLang)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tq1l" modelUID="r:00000000-0000-4000-0000-011c89590605(jetbrains.mps.transformation.test.outputLang.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tq1l.CustomRoot" typeId="tq1l.4146564171992368516" id="4146564171992399879" />
  </roots>
  <root id="4146564171992399879">
    <node role="statement" roleId="tq1l.4146564171992368517" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="4146564171992399880">
      <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="4146564171992399881">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2681305894288275125">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2681305894288275126">
            <property name="name" nameId="tpck.1169194664001" value="e2" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2681305894288275127" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2681305894288275130">
              <property name="value" nameId="tpee.1068580320021" value="5" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="4146564171992399882">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="4146564171992399883">
            <property name="name" nameId="tpck.1169194664001" value="i" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="4146564171992399884" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4146564171992399887">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4146564171992399888">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="4146564171992404964">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4146564171992399889">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4146564171992399883" resolveInfo="i" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.MulExpression" typeId="tpee.1092119917967" id="4146564171992404968">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="4146564171992404967">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4146564171992399883" resolveInfo="i" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2681305894288064984">
                <property name="value" nameId="tpee.1068580320021" value="287" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2681305894288275132">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2681305894288275134">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288275133">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2681305894288275126" resolveInfo="e" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.MulExpression" typeId="tpee.1092119917967" id="2681305894288275138">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288275137">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2681305894288275126" resolveInfo="e" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2681305894288275141">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="2681305894288275144">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2681305894288275147">
                    <property name="value" nameId="tpee.1068580320021" value="5" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288275143">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4146564171992399883" resolveInfo="i" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2681305894288275179">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2681305894288275181">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288275180">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4146564171992399883" resolveInfo="i" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.MulExpression" typeId="tpee.1092119917967" id="2681305894288275185">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288275184">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2681305894288275126" resolveInfo="e" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288275188">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4146564171992399883" resolveInfo="i" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="2681305894288379455" />
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2681305894288379457">
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2681305894288379458">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2681305894288379474">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2681305894288379475">
                <property name="name" nameId="tpck.1169194664001" value="res" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="2681305894288379476" />
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="2681305894288379478">
                  <property name="value" nameId="tpee.1068580123138" value="true" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="2681305894288379484">
              <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="2681305894288379485">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2681305894288382460">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="2681305894288382462">
                    <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288382461">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2681305894288379475" resolveInfo="res" />
                    </node>
                    <node role="rValue" roleId="tpee.1068498886297" type="tpee.AndExpression" typeId="tpee.1080120340718" id="2681305894288382466">
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288382465">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2681305894288379475" resolveInfo="res" />
                      </node>
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="2681305894288382470">
                        <node role="expression" roleId="tpee.1079359253376" type="tpee.GreaterThanExpression" typeId="tpee.1081506762703" id="2681305894288382477">
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.MinusExpression" typeId="tpee.1068581242869" id="2681305894288382473">
                            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288382472">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4146564171992399883" resolveInfo="i" />
                            </node>
                            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288382476">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2681305894288275126" resolveInfo="e" />
                            </node>
                          </node>
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288382480">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2681305894288379491" resolveInfo="qq" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2681305894288379491">
                <property name="name" nameId="tpck.1169194664001" value="qq" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2681305894288379493" />
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2681305894288379495">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
              </node>
              <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="2681305894288382453">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288382452">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2681305894288379491" resolveInfo="qq" />
                </node>
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2681305894288382456">
                  <property name="value" nameId="tpee.1068580320021" value="10" />
                </node>
              </node>
              <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="2681305894288382458">
                <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288382459">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2681305894288379491" resolveInfo="qq" />
                </node>
              </node>
            </node>
          </node>
          <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="2681305894288379466">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="2681305894288379470">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2681305894288379473">
                <property name="value" nameId="tpee.1068580320021" value="43" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288379469">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="4146564171992399883" resolveInfo="i" />
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="2681305894288379462">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="2681305894288379461">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2681305894288275126" resolveInfo="e" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="2681305894288379465">
                <property name="value" nameId="tpee.1068580320021" value="10" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="3571912445010045823">
          <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="3571912445010045824">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="3571912445010045826">
              <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="3571912445010045827">
                <property name="text" nameId="tpee.6329021646629104958" value="Block" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="6266395626233624824" />
        <node role="statement" roleId="tpee.1068581517665" type="tq1l.CustomStatement" typeId="tq1l.2681305894288486346" id="5857536350883158504">
          <property name="name" nameId="tpck.1169194664001" value="extraWork" />
          <node role="inner" roleId="tq1l.2681305894288486349" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="5857536350883158506">
            <property name="value" nameId="tpee.1068580320021" value="55" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tq1l.CustomStatement" typeId="tq1l.2681305894288486346" id="6266395626233719470">
          <property name="name" nameId="tpck.1169194664001" value="myWork1" />
          <node role="inner" roleId="tq1l.2681305894288486349" type="tpee.MulExpression" typeId="tpee.1092119917967" id="6266395626234333484">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6266395626234333487">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6266395626234333490">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6266395626234333493">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2681305894288275126" resolveInfo="e" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6266395626234333489">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6266395626234333483">
              <property name="value" nameId="tpee.1068580320021" value="175" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tq1l.CustomStatement" typeId="tq1l.2681305894288486346" id="6509983489804965801">
          <property name="name" nameId="tpck.1169194664001" value="myWork2" />
          <node role="inner" roleId="tq1l.2681305894288486349" type="tpee.MulExpression" typeId="tpee.1092119917967" id="6509983489804965802">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6509983489804965803">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6509983489804965804">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6509983489804965805">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2681305894288275126" resolveInfo="e" />
                </node>
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6509983489804965806">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6509983489804965807">
              <property name="value" nameId="tpee.1068580320021" value="175" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2163819695913718896">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2163819695913718897">
            <property name="name" nameId="tpck.1169194664001" value="e33" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2163819695913718898" />
            <node role="initializer" roleId="tpee.1068431790190" type="tq1l.CustomStatementRef" typeId="tq1l.2163819695913378074" id="2163819695913721856">
              <property name="ii" nameId="tq1l.2163819695913379842" value="23" />
              <link role="myStatement" roleId="tq1l.2163819695913379841" targetNodeId="6266395626233719470" resolveInfo="myWork1" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="2163819695913721858">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="2163819695913721859">
            <property name="name" nameId="tpck.1169194664001" value="e32" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2163819695913721860" />
            <node role="initializer" roleId="tpee.1068431790190" type="tq1l.CustomStatementRef" typeId="tq1l.2163819695913378074" id="2163819695913721861">
              <property name="ii" nameId="tq1l.2163819695913379842" value="22" />
              <link role="myStatement" roleId="tq1l.2163819695913379841" targetNodeId="6266395626233719470" resolveInfo="myWork1" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="5857536350883158508">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="5857536350883158509">
            <property name="name" nameId="tpck.1169194664001" value="e31" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="5857536350883158510" />
            <node role="initializer" roleId="tpee.1068431790190" type="tq1l.CustomStatementRef" typeId="tq1l.2163819695913378074" id="5857536350883158511">
              <property name="ii" nameId="tq1l.2163819695913379842" value="0" />
              <link role="myStatement" roleId="tq1l.2163819695913379841" targetNodeId="5857536350883158504" resolveInfo="extraWork" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7870321878390043349">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7870321878390043350">
            <property name="name" nameId="tpck.1169194664001" value="e30" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="7870321878390043351" />
            <node role="initializer" roleId="tpee.1068431790190" type="tq1l.CustomStatementRef" typeId="tq1l.2163819695913378074" id="7870321878390043352">
              <property name="ii" nameId="tq1l.2163819695913379842" value="11" />
              <link role="myStatement" roleId="tq1l.2163819695913379841" targetNodeId="5857536350883158504" resolveInfo="extraWork" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6509983489804965645">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6509983489804965646">
            <property name="name" nameId="tpck.1169194664001" value="e29" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6509983489804965647" />
            <node role="initializer" roleId="tpee.1068431790190" type="tq1l.CustomStatementRef" typeId="tq1l.2163819695913378074" id="6509983489804965648">
              <property name="ii" nameId="tq1l.2163819695913379842" value="12" />
              <link role="myStatement" roleId="tq1l.2163819695913379841" targetNodeId="6509983489804965801" resolveInfo="myWork2" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tq1l.TwoVarStatement" typeId="tq1l.6010543442198679048" id="6010543442198725792">
          <property name="name1" nameId="tq1l.6010543442198679051" value="ya1" />
          <property name="name2" nameId="tq1l.6010543442198679052" value="ya2" />
        </node>
      </node>
    </node>
  </root>
</model>

