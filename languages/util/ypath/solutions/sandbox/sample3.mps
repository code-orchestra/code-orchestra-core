<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c895905ba(sample3)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="d4e445fa-e1ac-4fc8-8d3b-e62b05d0ea4c(jetbrains.mps.ypath)" />
  <import index="tpk9" modelUID="r:00000000-0000-4000-0000-011c895905b5(treepath_dom)" version="-1" />
  <import index="fxg7" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.io(JDK/java.io@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="kvg6" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#org.w3c.dom(JDK/org.w3c.dom@java_stub)" version="-1" />
  <import index="9yi" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.xml.parsers(JDK/javax.xml.parsers@java_stub)" version="-1" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpki" modelUID="r:00000000-0000-4000-0000-011c895905ae(jetbrains.mps.ypath.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="1169047366677">
      <property name="name" nameId="tpck.1169194664001" value="XmlDemo" />
    </node>
  </roots>
  <root id="1169047366677">
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1169047415374">
      <property name="name" nameId="tpck.1169194664001" value="main" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1169047418134" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1169047415376">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1169048035392">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1169048035393">
            <property name="name" nameId="tpck.1169194664001" value="INPUT" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196637341" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1197994591169">
              <property name="value" nameId="tpee.1070475926801" value="&lt;doc&gt; &lt;a&gt;&lt;b&gt;&lt;foobar/&gt;&lt;findme baz=&quot;fooblin&quot;/&gt;&lt;/b&gt;&lt;c&gt;&lt;/c&gt;&lt;/a&gt; &lt;/doc&gt;" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.TryCatchStatement" typeId="tpee.1164879751025" id="1169048613422">
          <node role="body" roleId="tpee.1164879758292" type="tpee.StatementList" typeId="tpee.1068580123136" id="1169048613423">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1169048639110">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1169048639111">
                <property name="name" nameId="tpck.1169194664001" value="is" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1169048639112">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~InputStream" resolveInfo="InputStream" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1217888404849">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1217888404851">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~ByteArrayInputStream%d&lt;init&gt;(byte[])" resolveInfo="ByteArrayInputStream" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628996474">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1169048660235">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1169048035393" resolveInfo="INPUT" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628996475">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dgetBytes()%cbyte[]" resolveInfo="getBytes" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1169048628464">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1169048628465">
                <property name="name" nameId="tpck.1169194664001" value="doc" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1169048628466">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Document" resolveInfo="Document" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628995706">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628999872">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1169048628470">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9yi.~DocumentBuilderFactory%dnewInstance()%cjavax%dxml%dparsers%dDocumentBuilderFactory" resolveInfo="newInstance" />
                      <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="9yi.~DocumentBuilderFactory" resolveInfo="DocumentBuilderFactory" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628999873">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9yi.~DocumentBuilderFactory%dnewDocumentBuilder()%cjavax%dxml%dparsers%dDocumentBuilder" resolveInfo="newDocumentBuilder" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628995707">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9yi.~DocumentBuilder%dparse(java%dio%dInputStream)%corg%dw3c%ddom%dDocument" resolveInfo="parse" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1197994596090">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1169048639111" resolveInfo="is" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="1175090694726">
              <node role="iterable" roleId="tpee.1144226360166" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1175164319381">
                <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1175090703444">
                  <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1175090703445">
                    <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="tpk9.1175083364493" />
                    <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1175090701994">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1169048628465" resolveInfo="doc" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1175090703446">
                    <property name="axis" nameId="tpki.1168527174196" value="DESCENDANTS" />
                  </node>
                </node>
                <node role="operation" roleId="tpki.1168468671991" type="tpki.MatchKindOperation" typeId="tpki.1172242735136" id="1175164319382">
                  <link role="nodeKind" roleId="tpki.1172242802393" targetNodeId="tpk9.1175164209843" />
                </node>
              </node>
              <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1175090694728">
                <property name="name" nameId="tpck.1169194664001" value="node" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1175090697236">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
                </node>
              </node>
              <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1175090694730">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1175090708524">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628997237">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1175090708525">
                      <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628997238">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln(java%dlang%dObject)%cvoid" resolveInfo="println" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1175090715866">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1175090694728" resolveInfo="node" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="1175165765485">
              <node role="iterable" roleId="tpee.1144226360166" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1175170426638">
                <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1175252786877">
                  <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1175252783348">
                    <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1175165777254">
                      <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1175165777255">
                        <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="tpk9.1175083364493" />
                        <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1175165776061">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1169048628465" resolveInfo="doc" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1175165777256">
                        <property name="axis" nameId="tpki.1168527174196" value="DESCENDANTS" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpki.1168468671991" type="tpki.MatchPropertyOperation" typeId="tpki.1175169769579" id="1175252792856">
                      <link role="property" roleId="tpki.1175169795791" targetNodeId="tpk9.1175164263587" />
                      <node role="matchExpression" roleId="tpki.1175170018451" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1175252802901">
                        <property name="value" nameId="tpee.1070475926801" value="a" />
                      </node>
                      <node role="nodeKindOccurrence" roleId="tpki.1175165403535" type="tpki.TreeNodeKindOccurrence" typeId="tpki.1175165417012" id="1175252792858">
                        <link role="nodeKind" roleId="tpki.1175167444487" targetNodeId="tpk9.1175164209843" />
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1175252786878">
                    <property name="axis" nameId="tpki.1168527174196" value="DESCENDANTS" />
                  </node>
                </node>
                <node role="operation" roleId="tpki.1168468671991" type="tpki.MatchPropertyOperation" typeId="tpki.1175169769579" id="1175170512113">
                  <link role="property" roleId="tpki.1175169795791" targetNodeId="tpk9.1175164263587" />
                  <node role="matchExpression" roleId="tpki.1175170018451" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1175170522726">
                    <property name="value" nameId="tpee.1070475926801" value="findme" />
                  </node>
                  <node role="nodeKindOccurrence" roleId="tpki.1175165403535" type="tpki.TreeNodeKindOccurrence" typeId="tpki.1175165417012" id="1175170512115">
                    <link role="nodeKind" roleId="tpki.1175167444487" targetNodeId="tpk9.1175164209843" />
                  </node>
                </node>
              </node>
              <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1175165765487">
                <property name="name" nameId="tpck.1169194664001" value="node" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1175165766866">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
                </node>
              </node>
              <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1175165765489">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1175249904714">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628999936">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1175249904715">
                      <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628999937">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln(java%dlang%dString)%cvoid" resolveInfo="println" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1175249935691">
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1175249937520">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1175165765487" resolveInfo="node" />
                        </node>
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1175249931027">
                          <property name="value" nameId="tpee.1070475926801" value="Found: " />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="1175882263391">
              <node role="iterable" roleId="tpee.1144226360166" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1175882291218">
                <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1175882287338">
                  <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1175882277198">
                    <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1175882271113">
                      <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1175882271114">
                        <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="tpk9.1175083364493" />
                        <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1175882269670">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1169048628465" resolveInfo="doc" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1175882271115">
                        <property name="axis" nameId="tpki.1168527174196" value="DESCENDANTS" />
                        <property name="useDefault" nameId="tpki.1184147405254" value="false" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpki.1168468671991" type="tpki.MatchDefaultPropertyOperation" typeId="tpki.1175879071372" id="1175882277200">
                      <node role="matchExpression" roleId="tpki.1175879605156" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1175882283096">
                        <property name="value" nameId="tpee.1070475926801" value="a" />
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1175882287339">
                    <property name="axis" nameId="tpki.1168527174196" value="DESCENDANTS" />
                    <property name="useDefault" nameId="tpki.1184147405254" value="false" />
                  </node>
                </node>
                <node role="operation" roleId="tpki.1168468671991" type="tpki.MatchDefaultPropertyOperation" typeId="tpki.1175879071372" id="1175882291219">
                  <node role="matchExpression" roleId="tpki.1175879605156" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1175882296765">
                    <property name="value" nameId="tpee.1070475926801" value="findme" />
                  </node>
                </node>
              </node>
              <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1175882263393">
                <property name="name" nameId="tpck.1169194664001" value="node" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1175882265201">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
                </node>
              </node>
              <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1175882263395">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1175882317942">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628986846">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1175882317943">
                      <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628986847">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln(java%dlang%dString)%cvoid" resolveInfo="println" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="1175882331119">
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1175882332756">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1175882263393" resolveInfo="node" />
                        </node>
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1175882326526">
                          <property name="value" nameId="tpee.1070475926801" value="Found again: " />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="1169048613424">
            <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1169048613425">
              <property name="name" nameId="tpck.1169194664001" value="ignored" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1169048617499">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Exception" resolveInfo="Exception" />
              </node>
            </node>
            <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="1169048613427" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1169047422979">
        <property name="name" nameId="tpck.1169194664001" value="args" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="1169047425420">
          <node role="componentType" roleId="tpee.1070534760952" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196636510" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1178883069989" />
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1178883054823" />
  </root>
</model>

