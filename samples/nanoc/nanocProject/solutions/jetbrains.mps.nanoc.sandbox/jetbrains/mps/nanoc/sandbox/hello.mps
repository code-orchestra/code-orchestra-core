<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:f755780e-e164-47f9-b12c-a8188bed3abe(jetbrains.mps.nanoc.sandbox.hello)">
  <persistence version="7" />
  <language namespace="08ffecab-a1e5-4be9-bd87-e14140b1b0e0(jetbrains.mps.nanoc)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="i1tc" modelUID="r:d65f98fc-790c-41b3-9614-f2de26685b21(jetbrains.mps.nanoc.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="i1tc.File" typeId="i1tc.1388222368191236575" id="6585869519574685729">
      <property name="name" nameId="tpck.1169194664001" value="Hello" />
    </node>
  </roots>
  <root id="6585869519574685729">
    <node role="body" roleId="i1tc.7211731935130600906" type="i1tc.CBody" typeId="i1tc.7211731935130600480" id="6585869519574685730">
      <node role="statement" roleId="i1tc.7211731935130600481" type="i1tc.VarDeclStatement" typeId="i1tc.7211731935130582989" id="5698737643333767057">
        <node role="varDecl" roleId="i1tc.7211731935130582991" type="i1tc.VarDecl" typeId="i1tc.7211731935130582984" id="5698737643333767058">
          <property name="name" nameId="tpck.1169194664001" value="i" />
          <node role="initializer" roleId="i1tc.6585869519574765691" type="i1tc.IntConst" typeId="i1tc.7211731935130600899" id="5698737643333767061">
            <property name="value" nameId="i1tc.7211731935130600902" value="0" />
          </node>
        </node>
        <node role="type" roleId="i1tc.7211731935130582990" type="i1tc.CInt" typeId="i1tc.7211731935130582964" id="5698737643333767059" />
      </node>
      <node role="statement" roleId="i1tc.7211731935130600481" type="i1tc.CWhile" typeId="i1tc.7211731935130600478" id="1485470850545864036">
        <node role="body" roleId="i1tc.7211731935130600479" type="i1tc.CBody" typeId="i1tc.7211731935130600480" id="1485470850545864038">
          <node role="statement" roleId="i1tc.7211731935130600481" type="i1tc.CExpressionStatement" typeId="i1tc.6585869519574700068" id="1485470850545864044">
            <node role="expression" roleId="i1tc.6585869519574700069" type="i1tc.CAssignmentExpression" typeId="i1tc.6585869519574772760" id="1485470850545864046">
              <node role="value" roleId="i1tc.6585869519574772770" type="i1tc.PlusOp" typeId="i1tc.7211731935130600893" id="1485470850545864050">
                <node role="right" roleId="i1tc.7211731935130600885" type="i1tc.IntConst" typeId="i1tc.7211731935130600899" id="1485470850545864053">
                  <property name="value" nameId="i1tc.7211731935130600902" value="1" />
                </node>
                <node role="left" roleId="i1tc.7211731935130600884" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="1485470850545864049">
                  <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
                </node>
              </node>
              <node role="variable" roleId="i1tc.6585869519574772761" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="1485470850545864045">
                <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="i1tc.7211731935130600481" type="i1tc.CExpressionStatement" typeId="i1tc.6585869519574700068" id="3565731266278471126">
            <node role="expression" roleId="i1tc.6585869519574700069" type="i1tc.CAssignmentExpression" typeId="i1tc.6585869519574772760" id="3565731266278471127">
              <node role="value" roleId="i1tc.6585869519574772770" type="i1tc.PlusOp" typeId="i1tc.7211731935130600893" id="3565731266278471128">
                <node role="right" roleId="i1tc.7211731935130600885" type="i1tc.IntConst" typeId="i1tc.7211731935130600899" id="3565731266278471129">
                  <property name="value" nameId="i1tc.7211731935130600902" value="1" />
                </node>
                <node role="left" roleId="i1tc.7211731935130600884" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="3565731266278471130">
                  <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
                </node>
              </node>
              <node role="variable" roleId="i1tc.6585869519574772761" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="3565731266278471131">
                <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="i1tc.7211731935130600481" type="i1tc.CExpressionStatement" typeId="i1tc.6585869519574700068" id="3565731266278471132">
            <node role="expression" roleId="i1tc.6585869519574700069" type="i1tc.CAssignmentExpression" typeId="i1tc.6585869519574772760" id="3565731266278471133">
              <node role="value" roleId="i1tc.6585869519574772770" type="i1tc.PlusOp" typeId="i1tc.7211731935130600893" id="3565731266278471134">
                <node role="right" roleId="i1tc.7211731935130600885" type="i1tc.IntConst" typeId="i1tc.7211731935130600899" id="3565731266278471135">
                  <property name="value" nameId="i1tc.7211731935130600902" value="1" />
                </node>
                <node role="left" roleId="i1tc.7211731935130600884" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="3565731266278471136">
                  <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
                </node>
              </node>
              <node role="variable" roleId="i1tc.6585869519574772761" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="3565731266278471137">
                <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="i1tc.7211731935130600481" type="i1tc.CExpressionStatement" typeId="i1tc.6585869519574700068" id="3565731266278471138">
            <node role="expression" roleId="i1tc.6585869519574700069" type="i1tc.CAssignmentExpression" typeId="i1tc.6585869519574772760" id="3565731266278471139">
              <node role="value" roleId="i1tc.6585869519574772770" type="i1tc.PlusOp" typeId="i1tc.7211731935130600893" id="3565731266278471140">
                <node role="right" roleId="i1tc.7211731935130600885" type="i1tc.IntConst" typeId="i1tc.7211731935130600899" id="3565731266278471141">
                  <property name="value" nameId="i1tc.7211731935130600902" value="1" />
                </node>
                <node role="left" roleId="i1tc.7211731935130600884" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="3565731266278471142">
                  <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
                </node>
              </node>
              <node role="variable" roleId="i1tc.6585869519574772761" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="3565731266278471143">
                <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="i1tc.7211731935130600481" type="i1tc.CExpressionStatement" typeId="i1tc.6585869519574700068" id="3565731266278471144">
            <node role="expression" roleId="i1tc.6585869519574700069" type="i1tc.CAssignmentExpression" typeId="i1tc.6585869519574772760" id="3565731266278471145">
              <node role="value" roleId="i1tc.6585869519574772770" type="i1tc.PlusOp" typeId="i1tc.7211731935130600893" id="3565731266278471146">
                <node role="right" roleId="i1tc.7211731935130600885" type="i1tc.IntConst" typeId="i1tc.7211731935130600899" id="3565731266278471147">
                  <property name="value" nameId="i1tc.7211731935130600902" value="1" />
                </node>
                <node role="left" roleId="i1tc.7211731935130600884" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="3565731266278471148">
                  <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
                </node>
              </node>
              <node role="variable" roleId="i1tc.6585869519574772761" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="3565731266278471149">
                <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
              </node>
            </node>
          </node>
        </node>
        <node role="condition" roleId="i1tc.7211731935130600829" type="i1tc.LessOp" typeId="i1tc.6585869519574780678" id="5894693213360956497">
          <node role="right" roleId="i1tc.7211731935130600885" type="i1tc.IntConst" typeId="i1tc.7211731935130600899" id="5894693213360956500">
            <property name="value" nameId="i1tc.7211731935130600902" value="239" />
          </node>
          <node role="left" roleId="i1tc.7211731935130600884" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="5894693213360956496">
            <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="i1tc.7211731935130600481" type="i1tc.CExpressionStatement" typeId="i1tc.6585869519574700068" id="849607630585440638">
        <node role="expression" roleId="i1tc.6585869519574700069" type="i1tc.CAssignmentExpression" typeId="i1tc.6585869519574772760" id="849607630585440639">
          <node role="value" roleId="i1tc.6585869519574772770" type="i1tc.PlusOp" typeId="i1tc.7211731935130600893" id="849607630585440640">
            <node role="right" roleId="i1tc.7211731935130600885" type="i1tc.IntConst" typeId="i1tc.7211731935130600899" id="849607630585440641">
              <property name="value" nameId="i1tc.7211731935130600902" value="1" />
            </node>
            <node role="left" roleId="i1tc.7211731935130600884" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="849607630585440642">
              <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
            </node>
          </node>
          <node role="variable" roleId="i1tc.6585869519574772761" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="849607630585440643">
            <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="i1tc.7211731935130600481" type="i1tc.CExpressionStatement" typeId="i1tc.6585869519574700068" id="849607630585440645">
        <node role="expression" roleId="i1tc.6585869519574700069" type="i1tc.CAssignmentExpression" typeId="i1tc.6585869519574772760" id="849607630585440646">
          <node role="value" roleId="i1tc.6585869519574772770" type="i1tc.IntConst" typeId="i1tc.7211731935130600899" id="849607630585440658">
            <property name="value" nameId="i1tc.7211731935130600902" value="7" />
          </node>
          <node role="variable" roleId="i1tc.6585869519574772761" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="849607630585440650">
            <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="i1tc.7211731935130600481" type="i1tc.VarDeclStatement" typeId="i1tc.7211731935130582989" id="7530891836727013742">
        <node role="varDecl" roleId="i1tc.7211731935130582991" type="i1tc.VarDecl" typeId="i1tc.7211731935130582984" id="7530891836727013743">
          <property name="name" nameId="tpck.1169194664001" value="j" />
          <node role="initializer" roleId="i1tc.6585869519574765691" type="i1tc.IntConst" typeId="i1tc.7211731935130600899" id="7530891836727013746">
            <property name="value" nameId="i1tc.7211731935130600902" value="4" />
          </node>
        </node>
        <node role="type" roleId="i1tc.7211731935130582990" type="i1tc.CInt" typeId="i1tc.7211731935130582964" id="7530891836727013744" />
      </node>
      <node role="statement" roleId="i1tc.7211731935130600481" type="i1tc.CExpressionStatement" typeId="i1tc.6585869519574700068" id="7530891836727013762">
        <node role="expression" roleId="i1tc.6585869519574700069" type="i1tc.CAssignmentExpression" typeId="i1tc.6585869519574772760" id="7530891836727013764">
          <node role="value" roleId="i1tc.6585869519574772770" type="i1tc.MinusOp" typeId="i1tc.7211731935130600897" id="7530891836727013771">
            <node role="right" roleId="i1tc.7211731935130600885" type="i1tc.IntConst" typeId="i1tc.7211731935130600899" id="7530891836727013774">
              <property name="value" nameId="i1tc.7211731935130600902" value="1" />
            </node>
            <node role="left" roleId="i1tc.7211731935130600884" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="7530891836727013770">
              <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="7530891836727013743" resolveInfo="j" />
            </node>
          </node>
          <node role="variable" roleId="i1tc.6585869519574772761" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="7530891836727013763">
            <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="7530891836727013743" resolveInfo="j" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="i1tc.7211731935130600481" type="i1tc.VarDeclStatement" typeId="i1tc.7211731935130582989" id="7530891836727013776">
        <node role="varDecl" roleId="i1tc.7211731935130582991" type="i1tc.VarDecl" typeId="i1tc.7211731935130582984" id="7530891836727013777">
          <property name="name" nameId="tpck.1169194664001" value="f" />
          <node role="initializer" roleId="i1tc.6585869519574765691" type="i1tc.IntConst" typeId="i1tc.7211731935130600899" id="7530891836727013782">
            <property name="value" nameId="i1tc.7211731935130600902" value="0" />
          </node>
        </node>
        <node role="type" roleId="i1tc.7211731935130582990" type="i1tc.CFloat" typeId="i1tc.7211731935130582967" id="7530891836727013778" />
      </node>
      <node role="statement" roleId="i1tc.7211731935130600481" type="i1tc.CExpressionStatement" typeId="i1tc.6585869519574700068" id="849607630585440652">
        <node role="expression" roleId="i1tc.6585869519574700069" type="i1tc.CAssignmentExpression" typeId="i1tc.6585869519574772760" id="849607630585440653">
          <node role="value" roleId="i1tc.6585869519574772770" type="i1tc.PlusOp" typeId="i1tc.7211731935130600893" id="849607630585440654">
            <node role="right" roleId="i1tc.7211731935130600885" type="i1tc.IntConst" typeId="i1tc.7211731935130600899" id="849607630585440655">
              <property name="value" nameId="i1tc.7211731935130600902" value="1" />
            </node>
            <node role="left" roleId="i1tc.7211731935130600884" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="849607630585440656">
              <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
            </node>
          </node>
          <node role="variable" roleId="i1tc.6585869519574772761" type="i1tc.VarRef" typeId="i1tc.6585869519574772762" id="849607630585440657">
            <link role="declaration" roleId="i1tc.6585869519574772763" targetNodeId="5698737643333767058" resolveInfo="i" />
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

