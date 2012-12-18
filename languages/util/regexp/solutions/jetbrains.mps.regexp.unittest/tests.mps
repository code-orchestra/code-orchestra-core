<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:710bb5ca-133c-4e34-80eb-4be42af51339(tests)">
  <persistence version="7" />
  <language namespace="daafa647-f1f7-4b0b-b096-69cd7c8408c0(jetbrains.mps.baseLanguage.regexp)" />
  <language namespace="f61473f9-130f-42f6-b98d-6c438812c2f6(jetbrains.mps.baseLanguage.unitTest)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="443f4c36-fcf5-4eb6-9500-8d06ed259e3e(jetbrains.mps.baseLanguage.classifiers)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <import index="lgzw" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.util.regex(JDK/java.util.regex@java_stub)" version="-1" />
  <import index="k7g3" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.util(JDK/java.util@java_stub)" version="-1" />
  <import index="tpfo" modelUID="r:00000000-0000-4000-0000-011c89590518(jetbrains.mps.baseLanguage.regexp.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpfp" modelUID="r:00000000-0000-4000-0000-011c89590519(jetbrains.mps.baseLanguage.regexp.jetbrains.mps.regexp.accessory)" version="-1" implicit="yes" />
  <import index="tpe3" modelUID="r:00000000-0000-4000-0000-011c895902d7(jetbrains.mps.baseLanguage.unitTest.structure)" version="-1" implicit="yes" />
  <roots>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="6799940379546332953">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="Statements" />
    </node>
    <node type="tpfo.Regexps" typeId="tpfo.1174662351725" id="6799940379546332968">
      <property name="name" nameId="tpck.1169194664001" value="Regexps" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="1353467374625228509">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="Escaping" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="6129327962763155569">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="Replace" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="6129327962764348634">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="Match" />
    </node>
    <node type="tpe3.BTestCase" typeId="tpe3.1171931851043" id="3796137614137404062">
      <property name="testCaseName" nameId="tpe3.1171931851045" value="PerlReplace" />
    </node>
  </roots>
  <root id="6799940379546332953">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6799940379546332954" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6799940379546332955">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6799940379546332956" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6799940379546332957" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6799940379546332958" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="6799940379546332959">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6799940379546332960">
        <property name="methodName" nameId="tpe3.1171931690128" value="ifmatch" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6799940379546332961" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6799940379546332962" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6799940379546332963">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6799940379546332980">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6799940379546332981">
              <property name="name" nameId="tpck.1169194664001" value="input" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="6799940379546332982" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6799940379546332984">
                <property name="value" nameId="tpee.1070475926801" value="reader@gmail.com" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6799940379546332987">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6799940379546332988">
              <property name="name" nameId="tpck.1169194664001" value="matches" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6799940379546332989" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="6799940379546332991">
                <property name="value" nameId="tpee.1068580123138" value="false" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpfo.MatchRegexpStatement" typeId="tpfo.1174512414484" id="6799940379546332964">
            <node role="body" roleId="tpfo.1174512427594" type="tpee.StatementList" typeId="tpee.1068580123136" id="6799940379546332965">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6799940379546332992">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6799940379546332994">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6799940379546332993">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6799940379546332988" resolveInfo="matches" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="6799940379546332997">
                    <property name="value" nameId="tpee.1068580123138" value="true" />
                  </node>
                </node>
              </node>
            </node>
            <node role="expr" roleId="tpfo.1174512569438" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6799940379546332985">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6799940379546332981" resolveInfo="input" />
            </node>
            <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="6799940379546332976">
              <property name="caseInsensitive" nameId="tpfo.1175159132192" value="false" />
              <property name="dotAll" nameId="tpfo.1175158902584" value="false" />
              <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.RegexpDeclarationReferenceRegexp" typeId="tpfo.1174662605354" id="233706782641329819">
                <link role="regexp" roleId="tpfo.1174662628918" targetNodeId="6799940379546332969" resolveInfo="EMail" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="6799940379546332999">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6799940379546333004">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6799940379546332988" resolveInfo="matches" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6129327962763158480">
        <property name="methodName" nameId="tpe3.1171931690128" value="iftilde" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6129327962763158481" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6129327962763158482" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6129327962763158483">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6129327962763158498">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6129327962763158499">
              <property name="name" nameId="tpck.1169194664001" value="result" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="6129327962763158500" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="6129327962763158502">
                <property name="value" nameId="tpee.1068580123138" value="false" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpfo.FindMatchStatement" typeId="tpfo.1175169009571" id="6129327962763158487">
            <node role="expr" roleId="tpfo.1175169023932" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6129327962763158491">
              <property name="value" nameId="tpee.1070475926801" value="aaabcd" />
            </node>
            <node role="body" roleId="tpfo.1175169154112" type="tpee.StatementList" typeId="tpee.1068580123136" id="6129327962763158489">
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6129327962763158503">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="6129327962763158505">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6129327962763158504">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6129327962763158499" resolveInfo="result" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="6129327962763158508">
                    <property name="value" nameId="tpee.1068580123138" value="true" />
                  </node>
                </node>
              </node>
            </node>
            <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="6129327962763158494">
              <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="6129327962763158496">
                <property name="text" nameId="tpfo.1174482761807" value="ab" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="6129327962763158514">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6129327962763158516">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6129327962763158499" resolveInfo="result" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="633895403833555338">
        <property name="methodName" nameId="tpe3.1171931690128" value="findall" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="633895403833555339" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="633895403833555340" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="633895403833555341">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="633895403833555344">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="633895403833555345">
              <property name="name" nameId="tpck.1169194664001" value="i" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.IntegerType" typeId="tpee.1070534370425" id="633895403833555346" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="633895403833555347">
                <property name="value" nameId="tpee.1068580320021" value="0" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpfo.ForEachMatchStatement" typeId="tpfo.1175154849582" id="633895403833555348">
            <node role="expr" roleId="tpfo.1175154880428" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="633895403833555349">
              <property name="value" nameId="tpee.1070475926801" value="abababab" />
            </node>
            <node role="body" roleId="tpfo.1175154946790" type="tpee.StatementList" typeId="tpee.1068580123136" id="633895403833555350">
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="633895403833555351">
                <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="633895403833555352">
                  <property name="value" nameId="tpee.1070475926801" value="ab" />
                </node>
                <node role="actual" roleId="tpe3.8427750732757990725" type="tpfo.MatchVariableReference" typeId="tpfo.1174565027678" id="633895403833555353">
                  <link role="match" roleId="tpfo.1174565035929" targetNodeId="633895403833555358" resolveInfo="aa" />
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="633895403833555354">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.PostfixIncrementExpression" typeId="tpee.1214918800624" id="633895403833555355">
                  <node role="expression" roleId="tpee.1239714902950" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="633895403833555356">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="633895403833555345" resolveInfo="i" />
                  </node>
                </node>
              </node>
            </node>
            <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="633895403833555357">
              <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="633895403833555358">
                <property name="name" nameId="tpck.1169194664001" value="aa" />
                <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="633895403833555359">
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="633895403833555360">
                    <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                  </node>
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="633895403833555361">
                    <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="633895403833555363">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="633895403833555364">
              <property name="value" nameId="tpee.1068580320021" value="4" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="633895403833555365">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="633895403833555345" resolveInfo="i" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6799940379546332968">
    <node role="regexp" roleId="tpfo.1174662369010" type="tpfo.RegexpDeclaration" typeId="tpfo.1174483125581" id="6799940379546332969">
      <property name="name" nameId="tpck.1169194664001" value="EMail" />
      <property name="description" nameId="tpfo.1174662978120" value="email regexp" />
      <node role="regexp" roleId="tpfo.1174483133849" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="6799940379546350580">
        <node role="left" roleId="tpfo.1174485176897" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="6799940379546350583">
          <node role="right" roleId="tpfo.1174485181039" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="6799940379546350586">
            <property name="text" nameId="tpfo.1174482761807" value="@" />
          </node>
          <node role="left" roleId="tpfo.1174485176897" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="6799940379546914498">
            <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="6799940379547300497">
              <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
            </node>
          </node>
        </node>
        <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="6799940379546350600">
          <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="5533535376639120957">
            <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
          </node>
          <node role="right" roleId="tpfo.1174485181039" type="tpfo.StarRegexp" typeId="tpfo.1174482808826" id="6799940379547199073">
            <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.ParensRegexp" typeId="tpfo.1174491169200" id="6799940379547199074">
              <node role="expr" roleId="tpfo.1174491174779" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="6799940379547199075">
                <node role="left" roleId="tpfo.1174485176897" type="tpfo.DotRegexp" typeId="tpfo.1174556813606" id="5533535376639120959" />
                <node role="right" roleId="tpfo.1174485181039" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="6799940379547199077">
                  <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="5533535376639120958">
                    <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="regexp" roleId="tpfo.1174662369010" type="tpfo.RegexpDeclaration" typeId="tpfo.1174483125581" id="5533535376639120949">
      <property name="name" nameId="tpck.1169194664001" value="esc_Brackets" />
      <node role="regexp" roleId="tpfo.1174483133849" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="1353467374625726864">
        <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="1353467374625726865">
          <property name="name" nameId="tpck.1169194664001" value="as" />
          <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.OrRegexp" typeId="tpfo.1174482769792" id="1353467374625726866">
            <node role="left" roleId="tpfo.1174485176897" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1353467374625726867">
              <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1353467374625726868">
                <node role="right" roleId="tpfo.1174485181039" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="1353467374625726869">
                  <property name="text" nameId="tpfo.1174482761807" value="]" />
                </node>
                <node role="left" roleId="tpfo.1174485176897" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="1353467374625726870">
                  <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="1353467374625726871">
                    <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                  </node>
                </node>
              </node>
              <node role="left" roleId="tpfo.1174485176897" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="1353467374625726872">
                <property name="text" nameId="tpfo.1174482761807" value="[" />
              </node>
            </node>
            <node role="right" roleId="tpfo.1174485181039" type="tpfo.OrRegexp" typeId="tpfo.1174482769792" id="1353467374625726873">
              <node role="left" roleId="tpfo.1174485176897" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1353467374625726874">
                <node role="left" roleId="tpfo.1174485176897" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="1353467374625726875">
                  <property name="text" nameId="tpfo.1174482761807" value="(" />
                </node>
                <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1353467374625726876">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="1353467374625726877">
                    <property name="text" nameId="tpfo.1174482761807" value=")" />
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="1353467374625726878">
                    <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="1353467374625726879">
                      <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                    </node>
                  </node>
                </node>
              </node>
              <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1353467374625726880">
                <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1353467374625726881">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="1353467374625726882">
                    <property name="text" nameId="tpfo.1174482761807" value="}" />
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="1353467374625726883">
                    <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="1353467374625726884">
                      <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                    </node>
                  </node>
                </node>
                <node role="left" roleId="tpfo.1174485176897" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="1353467374625726885">
                  <property name="text" nameId="tpfo.1174482761807" value="{" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="regexp" roleId="tpfo.1174662369010" type="tpfo.RegexpDeclaration" typeId="tpfo.1174483125581" id="1353467374624831077">
      <property name="name" nameId="tpck.1169194664001" value="ssdssds" />
      <node role="regexp" roleId="tpfo.1174483133849" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1353467374625020297">
        <node role="left" roleId="tpfo.1174485176897" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="1353467374624831083">
          <property name="text" nameId="tpfo.1174482761807" value="(asdadsasd)" />
        </node>
        <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1353467374625824275">
          <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1353467374625909705">
            <node role="right" roleId="tpfo.1174485181039" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="1353467374625909708">
              <property name="text" nameId="tpfo.1174482761807" value="$" />
            </node>
            <node role="left" roleId="tpfo.1174485176897" type="tpfo.UnicodeCharacterRegexp" typeId="tpfo.1203415418648" id="1353467374625824278">
              <property name="code" nameId="tpfo.1203415499835" value="0022" />
            </node>
          </node>
          <node role="left" roleId="tpfo.1174485176897" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1353467374626009226">
            <node role="left" roleId="tpfo.1174485176897" type="tpfo.FromNToMTimesRegexp" typeId="tpfo.1174904605806" id="1353467374625213924">
              <property name="n" nameId="tpfo.1174904618869" value="1" />
              <property name="m" nameId="tpfo.1174904621683" value="4" />
              <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1353467374625213925">
                <node role="right" roleId="tpfo.1174485181039" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="1353467374625213926">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554696286" resolveInfo="\D" />
                </node>
                <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="1353467374625213927">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554752025" resolveInfo="\W" />
                </node>
              </node>
            </node>
            <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1353467374626825854">
              <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="1353467374626009229">
                <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.3050481019132403217" resolveInfo="\\" />
              </node>
              <node role="right" roleId="tpfo.1174485181039" type="tpfo.LineEndRegexp" typeId="tpfo.1175161300324" id="1353467374626825859" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="regexp" roleId="tpfo.1174662369010" type="tpfo.RegexpDeclaration" typeId="tpfo.1174483125581" id="3551998361336998501">
      <property name="name" nameId="tpck.1169194664001" value="asas" />
      <node role="regexp" roleId="tpfo.1174483133849" type="tpfo.NTimesRegexp" typeId="tpfo.1174904166999" id="3551998361337647042">
        <property name="n" nameId="tpfo.1174904184877" value="1" />
        <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PositiveSymbolClassRegexp" typeId="tpfo.1174554211468" id="3551998361337647043">
          <node role="part" roleId="tpfo.1174557628217" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="3551998361337647044">
            <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
          </node>
          <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="3551998361337647045">
            <property name="start" nameId="tpfo.1174558315290" value="0" />
            <property name="end" nameId="tpfo.1174558317822" value="9" />
          </node>
          <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntersectionSymbolClassPart" typeId="tpfo.1220021842985" id="3551998361337647046">
            <node role="left" roleId="tpfo.1220356033934" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="3551998361337647047">
              <property name="start" nameId="tpfo.1174558315290" value="a" />
              <property name="end" nameId="tpfo.1174558317822" value="z" />
            </node>
            <node role="right" roleId="tpfo.1220356007276" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="3551998361337647048">
              <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
            </node>
          </node>
          <node role="part" roleId="tpfo.1174557628217" type="tpfo.CharacterSymbolClassPart" typeId="tpfo.1174557878319" id="3551998361337647049">
            <property name="character" nameId="tpfo.1174557887320" value="(" />
          </node>
          <node role="part" roleId="tpfo.1174557628217" type="tpfo.CharacterSymbolClassPart" typeId="tpfo.1174557878319" id="3551998361337647050">
            <property name="character" nameId="tpfo.1174557887320" value=")" />
          </node>
          <node role="part" roleId="tpfo.1174557628217" type="tpfo.CharacterSymbolClassPart" typeId="tpfo.1174557878319" id="3551998361337647051">
            <property name="character" nameId="tpfo.1174557887320" value="[" />
          </node>
          <node role="part" roleId="tpfo.1174557628217" type="tpfo.CharacterSymbolClassPart" typeId="tpfo.1174557878319" id="3551998361337647052">
            <property name="character" nameId="tpfo.1174557887320" value="]" />
          </node>
        </node>
      </node>
    </node>
    <node role="regexp" roleId="tpfo.1174662369010" type="tpfo.RegexpDeclaration" typeId="tpfo.1174483125581" id="8786899561264886888">
      <property name="name" nameId="tpck.1169194664001" value="test2" />
      <node role="regexp" roleId="tpfo.1174483133849" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8786899561264886917">
        <node role="left" roleId="tpfo.1174485176897" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="8786899561264886890">
          <property name="name" nameId="tpck.1169194664001" value="myname" />
          <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8786899561264886904">
            <node role="right" roleId="tpfo.1174485181039" type="tpfo.StarRegexp" typeId="tpfo.1174482808826" id="8786899561264886911">
              <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PositiveSymbolClassRegexp" typeId="tpfo.1174554211468" id="8786899561264886912">
                <node role="part" roleId="tpfo.1174557628217" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="8786899561264886913">
                  <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
                <node role="part" roleId="tpfo.1174557628217" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="8786899561264886914">
                  <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.1174554674770" resolveInfo="\d" />
                </node>
                <node role="part" roleId="tpfo.1174557628217" type="tpfo.CharacterSymbolClassPart" typeId="tpfo.1174557878319" id="8786899561264886916">
                  <property name="character" nameId="tpfo.1174557887320" value="_" />
                </node>
              </node>
            </node>
            <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8786899561264886908">
              <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
            </node>
          </node>
        </node>
        <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8786899561264886921">
          <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8786899561265006298">
            <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8786899561265107276">
              <node role="right" roleId="tpfo.1174485181039" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8786899561266078734">
                <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
              </node>
              <node role="left" roleId="tpfo.1174485176897" type="tpfo.MatchVariableReferenceRegexp" typeId="tpfo.1174909099093" id="8786899561265006302">
                <link role="match" roleId="tpfo.1174909113141" targetNodeId="8786899561264886890" resolveInfo="myname" />
              </node>
            </node>
            <node role="left" roleId="tpfo.1174485176897" type="tpfo.StarRegexp" typeId="tpfo.1174482808826" id="8786899561264886926">
              <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8786899561264886925">
                <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554710194" resolveInfo="\s" />
              </node>
            </node>
          </node>
          <node role="left" roleId="tpfo.1174485176897" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="8786899561264886920">
            <property name="text" nameId="tpfo.1174482761807" value=":" />
          </node>
        </node>
      </node>
    </node>
    <node role="regexp" roleId="tpfo.1174662369010" type="tpfo.RegexpDeclaration" typeId="tpfo.1174483125581" id="4759120547781122944">
      <property name="name" nameId="tpck.1169194664001" value="qq" />
      <node role="regexp" roleId="tpfo.1174483133849" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="4759120547781167972">
        <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="4759120547781167978">
          <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="4759120547781170025">
            <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="4759120547781170084">
              <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="7048923897762185388">
                <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="7048923897762264286">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.PositiveSymbolClassRegexp" typeId="tpfo.1174554211468" id="7048923897762413168">
                    <node role="part" roleId="tpfo.1174557628217" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="7048923897762413169">
                      <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                    </node>
                    <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="7048923897762413170">
                      <property name="start" nameId="tpfo.1174558315290" value="a" />
                      <property name="end" nameId="tpfo.1174558317822" value="z" />
                    </node>
                    <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntersectionSymbolClassPart" typeId="tpfo.1220021842985" id="7048923897762413171">
                      <node role="left" roleId="tpfo.1220356033934" type="tpfo.CharacterSymbolClassPart" typeId="tpfo.1174557878319" id="7048923897762413172">
                        <property name="character" nameId="tpfo.1174557887320" value="a" />
                      </node>
                      <node role="right" roleId="tpfo.1220356007276" type="tpfo.IntersectionSymbolClassPart" typeId="tpfo.1220021842985" id="7048923897762413173">
                        <node role="left" roleId="tpfo.1220356033934" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="7048923897762413174">
                          <property name="start" nameId="tpfo.1174558315290" value="b" />
                          <property name="end" nameId="tpfo.1174558317822" value="c" />
                        </node>
                        <node role="right" roleId="tpfo.1220356007276" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="7048923897762413175">
                          <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.3050481019132403217" resolveInfo="\\" />
                        </node>
                      </node>
                    </node>
                    <node role="part" roleId="tpfo.1174557628217" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="7048923897762413176">
                      <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                    </node>
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.ParensRegexp" typeId="tpfo.1174491169200" id="7048923897762264243">
                    <node role="expr" roleId="tpfo.1174491174779" type="tpfo.LazyStarRegexp" typeId="tpfo.1174660461415" id="7048923897762264215">
                      <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="7048923897762264216">
                        <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                      </node>
                    </node>
                  </node>
                </node>
                <node role="left" roleId="tpfo.1174485176897" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="7048923897762264217">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="7048923897762264227">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.QuestionRegexp" typeId="tpfo.1174552240608" id="7048923897762264235">
                      <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="7048923897762264236">
                        <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                      </node>
                    </node>
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.QuestionRegexp" typeId="tpfo.1174552240608" id="7048923897762264225">
                      <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="7048923897762264226">
                        <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                      </node>
                    </node>
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.FromNToMTimesRegexp" typeId="tpfo.1174904605806" id="4759120547781170092">
                    <property name="m" nameId="tpfo.1174904621683" value="2" />
                    <property name="n" nameId="tpfo.1174904618869" value="1" />
                    <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="4759120547781170097">
                      <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="4759120547781170112">
                        <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="4759120547781170100">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554674770" resolveInfo="\d" />
                        </node>
                        <node role="right" roleId="tpfo.1174485181039" type="tpfo.PositiveSymbolClassRegexp" typeId="tpfo.1174554211468" id="4759120547781170115">
                          <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="4759120547781170117">
                            <property name="start" nameId="tpfo.1174558315290" value="a" />
                            <property name="end" nameId="tpfo.1174558317822" value="z" />
                          </node>
                          <node role="part" roleId="tpfo.1174557628217" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="4759120547781170120">
                            <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.1174554674770" resolveInfo="\d" />
                          </node>
                          <node role="part" roleId="tpfo.1174557628217" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="4759120547781170122">
                            <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.3050481019132403217" resolveInfo="\\" />
                          </node>
                          <node role="part" roleId="tpfo.1174557628217" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="4759120547781170125">
                            <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.1174554710194" resolveInfo="\s" />
                          </node>
                        </node>
                      </node>
                      <node role="left" roleId="tpfo.1174485176897" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="4759120547781295277">
                        <property name="text" nameId="tpfo.1174482761807" value="aaa\u0000" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="left" roleId="tpfo.1174485176897" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="4759120547781170046">
                <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="4759120547781170033">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
              </node>
            </node>
            <node role="left" roleId="tpfo.1174485176897" type="tpfo.PositiveSymbolClassRegexp" typeId="tpfo.1174554211468" id="4759120547781167999">
              <node role="part" roleId="tpfo.1174557628217" type="tpfo.CharacterSymbolClassPart" typeId="tpfo.1174557878319" id="4759120547781168000">
                <property name="character" nameId="tpfo.1174557887320" value="s" />
              </node>
            </node>
          </node>
          <node role="left" roleId="tpfo.1174485176897" type="tpfo.LazyPlusRegexp" typeId="tpfo.1174660505718" id="4759120547781167976">
            <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="4759120547781167975">
              <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
            </node>
          </node>
        </node>
        <node role="left" roleId="tpfo.1174485176897" type="tpfo.LazyStarRegexp" typeId="tpfo.1174660461415" id="4759120547781122985">
          <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.NegativeSymbolClassRegexp" typeId="tpfo.1174554238051" id="4759120547781122986">
            <node role="part" roleId="tpfo.1174557628217" type="tpfo.CharacterSymbolClassPart" typeId="tpfo.1174557878319" id="4759120547781122987">
              <property name="character" nameId="tpfo.1174557887320" value="e" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="regexp" roleId="tpfo.1174662369010" type="tpfo.RegexpDeclaration" typeId="tpfo.1174483125581" id="7048923897762884716">
      <property name="name" nameId="tpck.1169194664001" value="nameInBrackets" />
      <node role="regexp" roleId="tpfo.1174483133849" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="7048923897762884719">
        <node role="right" roleId="tpfo.1174485181039" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="7048923897762884722">
          <property name="text" nameId="tpfo.1174482761807" value="]" />
        </node>
        <node role="left" roleId="tpfo.1174485176897" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="7048923897762884723">
          <node role="right" roleId="tpfo.1174485181039" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="7048923897762884726">
            <property name="name" nameId="tpck.1169194664001" value="nameInBr" />
            <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="7048923897762884729">
              <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="7048923897762884728">
                <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
              </node>
            </node>
          </node>
          <node role="left" roleId="tpfo.1174485176897" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="7048923897762884718">
            <property name="text" nameId="tpfo.1174482761807" value="[" />
          </node>
        </node>
      </node>
    </node>
    <node role="regexp" roleId="tpfo.1174662369010" type="tpfo.RegexpDeclaration" typeId="tpfo.1174483125581" id="902359922144295065">
      <property name="name" nameId="tpck.1169194664001" value="Identifier" />
      <node role="regexp" roleId="tpfo.1174483133849" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="902359922144295067">
        <property name="name" nameId="tpck.1169194664001" value="identifier" />
        <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="902359922144295080">
          <node role="left" roleId="tpfo.1174485176897" type="tpfo.PositiveSymbolClassRegexp" typeId="tpfo.1174554211468" id="902359922144295070">
            <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="902359922144295072">
              <property name="start" nameId="tpfo.1174558315290" value="a" />
              <property name="end" nameId="tpfo.1174558317822" value="z" />
            </node>
            <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="902359922144295075">
              <property name="start" nameId="tpfo.1174558315290" value="A" />
              <property name="end" nameId="tpfo.1174558317822" value="Z" />
            </node>
            <node role="part" roleId="tpfo.1174557628217" type="tpfo.CharacterSymbolClassPart" typeId="tpfo.1174557878319" id="902359922144295079">
              <property name="character" nameId="tpfo.1174557887320" value="_" />
            </node>
          </node>
          <node role="right" roleId="tpfo.1174485181039" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="902359922144295094">
            <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PositiveSymbolClassRegexp" typeId="tpfo.1174554211468" id="902359922144295083">
              <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="902359922144295085">
                <property name="start" nameId="tpfo.1174558315290" value="a" />
                <property name="end" nameId="tpfo.1174558317822" value="z" />
              </node>
              <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="902359922144295088">
                <property name="start" nameId="tpfo.1174558315290" value="A" />
                <property name="end" nameId="tpfo.1174558317822" value="Z" />
              </node>
              <node role="part" roleId="tpfo.1174557628217" type="tpfo.CharacterSymbolClassPart" typeId="tpfo.1174557878319" id="902359922144295090">
                <property name="character" nameId="tpfo.1174557887320" value="_" />
              </node>
              <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="902359922144295093">
                <property name="start" nameId="tpfo.1174558315290" value="0" />
                <property name="end" nameId="tpfo.1174558317822" value="9" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="regexp" roleId="tpfo.1174662369010" type="tpfo.RegexpDeclaration" typeId="tpfo.1174483125581" id="902359922144295098">
      <property name="name" nameId="tpck.1169194664001" value="ArrayType" />
      <node role="regexp" roleId="tpfo.1174483133849" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="902359922144295101">
        <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="902359922144295105">
          <node role="right" roleId="tpfo.1174485181039" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="902359922144295108">
            <property name="text" nameId="tpfo.1174482761807" value="]" />
          </node>
          <node role="left" roleId="tpfo.1174485176897" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="902359922144295109">
            <node role="right" roleId="tpfo.1174485181039" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="902359922144295112">
              <property name="name" nameId="tpck.1169194664001" value="number" />
              <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="902359922144295115">
                <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="902359922144295114">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554674770" resolveInfo="\d" />
                </node>
              </node>
            </node>
            <node role="left" roleId="tpfo.1174485176897" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="902359922144295104">
              <property name="text" nameId="tpfo.1174482761807" value="[" />
            </node>
          </node>
        </node>
        <node role="left" roleId="tpfo.1174485176897" type="tpfo.RegexpDeclarationReferenceRegexp" typeId="tpfo.1174662605354" id="902359922144295100">
          <link role="regexp" roleId="tpfo.1174662628918" targetNodeId="902359922144295065" resolveInfo="Identifier" />
        </node>
      </node>
    </node>
    <node role="regexp" roleId="tpfo.1174662369010" type="tpfo.RegexpDeclaration" typeId="tpfo.1174483125581" id="902359922144295096">
      <property name="name" nameId="tpck.1169194664001" value="VarDeclaration" />
      <node role="regexp" roleId="tpfo.1174483133849" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="902359922144295119">
        <node role="right" roleId="tpfo.1174485181039" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="902359922144295122">
          <property name="name" nameId="tpck.1169194664001" value="name" />
          <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="902359922144295125">
            <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="902359922144295124">
              <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
            </node>
          </node>
        </node>
        <node role="left" roleId="tpfo.1174485176897" type="tpfo.RegexpDeclarationReferenceRegexp" typeId="tpfo.1174662605354" id="902359922144295118">
          <link role="regexp" roleId="tpfo.1174662628918" targetNodeId="902359922144295098" resolveInfo="ArrayType" />
        </node>
      </node>
    </node>
  </root>
  <root id="1353467374625228509">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1353467374625228510" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="1353467374625228511">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1353467374625228512" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1353467374625228513" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1353467374625228514" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="1353467374625228515">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1353467374625228516">
        <property name="methodName" nameId="tpe3.1171931690128" value="escapeInLiteral" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1353467374625228517" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1353467374625228518" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1353467374625228519">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1353467374625228614">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1353467374625228615">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1353467374625228616">
                <property name="value" nameId="tpee.1070475926801" value="[asdsa]" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.MatchRegexpOperation" typeId="tpfo.1222260469397" id="1353467374625228617">
                <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="1353467374625228618">
                  <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.RegexpDeclarationReferenceRegexp" typeId="tpfo.1174662605354" id="1353467374625228619">
                    <link role="regexp" roleId="tpfo.1174662628918" targetNodeId="5533535376639120949" resolveInfo="esc_Brackets" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1353467374625327703">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1353467374625327704">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1353467374625327705">
                <property name="value" nameId="tpee.1070475926801" value="(asdsa)" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.MatchRegexpOperation" typeId="tpfo.1222260469397" id="1353467374625327706">
                <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="1353467374625327707">
                  <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.RegexpDeclarationReferenceRegexp" typeId="tpfo.1174662605354" id="1353467374625327708">
                    <link role="regexp" roleId="tpfo.1174662628918" targetNodeId="5533535376639120949" resolveInfo="esc_Brackets" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="1353467374625327710">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1353467374625327711">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1353467374625327712">
                <property name="value" nameId="tpee.1070475926801" value="{qq}" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.MatchRegexpOperation" typeId="tpfo.1222260469397" id="1353467374625327713">
                <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="1353467374625327714">
                  <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.RegexpDeclarationReferenceRegexp" typeId="tpfo.1174662605354" id="1353467374625327715">
                    <link role="regexp" roleId="tpfo.1174662628918" targetNodeId="5533535376639120949" resolveInfo="esc_Brackets" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="1353467374625412825">
            <node role="condition" roleId="tpe3.1171983854940" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1353467374625412827">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1353467374625412828">
                <property name="value" nameId="tpee.1070475926801" value="s{qq}" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.MatchRegexpOperation" typeId="tpfo.1222260469397" id="1353467374625412829">
                <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="1353467374625412830">
                  <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.RegexpDeclarationReferenceRegexp" typeId="tpfo.1174662605354" id="1353467374625412831">
                    <link role="regexp" roleId="tpfo.1174662628918" targetNodeId="5533535376639120949" resolveInfo="esc_Brackets" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8330008649153446819">
        <property name="methodName" nameId="tpe3.1171931690128" value="testPredefined" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8330008649153446820" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8330008649153446821" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8330008649153446822">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8330008649153446829">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8330008649153446830">
              <property name="name" nameId="tpck.1169194664001" value="p" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8330008649153446831">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lgzw.~Pattern" resolveInfo="Pattern" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="8330008649153446832">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153447615">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153447619">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153447623">
                      <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153448116">
                        <node role="right" roleId="tpfo.1174485181039" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8330008649153448119">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1202318346829" resolveInfo="\b" />
                        </node>
                        <node role="left" roleId="tpfo.1174485176897" type="tpfo.PositiveSymbolClassRegexp" typeId="tpfo.1174554211468" id="8330008649153447626">
                          <node role="part" roleId="tpfo.1174557628217" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="8330008649153448115">
                            <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                          </node>
                          <node role="part" roleId="tpfo.1174557628217" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="8330008649153447797">
                            <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.1174554696286" resolveInfo="\D" />
                          </node>
                        </node>
                      </node>
                      <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8330008649153447622">
                        <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554752025" resolveInfo="\W" />
                      </node>
                    </node>
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8330008649153447618">
                      <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.3050481019132403217" resolveInfo="\\" />
                    </node>
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8330008649153446833">
                    <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554710194" resolveInfo="\s" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8330008649153446835">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153446838">
              <property name="value" nameId="tpee.1070475926801" value="\\s\\\\\\W[\\w\\D]\\b" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153446839">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153446840">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153446830" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153446841">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dpattern()%cjava%dlang%dString" resolveInfo="pattern" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8330008649153753492">
        <property name="methodName" nameId="tpe3.1171931690128" value="range1" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8330008649153753493" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8330008649153753494" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8330008649153753495">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8330008649153753497">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8330008649153753498">
              <property name="name" nameId="tpck.1169194664001" value="p" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8330008649153753499">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lgzw.~Pattern" resolveInfo="Pattern" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="8330008649153753500">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.PositiveSymbolClassRegexp" typeId="tpfo.1174554211468" id="8330008649153753518">
                  <node role="part" roleId="tpfo.1174557628217" type="tpfo.CharacterSymbolClassPart" typeId="tpfo.1174557878319" id="8330008649153753519">
                    <property name="character" nameId="tpfo.1174557887320" value="a" />
                  </node>
                  <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="8330008649153753521">
                    <property name="start" nameId="tpfo.1174558315290" value="c" />
                    <property name="end" nameId="tpfo.1174558317822" value="f" />
                  </node>
                  <node role="part" roleId="tpfo.1174557628217" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="8173814113624937010">
                    <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.1174554674770" resolveInfo="\d" />
                  </node>
                  <node role="part" roleId="tpfo.1174557628217" type="tpfo.CharacterSymbolClassPart" typeId="tpfo.1174557878319" id="8173814113624942577">
                    <property name="character" nameId="tpfo.1174557887320" value="-" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8330008649153753512">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153753513">
              <property name="value" nameId="tpee.1070475926801" value="[ac-f\\d\\-]" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153753514">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153753515">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153753498" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153753516">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dpattern()%cjava%dlang%dString" resolveInfo="pattern" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8173814113625132292">
        <property name="methodName" nameId="tpe3.1171931690128" value="rangeIntersection" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8173814113625132293" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8173814113625132294" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8173814113625132295">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8173814113625132297">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8173814113625132298">
              <property name="name" nameId="tpck.1169194664001" value="p" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8173814113625132299">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lgzw.~Pattern" resolveInfo="Pattern" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="8173814113625132300">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.PositiveSymbolClassRegexp" typeId="tpfo.1174554211468" id="8173814113625132301">
                  <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="8173814113625141355">
                    <property name="start" nameId="tpfo.1174558315290" value="1" />
                    <property name="end" nameId="tpfo.1174558317822" value="9" />
                  </node>
                  <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntersectionSymbolClassPart" typeId="tpfo.1220021842985" id="8173814113625141348">
                    <node role="left" roleId="tpfo.1220356033934" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="8173814113625141349">
                      <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                    </node>
                    <node role="right" roleId="tpfo.1220356007276" type="tpfo.NegativeSymbolClassRegexp" typeId="tpfo.1174554238051" id="8173814113625141350">
                      <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="8173814113625141353">
                        <property name="start" nameId="tpfo.1174558315290" value="d" />
                        <property name="end" nameId="tpfo.1174558317822" value="f" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8173814113625132306">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8173814113625132307">
              <property name="value" nameId="tpee.1070475926801" value="[1-9\\w&amp;&amp;[^d-f]]" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8173814113625132308">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8173814113625132309">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8173814113625132298" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8173814113625132310">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dpattern()%cjava%dlang%dString" resolveInfo="pattern" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="8173814113625245868">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8173814113625245877">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8173814113625245871">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8173814113625245870">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8173814113625132298" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8173814113625245875">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8173814113625245876">
                    <property name="value" nameId="tpee.1070475926801" value="1" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8173814113625245881">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="8173814113625245883">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8173814113625245884">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8173814113625245885">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8173814113625245886">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8173814113625132298" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8173814113625245887">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8173814113625245888">
                    <property name="value" nameId="tpee.1070475926801" value="a" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8173814113625245889">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="8173814113625245891">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8173814113625245892">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8173814113625245893">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8173814113625245894">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8173814113625132298" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8173814113625245895">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8173814113625245896">
                    <property name="value" nameId="tpee.1070475926801" value="g" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8173814113625245897">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="8173814113625245899">
            <node role="condition" roleId="tpe3.1171983854940" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8173814113625245908">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8173814113625245909">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8173814113625245910">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8173814113625132298" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8173814113625245911">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8173814113625245912">
                    <property name="value" nameId="tpee.1070475926801" value="f" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8173814113625245913">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8173814113625141357">
        <property name="methodName" nameId="tpe3.1171931690128" value="rangeIntersectionSimple" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8173814113625141358" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8173814113625141359" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8173814113625141360">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8173814113625141361">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8173814113625141362">
              <property name="name" nameId="tpck.1169194664001" value="p" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8173814113625141363">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lgzw.~Pattern" resolveInfo="Pattern" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="8173814113625141364">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.PositiveSymbolClassRegexp" typeId="tpfo.1174554211468" id="8173814113625141365">
                  <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntersectionSymbolClassPart" typeId="tpfo.1220021842985" id="8173814113625141367">
                    <node role="left" roleId="tpfo.1220356033934" type="tpfo.PredefinedSymbolClassSymbolClassPart" typeId="tpfo.1174558792178" id="8173814113625141368">
                      <link role="declaration" roleId="tpfo.1174558819022" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                    </node>
                    <node role="right" roleId="tpfo.1220356007276" type="tpfo.NegativeSymbolClassRegexp" typeId="tpfo.1174554238051" id="8173814113625141369">
                      <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="8173814113625141370">
                        <property name="start" nameId="tpfo.1174558315290" value="d" />
                        <property name="end" nameId="tpfo.1174558317822" value="f" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8173814113625141371">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8173814113625141372">
              <property name="value" nameId="tpee.1070475926801" value="[\\w&amp;&amp;[^d-f]]" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8173814113625141373">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8173814113625141374">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8173814113625141362" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8173814113625141375">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dpattern()%cjava%dlang%dString" resolveInfo="pattern" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8330008649153447596">
        <property name="methodName" nameId="tpe3.1171931690128" value="testStringLiteral" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8330008649153447597" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8330008649153447598" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8330008649153447599">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8330008649153447600">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8330008649153447601">
              <property name="name" nameId="tpck.1169194664001" value="p" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8330008649153447602">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lgzw.~Pattern" resolveInfo="Pattern" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="8330008649153447603">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153447604">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153447605">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="8330008649153447606">
                      <property name="text" nameId="tpfo.1174482761807" value="\&quot;" />
                    </node>
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="8330008649153447607">
                      <property name="text" nameId="tpfo.1174482761807" value="&quot;" />
                    </node>
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="8330008649153447634">
                    <property name="text" nameId="tpfo.1174482761807" value="'\'" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8330008649153447609">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153447610">
              <property name="value" nameId="tpee.1070475926801" value="'\\'\&quot;\\\&quot;" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153447611">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153447612">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153447601" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153447613">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dpattern()%cjava%dlang%dString" resolveInfo="pattern" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="8330008649153448279">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153448287">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153448282">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153448281">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153447601" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153448286">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153448292">
                    <property name="value" nameId="tpee.1070475926801" value="''\&quot;\&quot;" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153448291">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8330008649153549856">
        <property name="methodName" nameId="tpe3.1171931690128" value="testBackref" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8330008649153549857" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8330008649153549858" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8330008649153549859">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8330008649153549860">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8330008649153549861">
              <property name="name" nameId="tpck.1169194664001" value="p" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8330008649153549862">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lgzw.~Pattern" resolveInfo="Pattern" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="8330008649153549863">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153549870">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.LineEndRegexp" typeId="tpfo.1175161300324" id="8330008649153549873" />
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153549877">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153549882">
                      <node role="right" roleId="tpfo.1174485181039" type="tpfo.MatchVariableReferenceRegexp" typeId="tpfo.1174909099093" id="8330008649153549885">
                        <link role="match" roleId="tpfo.1174909113141" targetNodeId="8330008649153549880" resolveInfo="ioo" />
                      </node>
                      <node role="left" roleId="tpfo.1174485176897" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="8330008649153549880">
                        <property name="name" nameId="tpck.1169194664001" value="ioo" />
                        <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="8330008649153549887">
                          <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8330008649153549886">
                            <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                          </node>
                        </node>
                      </node>
                    </node>
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.LineStartRegexp" typeId="tpfo.1175161264766" id="8330008649153549869" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8330008649153549890">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153549891">
              <property name="value" nameId="tpee.1070475926801" value="^(\\w+)\\1$" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153549892">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153549893">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153549861" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153549894">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dpattern()%cjava%dlang%dString" resolveInfo="pattern" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="8330008649153549901">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153549902">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153549903">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153549904">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153549861" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153549905">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153549906">
                    <property name="value" nameId="tpee.1070475926801" value="kbbbwkbbbw" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153549907">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="8330008649153549917">
            <node role="condition" roleId="tpe3.1171983854940" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153549919">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153549920">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153549921">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153549861" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153549922">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153549923">
                    <property name="value" nameId="tpee.1070475926801" value="kbbbwkbbw" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153549924">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8330008649153751541">
        <property name="methodName" nameId="tpe3.1171931690128" value="testAutoBrackets" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8330008649153751542" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8330008649153751543" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8330008649153751544">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8330008649153751545">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8330008649153751546">
              <property name="name" nameId="tpck.1169194664001" value="p" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8330008649153751547">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lgzw.~Pattern" resolveInfo="Pattern" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="8330008649153751549">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153751552">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153751581">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.LineEndRegexp" typeId="tpfo.1175161300324" id="8330008649153751584" />
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="8330008649153751561">
                      <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153751564">
                        <node role="right" roleId="tpfo.1174485181039" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8330008649153751567">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                        </node>
                        <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8330008649153751563">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.LineStartRegexp" typeId="tpfo.1175161264766" id="8330008649153751551" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8330008649153751586">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153751587">
              <property name="value" nameId="tpee.1070475926801" value="^(?:\\w\\w)+$" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153751588">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153751589">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153751546" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153751590">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dpattern()%cjava%dlang%dString" resolveInfo="pattern" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="8330008649153751591">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153751592">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153751593">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153751594">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153751546" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153751595">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153751596">
                    <property name="value" nameId="tpee.1070475926801" value="bwbb" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153751597">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="8330008649153751599">
            <node role="condition" roleId="tpe3.1171983854940" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153751608">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153751602">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153751601">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153751546" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153751606">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153751607">
                    <property name="value" nameId="tpee.1070475926801" value="bbb" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153751612">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8330008649153752705">
        <property name="methodName" nameId="tpe3.1171931690128" value="testAutoBrackets24" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8330008649153752706" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8330008649153752707" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8330008649153752708">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8330008649153752709">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8330008649153752710">
              <property name="name" nameId="tpck.1169194664001" value="p" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8330008649153752711">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lgzw.~Pattern" resolveInfo="Pattern" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="8330008649153752712">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153752713">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153752714">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.LineEndRegexp" typeId="tpfo.1175161300324" id="8330008649153752715" />
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.FromNToMTimesRegexp" typeId="tpfo.1174904605806" id="8330008649153752740">
                      <property name="n" nameId="tpfo.1174904618869" value="2" />
                      <property name="m" nameId="tpfo.1174904621683" value="4" />
                      <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153752741">
                        <node role="right" roleId="tpfo.1174485181039" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8330008649153752742">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                        </node>
                        <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8330008649153752743">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.LineStartRegexp" typeId="tpfo.1175161264766" id="8330008649153752720" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8330008649153752721">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153752722">
              <property name="value" nameId="tpee.1070475926801" value="^(?:\\w\\w){2,4}$" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153752723">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153752724">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153752710" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153752725">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dpattern()%cjava%dlang%dString" resolveInfo="pattern" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="8330008649153752726">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153752727">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153752728">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153752729">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153752710" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153752730">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153752731">
                    <property name="value" nameId="tpee.1070475926801" value="bwbbbb" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153752732">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="8330008649153752733">
            <node role="condition" roleId="tpe3.1171983854940" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153752734">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153752735">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153752736">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153752710" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153752737">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153752738">
                    <property name="value" nameId="tpee.1070475926801" value="bbaabbaacc" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153752739">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8330008649153753025">
        <property name="methodName" nameId="tpe3.1171931690128" value="testAutoBrackets2ormore" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8330008649153753026" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8330008649153753027" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8330008649153753028">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8330008649153753029">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8330008649153753030">
              <property name="name" nameId="tpck.1169194664001" value="p" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8330008649153753031">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lgzw.~Pattern" resolveInfo="Pattern" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="8330008649153753032">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153753033">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153753034">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.LineEndRegexp" typeId="tpfo.1175161300324" id="8330008649153753035" />
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.AtLeastNTimesRegexp" typeId="tpfo.1174904442594" id="8330008649153753060">
                      <property name="n" nameId="tpfo.1174904477749" value="2" />
                      <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153753062">
                        <node role="right" roleId="tpfo.1174485181039" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8330008649153753063">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                        </node>
                        <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8330008649153753064">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.LineStartRegexp" typeId="tpfo.1175161264766" id="8330008649153753040" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8330008649153753041">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153753042">
              <property name="value" nameId="tpee.1070475926801" value="^(?:\\w\\w){2,}$" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153753043">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153753044">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153753030" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153753045">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dpattern()%cjava%dlang%dString" resolveInfo="pattern" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="8330008649153753046">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153753047">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153753048">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153753049">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153753030" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153753050">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153753051">
                    <property name="value" nameId="tpee.1070475926801" value="bwbb" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153753052">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="8330008649153753053">
            <node role="condition" roleId="tpe3.1171983854940" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153753054">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153753055">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153753056">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153753030" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153753057">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153753058">
                    <property name="value" nameId="tpee.1070475926801" value="bb" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153753059">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8330008649153753101">
        <property name="methodName" nameId="tpe3.1171931690128" value="testAutoBrackets2exactly" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8330008649153753102" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8330008649153753103" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8330008649153753104">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="8330008649153753105">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="8330008649153753106">
              <property name="name" nameId="tpck.1169194664001" value="p" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="8330008649153753107">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="lgzw.~Pattern" resolveInfo="Pattern" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="8330008649153753108">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153753109">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153753110">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.LineEndRegexp" typeId="tpfo.1175161300324" id="8330008649153753111" />
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.NTimesRegexp" typeId="tpfo.1174904166999" id="8330008649153753137">
                      <property name="n" nameId="tpfo.1174904184877" value="2" />
                      <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8330008649153753139">
                        <node role="right" roleId="tpfo.1174485181039" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8330008649153753140">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                        </node>
                        <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8330008649153753141">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.LineStartRegexp" typeId="tpfo.1175161264766" id="8330008649153753116" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8330008649153753117">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153753118">
              <property name="value" nameId="tpee.1070475926801" value="^(?:\\w\\w){2}$" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153753119">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153753120">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153753106" resolveInfo="p" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153753121">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dpattern()%cjava%dlang%dString" resolveInfo="pattern" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="8330008649153753122">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153753123">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153753124">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153753125">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153753106" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153753126">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153753127">
                    <property name="value" nameId="tpee.1070475926801" value="bwbb" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153753128">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="8330008649153753129">
            <node role="condition" roleId="tpe3.1171983854940" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153753130">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8330008649153753131">
                <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="8330008649153753132">
                  <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="8330008649153753106" resolveInfo="p" />
                </node>
                <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153753133">
                  <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Pattern%dmatcher(java%dlang%dCharSequence)%cjava%dutil%dregex%dMatcher" resolveInfo="matcher" />
                  <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8330008649153753134">
                    <property name="value" nameId="tpee.1070475926801" value="bb" />
                  </node>
                </node>
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="8330008649153753135">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="lgzw.~Matcher%dmatches()%cboolean" resolveInfo="matches" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6129327962763155569">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6129327962763155570" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6129327962763155571">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6129327962763155572" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6129327962763155573" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6129327962763155574" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="6129327962763155575">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6129327962763155576">
        <property name="methodName" nameId="tpe3.1171931690128" value="replace1" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6129327962763155577" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6129327962763155578" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6129327962763155579">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6129327962763155612">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6129327962763155615">
              <property name="name" nameId="tpck.1169194664001" value="s" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="6129327962763155617" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpfo.ReplaceWithRegexpExpression" typeId="tpfo.1174655989549" id="6129327962763155581">
                <node role="expr" roleId="tpfo.1174656103019" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6129327962763155597">
                  <property name="value" nameId="tpee.1070475926801" value="Manny goes home" />
                </node>
                <node role="replaceBlock" roleId="tpfo.1174656339468" type="tpfo.ReplaceBlock" typeId="tpfo.1174656254036" id="6129327962763155583">
                  <node role="body" roleId="tpee.1137022507850" type="tpee.StatementList" typeId="tpee.1068580123136" id="6129327962763155584">
                    <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="6129327962763155602">
                      <node role="expression" roleId="tpee.1068580123156" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6129327962763155608">
                        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.PlusExpression" typeId="tpee.1068581242875" id="6129327962763155604">
                          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6129327962763155603">
                            <property name="value" nameId="tpee.1070475926801" value="&lt;" />
                          </node>
                          <node role="rightExpression" roleId="tpee.1081773367579" type="tpfo.MatchVariableReference" typeId="tpfo.1174565027678" id="6129327962763155607">
                            <link role="match" roleId="tpfo.1174565035929" targetNodeId="6129327962763155599" resolveInfo="aa" />
                          </node>
                        </node>
                        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6129327962763155611">
                          <property name="value" nameId="tpee.1070475926801" value="&gt;" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
                <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="6129327962763155586">
                  <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="6129327962763155599">
                    <property name="name" nameId="tpck.1169194664001" value="aa" />
                    <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="6129327962763155600">
                      <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="6129327962763155601">
                        <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6129327962763155619">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6129327962763155622">
              <property name="value" nameId="tpee.1070475926801" value="&lt;Manny&gt; &lt;goes&gt; &lt;home&gt;" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6129327962763155623">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6129327962763155615" resolveInfo="s" />
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="6129327962764348634">
    <node role="method" roleId="tpee.1107880067339" type="tpee.InstanceMethodDeclaration" typeId="tpee.1068580123165" id="2588298302278368432">
      <property name="name" nameId="tpck.1169194664001" value="check" />
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="2588298302278368433" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="2588298302278368434" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="2588298302278368435">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2588298302278368442">
          <node role="condition" roleId="tpee.1068580123160" type="tpfo.FindMatchExpression" typeId="tpfo.6129327962763158517" id="2588298302278368443">
            <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="2588298302278368444">
              <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="2588298302278368472">
                <node role="left" roleId="tpfo.1174485176897" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="2588298302278368476">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.StarRegexp" typeId="tpfo.1174482808826" id="2588298302278368481">
                    <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="2588298302278368480">
                      <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554710194" resolveInfo="\s" />
                    </node>
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="2588298302278368475">
                    <property name="text" nameId="tpfo.1174482761807" value="!" />
                  </node>
                </node>
                <node role="right" roleId="tpfo.1174485181039" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="2588298302278368445">
                  <property name="name" nameId="tpck.1169194664001" value="mname" />
                  <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="2588298302278368446">
                    <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="2588298302278368447">
                      <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
            <node role="inputExpression" roleId="tpfo.6129327962763255289" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2588298302278368471">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2588298302278368436" resolveInfo="searchin" />
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2588298302278368449">
            <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="2588298302278368450">
              <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2588298302278368451">
                <property name="value" nameId="tpee.1070475926801" value="xyz" />
              </node>
              <node role="actual" roleId="tpe3.8427750732757990725" type="tpfo.MatchVariableReference" typeId="tpfo.1174565027678" id="2588298302278368452">
                <link role="match" roleId="tpfo.1174565035929" targetNodeId="2588298302278368445" resolveInfo="mname" />
              </node>
            </node>
          </node>
          <node role="elsifClauses" roleId="tpee.1206060520071" type="tpee.ElsifClause" typeId="tpee.1206060495898" id="2588298302278368453">
            <node role="condition" roleId="tpee.1206060619838" type="tpfo.FindMatchExpression" typeId="tpfo.6129327962763158517" id="2588298302278368454">
              <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="2588298302278368455">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="2588298302278368456">
                  <property name="name" nameId="tpck.1169194664001" value="rrt" />
                  <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="2588298302278368457">
                    <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PositiveSymbolClassRegexp" typeId="tpfo.1174554211468" id="2588298302278368458">
                      <node role="part" roleId="tpfo.1174557628217" type="tpfo.IntervalSymbolClassPart" typeId="tpfo.1174558301835" id="2588298302278368459">
                        <property name="start" nameId="tpfo.1174558315290" value="a" />
                        <property name="end" nameId="tpfo.1174558317822" value="f" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="inputExpression" roleId="tpfo.6129327962763255289" type="tpee.ParameterReference" typeId="tpee.1068581242874" id="2588298302278369372">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="2588298302278368436" resolveInfo="searchin" />
              </node>
            </node>
            <node role="statementList" roleId="tpee.1206060644605" type="tpee.StatementList" typeId="tpee.1068580123136" id="2588298302278368461">
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="2588298302278368462">
                <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2588298302278368463">
                  <property name="value" nameId="tpee.1070475926801" value="aaad" />
                </node>
                <node role="actual" roleId="tpe3.8427750732757990725" type="tpfo.MatchVariableReference" typeId="tpfo.1174565027678" id="2588298302278368464">
                  <link role="match" roleId="tpfo.1174565035929" targetNodeId="2588298302278368456" resolveInfo="rrt" />
                </node>
              </node>
            </node>
          </node>
          <node role="ifFalseStatement" roleId="tpee.1082485599094" type="tpee.BlockStatement" typeId="tpee.1082485599095" id="2588298302278368492">
            <node role="statements" roleId="tpee.1082485599096" type="tpee.StatementList" typeId="tpee.1068580123136" id="2588298302278368493">
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.Fail" typeId="tpe3.1172017222794" id="2588298302278368494">
                <node role="message" roleId="tpe3.1172075534298" type="tpe3.Message" typeId="tpe3.1172073500303" id="2588298302278368495">
                  <node role="message" roleId="tpe3.1172073511101" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2588298302278368496">
                    <property name="value" nameId="tpee.1070475926801" value="no match" />
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="parameter" roleId="tpee.1068580123134" type="tpee.ParameterDeclaration" typeId="tpee.1068498886292" id="2588298302278368436">
        <property name="name" nameId="tpck.1169194664001" value="searchin" />
        <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="2588298302278368437" />
      </node>
    </node>
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6129327962764348635" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="6129327962764348636">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6129327962764348637" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6129327962764348638" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6129327962764348639" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="6129327962764348640">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6129327962764348641">
        <property name="methodName" nameId="tpe3.1171931690128" value="find" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6129327962764348642" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6129327962764348643" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6129327962764348644">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="6129327962764368469">
            <node role="condition" roleId="tpe3.1171981057159" type="tpfo.FindMatchExpression" typeId="tpfo.6129327962763158517" id="6129327962764368475">
              <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="6129327962764368478">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.AtLeastNTimesRegexp" typeId="tpfo.1174904442594" id="6129327962764368491">
                  <property name="n" nameId="tpfo.1174904477749" value="3" />
                  <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="6129327962764368492">
                    <property name="text" nameId="tpfo.1174482761807" value="c" />
                  </node>
                </node>
              </node>
              <node role="inputExpression" roleId="tpfo.6129327962763255289" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6129327962764368471">
                <property name="value" nameId="tpee.1070475926801" value="acccasdawe" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="6129327962764368494">
            <node role="condition" roleId="tpe3.1171983854940" type="tpfo.FindMatchExpression" typeId="tpfo.6129327962763158517" id="6129327962764368496">
              <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="6129327962764368497">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.AtLeastNTimesRegexp" typeId="tpfo.1174904442594" id="6129327962764368498">
                  <property name="n" nameId="tpfo.1174904477749" value="3" />
                  <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="6129327962764368499">
                    <property name="text" nameId="tpfo.1174482761807" value="c" />
                  </node>
                </node>
              </node>
              <node role="inputExpression" roleId="tpfo.6129327962763255289" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6129327962764368500">
                <property name="value" nameId="tpee.1070475926801" value="accasdawe" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6129327962764576436">
        <property name="methodName" nameId="tpe3.1171931690128" value="match" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6129327962764576437" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6129327962764576438" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6129327962764576439">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="6129327962764576440">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4452696118160649093">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4452696118160578750">
                <property name="value" nameId="tpee.1070475926801" value="ww" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.MatchRegexpOperation" typeId="tpfo.1222260469397" id="4452696118160649097">
                <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="4452696118160649098">
                  <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="4452696118160649101">
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="4452696118160649100">
                      <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                    </node>
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="4452696118160649104">
                      <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertFalse" typeId="tpe3.1171983834376" id="6129327962764679037">
            <node role="condition" roleId="tpe3.1171983854940" type="tpfo.MatchRegexpExpression" typeId="tpfo.1179357154354" id="6129327962764679039">
              <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="6129327962764679040">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="4452696118160649109">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.MatchVariableReferenceRegexp" typeId="tpfo.1174909099093" id="4452696118160649112">
                    <link role="match" roleId="tpfo.1174909113141" targetNodeId="4452696118160649105" resolveInfo="chars" />
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="4452696118160649105">
                    <property name="name" nameId="tpck.1169194664001" value="chars" />
                    <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="4452696118160649106">
                      <node role="left" roleId="tpfo.1174485176897" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="4452696118160649107">
                        <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                      </node>
                      <node role="right" roleId="tpfo.1174485181039" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="4452696118160649108">
                        <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
              <node role="inputExpression" roleId="tpfo.1179357286898" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6129327962764679045">
                <property name="value" nameId="tpee.1070475926801" value="www" />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="6129327962764679735">
        <property name="methodName" nameId="tpe3.1171931690128" value="split" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="6129327962764679736" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="6129327962764679737" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="6129327962764679738">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="6129327962764679769">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="6129327962764679770">
              <property name="name" nameId="tpck.1169194664001" value="list" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.ClassifierType" typeId="tpee.1107535904670" id="6129327962764679771">
                <link role="classifier" roleId="tpee.1107535924139" targetNodeId="k7g3.~List" resolveInfo="List" />
                <node role="parameter" roleId="tpee.1109201940907" type="tpee.StringType" typeId="tpee.1225271177708" id="6129327962764679775" />
              </node>
              <node role="initializer" roleId="tpee.1068431790190" type="tpfo.SplitExpression" typeId="tpfo.1175164405556" id="6129327962764679777">
                <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="6129327962764679778">
                  <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="6129327962764679779">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.StarRegexp" typeId="tpfo.1174482808826" id="6129327962764679780">
                      <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="6129327962764679781">
                        <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554710194" resolveInfo="\s" />
                      </node>
                    </node>
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="6129327962764679782">
                      <property name="text" nameId="tpfo.1174482761807" value="," />
                    </node>
                  </node>
                </node>
                <node role="expr" roleId="tpfo.1175164443297" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6129327962764679783">
                  <property name="value" nameId="tpee.1070475926801" value="abc, def, xxyyy" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6129327962764679785">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6129327962764679789">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6129327962764679788">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6129327962764679770" resolveInfo="list" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6129327962764679793">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dsize()%cint" resolveInfo="size" />
              </node>
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6129327962764679794">
              <property name="value" nameId="tpee.1068580320021" value="3" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6129327962764679796">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6129327962764679799">
              <property name="value" nameId="tpee.1070475926801" value="abc" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6129327962764679801">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6129327962764679800">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6129327962764679770" resolveInfo="list" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6129327962764679805">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dget(int)%cjava%dlang%dObject" resolveInfo="get" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6129327962764679806">
                  <property name="value" nameId="tpee.1068580320021" value="0" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6129327962764679809">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6129327962764679810">
              <property name="value" nameId="tpee.1070475926801" value="def" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6129327962764679811">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6129327962764679812">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6129327962764679770" resolveInfo="list" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6129327962764679813">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dget(int)%cjava%dlang%dObject" resolveInfo="get" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6129327962764679816">
                  <property name="value" nameId="tpee.1068580320021" value="1" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="6129327962764679819">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="6129327962764679820">
              <property name="value" nameId="tpee.1070475926801" value="xxyyy" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="6129327962764679821">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="6129327962764679822">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="6129327962764679770" resolveInfo="list" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="6129327962764679823">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="k7g3.~List%dget(int)%cjava%dlang%dObject" resolveInfo="get" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="6129327962764679826">
                  <property name="value" nameId="tpee.1068580320021" value="2" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="7048923897762884731">
        <property name="methodName" nameId="tpe3.1171931690128" value="refFromRegexps" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="7048923897762884732" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="7048923897762884733" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="7048923897762884734">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="7048923897762907461">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="7048923897762907462">
              <property name="name" nameId="tpck.1169194664001" value="executed" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.BooleanType" typeId="tpee.1070534644030" id="7048923897762913397" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="7048923897762907465">
                <property name="value" nameId="tpee.1068580123138" value="false" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpfo.FindMatchStatement" typeId="tpfo.1175169009571" id="7048923897762884735">
            <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="7048923897762884736">
              <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="7048923897762937787">
                <node role="left" roleId="tpfo.1174485176897" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="7048923897762937790">
                  <property name="name" nameId="tpck.1169194664001" value="aq1" />
                  <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.StarRegexp" typeId="tpfo.1174482808826" id="7048923897762942662">
                    <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="7048923897762942661">
                      <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554710194" resolveInfo="\s" />
                    </node>
                  </node>
                </node>
                <node role="right" roleId="tpfo.1174485181039" type="tpfo.RegexpDeclarationReferenceRegexp" typeId="tpfo.1174662605354" id="7048923897762884741">
                  <link role="regexp" roleId="tpfo.1174662628918" targetNodeId="7048923897762884716" resolveInfo="nameInBrackets" />
                </node>
              </node>
            </node>
            <node role="expr" roleId="tpfo.1175169023932" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7048923897762884740">
              <property name="value" nameId="tpee.1070475926801" value="asdasd [ww]" />
            </node>
            <node role="body" roleId="tpfo.1175169154112" type="tpee.StatementList" typeId="tpee.1068580123136" id="7048923897762884739">
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="7048923897762884746">
                <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7048923897762884749">
                  <property name="value" nameId="tpee.1070475926801" value="ww" />
                </node>
                <node role="actual" roleId="tpe3.8427750732757990725" type="tpfo.MatchVariableReference" typeId="tpfo.1174565027678" id="7048923897762942664">
                  <link role="match" roleId="tpfo.1174565035929" targetNodeId="7048923897762884726" resolveInfo="nameInBr" />
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="7048923897762971918">
                <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="7048923897762971921">
                  <property name="value" nameId="tpee.1070475926801" value=" " />
                </node>
                <node role="actual" roleId="tpe3.8427750732757990725" type="tpfo.MatchVariableReference" typeId="tpfo.1174565027678" id="7048923897762971922">
                  <link role="match" roleId="tpfo.1174565035929" targetNodeId="7048923897762937790" resolveInfo="aq1" />
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="7048923897762913391">
                <node role="expression" roleId="tpee.1068580123156" type="tpee.AssignmentExpression" typeId="tpee.1068498886294" id="7048923897762913393">
                  <node role="lValue" roleId="tpee.1068498886295" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7048923897762913392">
                    <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7048923897762907462" resolveInfo="executed" />
                  </node>
                  <node role="rValue" roleId="tpee.1068498886297" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="7048923897762913396">
                    <property name="value" nameId="tpee.1068580123138" value="true" />
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertTrue" typeId="tpe3.1171981022339" id="7048923897762913399">
            <node role="condition" roleId="tpe3.1171981057159" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="7048923897762913401">
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="7048923897762907462" resolveInfo="executed" />
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="4276824325038067892">
        <property name="methodName" nameId="tpe3.1171931690128" value="matchInIf" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="4276824325038067893" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="4276824325038067894" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="4276824325038067895">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2588298302278368465">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2588298302278368466">
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2588298302278368467">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2588298302278368432" resolveInfo="check" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2588298302278368469">
                  <property name="value" nameId="tpee.1070475926801" value="! xyz" />
                </node>
              </node>
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2588298302278368468" />
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="2588298302278368484">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="2588298302278368486">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.ThisExpression" typeId="tpee.1070475354124" id="2588298302278368485" />
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="2588298302278368490">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="2588298302278368432" resolveInfo="check" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="2588298302278368491">
                  <property name="value" nameId="tpee.1070475926801" value="xxxaaadyyy" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="902359922144295130">
        <property name="methodName" nameId="tpe3.1171931690128" value="innerRegexps" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="902359922144295131" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="902359922144295132" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="902359922144295133">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="902359922144295134">
            <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="902359922144295136">
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="902359922144295146">
                <node role="actual" roleId="tpe3.8427750732757990725" type="tpfo.MatchVariableReference" typeId="tpfo.1174565027678" id="902359922144295151">
                  <link role="match" roleId="tpfo.1174565035929" targetNodeId="902359922144295122" resolveInfo="name" />
                </node>
                <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="902359922144295150">
                  <property name="value" nameId="tpee.1070475926801" value="inner" />
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="902359922144295163">
                <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="902359922144295166">
                  <property name="value" nameId="tpee.1070475926801" value="3" />
                </node>
                <node role="actual" roleId="tpe3.8427750732757990725" type="tpfo.MatchVariableReference" typeId="tpfo.1174565027678" id="1767845709140912926">
                  <link role="match" roleId="tpfo.1174565035929" targetNodeId="902359922144295112" resolveInfo="number" />
                </node>
              </node>
              <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="902359922144295169">
                <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="902359922144295172">
                  <property name="value" nameId="tpee.1070475926801" value="_123" />
                </node>
                <node role="actual" roleId="tpe3.8427750732757990725" type="tpfo.MatchVariableReference" typeId="tpfo.1174565027678" id="1767845709140912928">
                  <link role="match" roleId="tpfo.1174565035929" targetNodeId="902359922144295067" resolveInfo="identifier" />
                </node>
              </node>
            </node>
            <node role="condition" roleId="tpee.1068580123160" type="tpfo.FindMatchExpression" typeId="tpfo.6129327962763158517" id="902359922144295141">
              <node role="regexp" roleId="tpfo.1174653387388" type="tpfo.InlineRegexpExpression" typeId="tpfo.1174510540317" id="902359922144295142">
                <node role="regexp" roleId="tpfo.1174510571016" type="tpfo.RegexpDeclarationReferenceRegexp" typeId="tpfo.1174662605354" id="902359922144295145">
                  <link role="regexp" roleId="tpfo.1174662628918" targetNodeId="902359922144295096" resolveInfo="VarDeclaration" />
                </node>
              </node>
              <node role="inputExpression" roleId="tpfo.6129327962763255289" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="902359922144295137">
                <property name="value" nameId="tpee.1070475926801" value="_123[3]inner" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
  <root id="3796137614137404062">
    <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3796137614137404063" />
    <node role="constructor" roleId="tpee.1068390468201" type="tpee.ConstructorDeclaration" typeId="tpee.1068580123140" id="3796137614137404064">
      <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3796137614137404065" />
      <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3796137614137404066" />
      <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3796137614137404067" />
    </node>
    <node role="testMethodList" roleId="tpe3.1171931851044" type="tpe3.TestMethodList" typeId="tpe3.1171931858461" id="3796137614137404068">
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="3796137614137404069">
        <property name="methodName" nameId="tpe3.1171931690128" value="simple" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3796137614137404070" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3796137614137404071" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3796137614137404072">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="3796137614137404073">
            <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="3796137614137404074">
              <property name="name" nameId="tpck.1169194664001" value="input" />
              <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="3796137614137404075" />
              <node role="initializer" roleId="tpee.1068431790190" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3796137614137404077">
                <property name="value" nameId="tpee.1070475926801" value="aaabbccddeeffffffff" />
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="3796137614137404079">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3796137614137404082">
              <property name="value" nameId="tpee.1070475926801" value="a!b!c!d!e!f!" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3796137614137538861">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="3796137614137404083">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3796137614137404074" resolveInfo="input" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="3796137614137538865">
                <property name="globalReplace" nameId="tpfo.3796137614137159273" value="true" />
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.MatchVariableReferenceReplacement" typeId="tpfo.3796137614137538894" id="3796137614137943831">
                  <link role="match" roleId="tpfo.3796137614137539525" targetNodeId="3796137614137538871" resolveInfo="list" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="3796137614137943837">
                  <property name="text" nameId="tpfo.3796137614137565243" value="!" />
                </node>
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="3796137614137929921">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.ParensRegexp" typeId="tpfo.1174491169200" id="1643569692137825803">
                    <node role="expr" roleId="tpfo.1174491174779" type="tpfo.StarRegexp" typeId="tpfo.1174482808826" id="1643569692137825804">
                      <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="1643569692137825805">
                        <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554710194" resolveInfo="\s" />
                      </node>
                    </node>
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1643569692137919035">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.StarRegexp" typeId="tpfo.1174482808826" id="1643569692137919039">
                      <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.MatchVariableReferenceRegexp" typeId="tpfo.1174909099093" id="1643569692137919038">
                        <link role="match" roleId="tpfo.1174909113141" targetNodeId="3796137614137538871" resolveInfo="list" />
                      </node>
                    </node>
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="3796137614137538871">
                      <property name="name" nameId="tpck.1169194664001" value="list" />
                      <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="1643569692137919034">
                        <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1643569692138211513">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1643569692138211514">
              <property name="value" nameId="tpee.1070475926801" value="a!bbccddeeffffffff" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1643569692138211515">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="1643569692138211516">
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="3796137614137404074" resolveInfo="input" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="1643569692138211517">
                <property name="globalReplace" nameId="tpfo.3796137614137159273" value="false" />
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.MatchVariableReferenceReplacement" typeId="tpfo.3796137614137538894" id="1643569692138211518">
                  <link role="match" roleId="tpfo.3796137614137539525" targetNodeId="1643569692138211527" resolveInfo="list" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="1643569692138211519">
                  <property name="text" nameId="tpfo.3796137614137565243" value="!" />
                </node>
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1643569692138211520">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.ParensRegexp" typeId="tpfo.1174491169200" id="1643569692138211521">
                    <node role="expr" roleId="tpfo.1174491174779" type="tpfo.StarRegexp" typeId="tpfo.1174482808826" id="1643569692138211522">
                      <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="1643569692138211523">
                        <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554710194" resolveInfo="\s" />
                      </node>
                    </node>
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="1643569692138211524">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.StarRegexp" typeId="tpfo.1174482808826" id="1643569692138211525">
                      <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.MatchVariableReferenceRegexp" typeId="tpfo.1174909099093" id="1643569692138211526">
                        <link role="match" roleId="tpfo.1174909113141" targetNodeId="1643569692138211527" resolveInfo="list" />
                      </node>
                    </node>
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="1643569692138211527">
                      <property name="name" nameId="tpck.1169194664001" value="list" />
                      <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="1643569692138211528">
                        <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8942139995508443379">
        <property name="methodName" nameId="tpe3.1171931690128" value="swap" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8942139995508443380" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8942139995508443381" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8942139995508443382">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8942139995508443383">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508443386">
              <property name="value" nameId="tpee.1070475926801" value="word2 first" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8942139995508443388">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508443387">
                <property name="value" nameId="tpee.1070475926801" value="   first   word2" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="8942139995508443392">
                <property name="globalReplace" nameId="tpfo.3796137614137159273" value="false" />
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.MatchVariableReferenceReplacement" typeId="tpfo.3796137614137538894" id="8942139995508443428">
                  <link role="match" roleId="tpfo.3796137614137539525" targetNodeId="8942139995508443418" resolveInfo="w2" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="8942139995508443432">
                  <property name="text" nameId="tpfo.3796137614137565243" value=" " />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.MatchVariableReferenceReplacement" typeId="tpfo.3796137614137538894" id="8942139995508443434">
                  <link role="match" roleId="tpfo.3796137614137539525" targetNodeId="8942139995508443404" resolveInfo="w1" />
                </node>
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8942139995508443398">
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.StarRegexp" typeId="tpfo.1174482808826" id="8942139995508443396">
                    <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995508443395">
                      <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554710194" resolveInfo="\s" />
                    </node>
                  </node>
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8942139995508443409">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="8942139995508443415">
                      <node role="right" roleId="tpfo.1174485181039" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="8942139995508443418">
                        <property name="name" nameId="tpck.1169194664001" value="w2" />
                        <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="8942139995508443421">
                          <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995508443420">
                            <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                          </node>
                        </node>
                      </node>
                      <node role="left" roleId="tpfo.1174485176897" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="8942139995508443413">
                        <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995508443412">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554710194" resolveInfo="\s" />
                        </node>
                      </node>
                    </node>
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="8942139995508443404">
                      <property name="name" nameId="tpck.1169194664001" value="w1" />
                      <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="8942139995508443407">
                        <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995508443406">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                        </node>
                      </node>
                    </node>
                  </node>
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4452696118160649121">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="4452696118160649123">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="4452696118160649122" />
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="4452696118160649127">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="4452696118160649133">
                  <property name="name" nameId="tpck.1169194664001" value="word" />
                  <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="4452696118160649135">
                    <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                  </node>
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="4452696118160649137">
                  <property name="text" nameId="tpfo.3796137614137565243" value="[" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.MatchVariableReferenceReplacement" typeId="tpfo.3796137614137538894" id="4452696118160649139">
                  <link role="match" roleId="tpfo.3796137614137539525" targetNodeId="4452696118160649133" resolveInfo="word" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="4452696118160649141">
                  <property name="text" nameId="tpfo.3796137614137565243" value="]" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="1767845709140460447">
        <property name="methodName" nameId="tpe3.1171931690128" value="oneLetter" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="1767845709140460448" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="1767845709140460449" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="1767845709140460450">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1767845709140460451">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1767845709140460454">
              <property name="value" nameId="tpee.1070475926801" value="A" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1767845709140460456">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1767845709140460455">
                <property name="value" nameId="tpee.1070475926801" value="A" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="1767845709140460460">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="1767845709140460462">
                  <property name="text" nameId="tpfo.1174482761807" value="a" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="1767845709140460463">
                  <property name="text" nameId="tpfo.3796137614137565243" value="AA" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1767845709140460465">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1767845709140460466">
              <property name="value" nameId="tpee.1070475926801" value="AA" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1767845709140460467">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1767845709140460468">
                <property name="value" nameId="tpee.1070475926801" value="A" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="1767845709140460469">
                <property name="caseInsensitive" nameId="tpfo.3796137614137159272" value="true" />
                <property name="globalReplace" nameId="tpfo.3796137614137159273" value="false" />
                <property name="dotAll" nameId="tpfo.3796137614137159270" value="false" />
                <property name="multiLine" nameId="tpfo.3796137614137159271" value="false" />
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="1767845709140460470">
                  <property name="text" nameId="tpfo.1174482761807" value="a" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="1767845709140460471">
                  <property name="text" nameId="tpfo.3796137614137565243" value="AA" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="3632055896798290267">
        <property name="methodName" nameId="tpe3.1171931690128" value="dotAllMode" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3632055896798290268" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3632055896798290269" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3632055896798290270">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="3632055896798290271">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3632055896798292824">
              <property name="value" nameId="tpee.1070475926801" value="!\n!\n!" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3632055896798292812">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3632055896798290274">
                <property name="value" nameId="tpee.1070475926801" value="aaaaa\nddddd\nwwwww" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="3632055896798292816">
                <property name="globalReplace" nameId="tpfo.3796137614137159273" value="true" />
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="3632055896798292819">
                  <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.DotRegexp" typeId="tpfo.1174556813606" id="3632055896798292821" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="3632055896798292823">
                  <property name="text" nameId="tpfo.3796137614137565243" value="!" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="3632055896798292826">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3632055896798292827">
              <property name="value" nameId="tpee.1070475926801" value="!" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3632055896798292828">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3632055896798292829">
                <property name="value" nameId="tpee.1070475926801" value="aaaaa\nddddd\nwwwww" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="3632055896798292830">
                <property name="dotAll" nameId="tpfo.3796137614137159270" value="true" />
                <property name="globalReplace" nameId="tpfo.3796137614137159273" value="true" />
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="3632055896798292831">
                  <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.DotRegexp" typeId="tpfo.1174556813606" id="3632055896798292832" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="3632055896798292833">
                  <property name="text" nameId="tpfo.3796137614137565243" value="!" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="3632055896798292834">
        <property name="methodName" nameId="tpe3.1171931690128" value="multiLine" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="3632055896798292835" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="3632055896798292836" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="3632055896798292837">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="3632055896798292838">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3632055896798292841">
              <property name="value" nameId="tpee.1070475926801" value="sada\n[asdad]\nasda\n[asada]" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3632055896798292844">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3632055896798292842">
                <property name="value" nameId="tpee.1070475926801" value="sada\nasdad:\nasda\nasada:" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="3632055896798292848">
                <property name="globalReplace" nameId="tpfo.3796137614137159273" value="true" />
                <property name="multiLine" nameId="tpfo.3796137614137159271" value="true" />
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="3632055896798292861">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="3632055896798292866">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="3632055896798292869">
                      <property name="text" nameId="tpfo.1174482761807" value=":" />
                    </node>
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="3632055896798292864">
                      <property name="name" nameId="tpck.1169194664001" value="text" />
                      <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="3632055896798292871">
                        <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="3632055896798292870">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.LineStartRegexp" typeId="tpfo.1175161264766" id="3632055896798292851" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="3632055896798292879">
                  <property name="text" nameId="tpfo.3796137614137565243" value="[" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.MatchVariableReferenceReplacement" typeId="tpfo.3796137614137538894" id="3632055896798292875">
                  <link role="match" roleId="tpfo.3796137614137539525" targetNodeId="3632055896798292864" resolveInfo="text" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="3632055896798292877">
                  <property name="text" nameId="tpfo.3796137614137565243" value="]" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="3632055896798296107">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3632055896798296108">
              <property name="value" nameId="tpee.1070475926801" value="sada\nasdad:\nasda\nasada:" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="3632055896798296109">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="3632055896798296110">
                <property name="value" nameId="tpee.1070475926801" value="sada\nasdad:\nasda\nasada:" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="3632055896798296111">
                <property name="globalReplace" nameId="tpfo.3796137614137159273" value="true" />
                <property name="multiLine" nameId="tpfo.3796137614137159271" value="false" />
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="3632055896798296112">
                  <node role="right" roleId="tpfo.1174485181039" type="tpfo.SeqRegexp" typeId="tpfo.1174484562151" id="3632055896798296113">
                    <node role="right" roleId="tpfo.1174485181039" type="tpfo.StringLiteralRegexp" typeId="tpfo.1174482753837" id="3632055896798296114">
                      <property name="text" nameId="tpfo.1174482761807" value=":" />
                    </node>
                    <node role="left" roleId="tpfo.1174485176897" type="tpfo.MatchParensRegexp" typeId="tpfo.1174564062919" id="3632055896798296115">
                      <property name="name" nameId="tpck.1169194664001" value="text" />
                      <node role="regexp" roleId="tpfo.1174564160889" type="tpfo.PlusRegexp" typeId="tpfo.1174482804200" id="3632055896798296116">
                        <node role="regexp" roleId="tpfo.1174485243418" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="3632055896798296117">
                          <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                        </node>
                      </node>
                    </node>
                  </node>
                  <node role="left" roleId="tpfo.1174485176897" type="tpfo.LineStartRegexp" typeId="tpfo.1175161264766" id="3632055896798296118" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="3632055896798296119">
                  <property name="text" nameId="tpfo.3796137614137565243" value="[" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.MatchVariableReferenceReplacement" typeId="tpfo.3796137614137538894" id="3632055896798296120">
                  <link role="match" roleId="tpfo.3796137614137539525" targetNodeId="3632055896798296115" resolveInfo="text" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="3632055896798296121">
                  <property name="text" nameId="tpfo.3796137614137565243" value="]" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="testMethod" roleId="tpe3.1171931858462" type="tpe3.TestMethod" typeId="tpe3.1171931690126" id="8942139995508580996">
        <property name="methodName" nameId="tpe3.1171931690128" value="checkLiterals" />
        <node role="returnType" roleId="tpee.1068580123133" type="tpee.VoidType" typeId="tpee.1068581517677" id="8942139995508580997" />
        <node role="visibility" roleId="tpee.1178549979242" type="tpee.PublicVisibility" typeId="tpee.1146644602865" id="8942139995508580998" />
        <node role="body" roleId="tpee.1068580123135" type="tpee.StatementList" typeId="tpee.1068580123136" id="8942139995508580999">
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8942139995508581000">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508581003">
              <property name="value" nameId="tpee.1070475926801" value="\\" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8942139995508581005">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508581004">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="8942139995508581009">
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="8942139995508581019">
                  <property name="text" nameId="tpfo.3796137614137565243" value="\\" />
                </node>
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995508581020">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8942139995508582632">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508582633">
              <property name="value" nameId="tpee.1070475926801" value="[]" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8942139995508582634">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508582635">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="8942139995508582636">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995508582638">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="8942139995508582639">
                  <property name="text" nameId="tpfo.3796137614137565243" value="[]" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8942139995508582641">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508582642">
              <property name="value" nameId="tpee.1070475926801" value="$" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8942139995508582643">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508582644">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="8942139995508582645">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995508582647">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="8942139995508582648">
                  <property name="text" nameId="tpfo.3796137614137565243" value="$" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8942139995508723029">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508723030">
              <property name="value" nameId="tpee.1070475926801" value="\&quot;" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8942139995508723031">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508723032">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="8942139995508723033">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995508723034">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="8942139995508723035">
                  <property name="text" nameId="tpfo.3796137614137565243" value="&quot;" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8942139995509275196">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995509275197">
              <property name="value" nameId="tpee.1070475926801" value="\&quot;" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8942139995509275198">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995509275199">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="8942139995509275200">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995509275201">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="8942139995509275202">
                  <property name="text" nameId="tpfo.3796137614137565243" value="\&quot;" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8942139995508723037">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508723038">
              <property name="value" nameId="tpee.1070475926801" value="()" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8942139995508723039">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508723040">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="8942139995508723041">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995508723042">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="8942139995508723043">
                  <property name="text" nameId="tpfo.3796137614137565243" value="()" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8942139995508723045">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508723046">
              <property name="value" nameId="tpee.1070475926801" value="{}" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8942139995508723047">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508723048">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="8942139995508723049">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995508723050">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="8942139995508723052">
                  <property name="text" nameId="tpfo.3796137614137565243" value="{}" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8942139995508724135">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508724136">
              <property name="value" nameId="tpee.1070475926801" value="\n" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8942139995508724137">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508724138">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="8942139995508724139">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995508724140">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="8942139995508724142">
                  <property name="text" nameId="tpfo.3796137614137565243" value="\n" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8942139995508724144">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508724145">
              <property name="value" nameId="tpee.1070475926801" value="^" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8942139995508724146">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508724147">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="8942139995508724148">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995508724149">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="8942139995508724151">
                  <property name="text" nameId="tpfo.3796137614137565243" value="^" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8942139995508724153">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508724154">
              <property name="value" nameId="tpee.1070475926801" value="'" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8942139995508724155">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995508724156">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="8942139995508724157">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995508724158">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="8942139995508724160">
                  <property name="text" nameId="tpfo.3796137614137565243" value="'" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="8942139995509275205">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995509275206">
              <property name="value" nameId="tpee.1070475926801" value="'" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="8942139995509275207">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="8942139995509275208">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="8942139995509275209">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="8942139995509275210">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="8942139995509275211">
                  <property name="text" nameId="tpfo.3796137614137565243" value="\'" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1767845709140460419">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1767845709140460422">
              <property name="value" nameId="tpee.1070475926801" value="\u2606" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1767845709140460424">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1767845709140460423">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="1767845709140460428">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="1767845709140460430">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="1767845709140460431">
                  <property name="text" nameId="tpfo.3796137614137565243" value="\u2606" />
                </node>
              </node>
            </node>
          </node>
          <node role="statement" roleId="tpee.1068581517665" type="tpe3.AssertEquals" typeId="tpe3.1171978097730" id="1767845709140460433">
            <node role="expected" roleId="tpe3.8427750732757990724" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1767845709140460436">
              <property name="value" nameId="tpee.1070475926801" value="\r" />
            </node>
            <node role="actual" roleId="tpe3.8427750732757990725" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1767845709140460438">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1767845709140460437">
                <property name="value" nameId="tpee.1070475926801" value="a" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpfo.ReplaceRegexpOperation" typeId="tpfo.3796137614137086346" id="1767845709140460442">
                <node role="search" roleId="tpfo.3796137614137159227" type="tpfo.PredefinedSymbolClassRegexp" typeId="tpfo.1174555732504" id="1767845709140460444">
                  <link role="symbolClass" roleId="tpfo.1174555843709" targetNodeId="tpfp.1174554738336" resolveInfo="\w" />
                </node>
                <node role="replacement" roleId="tpfo.3796137614137086347" type="tpfo.LiteralReplacement" typeId="tpfo.3796137614137538892" id="1767845709140460445">
                  <property name="text" nameId="tpfo.3796137614137565243" value="\r" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
  </root>
</model>

