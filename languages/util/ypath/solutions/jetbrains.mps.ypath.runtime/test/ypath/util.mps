<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:a822b011-296a-478b-9b72-dc6e0c3c30e7(test.ypath.util)">
  <persistence version="7" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="qjxg" modelUID="f:java_stub#83f155ff-422c-4b5a-a2f2-b459302dd215#org.junit(jetbrains.mps.baseLanguage.unitTest.lib/org.junit@java_stub)" version="-1" />
  <import index="fjjo" modelUID="r:5420fa50-d52f-4531-bdd3-8e4092faaf95(jetbrains.mps.ypath.runtime)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="k7g3" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.util(JDK/java.util@java_stub)" version="-1" implicit="yes" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6033226775805315497">
      <property name="name" nameId="tpck.1169194664001" value="TestFilterTraversal" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6033226775805315496">
      <property name="name" nameId="tpck.1169194664001" value="YNode" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="6033226775805315825">
      <property name="name" nameId="tpck.1169194664001" value="TestTraversal" />
    </node>
  </roots>
  <root id="6033226775805315497">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315498" />
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315499">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TREE_PATH" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315500">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fjjo.2295870045929265522" resolveInfo="TreePath" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315501">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315502" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="6033226775805315503">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="6033226775805315496" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315655" resolveInfo="TREE_PATH" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315504">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TREE1" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315505">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315506" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315507">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315508">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315509">
            <property name="value" nameId="tpee.1070475926801" value="A1" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315510">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315511">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315512">
                <property name="value" nameId="tpee.1070475926801" value="B1" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315513">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315514">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315515">
                    <property name="value" nameId="tpee.1070475926801" value="C1" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315516">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315517">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315518">
                <property name="value" nameId="tpee.1070475926801" value="B2" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315519">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315520">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315521">
                    <property name="value" nameId="tpee.1070475926801" value="C2" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315522">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315523">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315524">
                    <property name="value" nameId="tpee.1070475926801" value="D2" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315525">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315526">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315527">
                    <property name="value" nameId="tpee.1070475926801" value="E2" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315528">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315529">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315530">
                <property name="value" nameId="tpee.1070475926801" value="B3" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315531">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315532">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315533">
                    <property name="value" nameId="tpee.1070475926801" value="C3" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315534">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315535">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315536">
                        <property name="value" nameId="tpee.1070475926801" value="D3" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315537">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315538">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315539">
                    <property name="value" nameId="tpee.1070475926801" value="E3" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315540">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315541">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315542">
                <property name="value" nameId="tpee.1070475926801" value="B4" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315543">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315544">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315545">
                    <property name="value" nameId="tpee.1070475926801" value="C4" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315546">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315547">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315548">
                        <property name="value" nameId="tpee.1070475926801" value="D4" />
                      </node>
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315549">
                        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315550">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315551">
                            <property name="value" nameId="tpee.1070475926801" value="E4" />
                          </node>
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315552">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315553">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315554">
                <property name="value" nameId="tpee.1070475926801" value="B5" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315555">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315556">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315557">
                    <property name="value" nameId="tpee.1070475926801" value="C5" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315558">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315559">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315560">
                        <property name="value" nameId="tpee.1070475926801" value="D5" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315561">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315562">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315563">
                <property name="value" nameId="tpee.1070475926801" value="B6" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315564">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315565">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315566">
                    <property name="value" nameId="tpee.1070475926801" value="C6" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315567">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315568">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315569">
                    <property name="value" nameId="tpee.1070475926801" value="D6" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315570">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315571">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315572">
                <property name="value" nameId="tpee.1070475926801" value="B7" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315573">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315574">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315575">
                    <property name="value" nameId="tpee.1070475926801" value="C7" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315576">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315577">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315578">
                        <property name="value" nameId="tpee.1070475926801" value="D7" />
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315579">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315580">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315581">
                        <property name="value" nameId="tpee.1070475926801" value="E7" />
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
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315582">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TREE1_PRECEDING_SIBLINGS_D" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315583">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315584" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315585">
        <property name="value" nameId="tpee.1070475926801" value="C2C6" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315586">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TREE1_FOLLOWING_SIBLINGS_D" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315587">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315588" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315589">
        <property name="value" nameId="tpee.1070475926801" value="E2E7" />
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6033226775805315590">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315591" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6033226775805315592" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315593" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6033226775805315594">
      <property name="name" nameId="tpck.1169194664001" value="testSampleData" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315595" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6033226775805315596" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315597">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6033226775805315598">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6033226775805315599">
            <property name="name" nameId="tpck.1169194664001" value="nameStartsWithD" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315600">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fjjo.2295870045929265512" resolveInfo="IFilter" />
              <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315601">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
              </node>
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315602">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="6033226775805315603">
                <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="6033226775805315604">
                  <property name="name" nameId="tpck.1169194664001" value="" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267759" resolveInfo="TreePath" />
                  <link role="classifier" roleId="tpee.1170346070688" targetNodeId="fjjo.2295870045929265512" resolveInfo="IFilter" />
                  <node role="typeParameter" roleId="tpee.1201186121363" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315605">
                    <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
                  </node>
                  <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6033226775805315606">
                    <property name="name" nameId="tpck.1169194664001" value="accept" />
                    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315607" />
                    <node role="returnType" roleId="tpee.1068580123133" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6033226775805315608" />
                    <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6033226775805315609">
                      <property name="name" nameId="tpck.1169194664001" value="t" />
                      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315610">
                        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
                      </node>
                    </node>
                    <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315646">
                      <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6033226775805315647">
                        <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315648">
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315649">
                            <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6033226775805315650">
                              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315609" resolveInfo="t" />
                            </node>
                            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315651">
                              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315738" resolveInfo="getName" />
                            </node>
                          </node>
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315652">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~String%dstartsWith(java%dlang%dString)%cboolean" />
                            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315653">
                              <property name="value" nameId="tpee.1070475926801" value="D" />
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
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805315611">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805315612">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qjxg.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qjxg.~Assert%dassertEquals(java%dlang%dObject,java%dlang%dObject)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805315613">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315582" resolveInfo="TREE1_PRECEDING_SIBLINGS_D" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805315614">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="6033226775805315496" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315785" resolveInfo="convertToString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315615">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315616">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315617">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315618">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805315619">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315499" resolveInfo="TREE_PATH" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315620">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267763" resolveInfo="startTraversal" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805315621">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315504" resolveInfo="TREE1" />
                        </node>
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315622">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805316114">
                        <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266868" resolveInfo="DESCENDANTS" />
                        <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315624">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268314" resolveInfo="filter" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6033226775805315625">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315599" resolveInfo="nameStartsWithD" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315626">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805316117">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266889" resolveInfo="PRECEDING_SIBLINGS" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805315628">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805315629">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qjxg.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qjxg.~Assert%dassertEquals(java%dlang%dObject,java%dlang%dObject)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805315630">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315586" resolveInfo="TREE1_FOLLOWING_SIBLINGS_D" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805315631">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="6033226775805315496" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315785" resolveInfo="convertToString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805316118">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805316119">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805316120">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805316121">
                      <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316131">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315499" resolveInfo="TREE_PATH" />
                      </node>
                      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805316123">
                        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267763" resolveInfo="startTraversal" />
                        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316132">
                          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315504" resolveInfo="TREE1" />
                        </node>
                      </node>
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805316125">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805316126">
                        <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                        <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266868" resolveInfo="DESCENDANTS" />
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805316127">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268314" resolveInfo="filter" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6033226775805316128">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315599" resolveInfo="nameStartsWithD" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805316129">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805316133">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266883" resolveInfo="FOLLOWING_SIBLINGS" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="6033226775805315645">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="qjxg.~Test" />
      </node>
    </node>
  </root>
  <root id="6033226775805315496">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315654" />
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315655">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TREE_PATH" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315656">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fjjo.2295870045929265522" resolveInfo="TreePath" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315657">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315658" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315659">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.AnonymousClassCreator" typeId="tpee.1182160077978" id="6033226775805315660">
          <node role="cls" roleId="tpee.1182160096073" type="tpee.AnonymousClass" typeId="tpee.1170345865475" id="6033226775805315661">
            <property name="name" nameId="tpck.1169194664001" value="" />
            <link role="classifier" roleId="tpee.1170346070688" targetNodeId="fjjo.2295870045929265522" resolveInfo="TreePath" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267759" resolveInfo="TreePath" />
            <node role="typeParameter" roleId="tpee.1201186121363" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315662">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
            </node>
            <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6033226775805315663">
              <property name="name" nameId="tpck.1169194664001" value="parent" />
              <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="6033226775805315664" />
              <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315665">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
              </node>
              <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6033226775805315666">
                <property name="name" nameId="tpck.1169194664001" value="t" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315667">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
                </node>
              </node>
              <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315813">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6033226775805315814">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315815">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6033226775805315816">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315666" resolveInfo="t" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315817">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315756" resolveInfo="getSupernode" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="6033226775805315818">
                <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" />
              </node>
            </node>
            <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6033226775805315668">
              <property name="name" nameId="tpck.1169194664001" value="childrenArray" />
              <node role="visibility" roleId="tpee.1178549979242" type="tpee.ProtectedVisibility" typeId="tpee.1146644641414" id="6033226775805315669" />
              <node role="returnType" roleId="tpee.1068580123133" type="tpee.ArrayType" typeId="tpee.1070534760951" id="6033226775805315670">
                <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315671">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
                </node>
              </node>
              <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6033226775805315672">
                <property name="name" nameId="tpck.1169194664001" value="t" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315673">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
                </node>
              </node>
              <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315819">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6033226775805315820">
                  <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315821">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6033226775805315822">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315672" resolveInfo="t" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315823">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315762" resolveInfo="getSubnodes" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="6033226775805315824">
                <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6033226775805315674">
      <property name="name" nameId="tpck.1169194664001" value="name" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315675">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6033226775805315676" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6033226775805315677">
      <property name="name" nameId="tpck.1169194664001" value="supernode" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315678">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6033226775805315679" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="6033226775805315680">
      <property name="name" nameId="tpck.1169194664001" value="subnodes" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ArrayType" typeId="tpee.1070534760951" id="6033226775805315681">
        <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315682">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6033226775805315683" />
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6033226775805315684">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315685" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6033226775805315686" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6033226775805315687">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315688">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315689">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805315690">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6033226775805315691">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315692">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6033226775805315693">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6033226775805315674" resolveInfo="name" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6033226775805315694" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6033226775805315695">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315687" resolveInfo="name" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6033226775805315696">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315697" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6033226775805315698" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6033226775805315699">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315700">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6033226775805315701">
        <property name="name" nameId="tpck.1169194664001" value="subnodes" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.VariableArityType" typeId="tpee.1219920932475" id="6033226775805315702">
          <node role="componentType" roleId="tpee.1219921048460" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315703">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
          </node>
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315704">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805315705">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6033226775805315706">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315707">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6033226775805315708">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6033226775805315674" resolveInfo="name" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6033226775805315709" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6033226775805315710">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315699" resolveInfo="name" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805315711">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6033226775805315712">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315713">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6033226775805315714">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6033226775805315680" resolveInfo="subnodes" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6033226775805315715" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6033226775805315716">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315701" resolveInfo="subnodes" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805315717">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6033226775805315718">
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315719" resolveInfo="initSubnodes" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6033226775805315719">
      <property name="name" nameId="tpck.1169194664001" value="initSubnodes" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6033226775805315720" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6033226775805315721" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315722">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="6033226775805315723">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="6033226775805315724">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6033226775805315725">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315680" resolveInfo="subnodes" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6033226775805315726" />
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315727">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6033226775805315728">
              <node role="iterable" roleId="tpee.1144226360166" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6033226775805315729">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315680" resolveInfo="subnodes" />
              </node>
              <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6033226775805315730">
                <property name="name" nameId="tpck.1169194664001" value="node" />
                <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315731">
                  <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
                </node>
              </node>
              <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315732">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805315733">
                  <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315734">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6033226775805315735">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315730" resolveInfo="node" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315736">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315744" resolveInfo="setSupernode" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6033226775805315737" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6033226775805315738">
      <property name="name" nameId="tpck.1169194664001" value="getName" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315739" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315740">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315741">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6033226775805315742">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6033226775805315743">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315674" resolveInfo="name" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6033226775805315744">
      <property name="name" nameId="tpck.1169194664001" value="setSupernode" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="6033226775805315745" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6033226775805315746" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6033226775805315747">
        <property name="name" nameId="tpck.1169194664001" value="node" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315748">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315749">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805315750">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6033226775805315751">
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315752">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="6033226775805315753">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="6033226775805315677" resolveInfo="supernode" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="6033226775805315754" />
            </node>
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6033226775805315755">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315747" resolveInfo="node" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6033226775805315756">
      <property name="name" nameId="tpck.1169194664001" value="getSupernode" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315757" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315758">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315759">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6033226775805315760">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6033226775805315761">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315677" resolveInfo="supernode" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6033226775805315762">
      <property name="name" nameId="tpck.1169194664001" value="getSubnodes" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315763" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ArrayType" typeId="tpee.1070534760951" id="6033226775805315764">
        <node role="componentType" roleId="tpee.1070534760952" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315765">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315766">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6033226775805315767">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6033226775805315768">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315680" resolveInfo="subnodes" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6033226775805315769">
      <property name="name" nameId="tpck.1169194664001" value="toString" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315770" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315771">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315772">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6033226775805315773">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6033226775805315774">
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceMethodCall" typeId="tpee.3066917033203108594" id="6033226775805315775">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315738" resolveInfo="getName" />
            </node>
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ParenthesizedExpression" typeId="tpee.1079359253375" id="6033226775805315776">
              <node role="expression" roleId="tpee.1079359253376" type="tpee.TernaryOperatorExpression" typeId="tpee.1163668896201" id="6033226775805315777">
                <node role="condition" roleId="tpee.1163668914799" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="6033226775805315778">
                  <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6033226775805315779">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315680" resolveInfo="subnodes" />
                  </node>
                  <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="6033226775805315780" />
                </node>
                <node role="ifTrue" roleId="tpee.1163668922816" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805315781">
                  <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="k7g3.~Arrays" />
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~Arrays%dtoString(java%dlang%dObject[])%cjava%dlang%dString" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalInstanceFieldReference" typeId="tpee.7785501532031639928" id="6033226775805315782">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315680" resolveInfo="subnodes" />
                  </node>
                </node>
                <node role="ifFalse" roleId="tpee.1163668934364" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315783">
                  <property name="value" nameId="tpee.1070475926801" value="[]" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="6033226775805315784">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="e2lb.~Override" />
      </node>
    </node>
    <node role="staticMethod" roleId="tpee.1070462273904" type="tpee.StaticMethodDeclaration" typeId="tpee.1081236700938" id="6033226775805315785">
      <property name="name" nameId="tpck.1169194664001" value="convertToString" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315786" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315787">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="6033226775805315788">
        <property name="name" nameId="tpck.1169194664001" value="iterable" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315789">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~Iterable" />
          <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315790">
            <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
          </node>
        </node>
      </node>
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315791">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6033226775805315792">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6033226775805315793">
            <property name="name" nameId="tpck.1169194664001" value="buf" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315794">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~StringBuffer" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315795">
              <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315796">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%d&lt;init&gt;()" />
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ForeachStatement" typeId="tpee.1144226303539" id="6033226775805315797">
          <node role="iterable" roleId="tpee.1144226360166" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="6033226775805315798">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315788" resolveInfo="iterable" />
          </node>
          <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6033226775805315799">
            <property name="name" nameId="tpck.1169194664001" value="node" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315800">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
            </node>
          </node>
          <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315801">
            <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805315802">
              <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315803">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6033226775805315804">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315793" resolveInfo="buf" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315805">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%dappend(java%dlang%dString)%cjava%dlang%dStringBuffer" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315806">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6033226775805315807">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315799" resolveInfo="node" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315808">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315738" resolveInfo="getName" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ReturnStatement" typeId="tpee.1068581242878" id="6033226775805315809">
          <node role="expression" roleId="tpee.1068581517676" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315810">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6033226775805315811">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315793" resolveInfo="buf" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315812">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~StringBuffer%dtoString()%cjava%dlang%dString" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6033226775805315825">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315826" />
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315827">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TREE_PATH" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315828">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="fjjo.2295870045929265522" resolveInfo="TreePath" />
        <node role="parameter" roleId="tpee.1109201940907" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315829">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
        </node>
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315830" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="6033226775805315831">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="6033226775805315496" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315655" resolveInfo="TREE_PATH" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315832">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TREE1" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315833">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315834" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315835">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315836">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315837">
            <property name="value" nameId="tpee.1070475926801" value="A" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315838">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315839">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315840">
                <property name="value" nameId="tpee.1070475926801" value="B" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315841">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315842">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315843">
                    <property name="value" nameId="tpee.1070475926801" value="G" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315844">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315845">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315846">
                <property name="value" nameId="tpee.1070475926801" value="C" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315847">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315848">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315849">
                    <property name="value" nameId="tpee.1070475926801" value="D" />
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315850">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315851">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315852">
                    <property name="value" nameId="tpee.1070475926801" value="E" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315853">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315854">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315855">
                <property name="value" nameId="tpee.1070475926801" value="F" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315856">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TREE1_DESCENDANTS" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315857">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315858" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315859">
        <property name="value" nameId="tpee.1070475926801" value="BGCDEF" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315860">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TREE1_SELF_DESCENDANTS" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315861">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315862" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315863">
        <property name="value" nameId="tpee.1070475926801" value="ABGCDEF" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315864">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TREE1_CHILDREN" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315865">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315866" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315867">
        <property name="value" nameId="tpee.1070475926801" value="BCF" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315868">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TREE1_DESCENDANTS_ANCESTORS" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315869">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315870" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315871">
        <property name="value" nameId="tpee.1070475926801" value="ABAACACAA" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315872">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="SUBTREE2" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315873">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315874" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315875">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315876">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315877">
            <property name="value" nameId="tpee.1070475926801" value="X" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315878">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TREE2" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315879">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315880" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315881">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315882">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315883">
            <property name="value" nameId="tpee.1070475926801" value="A" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315884">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315885">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315886">
                <property name="value" nameId="tpee.1070475926801" value="B" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315887">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315888">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315889">
                    <property name="value" nameId="tpee.1070475926801" value="C" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805315890">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315872" resolveInfo="SUBTREE2" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315891">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="SUBTREE2_ANCESTORS" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315892">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315893" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315894">
        <property name="value" nameId="tpee.1070475926801" value="CBA" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315895">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="SUBTREE2_SELF_ANCESTORS" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315896">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315897" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315898">
        <property name="value" nameId="tpee.1070475926801" value="XCBA" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315899">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="SUBTREE2_PARENT" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315900">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315901" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315902">
        <property name="value" nameId="tpee.1070475926801" value="C" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315903">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="SUBTREE2_ANCESTORS_DESCENDANTS" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315904">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315905" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315906">
        <property name="value" nameId="tpee.1070475926801" value="XCXBCX" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315907">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="SUBTREE3" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315908">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315909" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315910">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315911">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315912">
            <property name="value" nameId="tpee.1070475926801" value="I" />
          </node>
        </node>
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315913">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="TREE3" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315914">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="6033226775805315496" resolveInfo="YNode" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315915" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315916">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315917">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315918">
            <property name="value" nameId="tpee.1070475926801" value="A" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315919">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315920">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315921">
                <property name="value" nameId="tpee.1070475926801" value="B" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315922">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315923">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315924">
                    <property name="value" nameId="tpee.1070475926801" value="C" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315925">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315926">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315927">
                <property name="value" nameId="tpee.1070475926801" value="D" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315928">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315929">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315930">
                    <property name="value" nameId="tpee.1070475926801" value="E" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315931">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315932">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315933">
                        <property name="value" nameId="tpee.1070475926801" value="F" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315934">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315935">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315936">
                    <property name="value" nameId="tpee.1070475926801" value="G" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315937">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315938">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315939">
                <property name="value" nameId="tpee.1070475926801" value="H" />
              </node>
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805315940">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315907" resolveInfo="SUBTREE3" />
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315941">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315942">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315943">
                <property name="value" nameId="tpee.1070475926801" value="J" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315944">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315945">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315946">
                    <property name="value" nameId="tpee.1070475926801" value="K" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315947">
            <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315948">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315949">
                <property name="value" nameId="tpee.1070475926801" value="L" />
              </node>
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315950">
                <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315951">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315952">
                    <property name="value" nameId="tpee.1070475926801" value="M" />
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315953">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315954">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315955">
                        <property name="value" nameId="tpee.1070475926801" value="N" />
                      </node>
                    </node>
                  </node>
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6033226775805315956">
                    <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6033226775805315957">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315696" resolveInfo="YNode" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315958">
                        <property name="value" nameId="tpee.1070475926801" value="O" />
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
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315959">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="SUBTREE3_PRECEDING_SIBLINGS" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315960">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315961" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315962">
        <property name="value" nameId="tpee.1070475926801" value="BDH" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315963">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="SUBTREE3_PRECEDING_SIBLINGS_SELF" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315964">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315965" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315966">
        <property name="value" nameId="tpee.1070475926801" value="BDHI" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315967">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="SUBTREE3_SELF_FOLLOWING_SIBLINGS" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315968">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315969" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315970">
        <property name="value" nameId="tpee.1070475926801" value="IJL" />
      </node>
    </node>
    <node role="staticField" roleId="tpee.1128555889557" type="tpee.StaticFieldDeclaration" typeId="tpee.1070462154015" id="6033226775805315971">
      <property name="isFinal" nameId="tpee.1176718929932" value="true" />
      <property name="name" nameId="tpck.1169194664001" value="SUBTREE3_FOLLOWING_SIBLINGS" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6033226775805315972">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="e2lb.~String" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315973" />
      <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6033226775805315974">
        <property name="value" nameId="tpee.1070475926801" value="JL" />
      </node>
    </node>
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6033226775805315975">
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315976" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6033226775805315977" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315978" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="6033226775805315979">
      <property name="name" nameId="tpck.1169194664001" value="testSampleData" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6033226775805315980" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6033226775805315981" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6033226775805315982">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805315983">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805315984">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qjxg.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qjxg.~Assert%dassertEquals(java%dlang%dObject,java%dlang%dObject)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805315985">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315856" resolveInfo="TREE1_DESCENDANTS" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805315986">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="6033226775805315496" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315785" resolveInfo="convertToString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315987">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805315988">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805315989">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315827" resolveInfo="TREE_PATH" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315990">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267763" resolveInfo="startTraversal" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805315991">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315832" resolveInfo="TREE1" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805315992">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805316136">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266868" resolveInfo="DESCENDANTS" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805315994">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805315995">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qjxg.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qjxg.~Assert%dassertEquals(java%dlang%dObject,java%dlang%dObject)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805315996">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315860" resolveInfo="TREE1_SELF_DESCENDANTS" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805315997">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="6033226775805315496" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315785" resolveInfo="convertToString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805316137">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805316138">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316144">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315827" resolveInfo="TREE_PATH" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805316140">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267763" resolveInfo="startTraversal" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316145">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315832" resolveInfo="TREE1" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805316142">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805316146">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266871" resolveInfo="SELF_DESCENDANTS" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805316005">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316006">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qjxg.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qjxg.~Assert%dassertEquals(java%dlang%dObject,java%dlang%dObject)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316007">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315864" resolveInfo="TREE1_CHILDREN" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316008">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="6033226775805315496" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315785" resolveInfo="convertToString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805316147">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805316148">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316154">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315827" resolveInfo="TREE_PATH" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805316150">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267763" resolveInfo="startTraversal" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316155">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315832" resolveInfo="TREE1" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805316152">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805316156">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266874" resolveInfo="CHILDREN" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805316016">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316017">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qjxg.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qjxg.~Assert%dassertEquals(java%dlang%dObject,java%dlang%dObject)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316018">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315868" resolveInfo="TREE1_DESCENDANTS_ANCESTORS" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316019">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="6033226775805315496" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315785" resolveInfo="convertToString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805321044">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805321045">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805321046">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805321054">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315827" resolveInfo="TREE_PATH" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805321048">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267763" resolveInfo="startTraversal" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805321056">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315832" resolveInfo="TREE1" />
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805321050">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805321057">
                      <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266868" resolveInfo="DESCENDANTS" />
                      <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805321052">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805321058">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266877" resolveInfo="ANCESTORS" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805316030">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316031">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qjxg.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qjxg.~Assert%dassertEquals(java%dlang%dObject,java%dlang%dObject)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316032">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315891" resolveInfo="SUBTREE2_ANCESTORS" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316033">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="6033226775805315496" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315785" resolveInfo="convertToString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805321034">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805321035">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805321041">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315827" resolveInfo="TREE_PATH" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805321037">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267763" resolveInfo="startTraversal" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805321042">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315872" resolveInfo="SUBTREE2" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805321039">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805321043">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266877" resolveInfo="ANCESTORS" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805316041">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316042">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qjxg.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qjxg.~Assert%dassertEquals(java%dlang%dObject,java%dlang%dObject)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316043">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315895" resolveInfo="SUBTREE2_SELF_ANCESTORS" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316044">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="6033226775805315496" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315785" resolveInfo="convertToString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805321023">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805321024">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805321030">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315827" resolveInfo="TREE_PATH" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805321026">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267763" resolveInfo="startTraversal" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805321032">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315872" resolveInfo="SUBTREE2" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805321028">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805321033">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266880" resolveInfo="SELF_ANCESTORS" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805316052">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316053">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qjxg.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qjxg.~Assert%dassertEquals(java%dlang%dObject,java%dlang%dObject)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316054">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315903" resolveInfo="SUBTREE2_ANCESTORS_DESCENDANTS" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316055">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="6033226775805315496" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315785" resolveInfo="convertToString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805321016">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805321005">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805321006">
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805321012">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315827" resolveInfo="TREE_PATH" />
                    </node>
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805321008">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267763" resolveInfo="startTraversal" />
                      <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805321014">
                        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315872" resolveInfo="SUBTREE2" />
                      </node>
                    </node>
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805321010">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805321015">
                      <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266877" resolveInfo="ANCESTORS" />
                      <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805321020">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805321022">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266868" resolveInfo="DESCENDANTS" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805316066">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316067">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qjxg.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qjxg.~Assert%dassertEquals(java%dlang%dObject,java%dlang%dObject)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316068">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315959" resolveInfo="SUBTREE3_PRECEDING_SIBLINGS" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316069">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="6033226775805315496" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315785" resolveInfo="convertToString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805320995">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805320996">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805321002">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315827" resolveInfo="TREE_PATH" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805320998">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267763" resolveInfo="startTraversal" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805321003">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315907" resolveInfo="SUBTREE3" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805321000">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805321004">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266889" resolveInfo="PRECEDING_SIBLINGS" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805316077">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316078">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qjxg.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qjxg.~Assert%dassertEquals(java%dlang%dObject,java%dlang%dObject)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316079">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315963" resolveInfo="SUBTREE3_PRECEDING_SIBLINGS_SELF" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316080">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="6033226775805315496" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315785" resolveInfo="convertToString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805320985">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805320986">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805320992">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315827" resolveInfo="TREE_PATH" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805320988">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267763" resolveInfo="startTraversal" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805320993">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315907" resolveInfo="SUBTREE3" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805320990">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805320994">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266892" resolveInfo="PRECEDING_SIBLINGS_SELF" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805316088">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316089">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qjxg.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qjxg.~Assert%dassertEquals(java%dlang%dObject,java%dlang%dObject)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316090">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315967" resolveInfo="SUBTREE3_SELF_FOLLOWING_SIBLINGS" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316091">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="6033226775805315496" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315785" resolveInfo="convertToString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805320975">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805320976">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805320982">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315827" resolveInfo="TREE_PATH" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805320978">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267763" resolveInfo="startTraversal" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805320983">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315907" resolveInfo="SUBTREE3" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805320980">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805320984">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266886" resolveInfo="SELF_FOLLOWING_SIBLINGS" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6033226775805316099">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316100">
            <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="qjxg.~Assert" />
            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="qjxg.~Assert%dassertEquals(java%dlang%dObject,java%dlang%dObject)%cvoid" />
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316101">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315971" resolveInfo="SUBTREE3_FOLLOWING_SIBLINGS" />
            </node>
            <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StaticMethodCall" typeId="tpee.1081236700937" id="6033226775805316102">
              <link role="classConcept" roleId="tpee.1144433194310" targetNodeId="6033226775805315496" />
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="6033226775805315785" resolveInfo="convertToString" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805316157">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6033226775805316158">
                  <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805316164">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315827" resolveInfo="TREE_PATH" />
                  </node>
                  <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805316160">
                    <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929267763" resolveInfo="startTraversal" />
                    <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.LocalStaticFieldReference" typeId="tpee.1172008963197" id="6033226775805320973">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6033226775805315907" resolveInfo="SUBTREE3" />
                    </node>
                  </node>
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6033226775805316162">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fjjo.2295870045929268288" resolveInfo="traverse" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.EnumConstantReference" typeId="tpee.1083260308424" id="6033226775805320974">
                    <link role="enumConstantDeclaration" roleId="tpee.1083260308426" targetNodeId="fjjo.2295870045929266883" resolveInfo="FOLLOWING_SIBLINGS" />
                    <link role="enumClass" roleId="tpee.1144432896254" targetNodeId="fjjo.2295870045929266247" resolveInfo="TraversalAxis" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="annotation" roleId="tpee.1188208488637" type="tpee.AnnotationInstance" typeId="tpee.1188207840427" id="6033226775805316110">
        <link role="annotation" roleId="tpee.1188208074048" targetNodeId="qjxg.~Test" />
      </node>
    </node>
  </root>
</model>

