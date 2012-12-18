<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c8959045a(jetbrains.mps.samples.matrixLanguage.sandbox)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="aeb98137-c8ec-4c86-a51b-f00c080e4652(jetbrains.mps.samples.matrixLanguage)" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpoo" modelUID="r:00000000-0000-4000-0000-011c89590454(jetbrains.mps.samples.matrixLanguage.structure)" version="0" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="1209978890134">
      <property name="name" nameId="tpck.1169194664001" value="ABC" />
    </node>
  </roots>
  <root id="1209978890134">
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="5219263681752181033">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5219263681752181034" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5219263681752181035" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5219263681752181036" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1209978896230">
      <property name="name" nameId="tpck.1169194664001" value="abc" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1209978896231" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1209978896232" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1209978896233">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1215189793808">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1215189793809">
            <property name="name" nameId="tpck.1169194664001" value="tmp" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1215189793810" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1215189798078">
              <property name="value" nameId="tpee.1068580320021" value="10" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1216562432341">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1216562432342">
            <property name="name" nameId="tpck.1169194664001" value="a" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.DoubleType" typeId="tpee.1070534513062" id="1216562432343" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8382715564005711524">
              <property name="value" nameId="tpee.1068580320021" value="1" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1209988638155">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1209988638156">
            <property name="name" nameId="tpck.1169194664001" value="abc" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpoo.MatrixType" typeId="tpoo.1209978821264" id="1209989364497">
              <node role="scalarType" roleId="tpoo.1210159684238" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210163845732">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" resolveInfo="Double" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpoo.MatrixLiteral" typeId="tpoo.1209987469663" id="1210255383705">
              <node role="scalarType" roleId="tpoo.1210161158423" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210255389402">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" resolveInfo="Double" />
              </node>
              <node role="row" roleId="tpoo.1209987497704" type="tpoo.MatrixRow" typeId="tpoo.1209987479015" id="1215189101329">
                <node role="items" roleId="tpoo.1209987483934" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1215417598927">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1215189793809" resolveInfo="tmp" />
                </node>
                <node role="items" roleId="tpoo.1209987483934" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1215189365916">
                  <property name="value" nameId="tpee.1068580320021" value="20" />
                </node>
              </node>
              <node role="row" roleId="tpoo.1209987497704" type="tpoo.MatrixRow" typeId="tpoo.1209987479015" id="1210255458725">
                <node role="items" roleId="tpoo.1209987483934" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1215189334847">
                  <property name="value" nameId="tpee.1068580320021" value="233330" />
                </node>
                <node role="items" roleId="tpoo.1209987483934" type="tpee.MulExpression" typeId="tpee.1092119917967" id="1216562411803">
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1216562411900">
                    <property name="value" nameId="tpee.1068580320021" value="2" />
                  </node>
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1216562408519">
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1216562408520">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1216562400687" resolveInfo="foo" />
                    </node>
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="1216562408521" />
                  </node>
                </node>
              </node>
              <node role="row" roleId="tpoo.1209987497704" type="tpoo.MatrixRow" typeId="tpoo.1209987479015" id="1215416589509">
                <node role="items" roleId="tpoo.1209987483934" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1215417633935">
                  <property name="value" nameId="tpee.1068580320021" value="2" />
                </node>
                <node role="items" roleId="tpoo.1209987483934" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1216562443720">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1216562432342" resolveInfo="a" />
                </node>
                <node role="items" roleId="tpoo.1209987483934" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1216562448894">
                  <property name="value" nameId="tpee.1068580320021" value="12" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1210002994402">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1210002997360">
            <node role="rValue" roleId="tpee.1068498886297" type="tpoo.TransposeExpression" typeId="tpoo.1209999461920" id="1210003674892">
              <node role="matrix" roleId="tpoo.1209999493205" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210169930119">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209988638156" resolveInfo="abc" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210002994403">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209988638156" resolveInfo="abc" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1210004045517">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1210004047959">
            <node role="rValue" roleId="tpee.1068498886297" type="tpoo.MatrixMultExpression" typeId="tpoo.1210001631678" id="1210004060334">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpoo.TransposeExpression" typeId="tpoo.1209999461920" id="1210004068376">
                <node role="matrix" roleId="tpoo.1209999493205" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210004072304">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209988638156" resolveInfo="abc" />
                </node>
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210004057393">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209988638156" resolveInfo="abc" />
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210004045518">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209988638156" resolveInfo="abc" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1210004164728">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1210004168093">
            <node role="rValue" roleId="tpee.1068498886297" type="tpoo.MatrixMultExpression" typeId="tpoo.1210001631678" id="1210006551790">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210006556047">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209988638156" resolveInfo="abc" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1215184154730">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1215184154732">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Double%d&lt;init&gt;(double)" resolveInfo="Double" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1210171995394">
                    <property name="value" nameId="tpee.1113006610751" value="10.0" />
                  </node>
                </node>
              </node>
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210004164729">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209988638156" resolveInfo="abc" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1210239674451">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1210239674452">
            <property name="name" nameId="tpck.1169194664001" value="sum" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1210239674453">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Double" resolveInfo="Double" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.FloatingPointConstant" typeId="tpee.1111509017652" id="1210253007174">
              <property name="value" nameId="tpee.1113006610751" value="0.0" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpoo.ForEachMatrixElement" typeId="tpoo.1210234754876" id="1210246394575">
          <node role="row" roleId="tpoo.1210234807362" type="tpoo.MatrixIndexVariableDeclaration" typeId="tpoo.1210234858018" id="1210246399370">
            <property name="name" nameId="tpck.1169194664001" value="i1" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.Type" typeId="tpee.1068431790189" id="1210246399371" />
          </node>
          <node role="column" roleId="tpoo.1210234892102" type="tpoo.MatrixIndexVariableDeclaration" typeId="tpoo.1210234858018" id="1210246394578">
            <property name="name" nameId="tpck.1169194664001" value="j1" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.Type" typeId="tpee.1068431790189" id="1210246394579" />
          </node>
          <node role="element" roleId="tpoo.1210234933941" type="tpoo.MatrixElementVariableDeclaration" typeId="tpoo.1210234982684" id="1210246394580">
            <property name="name" nameId="tpck.1169194664001" value="element1" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.Type" typeId="tpee.1068431790189" id="1210246394581" />
          </node>
          <node role="matrix" roleId="tpoo.1210234913397" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210246541389">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209988638156" resolveInfo="abc" />
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1210246394583">
            <node role="statement" roleId="tpee.1068581517665" type="tpoo.ForEachMatrixElement" typeId="tpoo.1210234754876" id="1210250556671">
              <node role="row" roleId="tpoo.1210234807362" type="tpoo.MatrixIndexVariableDeclaration" typeId="tpoo.1210234858018" id="1210250556672">
                <property name="name" nameId="tpck.1169194664001" value="i2" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.Type" typeId="tpee.1068431790189" id="1210250556673" />
              </node>
              <node role="column" roleId="tpoo.1210234892102" type="tpoo.MatrixIndexVariableDeclaration" typeId="tpoo.1210234858018" id="1210250556674">
                <property name="name" nameId="tpck.1169194664001" value="j2" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.Type" typeId="tpee.1068431790189" id="1210250556675" />
              </node>
              <node role="element" roleId="tpoo.1210234933941" type="tpoo.MatrixElementVariableDeclaration" typeId="tpoo.1210234982684" id="1210250556676">
                <property name="name" nameId="tpck.1169194664001" value="element2" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.Type" typeId="tpee.1068431790189" id="1210250556677" />
              </node>
              <node role="matrix" roleId="tpoo.1210234913397" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210250556678">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209988638156" resolveInfo="abc" />
              </node>
              <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1210250556679">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1210250556680">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1210250556681">
                    <node role="rValue" roleId="tpee.1068498886297" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1210250556683">
                      <node role="rightExpression" roleId="tpee.1081773367579" type="tpoo.MatrixElementVariableReference" typeId="tpoo.1210238040066" id="1210251687738">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1210250556676" resolveInfo="element2" />
                      </node>
                      <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1210250556682">
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210250556688">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1210239674452" resolveInfo="sum" />
                        </node>
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.CastExpression" typeId="tpee.1070534934090" id="1210253045260">
                          <node role="expression" roleId="tpee.1070534934092" type="tpoo.MatrixIndexVariableReference" typeId="tpoo.1210239099519" id="1210253045261">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1210250556672" resolveInfo="i2" />
                          </node>
                          <node role="type" roleId="tpee.1070534934091" type="tpee.DoubleType" typeId="tpee.1070534513062" id="1210253046735" />
                        </node>
                      </node>
                    </node>
                    <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1215190588937">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1210239674452" resolveInfo="sum" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1210000644057">
          <node role="expression" roleId="tpee.1068580123156" type="tpoo.DeterminantExpression" typeId="tpoo.1209989472341" id="1210000644058">
            <node role="literal" roleId="tpoo.1209989620759" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1210000647063">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1209988638156" resolveInfo="abc" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="1216562400687">
      <property name="name" nameId="tpck.1169194664001" value="foo" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1216562421073" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1216562400689" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1216562400690">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="8382715564005711365">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8382715564005711366">
            <property name="value" nameId="tpee.1068580320021" value="1" />
          </node>
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1209978890135" />
  </root>
</model>

