<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:49eba21e-740e-4a19-9958-32f14a0e86d2(jetbrains.jetpad.builders.sandbox)">
  <persistence version="7" />
  <language namespace="132aa4d8-a3f7-441c-a7eb-3fce23492c6a(jetbrains.mps.baseLanguage.builders)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="pmg0" modelUID="r:77052501-5144-48a7-be50-7535fc6d1073(jetbrains.mps.baseLanguage.builders.structure)" version="0" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="7057666463730252450">
      <property name="name" nameId="tpck.1169194664001" value="Abc" />
    </node>
    <node type="pmg0.SimpleBuilders" typeId="pmg0.7288041816792374843" id="3816167865390667291">
      <property name="name" nameId="tpck.1169194664001" value="treeTest" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="3816167865390946785">
      <property name="name" nameId="tpck.1169194664001" value="Node" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="8009360033695026859">
      <property name="name" nameId="tpck.1169194664001" value="As" />
    </node>
    <node type="pmg0.SimpleBuilders" typeId="pmg0.7288041816792374843" id="5199967550912605229">
      <property name="name" nameId="tpck.1169194664001" value="extends" />
      <link role="extendsBuilder" roleId="pmg0.5199967550912384274" targetNodeId="3816167865390667291" resolveInfo="treeTest" />
    </node>
  </roots>
  <root id="7057666463730252450">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7057666463730252451" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="7057666463730252452">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7057666463730252453" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7057666463730252454" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7057666463730252455">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6666322667909804024">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6666322667909804025">
            <node role="creator" roleId="tpee.1145553007750" type="pmg0.BuilderCreator" typeId="pmg0.7057666463730155278" id="6666322667909804028">
              <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="6666322667909804029">
                <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="6666322667909840094">
                  <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="6666322667909840095" />
                  <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.BeanPropertyBuilder" typeId="pmg0.2679357232283750087" id="6666322667909840096">
                    <link role="setter" roleId="pmg0.2679357232283750088" targetNodeId="2679357232284126655" resolveInfo="setText" />
                    <node role="value" roleId="pmg0.2679357232283750106" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6666322667909840098">
                      <property name="value" nameId="tpee.1070475926801" value="abc" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.BeanBuilder" typeId="pmg0.6666322667909540799" id="6666322667909804030">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3816167865390946787" resolveInfo="Node" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6666322667909840093">
                  <property name="value" nameId="tpee.1070475926801" value="abc" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="3816167865390667312">
      <property name="name" nameId="tpck.1169194664001" value="aaa" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3816167865390667313" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3816167865390667314" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3816167865390667315">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3816167865390946757">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3816167865390946758">
            <node role="creator" roleId="tpee.1145553007750" type="pmg0.BuilderCreator" typeId="pmg0.7057666463730155278" id="3816167865390946760">
              <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="3816167865390946761">
                <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="3816167865390946763">
                  <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="3816167865390946764">
                    <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="3816167865390946766">
                      <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="3816167865390946767">
                        <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="2679357232284001275">
                          <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="2679357232284001276" />
                          <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.BeanPropertyBuilder" typeId="pmg0.2679357232283750087" id="2679357232284001277">
                            <link role="setter" roleId="pmg0.2679357232283750088" targetNodeId="2679357232283934851" resolveInfo="setXYZ" />
                            <node role="value" roleId="pmg0.2679357232283750106" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="4797501453850513401">
                              <property name="value" nameId="tpee.1068580320021" value="22" />
                            </node>
                          </node>
                        </node>
                        <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="2679357232284126662">
                          <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="2679357232284126663" />
                          <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.BeanPropertyBuilder" typeId="pmg0.2679357232283750087" id="2679357232284126664">
                            <link role="setter" roleId="pmg0.2679357232283750088" targetNodeId="2679357232284126655" resolveInfo="setText" />
                            <node role="value" roleId="pmg0.2679357232283750106" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2679357232284163967">
                              <property name="value" nameId="tpee.1070475926801" value="text to set" />
                            </node>
                          </node>
                        </node>
                      </node>
                      <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="3816167865390946768">
                        <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="3816167865390667302" resolveInfo="c2" />
                      </node>
                    </node>
                    <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="5199967550912605222">
                      <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="5199967550912605223" />
                      <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="5199967550912605224">
                        <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="3816167865390667302" resolveInfo="c2" />
                      </node>
                    </node>
                    <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="6211769134875336887">
                      <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="6211769134875336888" />
                      <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="6211769134875336889">
                        <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="5199967550912605230" resolveInfo="c3" />
                      </node>
                    </node>
                    <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="6211769134875336878">
                      <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="6211769134875336879" />
                      <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="6211769134875336880">
                        <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="3816167865390667302" resolveInfo="c2" />
                      </node>
                    </node>
                    <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="5199967550912605226">
                      <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="5199967550912605227" />
                      <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="5199967550912605228">
                        <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="3816167865390667296" resolveInfo="c1" />
                      </node>
                    </node>
                    <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="8009360033695538781">
                      <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="8009360033695538782" />
                      <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="8009360033695538783">
                        <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="3816167865390667296" resolveInfo="c1" />
                      </node>
                    </node>
                  </node>
                  <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="3816167865390946765">
                    <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="3816167865390667296" resolveInfo="c1" />
                  </node>
                </node>
              </node>
              <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="3816167865390946762">
                <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="3816167865390945389" resolveInfo="root" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="3816167865390667291">
    <node role="builder" roleId="pmg0.7288041816792374845" type="pmg0.SimpleBuilderDeclaration" typeId="pmg0.7288041816792374840" id="3816167865390945389">
      <property name="name" nameId="tpck.1169194664001" value="root" />
      <property name="root" nameId="pmg0.7288041816792489431" value="true" />
      <node role="type" roleId="pmg0.3816167865390455307" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3816167865390946799">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3816167865390946785" resolveInfo="Node" />
      </node>
      <node role="creator" roleId="pmg0.7288041816793525038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3816167865390946800">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3816167865390946802">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3816167865390946787" resolveInfo="Node" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3816167865390946803">
            <property name="value" nameId="tpee.1070475926801" value="root" />
          </node>
        </node>
      </node>
      <node role="child" roleId="pmg0.7288041816792733124" type="pmg0.SimpleBuilderChild" typeId="pmg0.7288041816792577338" id="3816167865390945394">
        <link role="child" roleId="pmg0.7288041816792577339" targetNodeId="3816167865390667292" resolveInfo="base" />
        <node role="attachStatement" roleId="pmg0.7288041816792607835" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3816167865391250056">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3816167865391250058">
            <node role="operand" roleId="tpee.1197027771414" type="pmg0.SimpleBuilderParentExpression" typeId="pmg0.7288041816792577340" id="3816167865391250057" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3816167865391250062">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3816167865390946793" resolveInfo="add" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="pmg0.SimpleBuilderChildExpression" typeId="pmg0.7288041816792577342" id="3816167865391250063" />
            </node>
          </node>
        </node>
      </node>
      <node role="property" roleId="pmg0.5389689214217081351" type="pmg0.SimpleBuilderProperty" typeId="pmg0.5389689214216990954" id="5389689214217329177">
        <property name="name" nameId="tpck.1169194664001" value="nameZ" />
        <node role="type" roleId="pmg0.5389689214216997399" type="tpee.StringType" typeId="tpee.1225271177708" id="5389689214217403943" />
        <node role="set" roleId="pmg0.5389689214217175694" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="5389689214217329180">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="5389689214217329182">
            <node role="operand" roleId="tpee.1197027771414" type="pmg0.SimpleBuilderPropertyParent" typeId="pmg0.5389689214217248368" id="5389689214217329181" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="5389689214217329186">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="5389689214217242841" resolveInfo="setName" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="pmg0.SimpleBuilderPropertyValue" typeId="pmg0.5389689214217248394" id="5389689214217329187" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="builder" roleId="pmg0.7288041816792374845" type="pmg0.SimpleBuilderDeclaration" typeId="pmg0.7288041816792374840" id="3816167865390667292">
      <property name="name" nameId="tpck.1169194664001" value="base" />
      <property name="isAbstract" nameId="pmg0.3816167865390639747" value="true" />
      <property name="leaf" nameId="pmg0.7288041816793407210" value="false" />
      <node role="type" roleId="pmg0.3816167865390455307" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3816167865390946804">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3816167865390946785" resolveInfo="Node" />
      </node>
      <node role="child" roleId="pmg0.7288041816792733124" type="pmg0.SimpleBuilderChild" typeId="pmg0.7288041816792577338" id="3816167865390667307">
        <link role="child" roleId="pmg0.7288041816792577339" targetNodeId="3816167865390667292" resolveInfo="base" />
        <node role="attachStatement" roleId="pmg0.7288041816792607835" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="3816167865391248602">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3816167865391248604">
            <node role="operand" roleId="tpee.1197027771414" type="pmg0.SimpleBuilderParentExpression" typeId="pmg0.7288041816792577340" id="3816167865391248603" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="3816167865391248608">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3816167865390946793" resolveInfo="add" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="pmg0.SimpleBuilderChildExpression" typeId="pmg0.7288041816792577342" id="3816167865391248609" />
            </node>
          </node>
        </node>
      </node>
      <node role="property" roleId="pmg0.5389689214217081351" type="pmg0.SimpleBuilderProperty" typeId="pmg0.5389689214216990954" id="3444577917576928484">
        <property name="name" nameId="tpck.1169194664001" value="baseeProp" />
        <node role="type" roleId="pmg0.5389689214216997399" type="tpee.BooleanType" typeId="tpee.1070534644030" id="3444577917576928487" />
        <node role="set" roleId="pmg0.5389689214217175694" type="tpee.Statement" typeId="tpee.1068580123157" id="3444577917576928486" />
      </node>
    </node>
    <node role="builder" roleId="pmg0.7288041816792374845" type="pmg0.SimpleBuilderDeclaration" typeId="pmg0.7288041816792374840" id="3816167865390667296">
      <property name="name" nameId="tpck.1169194664001" value="c1" />
      <link role="extends" roleId="pmg0.3816167865390363701" targetNodeId="3816167865390667292" resolveInfo="base" />
      <node role="type" roleId="pmg0.3816167865390455307" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3816167865390977220">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3816167865390946785" resolveInfo="Node" />
      </node>
      <node role="creator" roleId="pmg0.7288041816793525038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3816167865390977221">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3816167865390977223">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3816167865390946787" resolveInfo="Node" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3816167865390977224">
            <property name="value" nameId="tpee.1070475926801" value="c1" />
          </node>
        </node>
      </node>
    </node>
    <node role="builder" roleId="pmg0.7288041816792374845" type="pmg0.SimpleBuilderDeclaration" typeId="pmg0.7288041816792374840" id="3816167865390667302">
      <property name="name" nameId="tpck.1169194664001" value="c2" />
      <link role="extends" roleId="pmg0.3816167865390363701" targetNodeId="3816167865390667292" resolveInfo="base" />
      <node role="type" roleId="pmg0.3816167865390455307" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3816167865390977225">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3816167865390946785" resolveInfo="Node" />
      </node>
      <node role="creator" roleId="pmg0.7288041816793525038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="3816167865390977226">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="3816167865390977228">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3816167865390946787" resolveInfo="Node" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3816167865390977229">
            <property name="value" nameId="tpee.1070475926801" value="c2" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="3816167865390946785">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3816167865390946786" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="3816167865390946787">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3816167865390946788" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3816167865390946789" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3816167865390946790" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="3816167865390946791">
        <property name="name" nameId="tpck.1169194664001" value="c" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="3816167865390946792" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="3816167865390946793">
      <property name="name" nameId="tpck.1169194664001" value="add" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3816167865390946794" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3816167865390946795" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3816167865390946796" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="3816167865390946797">
        <property name="name" nameId="tpck.1169194664001" value="n" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="3816167865390946798">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3816167865390946785" resolveInfo="Node" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2679357232283934851">
      <property name="name" nameId="tpck.1169194664001" value="setXYZ" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2679357232283934852" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2679357232283934853" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2679357232283934854" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2679357232283934855">
        <property name="name" nameId="tpck.1169194664001" value="i" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="2679357232283934856" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7782956297805736454">
      <property name="name" nameId="tpck.1169194664001" value="setAAAA" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7782956297805736455" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7782956297805736456" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7782956297805736457" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7782956297805736458">
        <property name="name" nameId="tpck.1169194664001" value="s" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="7782956297805736459" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2679357232284126655">
      <property name="name" nameId="tpck.1169194664001" value="setText" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2679357232284126656" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2679357232284126657" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2679357232284126658" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2679357232284126659">
        <property name="name" nameId="tpck.1169194664001" value="text" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="2679357232284126660" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="5389689214217242841">
      <property name="name" nameId="tpck.1169194664001" value="setName" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="5389689214217242842" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="5389689214217242843" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="5389689214217242844" />
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="5389689214217242845">
        <property name="name" nameId="tpck.1169194664001" value="name" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="5389689214217242846" />
      </node>
    </node>
  </root>
  <root id="8009360033695026859">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8009360033695026860" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="8009360033695026861">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8009360033695026862" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8009360033695026863" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8009360033695026864">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8009360033695026865">
          <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8009360033695026866">
            <property name="name" nameId="tpck.1169194664001" value="n" />
            <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8009360033695026867">
              <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3816167865390946785" resolveInfo="Node" />
            </node>
            <node role="initializer" roleId="tpee.1068431790190" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="8009360033695026869" />
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="pmg0.AsBuilderStatement" typeId="pmg0.7802271442981707292" id="8009360033695026871">
          <node role="expression" roleId="pmg0.7802271442981707295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8009360033695026875">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8009360033695026866" resolveInfo="n" />
          </node>
          <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="8009360033695026874">
            <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="5389689214217604560">
              <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="5389689214217604561" />
              <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilderPropertyBuilder" typeId="pmg0.5389689214217404511" id="5389689214217604562">
                <link role="declaration" roleId="pmg0.5389689214217404513" targetNodeId="5389689214217329177" resolveInfo="nameZ" />
                <node role="value" roleId="pmg0.5389689214217404512" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5389689214217604564">
                  <property name="value" nameId="tpee.1070475926801" value="aaaa" />
                </node>
              </node>
            </node>
            <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="8009360033695056274">
              <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="8009360033695056275">
                <node role="statement" roleId="tpee.1068581517665" type="tpee.ForStatement" typeId="tpee.1144231330558" id="6185317612116086049">
                  <node role="body" roleId="tpee.1154032183016" type="tpee.StatementList" typeId="tpee.1068580123136" id="6185317612116086050">
                    <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="6211769134875336875">
                      <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="6211769134875336876">
                        <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="7782956297805940189">
                          <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="7782956297805940190" />
                          <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilderPropertyBuilder" typeId="pmg0.5389689214217404511" id="7782956297805940191">
                            <link role="declaration" roleId="pmg0.5389689214217404513" targetNodeId="6254726786820606548" resolveInfo="xyz" />
                            <node role="value" roleId="pmg0.5389689214217404512" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7782956297805985962">
                              <property name="value" nameId="tpee.1070475926801" value="aaaa" />
                            </node>
                          </node>
                        </node>
                        <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="7782956297805984814">
                          <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="7782956297805984815" />
                          <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="7782956297805984816">
                            <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="6254726786820606530" resolveInfo="ccc" />
                          </node>
                        </node>
                      </node>
                      <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="6211769134875336877">
                        <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="5199967550912605230" resolveInfo="c3" />
                      </node>
                    </node>
                    <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="6185317612116086066">
                      <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="6185317612116086067">
                        <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="7782956297805984817">
                          <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="7782956297805984818" />
                          <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="7782956297805984819">
                            <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="5199967550912605230" resolveInfo="c3" />
                          </node>
                        </node>
                      </node>
                      <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="6185317612116086068">
                        <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="3816167865390667302" resolveInfo="c2" />
                      </node>
                    </node>
                    <node role="statement" roleId="tpee.1068581517665" type="pmg0.BuilderStatement" typeId="pmg0.7057666463730155299" id="5199967550912605244">
                      <node role="body" roleId="pmg0.4797501453849924252" type="tpee.StatementList" typeId="tpee.1068580123136" id="5199967550912605245" />
                      <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="5199967550912605246">
                        <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="3816167865390667302" resolveInfo="c2" />
                      </node>
                    </node>
                  </node>
                  <node role="variable" roleId="tpee.1144230900587" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6185317612116086053">
                    <property name="name" nameId="tpck.1169194664001" value="i" />
                    <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="6185317612116086055" />
                    <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6185317612116086057">
                      <property name="value" nameId="tpee.1068580320021" value="0" />
                    </node>
                  </node>
                  <node role="condition" roleId="tpee.1144231399730" type="tpee.LessThanExpression" typeId="tpee.1081506773034" id="6185317612116086059">
                    <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6185317612116086062">
                      <property name="value" nameId="tpee.1068580320021" value="100" />
                    </node>
                    <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6185317612116086058">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6185317612116086053" resolveInfo="i" />
                    </node>
                  </node>
                  <node role="iteration" roleId="tpee.1144231408325" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="6185317612116086064">
                    <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6185317612116086065">
                      <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6185317612116086053" resolveInfo="i" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="8009360033695056276">
                <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="3816167865390667296" resolveInfo="c1" />
              </node>
            </node>
          </node>
          <node role="builder" roleId="pmg0.4797501453850567416" type="pmg0.SimpleBuilder" typeId="pmg0.7288041816793071802" id="8009360033695056273">
            <link role="declaration" roleId="pmg0.7288041816793071803" targetNodeId="3816167865390945389" resolveInfo="root" />
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="5199967550912605229">
    <node role="builder" roleId="pmg0.7288041816792374845" type="pmg0.SimpleBuilderDeclaration" typeId="pmg0.7288041816792374840" id="5199967550912605230">
      <property name="name" nameId="tpck.1169194664001" value="c3" />
      <link role="extends" roleId="pmg0.3816167865390363701" targetNodeId="3816167865390667292" resolveInfo="base" />
      <node role="type" roleId="pmg0.3816167865390455307" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="5199967550912605238">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3816167865390946785" resolveInfo="Node" />
      </node>
      <node role="creator" roleId="pmg0.7288041816793525038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="5199967550912605239">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="5199967550912605241">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3816167865390946787" resolveInfo="Node" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="5199967550912605242">
            <property name="value" nameId="tpee.1070475926801" value="c3" />
          </node>
        </node>
      </node>
    </node>
    <node role="builder" roleId="pmg0.7288041816792374845" type="pmg0.SimpleBuilderDeclaration" typeId="pmg0.7288041816792374840" id="6254726786820606530">
      <property name="name" nameId="tpck.1169194664001" value="ccc" />
      <node role="type" roleId="pmg0.3816167865390455307" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6254726786820606533">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="3816167865390946785" resolveInfo="Node" />
      </node>
      <node role="creator" roleId="pmg0.7288041816793525038" type="tpee.GenericNewExpression" typeId="tpee.1145552977093" id="6254726786820606534">
        <node role="creator" roleId="tpee.1145553007750" type="tpee.ClassCreator" typeId="tpee.1212685548494" id="6254726786820606536">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3816167865390946787" resolveInfo="Node" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6254726786820606537">
            <property name="value" nameId="tpee.1070475926801" value="ccc" />
          </node>
        </node>
      </node>
    </node>
    <node role="builder" roleId="pmg0.7288041816792374845" type="pmg0.SimpleBuilderExtensionDeclaration" typeId="pmg0.6254726786820459251" id="6254726786820499705">
      <link role="extended" roleId="pmg0.6254726786820459254" targetNodeId="5199967550912605230" resolveInfo="c3" />
      <node role="child" roleId="pmg0.6254726786820459252" type="pmg0.SimpleBuilderChild" typeId="pmg0.7288041816792577338" id="6254726786820606538">
        <link role="child" roleId="pmg0.7288041816792577339" targetNodeId="6254726786820606530" resolveInfo="ccc" />
        <node role="attachStatement" roleId="pmg0.7288041816792607835" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6254726786820606540">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6254726786820606542">
            <node role="operand" roleId="tpee.1197027771414" type="pmg0.SimpleBuilderParentExpression" typeId="pmg0.7288041816792577340" id="6254726786820606541" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6254726786820606546">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="3816167865390946793" resolveInfo="add" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="pmg0.SimpleBuilderChildExpression" typeId="pmg0.7288041816792577342" id="6254726786820606547" />
            </node>
          </node>
        </node>
      </node>
      <node role="property" roleId="pmg0.6254726786820459253" type="pmg0.SimpleBuilderProperty" typeId="pmg0.5389689214216990954" id="6254726786820606548">
        <property name="name" nameId="tpck.1169194664001" value="xyz" />
        <node role="set" roleId="pmg0.5389689214217175694" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6254726786820606552">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6254726786820606554">
            <node role="operand" roleId="tpee.1197027771414" type="pmg0.SimpleBuilderPropertyParent" typeId="pmg0.5389689214217248368" id="6254726786820606553" />
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6254726786820606558">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7782956297805736454" resolveInfo="setAAAA" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="pmg0.SimpleBuilderPropertyValue" typeId="pmg0.5389689214217248394" id="7782956297805736453" />
            </node>
          </node>
        </node>
        <node role="type" roleId="pmg0.5389689214216997399" type="tpee.StringType" typeId="tpee.1225271177708" id="6254726786820606551" />
      </node>
    </node>
  </root>
</model>

