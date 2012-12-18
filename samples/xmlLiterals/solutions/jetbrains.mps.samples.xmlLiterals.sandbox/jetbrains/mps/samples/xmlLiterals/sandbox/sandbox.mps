<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:63e559bf-39bb-4209-acb3-f4d189328793(jetbrains.mps.samples.xmlLiterals.sandbox.sandbox)">
  <persistence version="7" />
  <language namespace="a1896bc3-4f5b-4a31-b78b-b65514f8d0e5(jetbrains.mps.samples.xmlLiterals)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="2c55c7ac-60c3-4eea-b9db-0d627bd2dcb9(jetbrains.mps.xml)" />
  <language namespace="64f62b28-36e3-4052-9f72-f616211ae615(jetbrains.mps.xmlInternal)" />
  <import index="xuot" modelUID="f:java_stub#37a3367b-1fb2-44d8-aa6b-18075e74e003#org.jdom(org.jdom@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpjo" modelUID="r:00000000-0000-4000-0000-011c89590588(jetbrains.mps.xml.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpjh" modelUID="r:00000000-0000-4000-0000-011c89590591(jetbrains.mps.xmlInternal.structure)" version="2" implicit="yes" />
  <import index="v5hn" modelUID="r:a9473eef-c3e7-4713-b3b3-57facda6958d(jetbrains.mps.samples.xmlLiterals.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="9152904044274358977">
      <property name="name" nameId="tpck.1169194664001" value="Person" />
    </node>
    <node type="tpee.ClassConcept" typeId="tpee.1068390468198" id="9152904044274518176">
      <property name="name" nameId="tpck.1169194664001" value="Address" />
    </node>
  </roots>
  <root id="9152904044274358977">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9152904044274358978" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="9152904044274358979">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="9152904044274358980" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9152904044274358981" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9152904044274358982" />
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9152904044274516033">
      <property name="name" nameId="tpck.1169194664001" value="getName" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="9152904044274516037" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9152904044274516035" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9152904044274516036">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7417816926334720606">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7417816926334720607">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7417816926334720608">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7417816926334720594" resolveInfo="name" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7417816926334720609" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7417816926334720636">
      <property name="name" nameId="tpck.1169194664001" value="setName" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7417816926334720637" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7417816926334720638" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7417816926334720639">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7417816926334720642">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7417816926334720646">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7417816926334720649">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7417816926334720640" resolveInfo="newName" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7417816926334720643">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7417816926334720644">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7417816926334720594" resolveInfo="name" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7417816926334720645" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7417816926334720640">
        <property name="name" nameId="tpck.1169194664001" value="newName" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="7417816926334720641" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7417816926334720610">
      <property name="name" nameId="tpck.1169194664001" value="getLastName" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="7417816926334720618" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7417816926334720612" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7417816926334720613">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7417816926334720614">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7417816926334720615">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7417816926334720616">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7417816926334720598" resolveInfo="lastName" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7417816926334720617" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7417816926334720650">
      <property name="name" nameId="tpck.1169194664001" value="setLastName" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7417816926334720651" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7417816926334720652" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7417816926334720653">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7417816926334720662">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7417816926334720669">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7417816926334720672">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7417816926334720654" resolveInfo="newLastName" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7417816926334720664">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7417816926334720663" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7417816926334720668">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7417816926334720598" resolveInfo="lastName" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7417816926334720654">
        <property name="name" nameId="tpck.1169194664001" value="newLastName" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="7417816926334720655" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9152904044274541180">
      <property name="name" nameId="tpck.1169194664001" value="getAddress" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9152904044274541184">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="9152904044274518176" resolveInfo="Address" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9152904044274541182" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9152904044274541183">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7417816926334720619">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7417816926334720620">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7417816926334720621">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7417816926334720602" resolveInfo="address" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7417816926334720622" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7417816926334720673">
      <property name="name" nameId="tpck.1169194664001" value="setAddress" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7417816926334720674" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7417816926334720675" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7417816926334720676">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7417816926334720681">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7417816926334720685">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7417816926334720688">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7417816926334720677" resolveInfo="newAddress" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7417816926334720682">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7417816926334720683">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7417816926334720602" resolveInfo="address" />
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7417816926334720684" />
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7417816926334720677">
        <property name="name" nameId="tpck.1169194664001" value="newAddress" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7417816926334720678">
          <link role="classifier" roleId="tpee.1107535924139" targetNodeId="9152904044274518176" resolveInfo="Address" />
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9152904044274458171">
      <property name="name" nameId="tpck.1169194664001" value="toXml" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9152904044274464618">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="xuot.~Element" resolveInfo="Element" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9152904044274458173" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9152904044274458174">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="9152904044274464619">
          <node role="expression" roleId="tpee.1068580123156" type="v5hn.XmlLiteral" typeId="v5hn.9152904044274328259" id="9152904044274464620">
            <node role="element" roleId="v5hn.9152904044274328260" type="tpjh.SimpleElement" typeId="tpjh.1179105519357" id="9152904044274469589">
              <node role="contentList" roleId="tpjo.1179114219774" type="tpjo.ContentList" typeId="tpjo.1163629230879" id="9152904044274469591">
                <node role="content" roleId="tpjo.1163629255661" type="tpjh.SimpleElement" typeId="tpjh.1179105519357" id="9152904044274518018">
                  <node role="elementName" roleId="tpjh.1179271242032" type="tpjo.Text" typeId="tpjo.1161373262136" id="9152904044274518019">
                    <property name="text" nameId="tpjo.1161373273669" value="name" />
                  </node>
                  <node role="contentList" roleId="tpjo.1179114219774" type="tpjo.ContentList" typeId="tpjo.1163629230879" id="9152904044274518020">
                    <node role="content" roleId="tpjo.1163629255661" type="v5hn.TextMacro" typeId="v5hn.9152904044274469601" id="7417816926334597241">
                      <node role="expression" roleId="v5hn.9152904044274469602" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7417816926334597242">
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7417816926334597243">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9152904044274516033" resolveInfo="getName" />
                        </node>
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7417816926334597244" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="content" roleId="tpjo.1163629255661" type="tpjh.SimpleElement" typeId="tpjh.1179105519357" id="7417816926334720627">
                  <node role="elementName" roleId="tpjh.1179271242032" type="tpjo.Text" typeId="tpjo.1161373262136" id="7417816926334720628">
                    <property name="text" nameId="tpjo.1161373273669" value="lastName" />
                  </node>
                  <node role="contentList" roleId="tpjo.1179114219774" type="tpjo.ContentList" typeId="tpjo.1163629230879" id="7417816926334720629">
                    <node role="content" roleId="tpjo.1163629255661" type="v5hn.TextMacro" typeId="v5hn.9152904044274469601" id="7417816926334720631">
                      <node role="expression" roleId="v5hn.9152904044274469602" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7417816926334720633">
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7417816926334720634">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7417816926334720610" resolveInfo="getLastName" />
                        </node>
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7417816926334720635" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="content" roleId="tpjo.1163629255661" type="tpjh.SimpleElement" typeId="tpjh.1179105519357" id="9152904044274518193">
                  <node role="elementName" roleId="tpjh.1179271242032" type="tpjo.Text" typeId="tpjo.1161373262136" id="9152904044274518194">
                    <property name="text" nameId="tpjo.1161373273669" value="address" />
                  </node>
                  <node role="contentList" roleId="tpjo.1179114219774" type="tpjo.ContentList" typeId="tpjo.1163629230879" id="9152904044274518195">
                    <node role="content" roleId="tpjo.1163629255661" type="v5hn.ElementMacro" typeId="v5hn.9152904044274518122" id="7417816926334645014">
                      <node role="expression" roleId="v5hn.9152904044274518128" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7417816926334645019">
                        <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7417816926334645016">
                          <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7417816926334645017">
                            <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9152904044274541180" resolveInfo="getAddress" />
                          </node>
                          <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7417816926334645018" />
                        </node>
                        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7417816926334645023">
                          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="9152904044274518182" resolveInfo="toXml" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="elementName" roleId="tpjh.1179271242032" type="tpjo.Text" typeId="tpjo.1161373262136" id="9152904044274518015">
                <property name="text" nameId="tpjo.1161373273669" value="person" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="7417816926334720594">
      <property name="name" nameId="tpck.1169194664001" value="name" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="7417816926334720595" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="7417816926334720597" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="7417816926334720598">
      <property name="name" nameId="tpck.1169194664001" value="lastName" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="7417816926334720599" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="7417816926334720601" />
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="7417816926334720602">
      <property name="name" nameId="tpck.1169194664001" value="address" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="7417816926334720603" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="7417816926334720605">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="9152904044274518176" resolveInfo="Address" />
      </node>
    </node>
  </root>
  <root id="9152904044274518176">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9152904044274518177" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="9152904044274518178">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="9152904044274518179" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9152904044274518180" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9152904044274518181">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7946777123643247292">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7946777123643247299">
            <node role="rValue" roleId="tpee.1068498886297" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="7946777123643247302">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7417816926334720697" resolveInfo="addressString" />
            </node>
            <node role="lValue" roleId="tpee.1068498886295" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7946777123643247294">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7946777123643247293" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7946777123643247298">
                <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7417816926334720689" resolveInfo="addressString" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="7417816926334720697">
        <property name="name" nameId="tpck.1169194664001" value="addressString" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="7417816926334720698" />
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="7417816926334720717">
      <property name="name" nameId="tpck.1169194664001" value="getAddressString" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.StringType" typeId="tpee.1225271177708" id="7417816926334720721" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7417816926334720719" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7417816926334720720">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7417816926334720722">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7417816926334720723">
            <node role="operation" roleId="tpee.1197027833540" type="tpee.FieldReferenceOperation" typeId="tpee.1197029447546" id="7417816926334720724">
              <link role="fieldDeclaration" roleId="tpee.1197029500499" targetNodeId="7417816926334720689" resolveInfo="addressString" />
            </node>
            <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7417816926334720725" />
          </node>
        </node>
      </node>
    </node>
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="9152904044274518182">
      <property name="name" nameId="tpck.1169194664001" value="toXml" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="9152904044274518186">
        <link role="classifier" roleId="tpee.1107535924139" targetNodeId="xuot.~Element" resolveInfo="Element" />
      </node>
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="9152904044274518184" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="9152904044274518185">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7417816926334720699">
          <node role="expression" roleId="tpee.1068580123156" type="v5hn.XmlLiteral" typeId="v5hn.9152904044274328259" id="7417816926334720703">
            <node role="element" roleId="v5hn.9152904044274328260" type="tpjh.SimpleElement" typeId="tpjh.1179105519357" id="7417816926334720706">
              <node role="elementName" roleId="tpjh.1179271242032" type="tpjo.Text" typeId="tpjo.1161373262136" id="7417816926334720707">
                <property name="text" nameId="tpjo.1161373273669" value="address" />
              </node>
              <node role="contentList" roleId="tpjo.1179114219774" type="tpjo.ContentList" typeId="tpjo.1163629230879" id="7417816926334720708">
                <node role="content" roleId="tpjo.1163629255661" type="v5hn.TextMacro" typeId="v5hn.9152904044274469601" id="7417816926334720711">
                  <node role="expression" roleId="v5hn.9152904044274469602" type="tpee.DotExpression" typeId="tpee.1197027756228" id="7417816926334720726">
                    <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="7417816926334720727">
                      <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="7417816926334720717" resolveInfo="getAddressString" />
                    </node>
                    <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="7417816926334720728" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="field" roleId="tpee.1068390468199" type="tpee.FieldDeclaration" typeId="tpee.1068390468200" id="7417816926334720689">
      <property name="name" nameId="tpck.1169194664001" value="addressString" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PrivateVisibility" typeId="tpee.1146644623116" id="7417816926334720690" />
      <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="7417816926334720692" />
    </node>
  </root>
</model>

