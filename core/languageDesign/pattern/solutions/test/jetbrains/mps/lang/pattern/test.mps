<?xml version="1.0" encoding="UTF-8"?>
<model modelUID="r:ef0e231b-e6bd-436f-9003-b53de4081716(jetbrains.mps.lang.pattern.test)">
  <persistence version="7" />
  <language namespace="5206c888-7c5d-4275-bc0a-7c4da12f46e8(jetbrains.mps.lang.pattern.testLang)" />
  <language namespace="ceab5195-25ea-4f22-9b92-103b95ca8c0c(jetbrains.mps.lang.core)" />
  <language namespace="d4615e3b-d671-4ba9-af01-2b78369b0ba7(jetbrains.mps.lang.pattern)" />
  <language namespace="f3061a53-9226-4cc5-a443-f952ceaf5816(jetbrains.mps.baseLanguage)" />
  <language namespace="7866978e-a0f0-4cc7-81bc-4d213d9375e1(jetbrains.mps.lang.smodel)" />
  <language namespace="8585453e-6bfb-4d80-98de-b16074f1d86c(jetbrains.mps.lang.test)" />
  <import index="e2lb" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.lang(JDK/java.lang@java_stub)" version="-1" />
  <import index="fxg7" modelUID="f:java_stub#6354ebe7-c22a-4a0f-ac54-50b52ab9b065#java.io(JDK/java.io@java_stub)" version="-1" />
  <import index="tpck" modelUID="r:00000000-0000-4000-0000-011c89590288(jetbrains.mps.lang.core.structure)" version="0" implicit="yes" />
  <import index="tpee" modelUID="r:00000000-0000-4000-0000-011c895902ca(jetbrains.mps.baseLanguage.structure)" version="3" implicit="yes" />
  <import index="tp3t" modelUID="r:00000000-0000-4000-0000-011c89590345(jetbrains.mps.lang.pattern.structure)" version="0" implicit="yes" />
  <import index="pnao" modelUID="r:7336929d-3d95-43d0-b2df-fd38af21ae45(jetbrains.mps.lang.pattern.testLang.structure)" version="-1" implicit="yes" />
  <import index="tp5g" modelUID="r:00000000-0000-4000-0000-011c89590388(jetbrains.mps.lang.test.structure)" version="4" implicit="yes" />
  <roots>
    <node type="pnao.PatternTest" typeId="pnao.8707387027762047752" id="815823070325240409">
      <property name="name" nameId="tpck.1169194664001" value="v2" />
    </node>
    <node type="pnao.PatternTest" typeId="pnao.8707387027762047752" id="1563914226484855981">
      <property name="name" nameId="tpck.1169194664001" value="v3" />
    </node>
    <node type="pnao.PatternTest" typeId="pnao.8707387027762047752" id="1563914226484862621">
      <property name="name" nameId="tpck.1169194664001" value="ListPattern" />
    </node>
    <node type="pnao.PatternTest" typeId="pnao.8707387027762047752" id="1563914226484895490">
      <property name="name" nameId="tpck.1169194664001" value="Property" />
    </node>
    <node type="pnao.PatternTest" typeId="pnao.8707387027762047752" id="1563914226484981153">
      <property name="name" nameId="tpck.1169194664001" value="v1" />
    </node>
    <node type="pnao.PatternTest" typeId="pnao.8707387027762047752" id="2879868312063084275">
      <property name="name" nameId="tpck.1169194664001" value="OrPattern" />
    </node>
    <node type="pnao.PatternTest" typeId="pnao.8707387027762047752" id="4855904478357165289">
      <property name="name" nameId="tpck.1169194664001" value="OrPattern2" />
    </node>
    <node type="pnao.PatternTest" typeId="pnao.8707387027762047752" id="8263735385373599995">
      <property name="name" nameId="tpck.1169194664001" value="MultipleOr" />
    </node>
    <node type="tp5g.TestInfo" typeId="tp5g.5097124989038916362" id="4545179712979945422">
      <property name="projectPath" nameId="tp5g.5097124989038916363" value="${mps_home}/MPS.mpr" />
    </node>
  </roots>
  <root id="815823070325240409">
    <node role="nodeToMatch" roleId="pnao.8707387027762047753" type="tpee.StatementList" typeId="tpee.1068580123136" id="815823070325240442">
      <node role="statement" roleId="tpee.1068581517665" type="tpee.LocalVariableDeclarationStatement" typeId="tpee.1068581242864" id="815823070325240444">
        <node role="localVariableDeclaration" roleId="tpee.1068581242865" type="tpee.LocalVariableDeclaration" typeId="tpee.1068581242863" id="815823070325240445">
          <property name="name" nameId="tpck.1169194664001" value="s" />
          <node role="type" roleId="tpee.5680397130376446158" type="tpee.StringType" typeId="tpee.1225271177708" id="815823070325240446" />
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="815823070325240447">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="815823070325240448">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="815823070325240449" />
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="815823070325240450">
            <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="815823070325240451">
              <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="815823070325240452">
                <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
                <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
              </node>
              <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="815823070325240453">
                <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln(java%dlang%dString)%cvoid" resolveInfo="println" />
                <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="815823070325240454">
                  <property name="value" nameId="tpee.1070475926801" value=" " />
                </node>
              </node>
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="815823070325240455">
          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="815823070325240456" />
          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.LocalVariableReference" typeId="tpee.1068581242866" id="815823070325240457">
            <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="815823070325240445" resolveInfo="s" />
          </node>
        </node>
      </node>
      <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="8925839041031183902" />
    </node>
    <node role="matches" roleId="pnao.8707387027762047755" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="815823070325240412">
      <property name="value" nameId="tpee.1068580123138" value="true" />
    </node>
    <node role="pattern" roleId="pnao.8707387027762047754" type="tp3t.PatternExpression" typeId="tp3t.1136720037777" id="815823070325240427">
      <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.StatementList" typeId="tpee.1068580123136" id="815823070325240428">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="815823070325240429">
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.WildcardPattern" typeId="tp3t.1136720037783" id="815823070325240430" />
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.IfStatement" typeId="tpee.1068580123159" id="815823070325240431">
          <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="815823070325240435">
            <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="815823070325240436" />
            <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.Expression" typeId="tpee.1068431790191" id="815823070325240437">
              <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.PatternVariableDeclaration" typeId="tp3t.1136720037779" id="815823070325240438">
                <property name="varName" nameId="tp3t.1136720037780" value="p" />
              </node>
            </node>
          </node>
          <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="8925839041031188835">
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.PatternVariableDeclaration" typeId="tp3t.1136720037779" id="8925839041031188836">
              <property name="varName" nameId="tp3t.1136720037780" value="ifbody" />
            </node>
          </node>
        </node>
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="815823070325240439">
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.WildcardPattern" typeId="tp3t.1136720037783" id="815823070325240440" />
        </node>
      </node>
    </node>
    <node role="variable" roleId="pnao.3731303358747471468" type="pnao.VariableValue" typeId="pnao.8707387027762047758" id="815823070325240458">
      <node role="value" roleId="pnao.3731303358747471465" type="tpee.StatementList" typeId="tpee.1068580123136" id="815823070325240462">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="815823070325240469" />
        <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="815823070325240470">
          <node role="expression" roleId="tpee.1068580123156" type="tpee.DotExpression" typeId="tpee.1197027756228" id="815823070325240471">
            <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="815823070325240472">
              <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
              <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
            </node>
            <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="815823070325240473">
              <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln(java%dlang%dString)%cvoid" resolveInfo="println" />
              <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="815823070325240474">
                <property name="value" nameId="tpee.1070475926801" value=" " />
              </node>
            </node>
          </node>
        </node>
      </node>
      <node role="variable" roleId="pnao.8707387027762047759" type="pnao.TestVariableReference" typeId="pnao.8707387027762047761" id="815823070325240461">
        <link role="declaration" roleId="pnao.8707387027762047762" targetNodeId="8925839041031188836" resolveInfo="#ifbody" />
      </node>
    </node>
  </root>
  <root id="1563914226484855981">
    <node role="variable" roleId="pnao.3731303358747471468" type="pnao.VariableValue" typeId="pnao.8707387027762047758" id="1563914226484898736">
      <node role="variable" roleId="pnao.8707387027762047759" type="pnao.TestVariableReference" typeId="pnao.8707387027762047761" id="1563914226484898739">
        <link role="declaration" roleId="pnao.8707387027762047762" targetNodeId="1563914226484890296" resolveInfo="#printed" />
      </node>
      <node role="value" roleId="pnao.3731303358747471465" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1563914226484898740">
        <property name="value" nameId="tpee.1070475926801" value="d" />
      </node>
    </node>
    <node role="matches" roleId="pnao.8707387027762047755" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1563914226484855998">
      <property name="value" nameId="tpee.1068580123138" value="true" />
    </node>
    <node role="pattern" roleId="pnao.8707387027762047754" type="tp3t.PatternExpression" typeId="tp3t.1136720037777" id="1563914226484855999">
      <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1563914226484890287">
        <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1563914226484890288">
          <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.LinkPatternVariableDeclaration" typeId="tp3t.1137418540378" id="1563914226484890298">
            <property name="varName" nameId="tp3t.1137418571428" value="field" />
            <property name="linkRole" nameId="tpck.1757699476691236116" value="variableDeclaration" />
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.LinkPatternVariableDeclaration" typeId="tp3t.1137418540378" id="1563914226484892893">
            <property name="varName" nameId="tp3t.1137418571428" value="className" />
            <property name="linkRole" nameId="tpck.1757699476691236116" value="classifier" />
          </node>
        </node>
        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1563914226484890289">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln()%cvoid" resolveInfo="println" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.Expression" typeId="tpee.1068431790191" id="1563914226484890295">
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.PatternVariableDeclaration" typeId="tp3t.1136720037779" id="1563914226484890296">
              <property name="varName" nameId="tp3t.1136720037780" value="printed" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.LinkPatternVariableDeclaration" typeId="tp3t.1137418540378" id="1563914226484890297">
            <property name="varName" nameId="tp3t.1137418571428" value="method" />
            <property name="linkRole" nameId="tpck.1757699476691236116" value="baseMethodDeclaration" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodeToMatch" roleId="pnao.8707387027762047753" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1563914226484887791">
      <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1563914226484887790">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
      </node>
      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1563914226484887795">
        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln(java%dlang%dString)%cvoid" resolveInfo="println" />
        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1563914226484887796">
          <property name="value" nameId="tpee.1070475926801" value="d" />
        </node>
      </node>
    </node>
  </root>
  <root id="1563914226484862621">
    <node role="list" roleId="pnao.1563914226484929075" type="pnao.ListValue" typeId="pnao.1563914226484928842" id="1563914226484933910">
      <node role="variable" roleId="pnao.1563914226484928844" type="pnao.TestListReference" typeId="pnao.1563914226484928843" id="1563914226484941611">
        <link role="listPattern" roleId="pnao.1563914226484929056" targetNodeId="1563914226484929054" resolveInfo="#list" />
      </node>
      <node role="value" roleId="pnao.1563914226484928845" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1563914226484950427">
        <property name="value" nameId="tpee.1068580320021" value="10" />
      </node>
      <node role="value" roleId="pnao.1563914226484928845" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1563914226484954502">
        <property name="value" nameId="tpee.1068580320021" value="10" />
      </node>
    </node>
    <node role="matches" roleId="pnao.8707387027762047755" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1563914226484862629">
      <property name="value" nameId="tpee.1068580123138" value="true" />
    </node>
    <node role="pattern" roleId="pnao.8707387027762047754" type="tp3t.PatternExpression" typeId="tp3t.1136720037777" id="1563914226484862630">
      <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1563914226484929045">
        <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1563914226484929046">
          <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.LinkPatternVariableDeclaration" typeId="tp3t.1137418540378" id="1563914226484929047">
            <property name="varName" nameId="tp3t.1137418571428" value="field" />
            <property name="linkRole" nameId="tpck.1757699476691236116" value="variableDeclaration" />
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.LinkPatternVariableDeclaration" typeId="tp3t.1137418540378" id="1563914226484929048">
            <property name="varName" nameId="tp3t.1137418571428" value="className" />
            <property name="linkRole" nameId="tpck.1757699476691236116" value="classifier" />
          </node>
        </node>
        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1563914226484929049">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln()%cvoid" resolveInfo="println" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.Expression" typeId="tpee.1068431790191" id="1563914226484929053">
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.ListPattern" typeId="tp3t.1136727061274" id="1563914226484929054">
              <property name="varName" nameId="tp3t.1136720037780" value="list" />
            </node>
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.PatternVariableDeclaration" typeId="tp3t.1136720037779" id="1563914226484929055">
              <property name="varName" nameId="tp3t.1136720037780" value="ignore" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.LinkPatternVariableDeclaration" typeId="tp3t.1137418540378" id="1563914226484929052">
            <property name="varName" nameId="tp3t.1137418571428" value="method" />
            <property name="linkRole" nameId="tpck.1757699476691236116" value="baseMethodDeclaration" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodeToMatch" roleId="pnao.8707387027762047753" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1563914226484957858">
      <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1563914226484957861">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
      </node>
      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1563914226484957862">
        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Object%dwait(long,int)%cvoid" resolveInfo="wait" />
        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1563914226484957863">
          <property name="value" nameId="tpee.1068580320021" value="10" />
        </node>
        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1563914226484957865">
          <property name="value" nameId="tpee.1068580320021" value="10" />
        </node>
      </node>
    </node>
  </root>
  <root id="1563914226484895490">
    <node role="property" roleId="pnao.1563914226484921051" type="pnao.PropertyValue" typeId="pnao.1563914226484921014" id="1563914226484924957">
      <node role="variable" roleId="pnao.1563914226484921015" type="pnao.TestPropertyVariableReference" typeId="pnao.1563914226484898744" id="1563914226484924963">
        <link role="declaration" roleId="pnao.1563914226484898750" targetNodeId="1563914226484895506" resolveInfo="$printed" />
      </node>
      <node role="value" roleId="pnao.1563914226484921016" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1563914226484924959">
        <property name="value" nameId="tpee.1070475926801" value="something" />
      </node>
    </node>
    <node role="matches" roleId="pnao.8707387027762047755" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1563914226484895491">
      <property name="value" nameId="tpee.1068580123138" value="true" />
    </node>
    <node role="pattern" roleId="pnao.8707387027762047754" type="tp3t.PatternExpression" typeId="tp3t.1136720037777" id="1563914226484895492">
      <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1563914226484895493">
        <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1563914226484895494">
          <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.LinkPatternVariableDeclaration" typeId="tp3t.1137418540378" id="1563914226484895495">
            <property name="varName" nameId="tp3t.1137418571428" value="field" />
            <property name="linkRole" nameId="tpck.1757699476691236116" value="variableDeclaration" />
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.LinkPatternVariableDeclaration" typeId="tp3t.1137418540378" id="1563914226484895496">
            <property name="varName" nameId="tp3t.1137418571428" value="className" />
            <property name="linkRole" nameId="tpck.1757699476691236116" value="classifier" />
          </node>
        </node>
        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1563914226484895497">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln(java%dlang%dString)%cvoid" resolveInfo="println" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1563914226484895505">
            <property name="value" nameId="tpee.1070475926801" value="" />
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.PropertyPatternVariableDeclaration" typeId="tp3t.1136720037781" id="1563914226484895506">
              <property name="varName" nameId="tp3t.1136720037782" value="printed" />
              <property name="propertyName" nameId="tpck.1757699476691236117" value="value" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.LinkPatternVariableDeclaration" typeId="tp3t.1137418540378" id="1563914226484895500">
            <property name="varName" nameId="tp3t.1137418571428" value="method" />
            <property name="linkRole" nameId="tpck.1757699476691236116" value="baseMethodDeclaration" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodeToMatch" roleId="pnao.8707387027762047753" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1563914226484895501">
      <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1563914226484895502">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
      </node>
      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1563914226484895503">
        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln(java%dlang%dString)%cvoid" resolveInfo="println" />
        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.StringLiteral" typeId="tpee.1070475926800" id="1563914226484895504">
          <property name="value" nameId="tpee.1070475926801" value="something" />
        </node>
      </node>
    </node>
  </root>
  <root id="1563914226484981153">
    <node role="list" roleId="pnao.1563914226484929075" type="pnao.ListValue" typeId="pnao.1563914226484928842" id="1563914226484981154">
      <node role="variable" roleId="pnao.1563914226484928844" type="pnao.TestListReference" typeId="pnao.1563914226484928843" id="1563914226484981155">
        <link role="listPattern" roleId="pnao.1563914226484929056" targetNodeId="1563914226484981166" resolveInfo="#list" />
      </node>
      <node role="value" roleId="pnao.1563914226484928845" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1563914226484981156">
        <property name="value" nameId="tpee.1068580320021" value="10" />
      </node>
      <node role="value" roleId="pnao.1563914226484928845" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1563914226484981157">
        <property name="value" nameId="tpee.1068580320021" value="10" />
      </node>
    </node>
    <node role="matches" roleId="pnao.8707387027762047755" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="1563914226484981158">
      <property name="value" nameId="tpee.1068580123138" value="true" />
    </node>
    <node role="pattern" roleId="pnao.8707387027762047754" type="tp3t.PatternExpression" typeId="tp3t.1136720037777" id="1563914226484981159">
      <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1563914226484981160">
        <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1563914226484981161">
          <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
          <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.LinkPatternVariableDeclaration" typeId="tp3t.1137418540378" id="1563914226484981162">
            <property name="varName" nameId="tp3t.1137418571428" value="field" />
            <property name="linkRole" nameId="tpck.1757699476691236116" value="variableDeclaration" />
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.LinkPatternVariableDeclaration" typeId="tp3t.1137418540378" id="1563914226484981163">
            <property name="varName" nameId="tp3t.1137418571428" value="className" />
            <property name="linkRole" nameId="tpck.1757699476691236116" value="classifier" />
          </node>
        </node>
        <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1563914226484981164">
          <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="fxg7.~PrintStream%dprintln()%cvoid" resolveInfo="println" />
          <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.Expression" typeId="tpee.1068431790191" id="1563914226484981165">
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.ListPattern" typeId="tp3t.1136727061274" id="1563914226484981166">
              <property name="varName" nameId="tp3t.1136720037780" value="list" />
            </node>
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.PatternVariableDeclaration" typeId="tp3t.1136720037779" id="1563914226484981167">
              <property name="varName" nameId="tp3t.1136720037780" value="ignore" />
            </node>
          </node>
          <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.LinkPatternVariableDeclaration" typeId="tp3t.1137418540378" id="1563914226484981168">
            <property name="varName" nameId="tp3t.1137418571428" value="method" />
            <property name="linkRole" nameId="tpck.1757699476691236116" value="baseMethodDeclaration" />
          </node>
        </node>
      </node>
    </node>
    <node role="nodeToMatch" roleId="pnao.8707387027762047753" type="tpee.DotExpression" typeId="tpee.1197027756228" id="1563914226484981169">
      <node role="operand" roleId="tpee.1197027771414" type="tpee.StaticFieldReference" typeId="tpee.1070533707846" id="1563914226484981170">
        <link role="classifier" roleId="tpee.1144433057691" targetNodeId="e2lb.~System" resolveInfo="System" />
        <link role="variableDeclaration" roleId="tpee.1068581517664" targetNodeId="e2lb.~System%dout" resolveInfo="out" />
      </node>
      <node role="operation" roleId="tpee.1197027833540" type="tpee.InstanceMethodCallOperation" typeId="tpee.1202948039474" id="1563914226484981171">
        <link role="baseMethodDeclaration" roleId="tpee.1068499141037" targetNodeId="e2lb.~Object%dwait(long,int)%cvoid" resolveInfo="wait" />
        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1563914226484981172">
          <property name="value" nameId="tpee.1068580320021" value="10" />
        </node>
        <node role="actualArgument" roleId="tpee.1068499141038" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="1563914226484981173">
          <property name="value" nameId="tpee.1068580320021" value="10" />
        </node>
      </node>
    </node>
  </root>
  <root id="2879868312063084275">
    <node role="variable" roleId="pnao.3731303358747471468" type="pnao.VariableValue" typeId="pnao.8707387027762047758" id="4855904478357142041">
      <node role="value" roleId="pnao.3731303358747471465" type="tpee.ClassifierClassExpression" typeId="tpee.1116615150612" id="4855904478357142047">
        <link role="classifier" roleId="tpee.1116615189566" targetNodeId="fxg7.~BufferedOutputStream" resolveInfo="BufferedOutputStream" />
      </node>
      <node role="variable" roleId="pnao.8707387027762047759" type="pnao.TestVariableReference" typeId="pnao.8707387027762047761" id="455132893173205751">
        <link role="declaration" roleId="pnao.8707387027762047762" targetNodeId="5642650895629225735" resolveInfo="#ds" />
      </node>
    </node>
    <node role="nodeToMatch" roleId="pnao.8707387027762047753" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4855904478357142033">
      <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4855904478357142034">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="4855904478357142035" />
      </node>
      <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="4855904478357142037">
        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4855904478357142040" />
        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.ClassifierClassExpression" typeId="tpee.1116615150612" id="4855904478357142046">
          <link role="classifier" roleId="tpee.1116615189566" targetNodeId="fxg7.~BufferedOutputStream" resolveInfo="BufferedOutputStream" />
        </node>
      </node>
    </node>
    <node role="pattern" roleId="pnao.8707387027762047754" type="tp3t.PatternExpression" typeId="tp3t.1136720037777" id="2879868312063084277">
      <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.IfStatement" typeId="tpee.1068580123159" id="2879868312063084279">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="2879868312063084281">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="612919440683666600">
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.PatternVariableDeclaration" typeId="tp3t.1136720037779" id="612919440683690113">
              <property name="varName" nameId="tp3t.1136720037780" value="body" />
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tp3t.OrPattern" typeId="tp3t.2879868312062962308" id="4855904478356985691">
          <node role="variable" roleId="tp3t.4264731254635442558" type="tp3t.PatternVariableDeclaration" typeId="tp3t.1136720037779" id="5642650895629225735">
            <property name="varName" nameId="tp3t.1136720037780" value="ds" />
          </node>
          <node role="clause" roleId="tp3t.2879868312062970574" type="tp3t.OrPatternClause" typeId="tp3t.4855904478356877904" id="4855904478356985692">
            <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="7447026300559943984">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tp3t.OrPatternVariableReference" typeId="tp3t.4264731254635442556" id="7447026300559948863">
                <link role="declaration" roleId="tp3t.4264731254635442557" targetNodeId="5642650895629225735" resolveInfo="#ds" />
              </node>
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4855904478356985690" />
            </node>
          </node>
          <node role="clause" roleId="tp3t.2879868312062970574" type="tp3t.OrPatternClause" typeId="tp3t.4855904478356877904" id="4855904478357000966">
            <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="455132893173200872">
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4855904478357000968" />
              <node role="rightExpression" roleId="tpee.1081773367579" type="tp3t.OrPatternVariableReference" typeId="tp3t.4264731254635442556" id="455132893173205750">
                <link role="declaration" roleId="tp3t.4264731254635442557" targetNodeId="5642650895629225735" resolveInfo="#ds" />
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="matches" roleId="pnao.8707387027762047755" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="2879868312063084278">
      <property name="value" nameId="tpee.1068580123138" value="true" />
    </node>
  </root>
  <root id="4855904478357165289">
    <node role="variable" roleId="pnao.3731303358747471468" type="pnao.VariableValue" typeId="pnao.8707387027762047758" id="4855904478357165290">
      <node role="variable" roleId="pnao.8707387027762047759" type="pnao.TestVariableReference" typeId="pnao.8707387027762047761" id="7228132814203674561">
        <link role="declaration" roleId="pnao.8707387027762047762" targetNodeId="7228132814203674558" resolveInfo="#s" />
      </node>
      <node role="value" roleId="pnao.3731303358747471465" type="tpee.ClassifierClassExpression" typeId="tpee.1116615150612" id="4855904478357165292">
        <link role="classifier" roleId="tpee.1116615189566" targetNodeId="fxg7.~BufferedOutputStream" resolveInfo="BufferedOutputStream" />
      </node>
    </node>
    <node role="nodeToMatch" roleId="pnao.8707387027762047753" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4855904478357165293">
      <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4855904478357165294">
        <node role="statement" roleId="tpee.1068581517665" type="tpee.Statement" typeId="tpee.1068580123157" id="4855904478357165295" />
      </node>
      <node role="condition" roleId="tpee.1068580123160" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="4855904478357165296">
        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4855904478357165316" />
        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.ClassifierClassExpression" typeId="tpee.1116615150612" id="4855904478357165317">
          <link role="classifier" roleId="tpee.1116615189566" targetNodeId="fxg7.~BufferedOutputStream" resolveInfo="BufferedOutputStream" />
        </node>
      </node>
    </node>
    <node role="pattern" roleId="pnao.8707387027762047754" type="tp3t.PatternExpression" typeId="tp3t.1136720037777" id="4855904478357165299">
      <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.IfStatement" typeId="tpee.1068580123159" id="4855904478357165300">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="4855904478357165301">
          <node role="statement" roleId="tpee.1068581517665" type="tpee.ExpressionStatement" typeId="tpee.1068580123155" id="4855904478357165302">
            <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.PatternVariableDeclaration" typeId="tp3t.1136720037779" id="4855904478357165303">
              <property name="varName" nameId="tp3t.1136720037780" value="body" />
            </node>
          </node>
        </node>
        <node role="condition" roleId="tpee.1068580123160" type="tp3t.OrPattern" typeId="tp3t.2879868312062962308" id="4855904478357165304">
          <node role="variable" roleId="tp3t.4264731254635442558" type="tp3t.PatternVariableDeclaration" typeId="tp3t.1136720037779" id="7228132814203674558">
            <property name="varName" nameId="tp3t.1136720037780" value="s" />
          </node>
          <node role="clause" roleId="tp3t.2879868312062970574" type="tp3t.OrPatternClause" typeId="tp3t.4855904478356877904" id="4855904478357165305">
            <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="4855904478357165306">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4855904478357165307" />
              <node role="leftExpression" roleId="tpee.1081773367580" type="tp3t.OrPatternVariableReference" typeId="tp3t.4264731254635442556" id="7228132814203674559">
                <link role="declaration" roleId="tp3t.4264731254635442557" targetNodeId="7228132814203674558" resolveInfo="#s" />
              </node>
            </node>
          </node>
          <node role="clause" roleId="tp3t.2879868312062970574" type="tp3t.OrPatternClause" typeId="tp3t.4855904478356877904" id="4855904478357165310">
            <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="4855904478357165311">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tp3t.OrPatternVariableReference" typeId="tp3t.4264731254635442556" id="7228132814203674560">
                <link role="declaration" roleId="tp3t.4264731254635442557" targetNodeId="7228132814203674558" resolveInfo="#s" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="4855904478357165314" />
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="matches" roleId="pnao.8707387027762047755" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="4855904478357165315">
      <property name="value" nameId="tpee.1068580123138" value="true" />
    </node>
  </root>
  <root id="8263735385373599995">
    <node role="variable" roleId="pnao.3731303358747471468" type="pnao.VariableValue" typeId="pnao.8707387027762047758" id="8297918475033210051">
      <node role="variable" roleId="pnao.8707387027762047759" type="pnao.TestVariableReference" typeId="pnao.8707387027762047761" id="8297918475033210054">
        <link role="declaration" roleId="pnao.8707387027762047762" targetNodeId="7228132814203674562" resolveInfo="#s" />
      </node>
      <node role="value" roleId="pnao.3731303358747471465" type="tpee.PrimitiveClassExpression" typeId="tpee.4564374268190696673" id="8297918475033210055">
        <node role="primitiveType" roleId="tpee.4564374268190696674" type="tpee.DoubleType" typeId="tpee.1070534513062" id="8297918475033210056" />
      </node>
    </node>
    <node role="pattern" roleId="pnao.8707387027762047754" type="tp3t.PatternExpression" typeId="tp3t.1136720037777" id="8263735385373599997">
      <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.IfStatement" typeId="tpee.1068580123159" id="8263735385373599999">
        <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="8263735385373600001" />
        <node role="condition" roleId="tpee.1068580123160" type="tp3t.OrPattern" typeId="tp3t.2879868312062962308" id="8297918475033171167">
          <node role="variable" roleId="tp3t.4264731254635442558" type="tp3t.PatternVariableDeclaration" typeId="tp3t.1136720037779" id="7228132814203674562">
            <property name="varName" nameId="tp3t.1136720037780" value="s" />
          </node>
          <node role="clause" roleId="tp3t.2879868312062970574" type="tp3t.OrPatternClause" typeId="tp3t.4855904478356877904" id="8297918475033171168">
            <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="8297918475033209961">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tp3t.OrPatternVariableReference" typeId="tp3t.4264731254635442556" id="7228132814203674563">
                <link role="declaration" roleId="tp3t.4264731254635442557" targetNodeId="7228132814203674562" resolveInfo="#s" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="8297918475033209966" />
            </node>
          </node>
          <node role="clause" roleId="tp3t.2879868312062970574" type="tp3t.OrPatternClause" typeId="tp3t.4855904478356877904" id="8297918475033171173">
            <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="8297918475033209958">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="8297918475033209965" />
              <node role="leftExpression" roleId="tpee.1081773367580" type="tp3t.OrPatternVariableReference" typeId="tp3t.4264731254635442556" id="7228132814203674564">
                <link role="declaration" roleId="tp3t.4264731254635442557" targetNodeId="7228132814203674562" resolveInfo="#s" />
              </node>
            </node>
          </node>
          <node role="clause" roleId="tp3t.2879868312062970574" type="tp3t.OrPatternClause" typeId="tp3t.4855904478356877904" id="8297918475033174780">
            <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.AndExpression" typeId="tpee.1080120340718" id="8297918475033209968">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.Expression" typeId="tpee.1068431790191" id="8297918475033209969">
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.WildcardPattern" typeId="tp3t.1136720037783" id="8297918475033209976" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="8297918475033209971">
                <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="8297918475033209975" />
                <node role="leftExpression" roleId="tpee.1081773367580" type="tp3t.OrPatternVariableReference" typeId="tp3t.4264731254635442556" id="7228132814203674565">
                  <link role="declaration" roleId="tp3t.4264731254635442557" targetNodeId="7228132814203674562" resolveInfo="#s" />
                </node>
              </node>
            </node>
          </node>
          <node role="clause" roleId="tp3t.2879868312062970574" type="tp3t.OrPatternClause" typeId="tp3t.4855904478356877904" id="8297918475033210020">
            <node role="patternNode" roleId="tp3t.1136720037778" type="tpee.AndExpression" typeId="tpee.1080120340718" id="8297918475033210021">
              <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.Expression" typeId="tpee.1068431790191" id="8297918475033210022">
                <node role="smodelAttribute" roleId="tpck.5169995583184591170" type="tp3t.WildcardPattern" typeId="tp3t.1136720037783" id="8297918475033210033" />
              </node>
              <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="8297918475033210024">
                <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="8297918475033210032" />
                <node role="rightExpression" roleId="tpee.1081773367579" type="tp3t.OrPatternVariableReference" typeId="tp3t.4264731254635442556" id="7228132814203674566">
                  <link role="declaration" roleId="tp3t.4264731254635442557" targetNodeId="7228132814203674562" resolveInfo="#s" />
                </node>
              </node>
            </node>
          </node>
        </node>
      </node>
    </node>
    <node role="matches" roleId="pnao.8707387027762047755" type="tpee.BooleanConstant" typeId="tpee.1068580123137" id="8263735385373599998">
      <property name="value" nameId="tpee.1068580123138" value="true" />
    </node>
    <node role="nodeToMatch" roleId="pnao.8707387027762047753" type="tpee.IfStatement" typeId="tpee.1068580123159" id="8297918475033210034">
      <node role="condition" roleId="tpee.1068580123160" type="tpee.AndExpression" typeId="tpee.1080120340718" id="8297918475033210043">
        <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.EqualsExpression" typeId="tpee.1068580123152" id="8297918475033210047">
          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8297918475033210050">
            <property name="value" nameId="tpee.1068580320021" value="3" />
          </node>
          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.IntegerConstant" typeId="tpee.1068580320020" id="8297918475033210046">
            <property name="value" nameId="tpee.1068580320021" value="4" />
          </node>
        </node>
        <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.NotEqualsExpression" typeId="tpee.1073239437375" id="8297918475033210038">
          <node role="leftExpression" roleId="tpee.1081773367580" type="tpee.NullLiteral" typeId="tpee.1070534058343" id="8297918475033210037" />
          <node role="rightExpression" roleId="tpee.1081773367579" type="tpee.PrimitiveClassExpression" typeId="tpee.4564374268190696673" id="8297918475033210041">
            <node role="primitiveType" roleId="tpee.4564374268190696674" type="tpee.DoubleType" typeId="tpee.1070534513062" id="8297918475033210042" />
          </node>
        </node>
      </node>
      <node role="ifTrue" roleId="tpee.1068580123161" type="tpee.StatementList" typeId="tpee.1068580123136" id="8297918475033210036" />
    </node>
  </root>
  <root id="4545179712979945422" />
</model>

