<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:19bf018c-b5e7-418d-8415-b23921421325(sandboxModel)">
  <persistence version="7" />
  <language namespace="7c9e2807-94ad-4afc-adf0-aaee45eb2895(jetbrains.mps.samples.lambdaCalculus)" />
  <devkit namespace="2677cb18-f558-4e33-bc38-a5139cee06dc(jetbrains.mps.devkit.language-design)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="qjd" modelUID="r:d30b7004-00fd-4d3e-bdd6-6ae5346d9b86(jetbrains.mps.samples.lambdaCalculus.structure)" version="1" implicit="yes" />
  <roots>
    <node type="qjd.Program" typeId="qjd.4022026349915669385" id="5277476162361142416">
      <property name="name" nameId="tpck.1169194664001" value="test2" />
    </node>
    <node type="qjd.Program" typeId="qjd.4022026349915669385" id="2167053794906818090">
      <property name="name" nameId="tpck.1169194664001" value="sim" />
    </node>
    <node type="qjd.Program" typeId="qjd.4022026349915669385" id="816130369292750457">
      <property name="name" nameId="tpck.1169194664001" value="sumsq" />
    </node>
    <node type="qjd.Program" typeId="qjd.4022026349915669385" id="816130369292806252">
      <property name="name" nameId="tpck.1169194664001" value="letlet" />
    </node>
  </roots>
  <root id="5277476162361142416">
    <node role="expression" roleId="qjd.4022026349915669386" type="qjd.LambdaApplication" typeId="qjd.4022026349914762717" id="5277476162361142445">
      <node role="argument" roleId="qjd.4022026349914762721" type="qjd.NumericConstant" typeId="qjd.4022026349914762709" id="5277476162361142452">
        <property name="value" nameId="qjd.4022026349914762710" value="2" />
      </node>
      <node role="function" roleId="qjd.4022026349914762720" type="qjd.LambdaAbstraction" typeId="qjd.4022026349914673024" id="5277476162361142418">
        <node role="variable" roleId="qjd.4022026349914762681" type="qjd.AbstractionVariable" typeId="qjd.4022026349914673025" id="5277476162361142419">
          <property name="name" nameId="tpck.1169194664001" value="x" />
        </node>
        <node role="body" roleId="qjd.4022026349914762693" type="qjd.AbstractionVarRef" typeId="qjd.4022026349915821199" id="7255885626191296040">
          <link role="variable" roleId="qjd.8981808925914862845" targetNodeId="5277476162361142419" resolveInfo="x" />
        </node>
      </node>
    </node>
  </root>
  <root id="2167053794906818090">
    <node role="expression" roleId="qjd.4022026349915669386" type="qjd.LetExpression" typeId="qjd.4939219901991602079" id="2167053794906818091">
      <node role="value" roleId="qjd.4939219901991602080" type="qjd.LambdaAbstraction" typeId="qjd.4022026349914673024" id="2167053794906818092">
        <node role="variable" roleId="qjd.4022026349914762681" type="qjd.AbstractionVariable" typeId="qjd.4022026349914673025" id="2167053794906818093">
          <property name="name" nameId="tpck.1169194664001" value="x" />
        </node>
        <node role="body" roleId="qjd.4022026349914762693" type="qjd.MultiplyOperation" typeId="qjd.6645816968628162282" id="2167053794906818094">
          <node role="left" roleId="qjd.1934341835352312156" type="qjd.AbstractionVarRef" typeId="qjd.4022026349915821199" id="2167053794906818095">
            <link role="variable" roleId="qjd.8981808925914862845" targetNodeId="2167053794906818093" resolveInfo="x" />
          </node>
          <node role="right" roleId="qjd.1934341835352312157" type="qjd.AbstractionVarRef" typeId="qjd.4022026349915821199" id="2167053794906818096">
            <link role="variable" roleId="qjd.8981808925914862845" targetNodeId="2167053794906818093" resolveInfo="x" />
          </node>
        </node>
      </node>
      <node role="expression" roleId="qjd.4939219901991602081" type="qjd.ParenthesisExpression" typeId="qjd.3978364766705449817" id="2167053794906818097">
        <node role="expression" roleId="qjd.3978364766705449818" type="qjd.LambdaApplication" typeId="qjd.4022026349914762717" id="2167053794906818098">
          <node role="argument" roleId="qjd.4022026349914762721" type="qjd.LambdaApplication" typeId="qjd.4022026349914762717" id="2167053794906818099">
            <node role="argument" roleId="qjd.4022026349914762721" type="qjd.NumericConstant" typeId="qjd.4022026349914762709" id="2167053794906818100">
              <property name="value" nameId="qjd.4022026349914762710" value="2" />
            </node>
            <node role="function" roleId="qjd.4022026349914762720" type="qjd.LetRef" typeId="qjd.4939219901992083820" id="2167053794906818101">
              <link role="variable" roleId="qjd.8981808925914862844" targetNodeId="2167053794906818103" resolveInfo="sq" />
            </node>
          </node>
          <node role="function" roleId="qjd.4022026349914762720" type="qjd.LetRef" typeId="qjd.4939219901992083820" id="2167053794906818102">
            <link role="variable" roleId="qjd.8981808925914862844" targetNodeId="2167053794906818103" resolveInfo="sq" />
          </node>
        </node>
      </node>
      <node role="variable" roleId="qjd.8360767178776358704" type="qjd.LetVariable" typeId="qjd.8360767178776325736" id="2167053794906818103">
        <property name="name" nameId="tpck.1169194664001" value="sq" />
      </node>
    </node>
  </root>
  <root id="816130369292750457">
    <node role="expression" roleId="qjd.4022026349915669386" type="qjd.LambdaApplication" typeId="qjd.4022026349914762717" id="816130369292750664">
      <node role="argument" roleId="qjd.4022026349914762721" type="qjd.NumericConstant" typeId="qjd.4022026349914762709" id="816130369292750677">
        <property name="value" nameId="qjd.4022026349914762710" value="6" />
      </node>
      <node role="function" roleId="qjd.4022026349914762720" type="qjd.LambdaApplication" typeId="qjd.4022026349914762717" id="816130369292750642">
        <node role="argument" roleId="qjd.4022026349914762721" type="qjd.NumericConstant" typeId="qjd.4022026349914762709" id="816130369292750654">
          <property name="value" nameId="qjd.4022026349914762710" value="5" />
        </node>
        <node role="function" roleId="qjd.4022026349914762720" type="qjd.LambdaAbstraction" typeId="qjd.4022026349914673024" id="816130369292750459">
          <node role="variable" roleId="qjd.4022026349914762681" type="qjd.AbstractionVariable" typeId="qjd.4022026349914673025" id="816130369292750460">
            <property name="name" nameId="tpck.1169194664001" value="x" />
          </node>
          <node role="variable" roleId="qjd.4022026349914762681" type="qjd.AbstractionVariable" typeId="qjd.4022026349914673025" id="816130369292750464">
            <property name="name" nameId="tpck.1169194664001" value="y" />
          </node>
          <node role="body" roleId="qjd.4022026349914762693" type="qjd.LetExpression" typeId="qjd.4939219901991602079" id="816130369292750468">
            <node role="value" roleId="qjd.4939219901991602080" type="qjd.AddOperation" typeId="qjd.1934341835352312169" id="816130369292750486">
              <node role="right" roleId="qjd.1934341835352312157" type="qjd.AbstractionVarRef" typeId="qjd.4022026349915821199" id="816130369292750492">
                <link role="variable" roleId="qjd.8981808925914862845" targetNodeId="816130369292750464" resolveInfo="y" />
              </node>
              <node role="left" roleId="qjd.1934341835352312156" type="qjd.AbstractionVarRef" typeId="qjd.4022026349915821199" id="816130369292750482">
                <link role="variable" roleId="qjd.8981808925914862845" targetNodeId="816130369292750460" resolveInfo="x" />
              </node>
            </node>
            <node role="expression" roleId="qjd.4939219901991602081" type="qjd.LetExpression" typeId="qjd.4939219901991602079" id="816130369292750496">
              <node role="value" roleId="qjd.4939219901991602080" type="qjd.MultiplyOperation" typeId="qjd.6645816968628162282" id="816130369292750505">
                <node role="right" roleId="qjd.1934341835352312157" type="qjd.AbstractionVarRef" typeId="qjd.4022026349915821199" id="816130369292750511">
                  <link role="variable" roleId="qjd.8981808925914862845" targetNodeId="816130369292750464" resolveInfo="y" />
                </node>
                <node role="left" roleId="qjd.1934341835352312156" type="qjd.AbstractionVarRef" typeId="qjd.4022026349915821199" id="816130369292750504">
                  <link role="variable" roleId="qjd.8981808925914862845" targetNodeId="816130369292750460" resolveInfo="x" />
                </node>
              </node>
              <node role="expression" roleId="qjd.4939219901991602081" type="qjd.LambdaApplication" typeId="qjd.4022026349914762717" id="816130369292750539">
                <node role="argument" roleId="qjd.4022026349914762721" type="qjd.LetRef" typeId="qjd.4939219901992083820" id="816130369292750549">
                  <link role="variable" roleId="qjd.8981808925914862844" targetNodeId="816130369292750478" resolveInfo="sum" />
                </node>
                <node role="function" roleId="qjd.4022026349914762720" type="qjd.LambdaAbstraction" typeId="qjd.4022026349914673024" id="816130369292750515">
                  <node role="variable" roleId="qjd.4022026349914762681" type="qjd.AbstractionVariable" typeId="qjd.4022026349914673025" id="816130369292750516">
                    <property name="name" nameId="tpck.1169194664001" value="z" />
                  </node>
                  <node role="body" roleId="qjd.4022026349914762693" type="qjd.MultiplyOperation" typeId="qjd.6645816968628162282" id="816130369292750530">
                    <node role="right" roleId="qjd.1934341835352312157" type="qjd.SubtractOperation" typeId="qjd.6645816968628162284" id="816130369292750606">
                      <node role="right" roleId="qjd.1934341835352312157" type="qjd.MultiplyOperation" typeId="qjd.6645816968628162282" id="816130369292750624">
                        <node role="right" roleId="qjd.1934341835352312157" type="qjd.LetRef" typeId="qjd.4939219901992083820" id="816130369292750634">
                          <link role="variable" roleId="qjd.8981808925914862844" targetNodeId="816130369292750499" resolveInfo="mult" />
                        </node>
                        <node role="left" roleId="qjd.1934341835352312156" type="qjd.NumericConstant" typeId="qjd.4022026349914762709" id="816130369292750616">
                          <property name="value" nameId="qjd.4022026349914762710" value="2" />
                        </node>
                      </node>
                      <node role="left" roleId="qjd.1934341835352312156" type="qjd.AbstractionVarRef" typeId="qjd.4022026349915821199" id="816130369292750533">
                        <link role="variable" roleId="qjd.8981808925914862845" targetNodeId="816130369292750516" resolveInfo="z" />
                      </node>
                    </node>
                    <node role="left" roleId="qjd.1934341835352312156" type="qjd.AbstractionVarRef" typeId="qjd.4022026349915821199" id="816130369292750529">
                      <link role="variable" roleId="qjd.8981808925914862845" targetNodeId="816130369292750516" resolveInfo="z" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="variable" roleId="qjd.8360767178776358704" type="qjd.LetVariable" typeId="qjd.8360767178776325736" id="816130369292750499">
                <property name="name" nameId="tpck.1169194664001" value="mult" />
              </node>
            </node>
            <node role="variable" roleId="qjd.8360767178776358704" type="qjd.LetVariable" typeId="qjd.8360767178776325736" id="816130369292750478">
              <property name="name" nameId="tpck.1169194664001" value="sum" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="816130369292806252">
    <node role="expression" roleId="qjd.4022026349915669386" type="qjd.LetExpression" typeId="qjd.4939219901991602079" id="816130369292806253">
      <node role="value" roleId="qjd.4939219901991602080" type="qjd.NumericConstant" typeId="qjd.4022026349914762709" id="816130369292806254">
        <property name="value" nameId="qjd.4022026349914762710" value="1" />
      </node>
      <node role="expression" roleId="qjd.4939219901991602081" type="qjd.LetExpression" typeId="qjd.4939219901991602079" id="816130369292806255">
        <node role="value" roleId="qjd.4939219901991602080" type="qjd.NumericConstant" typeId="qjd.4022026349914762709" id="816130369292806256">
          <property name="value" nameId="qjd.4022026349914762710" value="2" />
        </node>
        <node role="expression" roleId="qjd.4939219901991602081" type="qjd.AddOperation" typeId="qjd.1934341835352312169" id="816130369292806257">
          <node role="right" roleId="qjd.1934341835352312157" type="qjd.LetRef" typeId="qjd.4939219901992083820" id="816130369292806258">
            <link role="variable" roleId="qjd.8981808925914862844" targetNodeId="816130369292806260" resolveInfo="q2" />
          </node>
          <node role="left" roleId="qjd.1934341835352312156" type="qjd.LetRef" typeId="qjd.4939219901992083820" id="816130369292806259">
            <link role="variable" roleId="qjd.8981808925914862844" targetNodeId="816130369292806261" resolveInfo="q1" />
          </node>
        </node>
        <node role="variable" roleId="qjd.8360767178776358704" type="qjd.LetVariable" typeId="qjd.8360767178776325736" id="816130369292806260">
          <property name="name" nameId="tpck.1169194664001" value="q2" />
        </node>
      </node>
      <node role="variable" roleId="qjd.8360767178776358704" type="qjd.LetVariable" typeId="qjd.8360767178776325736" id="816130369292806261">
        <property name="name" nameId="tpck.1169194664001" value="q1" />
      </node>
    </node>
  </root>
</model>

