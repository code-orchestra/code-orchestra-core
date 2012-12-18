<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:00000000-0000-4000-0000-011c895905bb(treepathFeatures)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="83888646-71ce-4f1c-9c53-c54016f6ad4f(jetbrains.mps.baseLanguage.collections)" />
  <language namespace="3a13115c-633c-4c5c-bbcc-75c4219e9555(jetbrains.mps.lang.quotation)" />
  <language namespace="fd392034-7849-419d-9071-12563d152375(jetbrains.mps.baseLanguage.closures)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="d4e445fa-e1ac-4fc8-8d3b-e62b05d0ea4c(jetbrains.mps.ypath)" />
  <import index="tpce" modelUID="r:00000000-0000-4000-0000-011c89590292(jetbrains.mps.lang.structure.structure)" version="0" />
  <import index="tp25" modelUID="r:00000000-0000-4000-0000-011c89590301(jetbrains.mps.lang.smodel.structure)" version="16" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" />
  <import index="kvg6" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#org.w3c.dom(JDK/org.w3c.dom@java_stub)" version="-1" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="fxg7" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.io(JDK/java.io@java_stub)" version="-1" />
  <import index="9yi" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#javax.xml.parsers(JDK/javax.xml.parsers@java_stub)" version="-1" />
  <import index="c5dh" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#jetbrains.mps.lang.smodel.generator.smodelAdapter(MPS.Classpath/jetbrains.mps.lang.smodel.generator.smodelAdapter@java_stub)" version="-1" />
  <import index="k7g3" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.util(JDK/java.util@java_stub)" version="-1" />
  <import index="tp2q" modelUID="r:00000000-0000-4000-0000-011c8959032e(jetbrains.mps.baseLanguage.collections.structure)" version="7" implicit="yes" />
  <import index="tp2c" modelUID="r:00000000-0000-4000-0000-011c89590338(jetbrains.mps.baseLanguage.closures.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tp3r" modelUID="r:00000000-0000-4000-0000-011c8959034b(jetbrains.mps.lang.quotation.structure)" version="0" implicit="yes" />
  <import index="tpki" modelUID="r:00000000-0000-4000-0000-011c895905ae(jetbrains.mps.ypath.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpki.TreePathAspect" typeId="tpki.1168879975004" id="1183980545104">
      <property name="name" nameId="tpck.1169194664001" value="TryFeatures" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="1184148497590">
      <property name="name" nameId="tpck.1169194664001" value="FeaturesDemo" />
    </node>
    <node type="tpki.TreePathAspect" typeId="tpki.1168879975004" id="1184685688047">
      <property name="name" nameId="tpck.1169194664001" value="SNODE" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="1184773002627">
      <property name="name" nameId="tpck.1169194664001" value="SnodeDemo" />
    </node>
    <node type="tpki.TreePathAspect" typeId="tpki.1168879975004" id="1191934136657">
      <property name="name" nameId="tpck.1169194664001" value="SNODE_GEN" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="1240329957161">
      <property name="name" nameId="tpck.1169194664001" value="SnodeGenUtil" />
    </node>
  </roots>
  <root id="1183980545104">
    <node role="nodeKinds" roleId="tpki.1172240749936" type="tpki.TreeNodeKind" typeId="tpki.1172240563057" id="1197705668634">
      <property name="name" nameId="tpck.1169194664001" value="foo" />
      <node role="properties" roleId="tpki.1175162866857" type="tpki.TreeNodeKindProperty" typeId="tpki.1175160940972" id="1197705676415">
        <property name="name" nameId="tpck.1169194664001" value="BAR" />
        <property name="default" nameId="tpki.1175877871677" value="true" />
        <node role="getter" roleId="tpki.1175160966691" type="tpki.PropertyGetter" typeId="tpki.1175161007000" id="1197705676416">
          <node role="parameter" roleId="tpki.1168428725556" type="tpki.LambdaMethodParameter" typeId="tpki.1168428709096" id="1197705676417">
            <property name="name" nameId="tpck.1169194664001" value="node" />
          </node>
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1197705676418">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1197705709089">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1197705709090">
                <property name="value" nameId="tpee.1070475926801" value="" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="properties" roleId="tpki.1175162866857" type="tpki.TreeNodeKindProperty" typeId="tpki.1175160940972" id="1197705912407">
        <property name="name" nameId="tpck.1169194664001" value="BAZ" />
        <property name="default" nameId="tpki.1175877871677" value="false" />
        <node role="getter" roleId="tpki.1175160966691" type="tpki.PropertyGetter" typeId="tpki.1175161007000" id="1197705912408">
          <node role="parameter" roleId="tpki.1168428725556" type="tpki.LambdaMethodParameter" typeId="tpki.1168428709096" id="1197705912409">
            <property name="name" nameId="tpck.1169194664001" value="node" />
          </node>
          <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1197705912410">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1197705937142">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1197705937143">
                <property name="value" nameId="tpee.1070475926801" value="" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="trigger" roleId="tpki.1172240613817" type="tpki.KindBlock" typeId="tpki.1172243209751" id="1197705668635">
        <node role="parameter" roleId="tpki.1168428725556" type="tpki.LambdaMethodParameter" typeId="tpki.1168428709096" id="1197705668636">
          <property name="name" nameId="tpck.1169194664001" value="node" />
        </node>
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1197705668637">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1197705695677">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1197705695678">
              <property name="value" nameId="tpee.1068580123138" value="true" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="features" roleId="tpki.1183980376561" type="tpki.ListFeature" typeId="tpki.1183978481785" id="1184067892215">
      <property name="name" nameId="tpck.1169194664001" value="nodes" />
      <property name="writable" nameId="tpki.1184066216986" value="false" />
      <property name="default" nameId="tpki.1184094715536" value="false" />
      <node role="getFunction" roleId="tpki.1183979776626" type="tpki.FeatureGetFun" typeId="tpki.1183978641483" id="1184067892216">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184067892217">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1184067910293">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628997995">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628993924">
                <node role="operand" roleId="tpee.1197027771414" type="tpki.NodeFunctionParam" typeId="tpki.1183978789889" id="1184067910294" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628993925">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~Node%dgetChildNodes()%corg%dw3c%ddom%dNodeList" resolveInfo="getChildNodes" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628997996">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~NodeList%ditem(int)%corg%dw3c%ddom%dNode" resolveInfo="item" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpki.IndexFunctionParam" typeId="tpki.1183978827781" id="1184067922292" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="sizeFunction" roleId="tpki.1183979799057" type="tpki.FeatureSizeFun" typeId="tpki.1183978693009" id="1184067892218">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184067892219">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1184067925893">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628987690">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628991845">
                <node role="operand" roleId="tpee.1197027771414" type="tpki.NodeFunctionParam" typeId="tpki.1183978789889" id="1184067925894" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628991846">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~Node%dgetChildNodes()%corg%dw3c%ddom%dNodeList" resolveInfo="getChildNodes" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628987691">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~NodeList%dgetLength()%cint" resolveInfo="getLength" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="features" roleId="tpki.1183980376561" type="tpki.SequenceFeature" typeId="tpki.1184066481897" id="1184068102100">
      <property name="writable" nameId="tpki.1184066216986" value="false" />
      <property name="name" nameId="tpck.1169194664001" value="attributes" />
      <property name="default" nameId="tpki.1184094715536" value="false" />
      <node role="sequenceFunction" roleId="tpki.1184066514754" type="tpki.FeatureSequenceFun" typeId="tpki.1184064321014" id="1184068102101">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184068102102">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1184068366994">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1184068366995">
              <property name="name" nameId="tpck.1169194664001" value="_node" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1184068366996">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpki.NodeFunctionParam" typeId="tpki.1183978789889" id="1184068370527" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1184068527933">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1184068528716">
              <node role="creator" roleId="tpee.1145553007750" type="tp2q.SequenceCreator" typeId="tp2q.1224414427926" id="1227876789939">
                <node role="elementType" roleId="tp2q.1224414456414" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1227876789940">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
                </node>
                <node role="initializer" roleId="tp2q.1224414466839" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876789941">
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876789942">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1227876789943">
                      <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1227876789944">
                        <property name="name" nameId="tpck.1169194664001" value="count" />
                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1227876789945" />
                        <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876789946">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876789947">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1227876789948">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184068366995" resolveInfo="_node" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1227876789949">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~Node%dgetAttributes()%corg%dw3c%ddom%dNamedNodeMap" resolveInfo="getAttributes" />
                            </node>
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1227876789950">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~NamedNodeMap%dgetLength()%cint" resolveInfo="getLength" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="1227876789951">
                      <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1227876789952">
                        <property name="name" nameId="tpck.1169194664001" value="idx" />
                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="1227876789953" />
                        <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1227876789954">
                          <property name="value" nameId="tpee.1068580320021" value="0" />
                        </node>
                      </node>
                      <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876789955">
                        <node role="statement" roleId="tpee.1068581517665" type="tp2c.YieldStatement" typeId="tp2c.1200830824066" id="1227876819045">
                          <node role="expression" roleId="tp2c.1200830928149" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876819046">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876819047">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1227876819048">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184068366995" resolveInfo="_node" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1227876819050">
                                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~Node%dgetAttributes()%corg%dw3c%ddom%dNamedNodeMap" resolveInfo="getAttributes" />
                              </node>
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1227876819051">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~NamedNodeMap%ditem(int)%corg%dw3c%ddom%dNode" resolveInfo="item" />
                              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1227876819052">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876789952" resolveInfo="idx" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="1227876789963">
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1227876789964">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876789944" resolveInfo="count" />
                        </node>
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1227876789965">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876789952" resolveInfo="idx" />
                        </node>
                      </node>
                      <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="1238145924326">
                        <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1238145924327">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876789952" resolveInfo="idx" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="sizeFunction" roleId="tpki.1184066532681" type="tpki.FeatureSizeFun" typeId="tpki.1183978693009" id="1184068102103">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184068102104">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1184068560651">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628996170">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628989256">
                <node role="operand" roleId="tpee.1197027771414" type="tpki.NodeFunctionParam" typeId="tpki.1183978789889" id="1184068560652" />
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628989257">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~Node%dgetAttributes()%corg%dw3c%ddom%dNamedNodeMap" resolveInfo="getAttributes" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628996171">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~NamedNodeMap%dgetLength()%cint" resolveInfo="getLength" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="treePathType" roleId="tpki.1179235945873" type="tpki.TreePathType" typeId="tpki.1168428529658" id="1183980545106">
      <node role="nodeType" roleId="tpki.1168428551640" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1183980581996">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Node" resolveInfo="Node" />
      </node>
    </node>
    <node role="parentBlock" roleId="tpki.1179298507919" type="tpki.ParentBlock" typeId="tpki.1168428668253" id="1183980545108">
      <node role="parameter" roleId="tpki.1168428725556" type="tpki.LambdaMethodParameter" typeId="tpki.1168428709096" id="1183980545109">
        <property name="name" nameId="tpck.1169194664001" value="node" />
      </node>
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1183980545110">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1184238624130">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628994471">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ClosureParameterReference" typeId="tpee.1153179560115" id="1184238624131">
              <link role="closureParameter" roleId="tpee.1153179615652" targetNodeId="1183980545109" resolveInfo="node" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628994472">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~Node%dgetParentNode()%corg%dw3c%ddom%dNode" resolveInfo="getParentNode" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="childrenBlock" roleId="tpki.1179298620994" type="tpki.ChildrenBlock" typeId="tpki.1168428680123" id="1183980545111">
      <node role="parameter" roleId="tpki.1168428725556" type="tpki.LambdaMethodParameter" typeId="tpki.1168428709096" id="1183980545112">
        <property name="name" nameId="tpck.1169194664001" value="node" />
      </node>
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1183980545113" />
    </node>
  </root>
  <root id="1184148497590">
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1184148507065">
      <property name="name" nameId="tpck.1169194664001" value="main" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1184148507066" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1184148507067" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184148507068">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1184148604080">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1184148604081">
            <property name="name" nameId="tpck.1169194664001" value="INPUT" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196635192" />
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1217888419880">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1217888419882">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%d&lt;init&gt;(java%dlang%dString)" resolveInfo="String" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1184148604084">
                  <property name="value" nameId="tpee.1070475926801" value="&lt;root&gt;&lt;a a1=&quot;a1&quot;&gt;&lt;b b1=&quot;b1&quot; b2=&quot;b2&quot;&gt;&lt;c c1=&quot;c1&quot;/&gt;&lt;/b&gt;&lt;/a&gt;&lt;/root&gt;" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.TryCatchStatement" typeId="tpee.1164879751025" id="1184148621870">
          <node role="body" roleId="tpee.1164879758292" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184148621871">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1184148621872">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1184148621873">
                <property name="name" nameId="tpck.1169194664001" value="is" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1184148621874">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fxg7.~InputStream" resolveInfo="InputStream" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1217888360466">
                  <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="1217888360468">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~ByteArrayInputStream%d&lt;init&gt;(byte[])" resolveInfo="ByteArrayInputStream" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628993142">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1184148621877">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184148604081" resolveInfo="INPUT" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628993143">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dgetBytes()%cbyte[]" resolveInfo="getBytes" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1184148621878">
              <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1184148621879">
                <property name="name" nameId="tpck.1169194664001" value="doc" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1184148621880">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="kvg6.~Document" resolveInfo="Document" />
                </node>
                <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628993525">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628999645">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1184148621883">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9yi.~DocumentBuilderFactory%dnewInstance()%cjavax%dxml%dparsers%dDocumentBuilderFactory" resolveInfo="newInstance" />
                      <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="9yi.~DocumentBuilderFactory" resolveInfo="DocumentBuilderFactory" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628999646">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9yi.~DocumentBuilderFactory%dnewDocumentBuilder()%cjavax%dxml%dparsers%dDocumentBuilder" resolveInfo="newDocumentBuilder" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628993526">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9yi.~DocumentBuilder%dparse(java%dio%dInputStream)%corg%dw3c%ddom%dDocument" resolveInfo="parse" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1184148621884">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184148621873" resolveInfo="is" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1184148704587">
              <node role="expression" roleId="tpee.1068580123156" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1184149365350">
                <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1184149111837">
                  <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1184149087222">
                    <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1184148711460">
                      <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1184148705520">
                        <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="1183980545104" resolveInfo="TryFeatures" />
                        <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1184148704588">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184148621879" resolveInfo="doc" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1184148711465">
                        <property name="axis" nameId="tpki.1168527174196" value="DESCENDANTS" />
                        <property name="useDefault" nameId="tpki.1184147405254" value="false" />
                        <link role="usedFeature" roleId="tpki.1184147586245" targetNodeId="1184067892215" resolveInfo="nodes" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1184149087226">
                      <property name="axis" nameId="tpki.1168527174196" value="DESCENDANTS" />
                      <property name="useDefault" nameId="tpki.1184147405254" value="false" />
                      <link role="usedFeature" roleId="tpki.1184147586245" targetNodeId="1184068102100" resolveInfo="attributes" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1184149111841">
                    <property name="axis" nameId="tpki.1168527174196" value="ANCESTORS" />
                  </node>
                </node>
                <node role="operation" roleId="tpki.1168468671991" type="tpki.WhereOperation" typeId="tpki.1168527701993" id="1184149365358">
                  <node role="whereBlock" roleId="tpki.1168527754706" type="tpki.WhereBlock" typeId="tpki.1168527733553" id="1184149365359">
                    <node role="parameter" roleId="tpki.1168428725556" type="tpki.LambdaMethodParameter" typeId="tpki.1168428709096" id="1184149365360">
                      <property name="name" nameId="tpck.1169194664001" value="node" />
                    </node>
                    <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184149365361">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1184246467860">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628990879">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628989910">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.ClosureParameterReference" typeId="tpee.1153179560115" id="1184246467861">
                              <link role="closureParameter" roleId="tpee.1153179615652" targetNodeId="1184149365360" resolveInfo="node" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628989911">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="kvg6.~Node%dgetNodeValue()%cjava%dlang%dString" resolveInfo="getNodeValue" />
                            </node>
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628990880">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dequals(java%dlang%dObject)%cboolean" resolveInfo="equals" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1184246485694">
                              <property name="value" nameId="tpee.1070475926801" value="c" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="catchClause" roleId="tpee.1164903496223" type="tpee.CatchClause" typeId="tpee.1164903280175" id="1184148621946">
            <node role="throwable" roleId="tpee.1164903359217" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1184148621947">
              <property name="name" nameId="tpck.1169194664001" value="ignored" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="1184148621948">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Exception" resolveInfo="Exception" />
              </node>
            </node>
            <node role="catchBody" roleId="tpee.1164903359218" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184148621949" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1184148566292">
        <property name="name" nameId="tpck.1169194664001" value="args" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="1184148568513">
          <node role="componentType" roleId="tpee.1070534760952" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196635976" />
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1184148497591" />
  </root>
  <root id="1184685688047">
    <node role="features" roleId="tpki.1183980376561" type="tpki.ParamSequenceFeature" typeId="tpki.1184658874084" id="1184685792724">
      <property name="name" nameId="tpck.1169194664001" value="child" />
      <property name="default" nameId="tpki.1184094715536" value="false" />
      <node role="sequenceFunction" roleId="tpki.1184066514754" type="tpki.ParamFeatureSequenceFun" typeId="tpki.1184658165849" id="1184685792725">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184685792726">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1184687034428">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1184687035067">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="c5dh.~SLinkOperations" resolveInfo="SLinkOperations" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="c5dh.~SLinkOperations%dgetTargets(jetbrains%dmps%dsmodel%dSNode,java%dlang%dString,boolean)%cjava%dutil%dList" resolveInfo="getTargets" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpki.NodeFunctionParam" typeId="tpki.1183978789889" id="1184687035068" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1184687035069" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1184687035070">
                <property name="value" nameId="tpee.1068580123138" value="true" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="sizeFunction" roleId="tpki.1184066532681" type="tpki.ParamFeatureSizeFun" typeId="tpki.1184658208019" id="1184685792727">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184685792728">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1184687047941">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628997172">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1184687048449">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="c5dh.~SLinkOperations" resolveInfo="SLinkOperations" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="c5dh.~SLinkOperations%dgetTargets(jetbrains%dmps%dsmodel%dSNode,java%dlang%dString,boolean)%cjava%dutil%dList" resolveInfo="getTargets" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpki.NodeFunctionParam" typeId="tpki.1183978789889" id="1184687048450" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1184687048451" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1184687048452">
                  <property name="value" nameId="tpee.1068580123138" value="true" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628997173">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dsize()%cint" resolveInfo="size" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameterQueryFunction" roleId="tpki.1184659272196" type="tpki.ParameterQueryFun" typeId="tpki.1184593387281" id="1184685792734">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184685792735">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1184685843618">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625338680">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625338009">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227903331">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227846986">
                    <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="1184844347519">
                      <link role="concept" roleId="tp25.1140138128738" targetNodeId="tp25.1138055754698" />
                      <node role="leftExpression" roleId="tp25.1140138123956" type="tpki.NodeTypeFunctionParam" typeId="tpki.1184593479323" id="1184685843619" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1184844383427">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="tp25.1138405853777" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="1184685900064">
                    <link role="link" roleId="tp25.1138056546658" targetNodeId="tpce.1071489727083" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.WhereOperation" typeId="tp2q.1202120902084" id="1227876805071">
                  <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876805072">
                    <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1227876805073">
                      <property name="name" nameId="tpck.1169194664001" value="it" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489639" />
                    </node>
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876805075">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1227876805076">
                        <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876805077">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1227876805078">
                            <property name="value" nameId="tpee.1070475926801" value="aggregation" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1227876805079">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dequals(java%dlang%dObject)%cboolean" resolveInfo="equals" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876805080">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876815914">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876805073" resolveInfo="it" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1227876805082">
                                <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599937831" resolveInfo="metaClass" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.SelectOperation" typeId="tp2q.1202128969694" id="1227876794363">
                <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876794364">
                  <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1227876794365">
                    <property name="name" nameId="tpck.1169194664001" value="it" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490277" />
                  </node>
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876794367">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1227876794368">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876794369">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876817991">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876794365" resolveInfo="it" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1227876794371">
                          <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599776563" resolveInfo="role" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="targetTypeFunction" roleId="tpki.1184659278821" type="tpki.TargetTypeFun" typeId="tpki.1184603621091" id="1184685792736">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184685792737">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1184851332821">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1184851332822">
              <property name="name" nameId="tpck.1169194664001" value="_param" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196633592" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="4112797171562794360" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1184851363567">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1184851363568">
              <property name="name" nameId="tpck.1169194664001" value="ld" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1184851363569">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpce.1071489288298" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625339491">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625330723">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227831416">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227897530">
                      <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="1184851261934">
                        <link role="concept" roleId="tp25.1140138128738" targetNodeId="tp25.1138055754698" />
                        <node role="leftExpression" roleId="tp25.1140138123956" type="tpki.NodeTypeFunctionParam" typeId="tpki.1184593479323" id="1184851255360" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1184851273506">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="tp25.1138405853777" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="1184851276616">
                      <link role="link" roleId="tp25.1138056546658" targetNodeId="tpce.1071489727083" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.WhereOperation" typeId="tp2q.1202120902084" id="1227876801383">
                    <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876801384">
                      <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1227876801385">
                        <property name="name" nameId="tpck.1169194664001" value="it" />
                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489837" />
                      </node>
                      <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876801387">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1227876801388">
                          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876801389">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876801390">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876815103">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876801385" resolveInfo="it" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1227876801392">
                                <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599776563" resolveInfo="role" />
                              </node>
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1227876801393">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dequals(java%dlang%dObject)%cboolean" resolveInfo="equals" />
                              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1227876801394">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184851332822" resolveInfo="_param" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetFirstOperation" typeId="tp2q.1165525191778" id="1184851359209" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1184851401431">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1184851401432">
              <property name="name" nameId="tpck.1169194664001" value="trg" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1184851401433">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpce.1169125787135" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227959991">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1184851380593">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184851363568" resolveInfo="ld" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1184851398623">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="tpce.1071599976176" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1184851368404">
            <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1196853157154">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1196853157155">
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="1196853157160">
                  <property name="linkRole" nameId="tpck.1757699476691236116" value="concept" />
                  <node role="expression" roleId="tp3r.1196350785111" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1196853157161">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184851401432" resolveInfo="trg" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameterType" roleId="tpki.1184659264134" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196634408" />
      <node role="toStringFunction" roleId="tpki.1184659752377" type="tpki.ToStringFun" typeId="tpki.1184659771596" id="1185011302719">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1185011302720">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1185011327979">
            <node role="expression" roleId="tpee.1068580123156" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1185011327980" />
          </node>
        </node>
      </node>
    </node>
    <node role="features" roleId="tpki.1183980376561" type="tpki.ParamSequenceFeature" typeId="tpki.1184658874084" id="1184688224775">
      <property name="name" nameId="tpck.1169194664001" value="link" />
      <property name="default" nameId="tpki.1184094715536" value="false" />
      <property name="writable" nameId="tpki.1184066216986" value="false" />
      <node role="sequenceFunction" roleId="tpki.1184066514754" type="tpki.ParamFeatureSequenceFun" typeId="tpki.1184658165849" id="1184688224776">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184688224777">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1184688446655">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1184688446656">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="c5dh.~SLinkOperations" resolveInfo="SLinkOperations" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="c5dh.~SLinkOperations%dgetTargets(jetbrains%dmps%dsmodel%dSNode,java%dlang%dString,boolean)%cjava%dutil%dList" resolveInfo="getTargets" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpki.NodeFunctionParam" typeId="tpki.1183978789889" id="1184688446657" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1184688446658" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1184688446659">
                <property name="value" nameId="tpee.1068580123138" value="false" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="sizeFunction" roleId="tpki.1184066532681" type="tpki.ParamFeatureSizeFun" typeId="tpki.1184658208019" id="1184688224778">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184688224779">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1184688456181">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217628988744">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1184688456182">
                <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="c5dh.~SLinkOperations" resolveInfo="SLinkOperations" />
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="c5dh.~SLinkOperations%dgetTargets(jetbrains%dmps%dsmodel%dSNode,java%dlang%dString,boolean)%cjava%dutil%dList" resolveInfo="getTargets" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpki.NodeFunctionParam" typeId="tpki.1183978789889" id="1184688456183" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1184688456184" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1184688456185">
                  <property name="value" nameId="tpee.1068580123138" value="false" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1217628988745">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dsize()%cint" resolveInfo="size" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameterType" roleId="tpki.1184659264134" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196637059" />
      <node role="parameterQueryFunction" roleId="tpki.1184659272196" type="tpki.ParameterQueryFun" typeId="tpki.1184593387281" id="1184688224785">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184688224786">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1184688403163">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625337596">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625314189">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227928442">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227956580">
                    <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="1184844395048">
                      <link role="concept" roleId="tp25.1140138128738" targetNodeId="tp25.1138055754698" />
                      <node role="leftExpression" roleId="tp25.1140138123956" type="tpki.NodeTypeFunctionParam" typeId="tpki.1184593479323" id="1184688403170" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1184844403214">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="tp25.1138405853777" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="1184688403167">
                    <link role="link" roleId="tp25.1138056546658" targetNodeId="tpce.1071489727083" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.WhereOperation" typeId="tp2q.1202120902084" id="1227876799156">
                  <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876799157">
                    <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1227876799158">
                      <property name="name" nameId="tpck.1169194664001" value="it" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490782" />
                    </node>
                    <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876799160">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1227876799161">
                        <node role="expression" roleId="tpee.1068580123156" type="tpee.OrExpression" typeId="tpee.1080223426719" id="1227876799162">
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1227876799163">
                            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1227876799164" />
                            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876799165">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876816086">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876799158" resolveInfo="it" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1227876799167">
                                <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599937831" resolveInfo="metaClass" />
                              </node>
                            </node>
                          </node>
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876799168">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1227876799169">
                              <property name="value" nameId="tpee.1070475926801" value="reference" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1227876799170">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dequals(java%dlang%dObject)%cboolean" resolveInfo="equals" />
                              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876799171">
                                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876815147">
                                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876799158" resolveInfo="it" />
                                </node>
                                <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1227876799173">
                                  <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599937831" resolveInfo="metaClass" />
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.SelectOperation" typeId="tp2q.1202128969694" id="1227876794646">
                <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876794647">
                  <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1227876794648">
                    <property name="name" nameId="tpck.1169194664001" value="it" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490182" />
                  </node>
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876794650">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1227876794651">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876794652">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876817337">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876794648" resolveInfo="it" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1227876794654">
                          <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599776563" resolveInfo="role" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="targetTypeFunction" roleId="tpki.1184659278821" type="tpki.TargetTypeFun" typeId="tpki.1184603621091" id="1184688224787">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184688224788">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1184851740887">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1184851740888">
              <property name="name" nameId="tpck.1169194664001" value="_param" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196635725" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1184851744505" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1184851752333">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1184851752334">
              <property name="name" nameId="tpck.1169194664001" value="ld" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1184851752335">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpce.1071489288298" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625325110">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625312111">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227937574">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227933593">
                      <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="1184851752342">
                        <link role="concept" roleId="tp25.1140138128738" targetNodeId="tp25.1138055754698" />
                        <node role="leftExpression" roleId="tp25.1140138123956" type="tpki.NodeTypeFunctionParam" typeId="tpki.1184593479323" id="1184851752343" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1184851752341">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="tp25.1138405853777" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="1184851752339">
                      <link role="link" roleId="tp25.1138056546658" targetNodeId="tpce.1071489727083" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp2q.WhereOperation" typeId="tp2q.1202120902084" id="1227876800331">
                    <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876800332">
                      <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1227876800333">
                        <property name="name" nameId="tpck.1169194664001" value="it" />
                        <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490803" />
                      </node>
                      <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876800335">
                        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1227876800336">
                          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876800337">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876800338">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876815558">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876800333" resolveInfo="it" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1227876800340">
                                <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599776563" resolveInfo="role" />
                              </node>
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1227876800341">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dequals(java%dlang%dObject)%cboolean" resolveInfo="equals" />
                              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1227876800342">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184851740888" resolveInfo="_param" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp2q.GetFirstOperation" typeId="tp2q.1165525191778" id="1184851752354" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1185016481799">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1185016481800">
              <property name="name" nameId="tpck.1169194664001" value="trg" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1185016481801">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpce.1169125787135" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227841978">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1185016481804">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184851752334" resolveInfo="ld" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1185016481803">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="tpce.1071599976176" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1184688590556">
            <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1196853157164">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1196853157165">
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="1196853157169">
                  <property name="linkRole" nameId="tpck.1757699476691236116" value="concept" />
                  <node role="expression" roleId="tp3r.1196350785111" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1196853157170">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1185016481800" resolveInfo="trg" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="toStringFunction" roleId="tpki.1184659752377" type="tpki.ToStringFun" typeId="tpki.1184659771596" id="1185011310499">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1185011310500">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1185011344775">
            <node role="expression" roleId="tpee.1068580123156" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1185011344776" />
          </node>
        </node>
      </node>
    </node>
    <node role="treePathType" roleId="tpki.1179235945873" type="tpki.TreePathType" typeId="tpki.1168428529658" id="1184685688048">
      <node role="nodeType" roleId="tpki.1168428551640" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1184685778181" />
    </node>
    <node role="parentBlock" roleId="tpki.1179298507919" type="tpki.ParentBlock" typeId="tpki.1168428668253" id="1184685688050">
      <node role="parameter" roleId="tpki.1168428725556" type="tpki.LambdaMethodParameter" typeId="tpki.1168428709096" id="1184685688051">
        <property name="name" nameId="tpck.1169194664001" value="node" />
      </node>
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184685688052">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1184687141107">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227848881">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ClosureParameterReference" typeId="tpee.1153179560115" id="1184687141108">
              <link role="closureParameter" roleId="tpee.1153179615652" targetNodeId="1184685688051" resolveInfo="node" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="1184687143394" />
          </node>
        </node>
      </node>
    </node>
    <node role="childrenBlock" roleId="tpki.1179298620994" type="tpki.ChildrenBlock" typeId="tpki.1168428680123" id="1184685688053">
      <node role="parameter" roleId="tpki.1168428725556" type="tpki.LambdaMethodParameter" typeId="tpki.1168428709096" id="1184685688054">
        <property name="name" nameId="tpck.1169194664001" value="node" />
      </node>
      <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184685688055" />
    </node>
  </root>
  <root id="1184773002627">
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1184773009709">
      <property name="name" nameId="tpck.1169194664001" value="main" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1184773009710" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1184773009711" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1184773009712">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1184773532713">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1184773532714">
            <property name="name" nameId="tpck.1169194664001" value="foo" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1184773532715">
              <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpce.1071489090640" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1184849947160" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1191847319083">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625348264">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625326939">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="1191847319084">
                <node role="expression" roleId="tpee.1079359253376" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227884064">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1196097007134">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="1196097010908">
                    <link role="link" roleId="tp25.1138056546658" targetNodeId="tpce.1169129564478" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.TranslateOperation" typeId="tp2q.1201792049884" id="1227876791917">
                <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876791918">
                  <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1227876791919">
                    <property name="name" nameId="tpck.1169194664001" value="it" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489790" />
                  </node>
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876791921">
                    <node role="statement" roleId="tpee.1068581517665" type="tp2c.YieldStatement" typeId="tp2c.1200830824066" id="1227876819203">
                      <node role="expression" roleId="tp2c.1200830928149" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876819204">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876819205">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876791919" resolveInfo="it" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1227876819206">
                          <link role="link" roleId="tp25.1138056516764" targetNodeId="tpce.1169127628841" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.TranslateOperation" typeId="tp2q.1201792049884" id="1227876793507">
              <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876793508">
                <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1227876793509">
                  <property name="name" nameId="tpck.1169194664001" value="it" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489657" />
                </node>
                <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876793511">
                  <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="1227876793512">
                    <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="1227876793513">
                      <property name="name" nameId="tpck.1169194664001" value="_zzz_" />
                    </node>
                    <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876793514">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876818152">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876793509" resolveInfo="it" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="1227876793516">
                        <link role="link" roleId="tp25.1138056546658" targetNodeId="tpce.1169127546356" />
                      </node>
                    </node>
                    <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876793517">
                      <node role="statement" roleId="tpee.1068581517665" type="tp2c.YieldStatement" typeId="tp2c.1200830824066" id="1227876819078">
                        <node role="expression" roleId="tp2c.1200830928149" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1227876819079">
                          <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1227876793513" resolveInfo="_zzz_" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="7376433222636453591">
          <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="7376433222636453592">
            <property name="text" nameId="tpee.6329021646629104958" value="The following ypath construct should result in the same expression as above" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1192886672526">
          <node role="expression" roleId="tpee.1068580123156" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1192887318829">
            <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1192887309642">
              <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1192887301283">
                <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1192887301288">
                  <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
                  <link role="usedFeature" roleId="tpki.1184147586245" targetNodeId="4145095496975344165" resolveInfo="child" />
                  <node role="paramObject" roleId="tpki.1184776023529" type="tpki.ParameterWrapper" typeId="tpki.1184768155075" id="1199388095823">
                    <property name="name" nameId="tpck.1169194664001" value="implements" />
                    <link role="paramRef" roleId="tpki.1190213718970" targetNodeId="tpce.1169129564478" />
                  </node>
                </node>
                <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1193055049811">
                  <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="1191934136657" resolveInfo="SNODE_GEN" />
                  <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193330704525">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1192887309646">
                <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
                <link role="usedFeature" roleId="tpki.1184147586245" targetNodeId="4145095496975344219" resolveInfo="link" />
                <node role="paramObject" roleId="tpki.1184776023529" type="tpki.ParameterWrapper" typeId="tpki.1184768155075" id="1199383194286">
                  <property name="name" nameId="tpck.1169194664001" value="intfc" />
                  <link role="paramRef" roleId="tpki.1190213718970" targetNodeId="tpce.1169127628841" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1192887318833">
              <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
              <link role="usedFeature" roleId="tpki.1184147586245" targetNodeId="4145095496975344165" resolveInfo="child" />
              <node role="paramObject" roleId="tpki.1184776023529" type="tpki.ParameterWrapper" typeId="tpki.1184768155075" id="1199388119006">
                <property name="name" nameId="tpck.1169194664001" value="extends" />
                <link role="paramRef" roleId="tpki.1190213718970" targetNodeId="tpce.1169127546356" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="7376433222636454007">
          <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="7376433222636454008">
            <property name="text" nameId="tpee.6329021646629104958" value="Another pair of tests" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1199446450087">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625321544">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1199446460598">
              <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="1199446460599">
                <node role="elementType" roleId="tp2q.1237721435807" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1199446460600" />
                <node role="initValue" roleId="tp2q.1237721435808" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227927397">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1199446460603">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1199446460602">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="tpce.1071489389519" />
                  </node>
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tp2q.TranslateOperation" typeId="tp2q.1201792049884" id="1227876792933">
              <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876792934">
                <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1227876792935">
                  <property name="name" nameId="tpck.1169194664001" value="it" />
                  <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490522" />
                </node>
                <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876792937">
                  <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="1227876792938">
                    <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="1227876792939">
                      <property name="name" nameId="tpck.1169194664001" value="p" />
                    </node>
                    <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876792940">
                      <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="1227876792941">
                        <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="1227876792942">
                          <property name="name" nameId="tpck.1169194664001" value="c" />
                        </node>
                        <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876792943">
                          <node role="operand" roleId="tpee.1197027771414" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1227876792944">
                            <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1227876792939" resolveInfo="p" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetChildrenOperation" typeId="tp25.1171500988903" id="1227876792945" />
                        </node>
                        <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876792946">
                          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1227876792947">
                            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876792948">
                              <node role="statement" roleId="tpee.1068581517665" type="tpee.BreakStatement" typeId="tpee.1081855346303" id="1227876792949">
                                <node role="loopLabelReference" roleId="tpee.9056323058805176516" type="tpee.LoopLabelReference" typeId="tpee.363746191845183785" id="4100552184032605918">
                                  <link role="loopLabel" roleId="tpee.363746191845183786" targetNodeId="4100552184032605917" resolveInfo="with_parents" />
                                </node>
                              </node>
                            </node>
                            <node role="condition" roleId="tpee.1068580123160" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1227876792950">
                              <node role="rightExpression" roleId="tpee.1081773367579" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1227876792951">
                                <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1227876792942" resolveInfo="c" />
                              </node>
                              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876814908">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876792935" resolveInfo="it" />
                              </node>
                            </node>
                          </node>
                          <node role="statement" roleId="tpee.1068581517665" type="tp2c.YieldStatement" typeId="tp2c.1200830824066" id="1227876818925">
                            <node role="expression" roleId="tp2c.1200830928149" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1227876818926">
                              <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1227876792942" resolveInfo="c" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1227876792955">
                      <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="1227876792956">
                        <node role="initValue" roleId="tp2q.1237721435808" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876792957">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876817903">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876792935" resolveInfo="it" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="1227876792959" />
                        </node>
                        <node role="elementType" roleId="tp2q.1237721435807" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1227876792960" />
                      </node>
                    </node>
                    <node role="loopLabel" roleId="tpee.363746191845183793" type="tpee.LoopLabel" typeId="tpee.363746191845175146" id="4100552184032605917">
                      <property name="name" nameId="tpck.1169194664001" value="with_parents" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1199715248656">
          <node role="expression" roleId="tpee.1068580123156" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1199715272074">
            <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1199715253043">
              <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1199715253051">
                <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="1191934136657" resolveInfo="SNODE_GEN" />
                <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1199715248657">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
                </node>
              </node>
              <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1199715253056">
                <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
                <link role="usedFeature" roleId="tpki.1184147586245" targetNodeId="4145095496975344219" resolveInfo="link" />
                <node role="paramObject" roleId="tpki.1184776023529" type="tpki.ParameterWrapper" typeId="tpki.1184768155075" id="1199791781879">
                  <property name="name" nameId="tpck.1169194664001" value="extends" />
                  <link role="paramRef" roleId="tpki.1190213718970" targetNodeId="tpce.1071489389519" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1199715272079">
              <property name="axis" nameId="tpki.1168527174196" value="PRECEDING_SIBLINGS" />
              <link role="usedFeature" roleId="tpki.1184147586245" targetNodeId="4145095496975144451" resolveInfo="allChildren" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="7376433222636453697">
          <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="7376433222636453698">
            <property name="text" nameId="tpee.6329021646629104958" value="And another one" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.CommentedStatementsBlock" typeId="tpee.1177326519037" id="1223661021121">
          <node role="statement" roleId="tpee.1177326540772" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="7376433222636453531">
            <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="7376433222636453532">
              <property name="text" nameId="tpee.6329021646629104958" value=" way too complicated" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1177326540772" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1199714415105">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625326795">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1199714416082">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="1199714416083">
                  <node role="elementType" roleId="tp2q.1237721435807" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1199714416084" />
                  <node role="initValue" roleId="tp2q.1237721435808" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1199714416087">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.TranslateOperation" typeId="tp2q.1201792049884" id="1227876793260">
                <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876793261">
                  <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1227876793262">
                    <property name="name" nameId="tpck.1169194664001" value="it" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490665" />
                  </node>
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876793264">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1227876793265">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227965889523">
                        <node role="operand" roleId="tpee.1197027771414" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876793268">
                          <node role="parameter" roleId="tp2c.1199569906740" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1227876793269">
                            <property name="name" nameId="tpck.1169194664001" value="_zzz_" />
                            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1227876793270" />
                          </node>
                          <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876793271">
                            <node role="statement" roleId="tpee.1068581517665" type="tp2q.ForEachStatement" typeId="tp2q.1153943597977" id="1227876793272">
                              <node role="variable" roleId="tp2q.1153944400369" type="tp2q.ForEachVariable" typeId="tp2q.1153944193378" id="1227876793273">
                                <property name="name" nameId="tpck.1169194664001" value="_yyy_" />
                              </node>
                              <node role="inputSequence" roleId="tp2q.1153944424730" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876793274">
                                <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876793275">
                                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876793269" resolveInfo="_zzz_" />
                                </node>
                                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetChildrenOperation" typeId="tp25.1171500988903" id="1227876793276" />
                              </node>
                              <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876793277">
                                <node role="statement" roleId="tpee.1068581517665" type="tp2c.YieldStatement" typeId="tp2c.1200830824066" id="1227876818856">
                                  <node role="expression" roleId="tp2c.1200830928149" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1227876818857">
                                    <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1227876793273" resolveInfo="_yyy_" />
                                  </node>
                                </node>
                                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1227876793280">
                                  <node role="expression" roleId="tpee.1068580123156" type="tp2c.InvokeExpression" typeId="tp2c.1199711271002" id="1227876793281">
                                    <node role="parameter" roleId="tp2c.1199711344856" type="tp2q.ForEachVariableReference" typeId="tp2q.1153944233411" id="1227876793282">
                                      <link role="variable" roleId="tp2q.1153944258490" targetNodeId="1227876793273" resolveInfo="_yyy_" />
                                    </node>
                                  </node>
                                </node>
                              </node>
                            </node>
                          </node>
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tp2c.InvokeFunctionOperation" typeId="tp2c.1225797177491" id="1227965889526">
                          <node role="parameter" roleId="tp2c.1225797361612" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227965889527">
                            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876793262" resolveInfo="it" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1199715819266">
          <node role="expression" roleId="tpee.1068580123156" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1199715845748">
            <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1199715843343">
              <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="1191934136657" resolveInfo="SNODE_GEN" />
              <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1199715819267">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
              </node>
            </node>
            <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1199715845755">
              <property name="axis" nameId="tpki.1168527174196" value="DESCENDANTS" />
              <link role="usedFeature" roleId="tpki.1184147586245" targetNodeId="4145095496975144451" resolveInfo="allChildren" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="7376433222636454001">
          <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="7376433222636454002">
            <property name="text" nameId="tpee.6329021646629104958" value="Following is just a test" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1197466841683">
          <node role="expression" roleId="tpee.1068580123156" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1197466849567">
            <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1197466844968">
              <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1197466844974">
                <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="1191934136657" resolveInfo="SNODE_GEN" />
                <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1197466841684">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
                </node>
              </node>
              <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1197466844979">
                <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
                <link role="usedFeature" roleId="tpki.1184147586245" targetNodeId="4145095496975344165" resolveInfo="child" />
                <node role="paramObject" roleId="tpki.1184776023529" type="tpki.ParameterWrapper" typeId="tpki.1184768155075" id="1197466847899">
                  <property name="name" nameId="tpck.1169194664001" value="implements" />
                  <link role="paramRef" roleId="tpki.1190213718970" targetNodeId="tpce.1169129564478" />
                </node>
              </node>
            </node>
            <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1197466849571">
              <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
              <link role="usedFeature" roleId="tpki.1184147586245" targetNodeId="4145095496975344219" resolveInfo="link" />
              <node role="paramObject" roleId="tpki.1184776023529" type="tpki.ParameterWrapper" typeId="tpki.1184768155075" id="7098165822328194787">
                <property name="name" nameId="tpck.1169194664001" value="intfc" />
                <link role="paramRef" roleId="tpki.1190213718970" targetNodeId="tpce.1169127628841" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7098165822327402120">
          <node role="expression" roleId="tpee.1068580123156" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="7098165822327402122">
            <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="7098165822327402125">
              <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="1184685688047" resolveInfo="SNODE" />
              <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7098165822327402121">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
              </node>
            </node>
            <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="7098165822327402127">
              <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
              <link role="usedFeature" roleId="tpki.1184147586245" targetNodeId="1184685792724" resolveInfo="child" />
              <node role="paramObject" roleId="tpki.1184776023529" type="tpki.ParameterWrapper" typeId="tpki.1184768155075" id="7098165822327402128">
                <property name="paramValue" nameId="tpki.1190284493458" value="implements" />
                <property name="name" nameId="tpck.1169194664001" value="implements" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1199388473312">
          <node role="expression" roleId="tpee.1068580123156" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="1199388480570">
            <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="1199388480591">
              <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="1184685688047" resolveInfo="SNODE" />
              <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7098165822327879145">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
              </node>
            </node>
            <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="1199388480595">
              <property name="axis" nameId="tpki.1168527174196" value="ANCESTORS" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7098165822327680384">
          <node role="expression" roleId="tpee.1068580123156" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="7098165822327680680">
            <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="7098165822327680683">
              <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="1191934136657" resolveInfo="SNODE_GEN" />
              <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7098165822328906898">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
              </node>
            </node>
            <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="7098165822327680685">
              <property name="axis" nameId="tpki.1168527174196" value="SELF_ANCESTORS" />
              <link role="usedFeature" roleId="tpki.1184147586245" targetNodeId="4145095496975144451" resolveInfo="allChildren" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7098165822327879147">
          <node role="expression" roleId="tpee.1068580123156" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="7098165822327879442">
            <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="7098165822327879445">
              <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="1184685688047" resolveInfo="SNODE" />
              <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7098165822327879148">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
              </node>
            </node>
            <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="7098165822327879447">
              <property name="axis" nameId="tpki.1168527174196" value="SELF_FOLLOWING_SIBLINGS" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7098165822328906900">
          <node role="expression" roleId="tpee.1068580123156" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="7098165822328907201">
            <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="7098165822328907204">
              <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="1184685688047" resolveInfo="SNODE" />
              <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7098165822328906901">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
              </node>
            </node>
            <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="7098165822328907206">
              <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7098165822328907258">
          <node role="expression" roleId="tpee.1068580123156" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="7098165822328907260">
            <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="7098165822328907263">
              <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="1184685688047" resolveInfo="SNODE" />
              <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7098165822328907259">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
              </node>
            </node>
            <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="7098165822328907265">
              <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7098165822329084456">
          <node role="expression" roleId="tpee.1068580123156" type="tpki.TreePathOperationExpression" typeId="tpki.1168468602533" id="7098165822329084751">
            <node role="operand" roleId="tpki.1168468622494" type="tpki.TreePathAdapterExpression" typeId="tpki.1168890168054" id="7098165822329084754">
              <link role="treepathAspect" roleId="tpki.1168890235188" targetNodeId="1191934136657" resolveInfo="SNODE_GEN" />
              <node role="expression" roleId="tpki.1168890213786" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7098165822329084457">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1184773532714" resolveInfo="foo" />
              </node>
            </node>
            <node role="operation" roleId="tpki.1168468671991" type="tpki.IterateOperation" typeId="tpki.1168524996431" id="7098165822329084756">
              <property name="axis" nameId="tpki.1168527174196" value="CHILDREN" />
              <link role="usedFeature" roleId="tpki.1184147586245" targetNodeId="4145095496975144451" resolveInfo="allChildren" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.SingleLineComment" typeId="tpee.6329021646629104954" id="7376433222636453039">
          <node role="commentPart" roleId="tpee.6329021646629175155" type="tpee.TextCommentPart" typeId="tpee.6329021646629104957" id="7376433222636453040">
            <property name="text" nameId="tpee.6329021646629104958" value="!@#$&amp;" />
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1184773021187">
        <property name="name" nameId="tpck.1169194664001" value="args" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="1184773025310">
          <node role="componentType" roleId="tpee.1070534760952" type="tpee.StringType" typeId="tpee.1225271177708" id="1225196632104" />
        </node>
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1184773002628" />
  </root>
  <root id="1191934136657">
    <node role="features" roleId="tpki.1183980376561" type="tpki.GenericParamFeature" typeId="tpki.4581582910844784750" id="4145095496975344165">
      <property name="name" nameId="tpck.1169194664001" value="child" />
      <property name="default" nameId="tpki.1184094715536" value="false" />
      <property name="ascending" nameId="tpki.1199012172872" value="false" />
      <node role="getter" roleId="tpki.1192877073256" type="tpki.GFGetterParamFun" typeId="tpki.1190800051916" id="1192878365675">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1192878365676">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1193063049621">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1193063049622">
              <property name="name" nameId="tpck.1169194664001" value="opExpr" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1193063049623">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1197027756228" resolveInfo="DotExpression" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1193063049624">
                <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeCreator" typeId="tp25.1180636770613" id="1193063049625">
                  <node role="createdType" roleId="tp25.1180636770616" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1193063049626">
                    <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1197027756228" resolveInfo="DotExpression" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1193063049627">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1193063049628">
              <property name="name" nameId="tpck.1169194664001" value="op" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1193063049629">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="tp25.1138411891628" resolveInfo="SNodeOperation" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1193063049631">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227904944">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227941440">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193063049637">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193063049622" resolveInfo="opExpr" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1219267871061">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1197027771414" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Link_SetTargetOperation" typeId="tp25.1140725362528" id="1193063049633">
                <node role="linkTarget" roleId="tp25.1140725362529" type="tpki.ExpressionFunctionParam" typeId="tpki.1192620437851" id="1193063049634" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1193063049645">
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1193063049646">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1193063049648">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1193063049649">
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1193063049650">
                    <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeCreator" typeId="tp25.1180636770613" id="1193063049651">
                      <node role="createdType" roleId="tp25.1180636770616" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1193063049652">
                        <link role="concept" roleId="tp25.1138405853777" targetNodeId="tp25.1138056143562" resolveInfo="SLinkAccess" />
                      </node>
                    </node>
                  </node>
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193063049653">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193063049628" resolveInfo="op" />
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1193063049654">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227893864">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227918584">
                    <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="1193063049660">
                      <link role="concept" roleId="tp25.1140138128738" targetNodeId="tp25.1138056143562" resolveInfo="SLinkAccess" />
                      <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193063049661">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193063049628" resolveInfo="op" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1193063049659">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="tp25.1138056516764" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Link_SetTargetOperation" typeId="tp25.1140725362528" id="1193063049656">
                    <node role="linkTarget" roleId="tp25.1140725362529" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1193063049657" />
                  </node>
                </node>
              </node>
            </node>
            <node role="condition" roleId="tpee.1068580123160" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1240330128481">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1240329969386" resolveInfo="singleCardinality" />
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1240329957161" resolveInfo="SnodeGenUtil" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240330135874">
                <node role="operand" roleId="tpee.1197027771414" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1240330135875" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1240330135876">
                  <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599893252" resolveInfo="sourceCardinality" />
                </node>
              </node>
            </node>
            <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="1193063049669">
              <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="1193063049670">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1193063049671">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1193063049672">
                    <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1193063049673">
                      <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeCreator" typeId="tp25.1180636770613" id="1193063049674">
                        <node role="createdType" roleId="tp25.1180636770616" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1193063049675">
                          <link role="concept" roleId="tp25.1138405853777" targetNodeId="tp25.1138056282393" resolveInfo="SLinkListAccess" />
                        </node>
                      </node>
                    </node>
                    <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193063049676">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193063049628" resolveInfo="op" />
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1193063049677">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227927026">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227882876">
                      <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="1193063049683">
                        <link role="concept" roleId="tp25.1140138128738" targetNodeId="tp25.1138056282393" resolveInfo="SLinkListAccess" />
                        <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193063049684">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193063049628" resolveInfo="op" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1193063049682">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="tp25.1138056546658" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Link_SetTargetOperation" typeId="tp25.1140725362528" id="1193063049679">
                      <node role="linkTarget" roleId="tp25.1140725362529" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1193063049680" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1193063049685">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227937062">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227849570">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193063049691">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193063049622" resolveInfo="opExpr" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1219267874660">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1197027833540" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Link_SetTargetOperation" typeId="tp25.1140725362528" id="1193063049687">
                <node role="linkTarget" roleId="tp25.1140725362529" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193063049688">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193063049628" resolveInfo="op" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1193063049692">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193063049693">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193063049622" resolveInfo="opExpr" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameterQueryFunction" roleId="tpki.1184659272196" type="tpki.ParameterQueryFun" typeId="tpki.1184593387281" id="1192878365678">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1192878365679">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1192878399672">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625339619">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227896843">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227881909">
                  <node role="operand" roleId="tpee.1197027771414" type="tpki.NodeTypeFunctionParam" typeId="tpki.1184593479323" id="1192878399679" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1192878399677">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="tp25.1138405853777" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="1192878399675">
                  <link role="link" roleId="tp25.1138056546658" targetNodeId="tpce.1071489727083" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.WhereOperation" typeId="tp2q.1202120902084" id="1227876802909">
                <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876802910">
                  <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1227876802911">
                    <property name="name" nameId="tpck.1169194664001" value="it" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754490528" />
                  </node>
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876802913">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1227876802914">
                      <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876802915">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1227876802916">
                          <property name="value" nameId="tpee.1070475926801" value="aggregation" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1227876802917">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dequals(java%dlang%dObject)%cboolean" resolveInfo="equals" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876802918">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876815308">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876802911" resolveInfo="it" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1227876802920">
                              <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599937831" resolveInfo="metaClass" />
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="targetTypeFunction" roleId="tpki.1184659278821" type="tpki.TargetTypeFun" typeId="tpki.1184603621091" id="1192878365680">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1192878365681">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1192878414174">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1192878414175">
              <property name="name" nameId="tpck.1169194664001" value="ld" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1192878414176">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1192878414177" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1192878414179">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1192878414180">
              <property name="name" nameId="tpck.1169194664001" value="trg" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1192878414181">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227933394">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1192878414184">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1192878414175" resolveInfo="ld" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1192878414183">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="tpce.1071599976176" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1192878414185">
            <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1196853157182">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1196853157183">
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="1196853157187">
                  <property name="linkRole" nameId="tpck.1757699476691236116" value="concept" />
                  <node role="expression" roleId="tp3r.1196350785111" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1196853157188">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1192878414180" resolveInfo="trg" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="toStringFunction" roleId="tpki.1184659752377" type="tpki.ToStringFun" typeId="tpki.1184659771596" id="1192878365682">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1192878365683">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1192878421683">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227832729">
              <node role="operand" roleId="tpee.1197027771414" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1192878421686" />
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1192878421685">
                <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599776563" resolveInfo="role" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameterType" roleId="tpki.1184659264134" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1192878380970">
        <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
      </node>
      <node role="cardinal" roleId="tpki.1196872079679" type="tpki.GFCardinalParamFun" typeId="tpki.1193057943814" id="1193058874206">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1193058874207">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1240330154189">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1240330154190">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1240329957161" resolveInfo="SnodeGenUtil" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1240329969386" resolveInfo="singleCardinality" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240330154191">
                <node role="operand" roleId="tpee.1197027771414" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1240330154192" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1240330154193">
                  <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599893252" resolveInfo="sourceCardinality" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="features" roleId="tpki.1183980376561" type="tpki.GenericParamFeature" typeId="tpki.4581582910844784750" id="4145095496975344219">
      <property name="name" nameId="tpck.1169194664001" value="link" />
      <property name="default" nameId="tpki.1184094715536" value="false" />
      <property name="ascending" nameId="tpki.1199012172872" value="false" />
      <node role="getter" roleId="tpki.1192877073256" type="tpki.GFGetterParamFun" typeId="tpki.1190800051916" id="1192878435112">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1192878435113">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1193047912064">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1193047912065">
              <property name="name" nameId="tpck.1169194664001" value="opExpr" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1193047912066">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1197027756228" resolveInfo="DotExpression" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1193047912067">
                <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeCreator" typeId="tp25.1180636770613" id="1193047912068">
                  <node role="createdType" roleId="tp25.1180636770616" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1193047912069">
                    <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpee.1197027756228" resolveInfo="DotExpression" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1193062933675">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1193062933676">
              <property name="name" nameId="tpck.1169194664001" value="op" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1193062933677">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="tp25.1138411891628" resolveInfo="SNodeOperation" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1193047912070">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227904915">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227898374">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193047912076">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193047912065" resolveInfo="opExpr" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1219267840857">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1197027771414" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Link_SetTargetOperation" typeId="tp25.1140725362528" id="1193047912072">
                <node role="linkTarget" roleId="tp25.1140725362529" type="tpki.ExpressionFunctionParam" typeId="tpki.1192620437851" id="1193047912073" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="1193062887932">
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="1193062887933">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1193062945628">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1193062946380">
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1193062949445">
                    <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeCreator" typeId="tp25.1180636770613" id="1193062949446">
                      <node role="createdType" roleId="tp25.1180636770616" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1193062949447">
                        <link role="concept" roleId="tp25.1138405853777" targetNodeId="tp25.1138056143562" resolveInfo="SLinkAccess" />
                      </node>
                    </node>
                  </node>
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193062945629">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193062933676" resolveInfo="op" />
                  </node>
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1193062970245">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227889159">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227886872">
                    <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="1193062972243">
                      <link role="concept" roleId="tp25.1140138128738" targetNodeId="tp25.1138056143562" resolveInfo="SLinkAccess" />
                      <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193062970246">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193062933676" resolveInfo="op" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1193062977887">
                      <link role="link" roleId="tp25.1138056516764" targetNodeId="tp25.1138056516764" />
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.Link_SetTargetOperation" typeId="tp25.1140725362528" id="1193062979639">
                    <node role="linkTarget" roleId="tp25.1140725362529" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1193062988327" />
                  </node>
                </node>
              </node>
            </node>
            <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="1193062897283">
              <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="1193062897284">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1193062993616">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="1193062993617">
                    <node role="rValue" roleId="tpee.1068498886297" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1193062993618">
                      <node role="creator" roleId="tpee.1145553007750" type="tp25.SNodeCreator" typeId="tp25.1180636770613" id="1193062993619">
                        <node role="createdType" roleId="tp25.1180636770616" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1193062993620">
                          <link role="concept" roleId="tp25.1138405853777" targetNodeId="tp25.1138056282393" resolveInfo="SLinkListAccess" />
                        </node>
                      </node>
                    </node>
                    <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193062993621">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193062933676" resolveInfo="op" />
                    </node>
                  </node>
                </node>
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1193062993622">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227901647">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227959078">
                      <node role="operand" roleId="tpee.1197027771414" type="tp25.SNodeTypeCastExpression" typeId="tp25.1140137987495" id="1193062993628">
                        <link role="concept" roleId="tp25.1140138128738" targetNodeId="tp25.1138056282393" resolveInfo="SLinkListAccess" />
                        <node role="leftExpression" roleId="tp25.1140138123956" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193062993629">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193062933676" resolveInfo="op" />
                        </node>
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1193063030275">
                        <link role="link" roleId="tp25.1138056516764" targetNodeId="tp25.1138056546658" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Link_SetTargetOperation" typeId="tp25.1140725362528" id="1193062993624">
                      <node role="linkTarget" roleId="tp25.1140725362529" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1193062993625" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="condition" roleId="tpee.1068580123160" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1240330179121">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1240329957161" resolveInfo="SnodeGenUtil" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1240329969386" resolveInfo="singleCardinality" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240330179122">
                <node role="operand" roleId="tpee.1197027771414" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1240330179123" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1240330179124">
                  <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599893252" resolveInfo="sourceCardinality" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1193047912090">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227924930">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227840317">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193047912096">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193047912065" resolveInfo="opExpr" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1219267848752">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="tpee.1197027833540" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp25.Link_SetTargetOperation" typeId="tp25.1140725362528" id="1193047912092">
                <node role="linkTarget" roleId="tp25.1140725362529" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193063018860">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193062933676" resolveInfo="op" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1193047912097">
            <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1193047912098">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1193047912065" resolveInfo="opExpr" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameterQueryFunction" roleId="tpki.1184659272196" type="tpki.ParameterQueryFun" typeId="tpki.1184593387281" id="1192878435115">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1192878435116">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1192878498763">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1217625313142">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227885336">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227897900">
                  <node role="operand" roleId="tpee.1197027771414" type="tpki.NodeTypeFunctionParam" typeId="tpki.1184593479323" id="1192878498771" />
                  <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1192878498769">
                    <link role="link" roleId="tp25.1138056516764" targetNodeId="tp25.1138405853777" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkListAccess" typeId="tp25.1138056282393" id="1192878498767">
                  <link role="link" roleId="tp25.1138056546658" targetNodeId="tpce.1071489727083" />
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tp2q.WhereOperation" typeId="tp2q.1202120902084" id="1227876796142">
                <node role="closure" roleId="tp2q.1204796294226" type="tp2c.ClosureLiteral" typeId="tp2c.1199569711397" id="1227876796143">
                  <node role="parameter" roleId="tp2c.1199569906740" type="tp2q.SmartClosureParameterDeclaration" typeId="tp2q.1203518072036" id="1227876796144">
                    <property name="name" nameId="tpck.1169194664001" value="it" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.UndefinedType" typeId="tpee.4836112446988635817" id="2108863436754489908" />
                  </node>
                  <node role="body" roleId="tp2c.1199569916463" type="tpee.StatementList" typeId="tpee.1068580123136" id="1227876796146">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1227876796147">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.OrExpression" typeId="tpee.1080223426719" id="1227876796148">
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1227876796149">
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="1227876796150" />
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876796151">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876816144">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876796144" resolveInfo="it" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1227876796153">
                              <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599937831" resolveInfo="metaClass" />
                            </node>
                          </node>
                        </node>
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876796154">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1227876796155">
                            <property name="value" nameId="tpee.1070475926801" value="reference" />
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1227876796156">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dequals(java%dlang%dObject)%cboolean" resolveInfo="equals" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1227876796157">
                              <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1227876817941">
                                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1227876796144" resolveInfo="it" />
                              </node>
                              <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1227876796159">
                                <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599937831" resolveInfo="metaClass" />
                              </node>
                            </node>
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="targetTypeFunction" roleId="tpki.1184659278821" type="tpki.TargetTypeFun" typeId="tpki.1184603621091" id="1192878435117">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1192878435118">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1192878512138">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1192878512139">
              <property name="name" nameId="tpck.1169194664001" value="ld" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1192878512140">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1192878512141" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1192878512142">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1192878512143">
              <property name="name" nameId="tpck.1169194664001" value="trg" />
              <node role="type" roleId="tpee.5680397130376446158" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1192878512144">
                <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpce.1169125787135" resolveInfo="AbstractConceptDeclaration" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227820618">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1192878512147">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1192878512139" resolveInfo="ld" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SLinkAccess" typeId="tp25.1138056143562" id="1192878512146">
                  <link role="link" roleId="tp25.1138056516764" targetNodeId="tpce.1071599976176" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1192878512148">
            <node role="expression" roleId="tpee.1068581517676" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1196853157190">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1196853157191">
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.ReferenceAntiquotation" typeId="tp3r.1196350785117" id="1196853157195">
                  <property name="linkRole" nameId="tpck.1757699476691236116" value="concept" />
                  <node role="expression" roleId="tp3r.1196350785111" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1196853157196">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1192878512143" resolveInfo="trg" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="toStringFunction" roleId="tpki.1184659752377" type="tpki.ToStringFun" typeId="tpki.1184659771596" id="1192878435119">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1192878435120">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1192878518144">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227878633">
              <node role="operand" roleId="tpee.1197027771414" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1192878518147" />
              <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1192878518146">
                <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599776563" resolveInfo="role" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameterType" roleId="tpki.1184659264134" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1192878442143">
        <link role="concept" roleId="tp25.1138405853777" targetNodeId="tpce.1071489288298" resolveInfo="LinkDeclaration" />
      </node>
      <node role="cardinal" roleId="tpki.1196872079679" type="tpki.GFCardinalParamFun" typeId="tpki.1193057943814" id="1193059035159">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1193059035160">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1240330173351">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="1240330173352">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="1240329957161" resolveInfo="SnodeGenUtil" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="1240329969386" resolveInfo="singleCardinality" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1240330173353">
                <node role="operand" roleId="tpee.1197027771414" type="tpki.ParamFunctionParam" typeId="tpki.1184501940146" id="1240330173354" />
                <node role="operation" roleId="tpee.1197027833540" type="tp25.SPropertyAccess" typeId="tp25.1138056022639" id="1240330173355">
                  <link role="property" roleId="tp25.1138056395725" targetNodeId="tpce.1071599893252" resolveInfo="sourceCardinality" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="features" roleId="tpki.1183980376561" type="tpki.GenericFeature" typeId="tpki.4581582910844536269" id="4145095496975144451">
      <property name="name" nameId="tpck.1169194664001" value="allChildren" />
      <property name="default" nameId="tpki.1184094715536" value="true" />
      <property name="ascending" nameId="tpki.1199012172872" value="false" />
      <link role="opposite" roleId="tpki.1197826813331" targetNodeId="4145095496975180718" resolveInfo="parent" />
      <node role="getter" roleId="tpki.1192877073256" type="tpki.GFGetterFun" typeId="tpki.1196857052853" id="1199450600144">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1199450600145">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1199450600150">
            <node role="expression" roleId="tpee.1068580123156" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1199450600151">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227905942">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.Expression" typeId="tpee.1068431790191" id="1199450600154">
                  <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1199450600155">
                    <node role="expression" roleId="tp3r.1196350785111" type="tpki.ExpressionFunctionParam" typeId="tpki.1192620437851" id="1199450695587" />
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetChildrenOperation" typeId="tp25.1171500988903" id="1199450600153" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="features" roleId="tpki.1183980376561" type="tpki.GenericFeature" typeId="tpki.4581582910844536269" id="4145095496975180718">
      <property name="name" nameId="tpck.1169194664001" value="parent" />
      <property name="default" nameId="tpki.1184094715536" value="false" />
      <property name="ascending" nameId="tpki.1199012172872" value="true" />
      <node role="getter" roleId="tpki.1192877073256" type="tpki.GFGetterFun" typeId="tpki.1196857052853" id="1199450600158">
        <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="1199450600159">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="1199450709521">
            <node role="expression" roleId="tpee.1068580123156" type="tp3r.Quotation" typeId="tp3r.1196350785113" id="1199450709522">
              <node role="quotedNode" roleId="tp3r.1196350785114" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="1199450712923">
                <node role="creator" roleId="tpee.1145553007750" type="tp2q.ListCreatorWithInit" typeId="tp2q.1160600644654" id="1199450714101">
                  <node role="initValue" roleId="tp2q.1237721435808" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1204227852967">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.Expression" typeId="tpee.1068431790191" id="1199450721812">
                      <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3r.Antiquotation" typeId="tp3r.1196350785112" id="1199450721813">
                        <node role="expression" roleId="tp3r.1196350785111" type="tpki.ExpressionFunctionParam" typeId="tpki.1192620437851" id="1199450721814" />
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tp25.Node_GetParentOperation" typeId="tp25.1139613262185" id="1199450721811" />
                  </node>
                  <node role="elementType" roleId="tp2q.1237721435807" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1199450716175" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="treePathType" roleId="tpki.1179235945873" type="tpki.TreePathType" typeId="tpki.1168428529658" id="1191934136658">
      <node role="nodeType" roleId="tpki.1168428551640" type="tp25.SNodeType" typeId="tp25.1138055754698" id="1191934176137" />
    </node>
  </root>
  <root id="1240329957161">
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="1240329969386">
      <property name="name" nameId="tpck.1169194664001" value="singleCardinality" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="1240329972750" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1240329969388" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1240329969389">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="1240330043367">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="1240330043368">
            <property name="name" nameId="tpck.1169194664001" value="card" />
            <node role="type" roleId="tpee.5680397130376446158" type="tp25.SEnumMemberType" typeId="tp25.1240170042401" id="1240330043369">
              <link role="enum" roleId="tp25.1240170836027" targetNodeId="tpce.1084197782722" resolveInfo="Cardinality" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tp25.SEnumOperationInvocation" typeId="tp25.1240930118027" id="1240937090248">
              <link role="enumDeclaration" roleId="tp25.1240930118028" targetNodeId="tpce.1084197782722" resolveInfo="Cardinality" />
              <node role="operation" roleId="tp25.1240930317927" type="tp25.SEnum_MemberForValueOperation" typeId="tp25.1240930444878" id="1240937094750">
                <node role="valueExpression" roleId="tp25.1240930444879" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="1240937096206">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240330009626" resolveInfo="cardinality" />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="1240330084130">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.OrExpression" typeId="tpee.1080223426719" id="1240330099265">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1240330099266">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1240330099270">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240330043368" resolveInfo="card" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tp25.SEnumOperationInvocation" typeId="tp25.1240930118027" id="1240937111148">
                <link role="enumDeclaration" roleId="tp25.1240930118028" targetNodeId="tpce.1084197782722" resolveInfo="Cardinality" />
                <node role="operation" roleId="tp25.1240930317927" type="tp25.SEnum_MemberOperation" typeId="tp25.1240930444945" id="1240937115526">
                  <link role="member" roleId="tp25.1240930444946" targetNodeId="tpce.1084197782724" />
                </node>
              </node>
            </node>
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="1240330099271">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1240330099272">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="1240330043368" resolveInfo="card" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tp25.SEnumOperationInvocation" typeId="tp25.1240930118027" id="1240937102488">
                <link role="enumDeclaration" roleId="tp25.1240930118028" targetNodeId="tpce.1084197782722" resolveInfo="Cardinality" />
                <node role="operation" roleId="tp25.1240930317927" type="tp25.SEnum_MemberOperation" typeId="tp25.1240930444945" id="1240937107991">
                  <link role="member" roleId="tp25.1240930444946" targetNodeId="tpce.1084197782723" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="1240330009626">
        <property name="name" nameId="tpck.1169194664001" value="cardinality" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="4853609160933722473" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1240329957162" />
  </root>
</model>

